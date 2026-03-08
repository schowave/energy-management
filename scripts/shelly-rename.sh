#!/usr/bin/env bash
# ============================================================================
# shelly-rename.sh – Shelly-Geräte benennen (Gen2+ RPC API)
#
# Verwendung:
#   ./shelly-rename.sh              # Alle Geräte umbenennen + rebooten
#   ./shelly-rename.sh --dry-run    # Nur anzeigen
#   ./shelly-rename.sh --check      # Aktuellen Status prüfen
# ============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEVICES_FILE="${SCRIPT_DIR}/shelly-devices.sh"
DRY_RUN=false
CHECK=false
TIMEOUT=5

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run) DRY_RUN=true; shift ;;
        --check)   CHECK=true; shift ;;
        -h|--help) echo "Verwendung: $0 [--dry-run] [--check]"; exit 0 ;;
        *)         echo "Unbekannt: $1"; exit 1 ;;
    esac
done

# Geräteliste laden
if [[ ! -f "$DEVICES_FILE" ]]; then
    echo -e "${RED}Geräteliste nicht gefunden: ${DEVICES_FILE}${NC}"
    exit 1
fi

# register-Funktion überschreiben um Geräte zu sammeln
DEVICES=()
register() { DEVICES+=("$1;$2;$3"); }
source "$DEVICES_FILE"

# --- Check-Modus ---
if [[ "$CHECK" == true ]]; then
    printf "%-16s %-14s %-30s %-30s %s\n" "IP" "MAC" "Aktueller Name" "Soll-Name" "Status"
    printf "%-16s %-14s %-30s %-30s %s\n" "───" "───" "───" "───" "───"

    for entry in "${DEVICES[@]}"; do
        IFS=';' read -r ip name hostname <<< "$entry"
        [[ -z "$ip" ]] && continue

        config=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.GetConfig" 2>/dev/null) || {
            printf "%-16s %-14s " "$ip" ""
            echo -e "${RED}❌ NICHT ERREICHBAR${NC}                     ${name}"
            continue
        }

        current_name=$(echo "$config" | grep -o '"name":"[^"]*"' | head -1 | cut -d'"' -f4)
        mac=$(echo "$config" | grep -o '"mac":"[^"]*"' | cut -d'"' -f4)
        [[ -z "$current_name" ]] && current_name="(nicht gesetzt)"

        if [[ "$current_name" == "$name" ]]; then
            printf "%-16s %-14s %-30s %-30s " "$ip" "$mac" "$current_name" "$name"
            echo -e "${GREEN}✅${NC}"
        else
            printf "%-16s %-14s %-30s %-30s " "$ip" "$mac" "$current_name" "$name"
            echo -e "${YELLOW}⚠️  ändern${NC}"
        fi
    done
    exit 0
fi

# --- Rename ---
echo -e "${CYAN}Shelly-Geräte umbenennen${NC}"
[[ "$DRY_RUN" == true ]] && echo -e "${YELLOW}(Dry-Run – keine Änderungen)${NC}"
echo ""

success=0; skipped=0; failed=0

for entry in "${DEVICES[@]}"; do
    IFS=';' read -r ip name hostname <<< "$entry"

    if [[ -z "$ip" ]]; then
        ((skipped++))
        continue
    fi

    echo -e "${CYAN}━━━ ${ip} ━━━${NC}"

    config=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.GetConfig" 2>/dev/null) || {
        echo -e "  ${RED}❌ Nicht erreichbar${NC}\n"
        ((failed++))
        continue
    }

    current_name=$(echo "$config" | grep -o '"name":"[^"]*"' | head -1 | cut -d'"' -f4)
    mac=$(echo "$config" | grep -o '"mac":"[^"]*"' | cut -d'"' -f4)
    [[ -z "$current_name" ]] && current_name="(null)"

    echo "  MAC:     ${mac}"
    echo "  Aktuell: ${current_name}"
    echo "  Neu:     ${name}"

    if [[ "$current_name" == "$name" ]]; then
        echo -e "  ${GREEN}✅ Bereits korrekt${NC}\n"
        ((skipped++))
        continue
    fi

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "  ${YELLOW}→ Würde umbenennen: ${current_name} → ${name}${NC}\n"
        ((skipped++))
        continue
    fi

    # Name setzen
    result=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.SetConfig" \
        -d "{\"config\":{\"device\":{\"name\":\"${name}\"}}}" 2>/dev/null) || {
        echo -e "  ${RED}❌ Fehler beim Setzen${NC}\n"
        ((failed++))
        continue
    }

    echo -e "  ${GREEN}✅ Name gesetzt${NC}"

    # Reboot
    echo "  ↻ Neustart..."
    curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Shelly.Reboot" 2>/dev/null || true
    echo -e "  ${GREEN}✅ Neustart ausgelöst${NC}\n"

    ((success++))
done

echo -e "${CYAN}━━━ Zusammenfassung ━━━${NC}"
echo -e "  ${GREEN}✅ Erfolgreich:    ${success}${NC}"
echo -e "  ${YELLOW}⏭️  Übersprungen:   ${skipped}${NC}"
echo -e "  ${RED}❌ Fehlgeschlagen: ${failed}${NC}"

[[ $success -gt 0 ]] && echo -e "\n${YELLOW}⏳ Geräte starten neu (~10 Sekunden).${NC}"
