#!/usr/bin/env bash
# ============================================================================
# shelly-common.sh – Gemeinsame Hilfsfunktionen für Shelly-Skripte
#
# Wird per "source" eingebunden, nicht direkt ausgeführt.
# ============================================================================

# Farben
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

# Pfade (SCRIPT_DIR muss VOR dem Sourcing gesetzt sein, oder wir leiten ab)
SCRIPT_DIR="${SCRIPT_DIR:-$(cd "$(dirname "${BASH_SOURCE[1]}")" && pwd)}"
DEVICES_FILE="${SCRIPT_DIR}/shelly-devices.sh"

# Defaults
TIMEOUT="${TIMEOUT:-3}"
PARALLEL="${PARALLEL:-30}"

# Cloud-Credentials (auto-load aus Datei)
CLOUD_ENV="${HOME}/.config/shelly-cloud.env"

# ---------------------------------------------------------------------------
# derive_hostname "DG_Buero_Licht" → "shelly-dg-buero-licht"
# derive_hostname "EG_Wohnen_Jalousie_1" → "shelly-eg-wohnen-jalousie-1"
# ---------------------------------------------------------------------------
derive_hostname() {
    local name="$1"
    echo "shelly-$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr '_' '-')"
}

# ---------------------------------------------------------------------------
# load_devices → füllt DEVICES=("ip;name;hostname" ...)
# ---------------------------------------------------------------------------
load_devices() {
    DEVICES=()
    register() { DEVICES+=("$1;$2;$3"); }
    source "$DEVICES_FILE"
}

# ---------------------------------------------------------------------------
# load_known_ips → füllt known_ips=("1.2.3.4" ...)
# ---------------------------------------------------------------------------
load_known_ips() {
    known_ips=()
    if [[ -f "$DEVICES_FILE" ]]; then
        while IFS= read -r line; do
            if [[ "$line" =~ ^register[[:space:]]+\"([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\" ]]; then
                known_ips+=("${BASH_REMATCH[1]}")
            fi
        done < "$DEVICES_FILE"
    fi
}

# ---------------------------------------------------------------------------
# is_known_ip "192.168.1.42" → return 0/1
# Voraussetzung: known_ips wurde vorher via load_known_ips gefüllt
# ---------------------------------------------------------------------------
is_known_ip() {
    for ip in "${known_ips[@]+"${known_ips[@]}"}"; do
        [[ "$ip" == "$1" ]] && return 0
    done
    return 1
}

# ---------------------------------------------------------------------------
# load_cloud_credentials [--cloud KEY URI]
# Setzt AUTH_KEY und SERVER_URI aus Argumenten oder ~/.config/shelly-cloud.env
# ---------------------------------------------------------------------------
load_cloud_credentials() {
    AUTH_KEY="${1:-}"
    SERVER_URI="${2:-}"

    if [[ -z "$AUTH_KEY" && -f "$CLOUD_ENV" ]]; then
        # shellcheck source=/dev/null
        source "$CLOUD_ENV"
        AUTH_KEY="${SHELLY_AUTH_KEY:-}"
        SERVER_URI="${SHELLY_SERVER_URI:-}"
    fi

    SERVER_URI="${SERVER_URI%/}"
}

# ---------------------------------------------------------------------------
# fetch_cloud_devices → füllt cloud_names[MAC]="name"
# Voraussetzung: AUTH_KEY und SERVER_URI sind gesetzt
# ---------------------------------------------------------------------------
declare -A cloud_names 2>/dev/null || true
declare -A cloud_categories 2>/dev/null || true
declare -A cloud_rooms 2>/dev/null || true

fetch_cloud_devices() {
    cloud_names=()
    cloud_categories=()
    cloud_rooms=()

    if [[ -z "$AUTH_KEY" || -z "$SERVER_URI" ]]; then
        return 1
    fi

    echo -e "${CYAN}📡 Rufe Geräteliste von Shelly Cloud ab...${NC}"

    local response
    response=$(curl -s --max-time 15 \
        -X POST "${SERVER_URI}/interface/device/list" \
        -d "auth_key=${AUTH_KEY}" 2>/dev/null) || {
        echo -e "${RED}❌ Fehler beim Abrufen der Cloud-Daten${NC}"
        return 1
    }

    if ! echo "$response" | grep -q '"isok":true'; then
        echo -e "${RED}❌ Cloud API Fehler${NC}"
        echo "Antwort (erste 500 Zeichen):"
        echo "$response" | head -c 500
        return 1
    fi

    echo -e "${GREEN}✅ Cloud-Daten empfangen${NC}"

    local mapfile_tmp
    mapfile_tmp=$(mktemp)

    python3 -c "
import json, sys
data = json.loads(sys.stdin.read())
devices = data.get('data', {}).get('devices', {})
if isinstance(devices, dict):
    for mac_key, dev in devices.items():
        name = dev.get('name', '') or ''
        category = dev.get('category', '') or ''
        room_id = dev.get('room_id', '') or ''
        mac = mac_key.upper()
        print(f'{mac}|{name}|{category}|{room_id}')
" <<< "$response" > "$mapfile_tmp" 2>/dev/null || {
        echo -e "${RED}❌ Fehler beim Parsen der Cloud-Daten${NC}"
        rm -f "$mapfile_tmp"
        return 1
    }

    while IFS='|' read -r mac name category room_id; do
        [[ -z "$mac" ]] && continue
        cloud_names["$mac"]="$name"
        cloud_categories["$mac"]="$category"
        cloud_rooms["$mac"]="$room_id"
    done < "$mapfile_tmp"

    rm -f "$mapfile_tmp"
    echo -e "${CYAN}📊 ${#cloud_names[@]} Geräte aus der Cloud geladen${NC}"
    return 0
}
