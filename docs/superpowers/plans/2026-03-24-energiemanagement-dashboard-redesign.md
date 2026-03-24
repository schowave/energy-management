# Energiemanagement Dashboard Redesign — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Restructure `energiemanagement.yaml` from 2 tabs (Übersicht + Optimierung) to 3 tabs (Cockpit + Analyse + Wärmepumpe) — eliminating redundancy, grouping related content, and optimizing for mobile quick-checks.

**Architecture:** Single-file YAML restructuring. The existing `energiemanagement.yaml` (1547 lines) gets rewritten as 3 `type: sections` views. No new custom cards, no new entities, no automations. All card configurations are migrated from the existing file — only layout and grouping changes.

**Tech Stack:** Home Assistant Dashboard YAML, custom cards: `power-flow-card-plus`, `apexcharts-card`, `mushroom-*-card`.

**Spec:** `docs/superpowers/specs/2026-03-24-energiemanagement-dashboard-redesign.md`

**Current file:** `config/kamrui-n100/dashboards/energiemanagement.yaml`

---

## File Structure

Only one file is modified:

- **Modify:** `config/kamrui-n100/dashboards/energiemanagement.yaml` — complete rewrite of the `views:` list

The file will be rewritten in 4 tasks (backup + 3 tabs), each producing a valid YAML state.

**Convention:** All ".bak line X-Y" references in this plan refer to the current file content as it exists before Task 1. After Task 1 Step 1, this content is preserved as `.bak`. When copying cards, copy only the card definition (starting with `- type:`), NOT the surrounding `- type: grid` wrapper or `- type: heading` — each new section provides its own grid wrapper and heading. Target indentation for cards inside sections is 10 spaces (cards sit under `cards:` inside `- type: grid`).

---

### Task 1: Backup and scaffold 3-tab structure

**Files:**
- Modify: `config/kamrui-n100/dashboards/energiemanagement.yaml`

- [ ] **Step 1: Create backup of current dashboard**

```bash
cp config/kamrui-n100/dashboards/energiemanagement.yaml config/kamrui-n100/dashboards/energiemanagement.yaml.bak
```

- [ ] **Step 2: Write the 3-tab scaffold**

Replace the entire file content with the skeleton structure. Each tab is a `type: sections` view with placeholder comments. This ensures valid YAML at every step.

```yaml
views:
  # ════════════════════════════════════════════════════
  # Tab 1: Cockpit — Quick-Check + Steuerung
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Cockpit"
    icon: mdi:home-lightning-bolt
    max_columns: 1
    sections: []

  # ════════════════════════════════════════════════════
  # Tab 2: Analyse — Zeitreihen & Charts
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Analyse"
    icon: mdi:chart-line
    max_columns: 3
    sections: []

  # ════════════════════════════════════════════════════
  # Tab 3: Wärmepumpe — Status, Steuerung, Diagnose
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Wärmepumpe"
    icon: mdi:heat-pump-outline
    max_columns: 2
    sections: []
```

- [ ] **Step 3: Validate YAML syntax**

```bash
python3 -c "import yaml; yaml.safe_load(open('config/kamrui-n100/dashboards/energiemanagement.yaml'))"
```

Expected: no output (valid YAML).

- [ ] **Step 4: Commit**

```bash
git add config/kamrui-n100/dashboards/energiemanagement.yaml config/kamrui-n100/dashboards/energiemanagement.yaml.bak
git commit -m "refactor: scaffold 3-tab dashboard structure with backup"
```

---

### Task 2: Implement Tab 1 — Cockpit

**Files:**
- Modify: `config/kamrui-n100/dashboards/energiemanagement.yaml` (replace `sections: []` under Tab 1)

**Source sections from current file (line references to `.bak`):**
- Energiefluss: lines 14-37 (power-flow-card-plus card only, NOT the grid wrapper at line 10-13)
- KPI-Chips: lines 38-61 (mushroom-chips-card) — copy, remove SOC chip (lines 50-56, redundant with power-flow-card)
- EMHASS status cards: lines 641-704 (from current Tab 2) — merge into one new template-card (see inline YAML below)
- Batterie-Steuerung buttons: lines 971-988 + 1047-1081 (from current Tab 2) — see inline YAML below
- Modus-Anzeige: lines 995-1046 (from current Tab 2) — folded into EMHASS card secondary line
- Netz-Empfehlung: lines 678-694 (from current Tab 2) — intentionally omitted from Cockpit (available in Analyse tab EMHASS chart); the Cockpit focuses on battery recommendation only

- [ ] **Step 1: Write Tab 1 sections**

Replace `sections: []` under Tab 1 with the following 4 sections:

**Section 1 — Energiefluss:** Copy the power-flow-card-plus card from lines 14-37 (NOT lines 10-13 which are the grid wrapper/heading — each section provides its own).

**Section 2 — KPI-Chips:** Copy mushroom-chips-card from current lines 38-61, but remove the SOC chip (lines 50-56) since power-flow-card already shows SOC. Keep: Autarkie, Eigenverbrauch, Strompreis.

**Section 3 — EMHASS-Empfehlung + Modus:** Create a NEW `custom:mushroom-template-card` that merges EMHASS status + battery mode into one compact card:

```yaml
      # ── EMHASS-Empfehlung + Modus ──────────────────────
      - type: grid
        cards:
          - type: heading
            heading: EMHASS-Empfehlung
          - type: custom:mushroom-template-card
            primary: >-
              {% set p = states('sensor.p_batt_forecast') | float(0) %}
              {% if states('sensor.p_batt_forecast') in ['unknown', 'unavailable'] %}Akku: —
              {% elif p > 50 %}Akku laden · Ziel {{ states('sensor.soc_batt_forecast') | float(0) | round(0) }}%
              {% elif p < -50 %}Akku entladen · Ziel {{ states('sensor.soc_batt_forecast') | float(0) | round(0) }}%
              {% else %}Akku halten · SOC {{ states('sensor.soc_batt_forecast') | float(0) | round(0) }}%
              {% endif %}
            secondary: >-
              {% set status = states('sensor.optim_status') %}
              {% set last = state_attr('automation.emhass_day_ahead_optimierung', 'last_triggered') %}
              {% set gain = states('sensor.total_cost_fun_value') | float(0) | round(2) %}
              {% set mode = states('select.battery_forced_charge_discharge') %}
              {{ status if status not in ['unknown', 'unavailable', ''] else 'Keine Daten' }}
              · {{ gain }}€
              {% if last %} · {{ as_timestamp(last) | timestamp_custom('%H:%M') }}{% endif %}
              · {% if mode == 'Forced charge' %}Zwangsladen{% elif mode == 'Forced discharge' %}Zwangsentladen{% else %}Eigenverbrauch{% endif %}
            icon: mdi:robot
            icon_color: >-
              {% if states('sensor.optim_status') == 'Optimal' %}green
              {% elif states('sensor.optim_status') in ['unknown', 'unavailable', ''] %}grey
              {% else %}red{% endif %}
            entity: sensor.p_batt_forecast
            badge_icon: >-
              {% set mode = states('select.battery_forced_charge_discharge') %}
              {% if mode == 'Forced charge' %}mdi:battery-arrow-up
              {% elif mode == 'Forced discharge' %}mdi:battery-arrow-down
              {% else %}mdi:battery-check{% endif %}
            badge_color: >-
              {% set mode = states('select.battery_forced_charge_discharge') %}
              {% if mode == 'Forced charge' %}orange
              {% else %}green{% endif %}
```

**Section 4 — Batterie-Steuerung:** Copy the 5 action buttons from current Tab 2:

```yaml
      # ── Batterie-Steuerung ──────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: Batterie-Steuerung
          - type: button
            name: "1h / 5kW"
            icon: mdi:battery-arrow-up
            icon_height: 40px
            tap_action:
              action: call-service
              service: script.batterie_zwangsladen
              data:
                dauer_stunden: 1
                ladeleistung: 5000
              confirmation:
                text: "Batterie 1 Stunde mit 5 kW zwangsladen?"
          - type: button
            name: "2h / 5kW"
            icon: mdi:battery-clock
            icon_height: 40px
            tap_action:
              action: call-service
              service: script.batterie_zwangsladen
              data:
                dauer_stunden: 2
                ladeleistung: 5000
              confirmation:
                text: "Batterie 2 Stunden mit 5 kW zwangsladen?"
          - type: button
            name: "Stoppen"
            icon: mdi:battery-remove
            icon_height: 40px
            tap_action:
              action: call-service
              service: scene.turn_on
              target:
                entity_id: scene.self_consumption_mode_max_battery_discharge
              confirmation:
                text: "Zwangsladen abbrechen und auf Eigenverbrauch wechseln?"
          - type: button
            name: "Day-Ahead"
            icon: mdi:chart-timeline-variant-shimmer
            icon_height: 40px
            tap_action:
              action: call-service
              service: rest_command.emhass_dayahead
              confirmation:
                text: "EMHASS Day-Ahead Optimierung jetzt starten?"
          - type: button
            name: "Publish"
            icon: mdi:publish
            icon_height: 40px
            tap_action:
              action: call-service
              service: rest_command.emhass_publish
              confirmation:
                text: "EMHASS Sensoren in HA aktualisieren?"
```

- [ ] **Step 2: Validate YAML syntax**

```bash
python3 -c "import yaml; yaml.safe_load(open('config/kamrui-n100/dashboards/energiemanagement.yaml'))"
```

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/dashboards/energiemanagement.yaml
git commit -m "feat: implement Cockpit tab (Tab 1) with KPIs and controls"
```

---

### Task 3: Implement Tab 2 — Analyse

**Files:**
- Modify: `config/kamrui-n100/dashboards/energiemanagement.yaml` (replace `sections: []` under Tab 2)

**Source sections from current file (line references to `.bak`):**
- PV chart: lines 187-255 — copy as-is
- MPPT chart: lines 493-536 — copy as-is (already has `grid_options.columns: full`)
- Empfohlener Leistungsverlauf: lines 706-845 — copy as-is from current Tab 2
- SOC chart: lines 847-910 — copy as-is from current Tab 2
- Batterie Lade/Entlade chart: lines 304-334 — copy as-is from current Tab 1
- Netz chart: lines 351-381 — copy as-is from current Tab 1
- Strompreis chart: lines 68-149 — copy as-is from current Tab 1
- Strompreis markdown + entities: lines 150-180 — copy as-is
- Verbrauch chart: lines 414-445 — copy as-is from current Tab 1
- Shelly entities: lines 590-624 — copy as-is from current Tab 1
- Hardware entities: lines 558-583 — copy as-is from current Tab 1

**Intentionally dropped charts (redundancy):**
- Börsenpreis chart (lines 911-967): redundant with Strompreis chart — same entity `sensor.current_electricity_market_price` already shown in Netz & Strompreis section. The Einspeisevergütung reference line (0.082 €/kWh) is a static value, not worth a dedicated chart.
- MPPT entity-cards (lines 537-556): MPPT power/voltage values are readable from the MPPT chart. Entity-cards are redundant.

- [ ] **Step 1: Write Tab 2 Section 1 — PV & Forecast**

```yaml
      # ── PV & Forecast ──────────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: PV & Forecast
          # PV Real vs. Solcast Forecast chart — copy from .bak lines 187-255
          # (the full apexcharts-card with PV Real + Forecast + Konfidenzband 10/90)
          # Add grid_options.columns: full
```

Copy the PV ApexChart from `.bak` lines 187-255 exactly, adding `grid_options: columns: full` at the top of the card.

Copy the MPPT chart from `.bak` lines 493-536 exactly, ensure `grid_options: columns: full`.

Add Solcast chips (replacing the old entity-card section):

```yaml
          - type: custom:mushroom-chips-card
            chips:
              - type: entity
                entity: sensor.solcast_pv_forecast_prognose_heute
                icon: mdi:solar-power
                name: Heute
              - type: entity
                entity: sensor.solcast_pv_forecast_prognose_morgen
                icon: mdi:weather-sunny
                name: Morgen
              - type: entity
                entity: sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute
                icon: mdi:sun-clock
                name: Verbleibend
              - type: entity
                entity: sensor.daily_pv_generation
                icon: mdi:solar-power-variant
                name: Real heute
```

- [ ] **Step 2: Write Tab 2 Section 2 — Batterie & EMHASS-Plan**

```yaml
      # ── Batterie & EMHASS-Plan ──────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: Batterie & EMHASS-Plan
          # Empfohlener Leistungsverlauf chart — copy from .bak lines 706-845
          # (the 6-series chart: PV Real+FC, Verbrauch Real+FC, Akku, Netz Real+FC)
          # Already has grid_options.columns: full and now-line
```

Copy the Empfohlener Leistungsverlauf ApexChart from `.bak` lines 706-845 exactly.

Copy the SOC chart from `.bak` lines 847-910 exactly.

Copy the Batterie Lade-/Entladeleistung chart from `.bak` lines 304-334, adding `grid_options: columns: full`.

Add chips for daily battery stats:

```yaml
          - type: custom:mushroom-chips-card
            chips:
              - type: entity
                entity: sensor.daily_battery_charge
                icon: mdi:battery-plus
                name: Geladen
              - type: entity
                entity: sensor.daily_battery_discharge
                icon: mdi:battery-minus
                name: Entladen
```

- [ ] **Step 3: Write Tab 2 Section 3 — Netz & Strompreis**

```yaml
      # ── Netz & Strompreis ───────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: Netz & Strompreis
          # Netzbezug/Einspeisung chart — copy from .bak lines 351-381
          # Add grid_options.columns: full
          # Strompreis chart — copy from .bak lines 68-149
          # Add grid_options.columns: full and now-line
```

**Spec deviation:** The spec suggests a single dual-Y-axis chart combining Netz + Preis. We keep them as two separate charts instead — the existing charts are well-tuned and a combined 8-series dual-axis chart would be hard to read. The information is the same, just in two stacked charts.

Copy the Netz chart from `.bak` lines 351-381, adding `grid_options: columns: full`.

Copy the Strompreis chart from `.bak` lines 68-149, adding at the card top level:

```yaml
            grid_options:
              columns: full
            now:
              show: true
              label: Jetzt
```

Copy the Strompreis markdown from `.bak` lines 170-180.

Copy entity-cards: 1komma5° aktuell, ENTSO-e aktuell, ENTSO-e Min, ENTSO-e Max from `.bak` lines 150-169.

Add import/export chips:

```yaml
          - type: custom:mushroom-chips-card
            chips:
              - type: entity
                entity: sensor.daily_imported_energy
                icon: mdi:transmission-tower-import
                name: Import heute
              - type: entity
                entity: sensor.daily_exported_energy
                icon: mdi:transmission-tower-export
                name: Export heute
```

- [ ] **Step 4: Write Tab 2 Section 4 — Verbrauch**

Copy from `.bak`:
- Hausverbrauch template-card: lines 406-413 (current Watt display)
- Verbrauch chart: lines 414-445 (add `grid_options: columns: full`)
- Grundlast template-card: lines 590-599
- Shelly entity-cards: lines 600-624

Note: The Autarkie template-card (lines 398-405) is intentionally dropped — already shown as KPI chip in Cockpit.

- [ ] **Step 5: Write Tab 2 Section 5 — Hardware**

Copy from `.bak`: lines 558-583 (battery temp, inverter temp, SOH).

- [ ] **Step 6: Validate YAML syntax**

```bash
python3 -c "import yaml; yaml.safe_load(open('config/kamrui-n100/dashboards/energiemanagement.yaml'))"
```

- [ ] **Step 7: Commit**

```bash
git add config/kamrui-n100/dashboards/energiemanagement.yaml
git commit -m "feat: implement Analyse tab (Tab 2) with all charts and details"
```

---

### Task 4: Implement Tab 3 — Wärmepumpe

**Files:**
- Modify: `config/kamrui-n100/dashboards/energiemanagement.yaml` (replace `sections: []` under Tab 3)

**Source sections from current file (line references to `.bak`):**
- WP Status card: lines 1088-1104 (NOT 1105-1120 which is Extra-WW toggle — that goes in Steuerung)
- WP Betriebsmodus chips: lines 1220-1251 — copy
- WP Diagnose/Status cards: lines 1204-1306 — copy
- WP Temperaturen entities: lines 1128-1197 — copy (change slider → buttons)
- WP Steuerung: lines 1370-1428 — copy (change slider → buttons)
- WP Temperatur chart: lines 1431-1512 — copy
- WP Leistung chart: lines 1513-1546 — copy
- WP COP section: lines 1313-1363 — copy
- WP SG-Ready: lines 1403-1428 — copy

- [ ] **Step 1: Write Tab 3 Section 1 — Status**

```yaml
      # ── Status ──────────────────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: Status
```

Copy the WP status template-card from `.bak` lines 1088-1104 only (Leistung, COP, Betriebszustand). Do NOT include lines 1105-1120 (Extra-WW toggle) — that goes in Section 3 (Steuerung).

Copy the Operation Mode template-card from `.bak` lines 1204-1219.

Copy the Betriebsmodus chips-card from `.bak` lines 1220-1251 (VD1, Heizstab, HUP, EVU).

Copy the Alarm/Druck template-card from `.bak` lines 1252-1261.

- [ ] **Step 2: Write Tab 3 Section 2 — Temperaturen**

Copy all temperature entity-cards from `.bak` lines 1128-1187 (Vorlauf, Rücklauf, WW, Außen, Wärmequelle, Durchfluss, Soll/Ist Heizung, Soll/Ist WW). Already uses `display_mode: buttons` (changed in earlier commit).

- [ ] **Step 3: Write Tab 3 Section 3 — Steuerung**

Copy from `.bak`:
- Extra-WW toggle: lines 1105-1120 (with confirmation)
- Sollwert Heizung: lines 1188-1192 (`display_mode: buttons`)
- Sollwert Warmwasser: lines 1193-1197 (`display_mode: buttons`)
- Heizung sperren: lines 1370-1385 (with confirmation)
- WW sperren: lines 1386-1401 (with confirmation)
- SG-Ready controls: lines 1404-1429 (Modus Heizen, Offset Heizen, Modus WW, Offset WW, Power Control Mode, Smart Mode). Do NOT copy the heading at line 1402-1403 — each section provides its own heading.

**Important:** Change `display_mode: slider` → `display_mode: buttons` for `number.licv_8_2r1_3_offset_heizen` and `number.licv_8_2r1_3_offset_warmw` (same safety fix as Sollwert sliders).

- [ ] **Step 4: Write Tab 3 Section 4 — Diagnose & Statistik**

Copy from `.bak`:
- Temperature chart: lines 1431-1512 (6-series ApexChart, add `grid_options: columns: full`)
- WP Leistung chart: lines 1513-1546 (add `grid_options: columns: full`)
- COP markdown table: lines 1313-1339 (add `grid_options: columns: full`)
- COP template-cards: lines 1340-1363
- Entity-cards: Heizleistung (line 1263), Stromaufnahme myUplink (line 1268), Betriebsstunden Verdichter (line 1273), Betriebsstunden Heizen (line 1278), Betriebsstunden WW (line 1283), Stromzähler Shelly 3EM (line 1288), Wärmemenge gesamt (line 1293), Heizung gesamt (line 1298), Warmwasser gesamt (line 1303)

- [ ] **Step 5: Validate YAML syntax**

```bash
python3 -c "import yaml; yaml.safe_load(open('config/kamrui-n100/dashboards/energiemanagement.yaml'))"
```

- [ ] **Step 6: Commit**

```bash
git add config/kamrui-n100/dashboards/energiemanagement.yaml
git commit -m "feat: implement Wärmepumpe tab (Tab 3) with status, controls, diagnostics"
```

---

### Task 5: Final validation and cleanup

**Files:**
- Modify: `config/kamrui-n100/dashboards/energiemanagement.yaml` (if fixes needed)
- Delete: `config/kamrui-n100/dashboards/energiemanagement.yaml.bak` (after confirmation)

- [ ] **Step 1: Full YAML validation**

```bash
python3 -c "import yaml; yaml.safe_load(open('config/kamrui-n100/dashboards/energiemanagement.yaml'))"
```

- [ ] **Step 2: Verify all 3 tabs have content**

```bash
grep -n "^  - type: sections" config/kamrui-n100/dashboards/energiemanagement.yaml
```

Expected: 3 lines (one per tab).

- [ ] **Step 3: Verify no content was lost — compare entity counts**

```bash
# Count unique entity IDs in both files
grep -oP "entity: \K\S+" config/kamrui-n100/dashboards/energiemanagement.yaml.bak | sort -u > /tmp/old-entities.txt
grep -oP "entity: \K\S+" config/kamrui-n100/dashboards/energiemanagement.yaml | sort -u > /tmp/new-entities.txt
# Show entities in old but not in new (should only be intentionally removed ones)
comm -23 /tmp/old-entities.txt /tmp/new-entities.txt
```

Expected intentionally removed entities (redundancy elimination):
- `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute`
- `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen`
- `sensor.solcast_pv_forecast_prognose_aktuelle_stunde`
- `sensor.solcast_pv_forecast_prognose_nachste_stunde`
- `sensor.solcast_pv_forecast_leistung_in_30_minuten`
- `sensor.solcast_pv_forecast_leistung_in_1_stunde`

Any other missing entity is a bug — fix before proceeding.

- [ ] **Step 4: Remove backup after user confirms dashboard works**

```bash
rm config/kamrui-n100/dashboards/energiemanagement.yaml.bak
git add -A
git commit -m "chore: remove dashboard backup after successful migration"
```

Note: Only run this step after deploying to N100 and verifying the dashboard renders correctly.
