#!/usr/bin/env bash
# ============================================================================
# shelly-rename.sh – Shelly-Geräte benennen (Gen2+ RPC API)
#
# Setzt den Gerätenamen per Sys.SetConfig. Der Hostname (WiFi STA) wird
# von Gen4-Geräten nicht unterstützt und daher nur als Referenz geführt.
#
# Verwendung:
#   ./shelly-rename.sh              # Alle Geräte umbenennen + rebooten
#   ./shelly-rename.sh --dry-run    # Nur anzeigen
#   ./shelly-rename.sh --check      # Aktuellen Status prüfen
#   ./shelly-rename.sh --ip X.X.X.X # Nur ein bestimmtes Gerät
# ============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/shelly-common.sh"

DRY_RUN=false
CHECK=false
FILTER_IP=""
TIMEOUT=5

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run) DRY_RUN=true; shift ;;
        --check)   CHECK=true; shift ;;
        --ip)      FILTER_IP="$2"; shift 2 ;;
        -h|--help)
            echo "Verwendung: $0 [--dry-run] [--check] [--ip X.X.X.X]"
            exit 0
            ;;
        *) echo "Unbekannt: $1"; exit 1 ;;
    esac
done

# Geräteliste laden
load_devices

# --- Check-Modus ---
if [[ "$CHECK" == true ]]; then
    printf "%-16s %-14s %-25s %-25s %-28s %s\n" "IP" "MAC" "Name (ist)" "Name (soll)" "Hostname (Ref)" "Status"
    printf "%-16s %-14s %-25s %-25s %-28s %s\n" "───" "───" "───" "───" "───" "───"

    for entry in "${DEVICES[@]}"; do
        IFS=';' read -r ip name hostname <<< "$entry"
        [[ -z "$ip" ]] && continue

        # TODO-Einträge überspringen
        [[ "$name" == TODO_* ]] && continue

        # IP-Filter
        [[ -n "$FILTER_IP" && "$ip" != "$FILTER_IP" ]] && continue

        config=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.GetConfig" 2>/dev/null) || {
            printf "%-16s %-14s " "$ip" ""
            echo -e "${RED}❌ NICHT ERREICHBAR${NC}"
            continue
        }

        current_name=$(echo "$config" | grep -o '"name":"[^"]*"' | head -1 | cut -d'"' -f4)
        mac=$(echo "$config" | grep -o '"mac":"[^"]*"' | cut -d'"' -f4)
        [[ -z "$current_name" ]] && current_name="(nicht gesetzt)"

        if [[ "$current_name" == "$name" ]]; then
            printf "%-16s %-14s %-25s %-25s %-28s " "$ip" "$mac" "$current_name" "$name" "$hostname"
            echo -e "${GREEN}✅${NC}"
        else
            printf "%-16s %-14s %-25s %-25s %-28s " "$ip" "$mac" "$current_name" "$name" "$hostname"
            echo -e "${YELLOW}⚠️  ändern${NC}"
        fi
    done
    exit 0
fi

# --- Rename ---
echo -e "${CYAN}Shelly-Geräte umbenennen${NC}"
[[ "$DRY_RUN" == true ]] && echo -e "${YELLOW}(Dry-Run – keine Änderungen)${NC}"
[[ -n "$FILTER_IP" ]] && echo -e "${CYAN}Filter: nur ${FILTER_IP}${NC}"
echo ""

success=0; skipped=0; failed=0

for entry in "${DEVICES[@]}"; do
    IFS=';' read -r ip name hostname <<< "$entry"

    if [[ -z "$ip" ]]; then
        ((skipped++))
        continue
    fi

    # TODO-Einträge überspringen
    if [[ "$name" == TODO_* ]]; then
        ((skipped++))
        continue
    fi

    # IP-Filter
    if [[ -n "$FILTER_IP" && "$ip" != "$FILTER_IP" ]]; then
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

    echo "  MAC:          ${mac}"
    echo "  Name:         ${current_name} → ${name}"
    echo "  Hostname:     ${hostname} (Referenz, nicht per API setzbar)"

    if [[ "$current_name" == "$name" ]]; then
        echo -e "  ${GREEN}✅ Bereits korrekt${NC}\n"
        ((skipped++))
        continue
    fi

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "  ${YELLOW}→ Name ändern${NC}"
        echo ""
        ((skipped++))
        continue
    fi

    # Name setzen
    result=$(curl -s --max-time "$TIMEOUT" "http://${ip}/rpc/Sys.SetConfig" \
        -d "{\"config\":{\"device\":{\"name\":\"${name}\"}}}" 2>/dev/null) || {
        echo -e "  ${RED}❌ Fehler beim Name setzen${NC}\n"
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
