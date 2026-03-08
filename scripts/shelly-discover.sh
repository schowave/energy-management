#!/usr/bin/env bash
# ============================================================================
# shelly-discover.sh – Netzwerk nach Shelly-Geräten scannen
#
# Verwendung:
#   ./shelly-discover.sh                # Scannen + auflisten (Standard)
#   ./shelly-discover.sh --list         # Nur auflisten (Alias)
#   ./shelly-discover.sh --add          # Interaktiv neue Geräte hinzufügen
#   ./shelly-discover.sh --add --cloud KEY URI  # Mit Cloud-Namen
#   ./shelly-discover.sh --subnet 192.168.178   # Anderes Subnetz
# ============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/shelly-common.sh"

SUBNET="192.168.1"
ADD_MODE=false
AUTH_KEY=""
SERVER_URI=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --list)    shift ;;  # Default-Verhalten, Kompatibilität
        --add)     ADD_MODE=true; shift ;;
        --subnet)  SUBNET="$2"; shift 2 ;;
        --cloud)   AUTH_KEY="$2"; SERVER_URI="$3"; shift 3 ;;
        -h|--help)
            echo "Verwendung: $0 [--list] [--add] [--subnet 192.168.x] [--cloud KEY URI]"
            echo ""
            echo "Modi:"
            echo "  (Standard)   Scannen und auflisten"
            echo "  --add        Neue Geräte interaktiv hinzufügen"
            echo ""
            echo "Optionen:"
            echo "  --subnet X   Anderes /24-Subnetz scannen (Default: 192.168.1)"
            echo "  --cloud K U  Shelly Cloud API für Namen (Key + Server-URI)"
            echo "               Alternativ: ~/.config/shelly-cloud.env"
            exit 0
            ;;
        *) echo "Unbekannt: $1"; exit 1 ;;
    esac
done

# Cloud-Credentials laden
load_cloud_credentials "$AUTH_KEY" "$SERVER_URI"

# Bekannte IPs laden
load_known_ips

# --- Scan ---
echo -e "${CYAN}🔍 Scanne ${SUBNET}.0/24 nach Shelly-Geräten...${NC}"

TMPDIR_SCAN=$(mktemp -d)
trap 'rm -rf "$TMPDIR_SCAN"' EXIT

pids=()
for i in $(seq 1 254); do
    ip="${SUBNET}.${i}"
    (
        result=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Shelly.GetDeviceInfo" 2>/dev/null) || exit 0
        if [ -n "$result" ] && echo "$result" | grep -q '"model"'; then
            model=$(echo "$result" | grep -o '"model":"[^"]*"' | cut -d'"' -f4)
            mac=$(echo "$result" | grep -o '"mac":"[^"]*"' | cut -d'"' -f4)
            name=$(echo "$result" | grep -o '"name":[^,}]*' | head -1 | sed 's/"name"://;s/"//g;s/null//')
            gen=$(echo "$result" | grep -o '"gen":[0-9]*' | cut -d: -f2)
            printf '%s|%s|%s|%s|%s\n' "$ip" "$model" "$mac" "$name" "$gen" > "${TMPDIR_SCAN}/${i}"
        fi
    ) &
    pids+=($!)

    if (( ${#pids[@]} >= PARALLEL )); then
        for pid in "${pids[@]}"; do wait "$pid" 2>/dev/null || true; done
        pids=()
    fi
done

for pid in "${pids[@]+"${pids[@]}"}"; do wait "$pid" 2>/dev/null || true; done

echo ""

# Ergebnisse sammeln
found=0
new_devices=()

printf "%-16s %-25s %-14s %-4s %-25s %s\n" "IP" "Modell" "MAC" "Gen" "Name" "Status"
printf "%-16s %-25s %-14s %-4s %-25s %s\n" "───" "───" "───" "───" "───" "───"

for f in $(ls "${TMPDIR_SCAN}/" 2>/dev/null | sort -n); do
    line=$(cat "${TMPDIR_SCAN}/${f}")
    IFS='|' read -r ip model mac name gen <<< "$line"
    ((found++))

    display_name="${name:-(nicht gesetzt)}"

    if is_known_ip "$ip"; then
        printf "%-16s %-25s %-14s %-4s %-25s " "$ip" "$model" "$mac" "$gen" "$display_name"
        echo -e "${GREEN}✅ in Liste${NC}"
    else
        printf "%-16s %-25s %-14s %-4s %-25s " "$ip" "$model" "$mac" "$gen" "$display_name"
        echo -e "${YELLOW}🆕 NEU${NC}"
        new_devices+=("${ip}|${model}|${mac}|${name}|${gen}")
    fi
done

echo ""
echo -e "${CYAN}📊 Gefunden: ${found} Geräte, davon ${#new_devices[@]} neu${NC}"

if [[ ${#new_devices[@]} -eq 0 ]]; then
    echo -e "${GREEN}✅ Alle Geräte sind bereits in der Liste.${NC}"
    exit 0
fi

# --- Nur auflisten (Standard-Modus) ---
if [[ "$ADD_MODE" != true ]]; then
    echo ""
    echo "Neue Geräte:"
    for device in "${new_devices[@]}"; do
        IFS='|' read -r ip model mac name gen <<< "$device"
        echo "  ${ip} (${model}, MAC: ${mac})"
    done
    echo ""
    echo -e "${YELLOW}📝 Zum Hinzufügen: $0 --add${NC}"
    exit 0
fi

# --- Add-Modus: Cloud-Namen laden ---
cloud_loaded=false
if [[ -n "$AUTH_KEY" ]]; then
    echo ""
    if fetch_cloud_devices; then
        cloud_loaded=true
    fi
fi

# --- Add-Modus: Interaktive Erfassung ---
echo ""
echo -e "${CYAN}━━━ Neue Geräte interaktiv hinzufügen ━━━${NC}"
echo ""

GESCHOSSE=("KG" "EG" "OG" "DG")
TYPEN=("Licht" "Jalousie" "Steckdose" "Waermepumpe" "3EM" "Workstation" "Serverschrank" "Waschmaschine" "Trockner" "Kuehlschrank" "Spuelmaschine" "Lichtstreifen")

added=0
skipped=0

for device in "${new_devices[@]}"; do
    IFS='|' read -r ip model mac name gen <<< "$device"

    echo -e "${CYAN}━━━ ${ip} (${model}, MAC: ${mac}) ━━━${NC}"

    # Cloud-Hinweis anzeigen
    mac_upper=$(echo "$mac" | tr '[:lower:]' '[:upper:]')
    if [[ "$cloud_loaded" == true && -n "${cloud_names[$mac_upper]+x}" ]]; then
        cloud_name="${cloud_names[$mac_upper]}"
        cloud_cat="${cloud_categories[$mac_upper]:-}"
        cloud_room="${cloud_rooms[$mac_upper]:-}"
        echo -e "  Cloud: ${GREEN}${cloud_name}${NC} (Kategorie: ${cloud_cat}, Room: ${cloud_room})"
    fi

    # Überspringen?
    echo ""
    read -rp "  Gerät hinzufügen? [J/n/q] " confirm
    case "${confirm,,}" in
        n) echo -e "  ${YELLOW}⏭️  Übersprungen${NC}"; echo ""; ((skipped++)); continue ;;
        q) echo "Abbruch."; break ;;
    esac

    # Geschoss
    echo "  Geschoss: ${GESCHOSSE[*]}"
    read -rp "  Geschoss: " geschoss
    geschoss=$(echo "$geschoss" | tr '[:lower:]' '[:upper:]')
    if [[ ! " ${GESCHOSSE[*]} " =~ " ${geschoss} " ]]; then
        echo -e "  ${YELLOW}⚠️  Unbekanntes Geschoss '${geschoss}', wird trotzdem verwendet${NC}"
    fi

    # Raum
    read -rp "  Raum (z.B. Buero, Kueche, Bad): " raum
    # Ersten Buchstaben groß, Rest klein
    raum="$(echo "${raum:0:1}" | tr '[:lower:]' '[:upper:]')$(echo "${raum:1}" | tr '[:upper:]' '[:lower:]')"

    # Typ
    echo "  Typen: ${TYPEN[*]}"
    read -rp "  Typ: " typ
    typ="$(echo "${typ:0:1}" | tr '[:lower:]' '[:upper:]')$(echo "${typ:1}" | tr '[:upper:]' '[:lower:]')"

    # Nummer (optional)
    read -rp "  Nr (optional, leer = keine): " nr

    # Name zusammenbauen
    device_name="${geschoss}_${raum}_${typ}"
    [[ -n "$nr" ]] && device_name="${device_name}_${nr}"

    hostname=$(derive_hostname "$device_name")

    echo ""
    echo -e "  Name:     ${GREEN}${device_name}${NC}"
    echo -e "  Hostname: ${GREEN}${hostname}${NC}"
    read -rp "  OK? [J/n] " ok
    if [[ "${ok,,}" == "n" ]]; then
        echo -e "  ${YELLOW}⏭️  Übersprungen${NC}"; echo ""
        ((skipped++))
        continue
    fi

    # Cloud-Kommentar
    comment="# ${model}"
    if [[ "$cloud_loaded" == true && -n "${cloud_names[$mac_upper]+x}" ]]; then
        comment="# Cloud: ${cloud_names[$mac_upper]} | ${model}"
    fi
    comment="${comment} MAC:${mac}"

    # In Datei schreiben
    echo "register \"${ip}\" \"${device_name}\" \"${hostname}\"  ${comment}" >> "$DEVICES_FILE"
    echo -e "  ${GREEN}✅ Eingetragen${NC}"
    echo ""
    ((added++))
done

echo -e "${CYAN}━━━ Zusammenfassung ━━━${NC}"
echo -e "  ${GREEN}✅ Hinzugefügt: ${added}${NC}"
echo -e "  ${YELLOW}⏭️  Übersprungen: ${skipped}${NC}"

if [[ $added -gt 0 ]]; then
    echo ""
    read -rp "Jetzt umbenennen? (./shelly-rename.sh) [j/N] " do_rename
    if [[ "${do_rename,,}" == "j" ]]; then
        "${SCRIPT_DIR}/shelly-rename.sh"
    else
        echo -e "${YELLOW}📝 Später umbenennen: ./shelly-rename.sh${NC}"
    fi
fi
