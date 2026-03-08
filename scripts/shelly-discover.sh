#!/usr/bin/env bash
# ============================================================================
# shelly-discover.sh – Netzwerk nach Shelly-Geräten scannen
#
# Verwendung:
#   ./shelly-discover.sh              # Scannen + neue Geräte in devices eintragen
#   ./shelly-discover.sh --list       # Nur auflisten
#   ./shelly-discover.sh --subnet 192.168.178  # Anderes Subnetz
# ============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEVICES_FILE="${SCRIPT_DIR}/shelly-devices.sh"
SUBNET="192.168.1"
LIST_ONLY=false
TIMEOUT=2
PARALLEL=30

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

while [[ $# -gt 0 ]]; do
    case $1 in
        --list)    LIST_ONLY=true; shift ;;
        --subnet)  SUBNET="$2"; shift 2 ;;
        -h|--help) echo "Verwendung: $0 [--list] [--subnet 192.168.x]"; exit 0 ;;
        *)         echo "Unbekannt: $1"; exit 1 ;;
    esac
done

# Bekannte IPs aus devices-Datei laden
known_ips=()
if [[ -f "$DEVICES_FILE" ]]; then
    while IFS= read -r line; do
        if [[ "$line" =~ ^register[[:space:]]+\"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\" ]]; then
            known_ips+=("${BASH_REMATCH[1]}")
        fi
    done < "$DEVICES_FILE"
fi

is_known() {
    for ip in "${known_ips[@]+"${known_ips[@]}"}"; do
        [[ "$ip" == "$1" ]] && return 0
    done
    return 1
}

# --- Scan ---
echo -e "${CYAN}🔍 Scanne ${SUBNET}.0/24 nach Shelly-Geräten...${NC}"

TMPDIR_SCAN=$(mktemp -d)
trap 'rm -rf "$TMPDIR_SCAN"' EXIT

# Alle IPs parallel curlen, Ergebnisse in temp-Dateien
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

    # Batch-Limit
    if (( ${#pids[@]} >= PARALLEL )); then
        for pid in "${pids[@]}"; do wait "$pid" 2>/dev/null || true; done
        pids=()
    fi
done

# Restliche Jobs abwarten
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

    if is_known "$ip"; then
        printf "%-16s %-25s %-14s %-4s %-25s " "$ip" "$model" "$mac" "$gen" "$display_name"
        echo -e "${GREEN}✅ in Liste${NC}"
    else
        printf "%-16s %-25s %-14s %-4s %-25s " "$ip" "$model" "$mac" "$gen" "$display_name"
        echo -e "${YELLOW}🆕 NEU${NC}"
        new_devices+=("${ip}|${model}|${mac}")
    fi
done

echo ""
echo -e "${CYAN}📊 Gefunden: ${found} Geräte, davon ${#new_devices[@]} neu${NC}"

if [[ ${#new_devices[@]} -eq 0 ]]; then
    echo -e "${GREEN}✅ Alle Geräte sind bereits in der Liste.${NC}"
    exit 0
fi

if [[ "$LIST_ONLY" == true ]]; then
    echo ""
    echo "Neue Geräte (nicht geschrieben, --list Modus):"
    for device in "${new_devices[@]}"; do
        IFS='|' read -r ip model mac <<< "$device"
        echo "  ${ip} (${model}, MAC: ${mac})"
    done
    exit 0
fi

# Neue Geräte in shelly-devices.sh eintragen
echo ""
echo -e "${CYAN}Füge neue Geräte in shelly-devices.sh ein:${NC}"

for device in "${new_devices[@]}"; do
    IFS='|' read -r ip model mac <<< "$device"

    todo_name="TODO_${model}_${mac: -6}"
    todo_hostname="shelly-todo-${mac: -6}"
    todo_hostname=$(echo "$todo_hostname" | tr '[:upper:]' '[:lower:]')

    echo "register \"${ip}\" \"${todo_name}\" \"${todo_hostname}\"  # ${model} MAC:${mac}" >> "$DEVICES_FILE"
    echo -e "  ${GREEN}+${NC} ${ip} → ${todo_name} (${model}, MAC: ${mac})"
done

echo ""
echo -e "${GREEN}✅ ${#new_devices[@]} neue Geräte eingetragen${NC}"
echo -e "${YELLOW}📝 Bitte Namen in shelly-devices.sh anpassen, dann: ./shelly-rename.sh${NC}"
