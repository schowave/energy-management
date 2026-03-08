#!/usr/bin/env bash
# ============================================================================
# shelly-cloud-import.sh – Cloud-Namen von Shelly-Geräten auslesen
#
# Strategie:
#   1. Lokale Geräte per /rpc/Sys.GetConfig abfragen (Cloud sync → Gerät?)
#   2. Falls lokal keine Namen: Shelly Cloud API nutzen
#
# Verwendung:
#   ./shelly-cloud-import.sh                          # Lokale Namen lesen
#   ./shelly-cloud-import.sh --cloud KEY SERVER_URI   # Cloud API nutzen
#   ./shelly-cloud-import.sh --apply                  # Namen in devices schreiben
#
# Cloud Auth-Key finden:
#   https://control.shelly.cloud/ → User Settings → Authorization cloud key
# ============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEVICES_FILE="${SCRIPT_DIR}/shelly-devices.sh"
AUTH_KEY=""
SERVER_URI=""
APPLY=false
TIMEOUT=3

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

while [[ $# -gt 0 ]]; do
    case $1 in
        --cloud)   AUTH_KEY="$2"; SERVER_URI="$3"; shift 3 ;;
        --apply)   APPLY=true; shift ;;
        -h|--help)
            echo "Verwendung:"
            echo "  $0                          # Lokale Namen lesen"
            echo "  $0 --cloud KEY SERVER_URI   # Cloud API nutzen"
            echo "  $0 --apply                  # Namen in shelly-devices.sh schreiben"
            exit 0
            ;;
        *) echo "Unbekannt: $1"; exit 1 ;;
    esac
done

if [[ ! -f "$DEVICES_FILE" ]]; then
    echo -e "${RED}❌ ${DEVICES_FILE} nicht gefunden${NC}"
    exit 1
fi

# --- Phase 1: Lokale Namen von den Geräten lesen ---
if [[ -z "$AUTH_KEY" ]]; then
    echo -e "${CYAN}📡 Lese Namen direkt von den Shelly-Geräten...${NC}"
    echo ""

    printf "%-16s %-14s %-30s %-30s\n" "IP" "MAC" "Lokaler Name" "Aktuell in Liste"
    printf "%-16s %-14s %-30s %-30s\n" "───" "───" "───" "───"

    found_names=0
    no_names=0
    unreachable=0

    TMPDIR_SCAN=$(mktemp -d)
    trap 'rm -rf "$TMPDIR_SCAN"' EXIT

    # Alle TODO-Geräte parallel abfragen
    idx=0
    pids=()
    while IFS= read -r line; do
        if [[ "$line" =~ TODO_ ]] && [[ "$line" =~ ^register[[:space:]]+\"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\"[[:space:]]+\"([^\"]+)\" ]]; then
            ip="${BASH_REMATCH[1]}"
            current="${BASH_REMATCH[2]}"
            ((idx++))

            (
                config=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.GetConfig" 2>/dev/null) || {
                    echo "${ip}||${current}|UNREACHABLE" > "${TMPDIR_SCAN}/${idx}"
                    exit 0
                }
                local_name=$(echo "$config" | grep -o '"name":"[^"]*"' | head -1 | cut -d'"' -f4)
                mac=$(echo "$config" | grep -o '"mac":"[^"]*"' | cut -d'"' -f4)
                echo "${ip}|${mac}|${current}|${local_name}" > "${TMPDIR_SCAN}/${idx}"
            ) &
            pids+=($!)

            if (( ${#pids[@]} >= 20 )); then
                for pid in "${pids[@]}"; do wait "$pid" 2>/dev/null || true; done
                pids=()
            fi
        fi
    done < "$DEVICES_FILE"

    for pid in "${pids[@]+${pids[@]}}"; do wait "$pid" 2>/dev/null || true; done

    # Ergebnisse anzeigen
    for f in "${TMPDIR_SCAN}"/*; do
        [[ -f "$f" ]] || continue
        IFS='|' read -r ip mac current local_name < "$f"

        if [[ "$local_name" == "UNREACHABLE" ]]; then
            printf "%-16s %-14s " "$ip" ""
            echo -e "${RED}❌ nicht erreichbar${NC}"
            ((unreachable++))
        elif [[ -n "$local_name" ]]; then
            printf "%-16s %-14s ${GREEN}%-30s${NC} %-30s\n" "$ip" "$mac" "$local_name" "$current"
            ((found_names++))
        else
            printf "%-16s %-14s ${YELLOW}%-30s${NC} %-30s\n" "$ip" "$mac" "(kein Name)" "$current"
            ((no_names++))
        fi
    done

    echo ""
    echo -e "${CYAN}📊 Mit Namen: ${found_names}, Ohne Namen: ${no_names}, Nicht erreichbar: ${unreachable}${NC}"

    if [[ $found_names -eq 0 ]]; then
        echo ""
        echo -e "${YELLOW}Die Namen sind nur in der Shelly Cloud gespeichert, nicht auf den Geräten.${NC}"
        echo ""
        echo "Nächster Schritt: Cloud API nutzen:"
        echo "  1. https://control.shelly.cloud/ → User Settings → Authorization cloud key → Get"
        echo "  2. ./shelly-cloud-import.sh --cloud \"AUTH_KEY\" \"SERVER_URI\""
    fi

    exit 0
fi

# --- Phase 2: Cloud API ---
SERVER_URI="${SERVER_URI%/}"

echo -e "${CYAN}📡 Rufe Geräteliste von Shelly Cloud ab...${NC}"

# Geräteliste von der Cloud holen
response=$(curl -s --max-time 15 \
    -X POST "${SERVER_URI}/interface/device/list" \
    -d "auth_key=${AUTH_KEY}" 2>/dev/null) || {
    echo -e "${RED}❌ Fehler beim Abrufen der Cloud-Daten${NC}"
    exit 1
}

if ! echo "$response" | grep -q '"isok":true'; then
    echo -e "${RED}❌ Cloud API Fehler${NC}"
    echo "Antwort (erste 500 Zeichen):"
    echo "$response" | head -c 500
    exit 1
fi

echo -e "${GREEN}✅ Cloud-Daten empfangen${NC}"
echo ""

# JSON mit python3 parsen (auf macOS immer verfügbar)
MAPFILE=$(mktemp)
trap 'rm -f "$MAPFILE"' EXIT

python3 -c "
import json, sys

data = json.loads(sys.stdin.read())
devices = data.get('data', {}).get('devices', {})

# Format: {mac_lowercase: {name, ip, type, category, mode, room_id, ...}}
# Die MAC-Adresse ist der Schlüssel (lowercase), nicht ein Feld im Objekt
if isinstance(devices, dict):
    for mac_key, dev in devices.items():
        name = dev.get('name', '') or ''
        ip = dev.get('ip', '') or ''
        dtype = dev.get('type', '') or ''
        category = dev.get('category', '') or ''
        room_id = dev.get('room_id', '') or ''
        mac = mac_key.upper()
        print(f'{mac}|{name}|{ip}|{dtype}|{category}|{room_id}')
" < <(echo "$response") > "$MAPFILE" 2>/dev/null || {
    echo -e "${RED}❌ Fehler beim Parsen der Cloud-Daten${NC}"
    echo "Speichere Rohdaten zur Analyse in /tmp/shelly-cloud-response.json"
    echo "$response" > /tmp/shelly-cloud-response.json
    exit 1
}

# Cloud-Mapping anzeigen
declare -A cloud_map
declare -A cloud_category
declare -A cloud_room
cloud_count=0

printf "%-14s %-16s %-25s %-10s %-6s\n" "MAC" "IP" "Cloud-Name" "Kategorie" "Room"
printf "%-14s %-16s %-25s %-10s %-6s\n" "───" "───" "───" "───" "───"

while IFS='|' read -r mac name ip dtype category room_id; do
    [[ -z "$mac" ]] && continue
    cloud_map["$mac"]="$name"
    cloud_category["$mac"]="$category"
    cloud_room["$mac"]="$room_id"
    printf "%-14s %-16s %-25s %-10s %-6s\n" "$mac" "$ip" "${name:-(kein Name)}" "$category" "$room_id"
    ((cloud_count++)) || true
done < "$MAPFILE"

echo ""
echo -e "${CYAN}📊 ${cloud_count} Geräte aus der Cloud${NC}"
echo ""

if [[ $cloud_count -eq 0 ]]; then
    echo -e "${YELLOW}Keine Geräte gefunden.${NC}"
    echo "Speichere Rohdaten: /tmp/shelly-cloud-response.json"
    echo "$response" > /tmp/shelly-cloud-response.json
    exit 1
fi

# Zuordnung zu TODO-Einträgen in shelly-devices.sh
echo -e "${CYAN}🔄 Zuordnung zu shelly-devices.sh (TODO-Einträge):${NC}"
echo ""

printf "%-16s %-14s %-25s %-10s %-6s\n" "IP" "MAC" "Cloud-Name" "Kategorie" "Room"
printf "%-16s %-14s %-25s %-10s %-6s\n" "───" "───" "───" "───" "───"

matched=0
unmatched=0

while IFS= read -r line; do
    if [[ "$line" =~ TODO_ ]] && [[ "$line" =~ MAC:([A-Fa-f0-9]+) ]]; then
        device_mac=$(echo "${BASH_REMATCH[1]}" | tr '[:lower:]' '[:upper:]')
        # Jetzt die IP aus der Zeile holen (erster regex)
        if [[ "$line" =~ ^register[[:space:]]+\"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\" ]]; then
            ip="${BASH_REMATCH[1]}"
        else
            ip="?"
        fi

        if [[ -n "${cloud_map[$device_mac]+x}" ]]; then
            cloud_name="${cloud_map[$device_mac]}"
            cat="${cloud_category[$device_mac]}"
            room="${cloud_room[$device_mac]}"
            printf "%-16s %-14s ${GREEN}%-25s${NC} %-10s %-6s\n" "$ip" "$device_mac" "$cloud_name" "$cat" "$room"
            ((matched++)) || true
        else
            printf "%-16s %-14s ${YELLOW}%-25s${NC}\n" "$ip" "$device_mac" "(nicht in Cloud)"
            ((unmatched++)) || true
        fi
    fi
done < "$DEVICES_FILE"

echo ""
echo -e "${CYAN}📊 Zugeordnet: ${matched}, Nicht gefunden: ${unmatched}${NC}"
echo ""
echo -e "${YELLOW}📝 Nächster Schritt: Cloud-Namen und Room-IDs nutzen, um shelly-devices.sh zu aktualisieren${NC}"
echo "   Room-IDs zuordnen (aus Cloud-Daten ablesen) und in Namensschema übertragen."
