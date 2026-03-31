# 1komma5° vs EMHASS Vergleich — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a tracking system with template sensors, utility meters, and a dedicated dashboard to objectively compare 1komma5° Heartbeat battery decisions vs. EMHASS optimization, including heat pump optimization potential.

**Architecture:** Template sensors compute real-time costs and deltas, utility meters aggregate to daily/weekly/monthly sums, and a new ApexCharts dashboard visualizes the comparison across three tabs (Live, Woche, Monat).

**Tech Stack:** Home Assistant YAML (template sensors, utility meters, input_number), ApexCharts Card, Mushroom Cards

**Spec:** `docs/superpowers/specs/2026-04-01-1k5-vs-emhass-vergleich-design.md`

---

## Constraints

- **No YAML anchors** in dashboard files — HA Lovelace parser does not support `&anchor`/`*ref`
- **ApexCharts `span:`** only accepts `day`, `hour`, `minute`, `week`, `month`, `year`, `isoWeek` — NOT `now`. For rolling windows, omit `span:` entirely.
- **Commits in English**, code comments and docs in German
- All entity IDs use the full 1komma5° UUID suffix: `7fee2e61_1ff6_4eaf_8a8e_7509522abb45`

## File Map

| File | Action | Responsibility |
|------|--------|----------------|
| `config/kamrui-n100/configuration.yaml` | Modify | Add `input_number.einspeiseverguetung` |
| `config/kamrui-n100/template_sensors.yaml` | Modify | Add 6 new sensors (heartbeat modus, costs, delta, WP) |
| `config/kamrui-n100/utility_meter.yaml` | Modify | Add 15 utility meters |
| `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml` | Create | New comparison dashboard (3 tabs) |

---

## Task 1: Input Number Helper

**Files:**
- Modify: `config/kamrui-n100/configuration.yaml`

- [ ] **Step 1: Add input_number for Einspeisevergütung**

Add after the existing `input_select:` block (line 31) in `configuration.yaml`:

```yaml
input_number:
  einspeiseverguetung:
    name: "Einspeisevergütung"
    min: 0
    max: 0.20
    step: 0.001
    unit_of_measurement: "EUR/kWh"
    icon: mdi:currency-eur
    initial: 0.082
```

- [ ] **Step 2: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('configuration.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/configuration.yaml
git commit -m "feat: add input_number helper for feed-in tariff rate"
```

---

## Task 2: Heartbeat Mode Sensor

**Files:**
- Modify: `config/kamrui-n100/template_sensors.yaml`

- [ ] **Step 1: Add heartbeat_modus sensor**

Append to `template_sensors.yaml` after the existing WP COP sensors:

```yaml
# ── 1komma5° Heartbeat Modus-Tracking ─────────────
- sensor:
    - name: "Heartbeat Modus"
      unique_id: heartbeat_modus
      icon: mdi:heart-pulse
      state: >
        {% set charge = states('sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set discharge = states('sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set export = states('sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% if charge > 100 %}laden
        {% elif discharge > 100 %}entladen
        {% elif export < 10 and charge < 100 and discharge < 100 %}zero_export
        {% else %}idle
        {% endif %}
```

- [ ] **Step 2: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('template_sensors.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/template_sensors.yaml
git commit -m "feat: add heartbeat mode tracking sensor"
```

---

## Task 3: Cost Comparison Sensors

**Files:**
- Modify: `config/kamrui-n100/template_sensors.yaml`

- [ ] **Step 1: Add real cost sensor (1k5_netzbezugskosten_laufend)**

Append to `template_sensors.yaml`:

```yaml
# ── 1komma5° vs EMHASS Kostenvergleich ─────────────
- sensor:
    - name: "1k5 Netzbezugskosten laufend"
      unique_id: 1k5_netzbezugskosten_laufend
      unit_of_measurement: "EUR/h"
      state_class: measurement
      icon: mdi:cash
      state: >
        {% set import_kw = states('sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) / 1000 %}
        {% set export_kw = states('sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) / 1000 %}
        {% set preis = states('sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set einspeisung = states('input_number.einspeiseverguetung') | float(0.082) %}
        {{ (import_kw * preis - export_kw * einspeisung) | round(4) }}
```

- [ ] **Step 2: Add EMHASS theoretical cost sensor**

Append to `template_sensors.yaml`:

```yaml
    - name: "EMHASS Theo Kosten laufend"
      unique_id: emhass_theo_kosten_laufend
      unit_of_measurement: "EUR/h"
      state_class: measurement
      icon: mdi:robot
      state: >
        {% set verbrauch = states('sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set pv = states('sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set batt = states('sensor.p_batt_forecast') | float(0) %}
        {% set preis = states('sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set einspeisung = states('input_number.einspeiseverguetung') | float(0.082) %}
        {% set net = (verbrauch - pv + batt) / 1000 %}
        {% set theo_import = [0, net] | max %}
        {% set theo_export = [0, -net] | max %}
        {{ (theo_import * preis - theo_export * einspeisung) | round(4) }}
```

Vorzeichen-Konvention: `p_batt_forecast` positiv = Laden (erhöht Netzbezug), negativ = Entladen (reduziert Netzbezug). Daher `verbrauch - pv + batt`. (Quelle: `docs/emhass-referenz.md`)

- [ ] **Step 3: Add delta sensor**

Append to `template_sensors.yaml`:

```yaml
    - name: "Entscheidungs-Delta laufend"
      unique_id: entscheidungs_delta_laufend
      unit_of_measurement: "EUR/h"
      state_class: measurement
      icon: mdi:swap-horizontal
      state: >
        {% set real = states('sensor.1k5_netzbezugskosten_laufend') | float(0) %}
        {% set theo = states('sensor.emhass_theo_kosten_laufend') | float(0) %}
        {{ (real - theo) | round(4) }}
```

- [ ] **Step 4: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('template_sensors.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 5: Commit**

```bash
git add config/kamrui-n100/template_sensors.yaml
git commit -m "feat: add real-time cost comparison sensors (1k5 vs EMHASS)"
```

---

## Task 4: Heat Pump Cost Sensors

**Files:**
- Modify: `config/kamrui-n100/template_sensors.yaml`

- [ ] **Step 1: Add WP cost sensor**

Append to the cost comparison sensor block in `template_sensors.yaml`:

```yaml
# ── Wärmepumpen-Kostentracking ─────────────────────
    - name: "WP Stromkosten laufend"
      unique_id: wp_stromkosten_laufend
      unit_of_measurement: "EUR/h"
      state_class: measurement
      icon: mdi:heat-pump
      state: >
        {% set wp_kw = states('sensor.kg_technik_waermepumpe_3em_leistung') | float(0) / 1000 %}
        {% set preis = states('sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {{ (wp_kw * preis) | round(4) }}
```

- [ ] **Step 2: Add WP savings potential sensor**

Append to `template_sensors.yaml`:

```yaml
    - name: "WP Einsparpotenzial laufend"
      unique_id: wp_einsparpotenzial_laufend
      unit_of_measurement: "EUR/h"
      state_class: measurement
      icon: mdi:piggy-bank
      state: >
        {% set wp_kw = states('sensor.kg_technik_waermepumpe_3em_leistung') | float(0) / 1000 %}
        {% set preis = states('sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set preis_min = state_attr('sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45', 'price_today_min') | float(preis) %}
        {% set einspeisung = states('input_number.einspeiseverguetung') | float(0.082) %}
        {% set pv = states('sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set verbrauch = states('sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set batt_out = states('sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45') | float(0) %}
        {% set ueberschuss_kw = [0, (pv - verbrauch + batt_out) / 1000] | max %}
        {% if wp_kw <= 0 %}0
        {% elif ueberschuss_kw >= wp_kw %}
          {{ [0, wp_kw * (preis - einspeisung)] | max | round(4) }}
        {% else %}
          {{ [0, wp_kw * (preis - preis_min)] | max | round(4) }}
        {% endif %}
```

- [ ] **Step 3: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('template_sensors.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 4: Commit**

```bash
git add config/kamrui-n100/template_sensors.yaml
git commit -m "feat: add heat pump cost tracking and savings potential sensors"
```

---

## Task 5: Integration Sensors (Riemann-Summe)

**Files:**
- Modify: `config/kamrui-n100/configuration.yaml`

Utility Meters tracken State-Deltas, nicht zeitgewichtete Integrale. Daher brauchen wir `sensor.integration` (Riemann-Summe) als Zwischenschicht, die EUR/h über die Zeit zu kumulierten EUR integriert.

- [ ] **Step 1: Add integration sensors to configuration.yaml**

Add after the `input_number:` block in `configuration.yaml`:

```yaml
sensor:
  # ── Riemann-Summe: EUR/h → kumulierte EUR ────────
  - platform: integration
    source: sensor.1k5_netzbezugskosten_laufend
    name: "1k5 Netzbezugskosten kumuliert"
    unit_prefix: ""
    round: 4
    method: left

  - platform: integration
    source: sensor.emhass_theo_kosten_laufend
    name: "EMHASS Theo Kosten kumuliert"
    unit_prefix: ""
    round: 4
    method: left

  - platform: integration
    source: sensor.entscheidungs_delta_laufend
    name: "Entscheidungs-Delta kumuliert"
    unit_prefix: ""
    round: 4
    method: left

  - platform: integration
    source: sensor.wp_stromkosten_laufend
    name: "WP Stromkosten kumuliert"
    unit_prefix: ""
    round: 4
    method: left

  - platform: integration
    source: sensor.wp_einsparpotenzial_laufend
    name: "WP Einsparpotenzial kumuliert"
    unit_prefix: ""
    round: 4
    method: left
```

- [ ] **Step 2: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('configuration.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/configuration.yaml
git commit -m "feat: add Riemann sum integration sensors for cost accumulation"
```

---

## Task 6: Utility Meters

**Files:**
- Modify: `config/kamrui-n100/utility_meter.yaml`

Utility Meters nutzen die kumulierten EUR-Sensoren (Integration), nicht die EUR/h-Rate-Sensoren.

- [ ] **Step 1: Add battery decision comparison utility meters**

Append to `utility_meter.yaml`:

```yaml
# ── 1komma5° vs EMHASS Kostenvergleich ─────────────
# Batterie-Entscheidungsvergleich
1k5_real_kosten_tag:
  source: sensor.1k5_netzbezugskosten_kumuliert
  name: "1k5 Real Kosten Tag"
  cycle: daily

emhass_theo_kosten_tag:
  source: sensor.emhass_theo_kosten_kumuliert
  name: "EMHASS Theo Kosten Tag"
  cycle: daily

entscheidungs_delta_tag:
  source: sensor.entscheidungs_delta_kumuliert
  name: "Entscheidungs-Delta Tag"
  cycle: daily

1k5_real_kosten_woche:
  source: sensor.1k5_netzbezugskosten_kumuliert
  name: "1k5 Real Kosten Woche"
  cycle: weekly

emhass_theo_kosten_woche:
  source: sensor.emhass_theo_kosten_kumuliert
  name: "EMHASS Theo Kosten Woche"
  cycle: weekly

entscheidungs_delta_woche:
  source: sensor.entscheidungs_delta_kumuliert
  name: "Entscheidungs-Delta Woche"
  cycle: weekly

1k5_real_kosten_monat:
  source: sensor.1k5_netzbezugskosten_kumuliert
  name: "1k5 Real Kosten Monat"
  cycle: monthly

emhass_theo_kosten_monat:
  source: sensor.emhass_theo_kosten_kumuliert
  name: "EMHASS Theo Kosten Monat"
  cycle: monthly

entscheidungs_delta_monat:
  source: sensor.entscheidungs_delta_kumuliert
  name: "Entscheidungs-Delta Monat"
  cycle: monthly
```

- [ ] **Step 2: Add WP tracking utility meters**

Append to `utility_meter.yaml`:

```yaml
# Wärmepumpen-Tracking
wp_stromkosten_tag:
  source: sensor.wp_stromkosten_kumuliert
  name: "WP Stromkosten Tag"
  cycle: daily

wp_einsparpotenzial_tag:
  source: sensor.wp_einsparpotenzial_kumuliert
  name: "WP Einsparpotenzial Tag"
  cycle: daily

wp_stromkosten_woche:
  source: sensor.wp_stromkosten_kumuliert
  name: "WP Stromkosten Woche"
  cycle: weekly

wp_einsparpotenzial_woche:
  source: sensor.wp_einsparpotenzial_kumuliert
  name: "WP Einsparpotenzial Woche"
  cycle: weekly

wp_stromkosten_monat:
  source: sensor.wp_stromkosten_kumuliert
  name: "WP Stromkosten Monat"
  cycle: monthly

wp_einsparpotenzial_monat:
  source: sensor.wp_einsparpotenzial_kumuliert
  name: "WP Einsparpotenzial Monat"
  cycle: monthly
```

- [ ] **Step 3: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('utility_meter.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 4: Commit**

```bash
git add config/kamrui-n100/utility_meter.yaml
git commit -m "feat: add 15 utility meters for cost comparison tracking"
```

---

## Task 7: Dashboard — Tab 1 (Live)

**Files:**
- Create: `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml`

**Important:** No YAML anchors allowed. ApexCharts `span:` only accepts `day`/`hour`/`week`/`month`/`year`/`isoWeek`.

- [ ] **Step 1: Create dashboard skeleton with KPI chips**

Create `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml`:

```yaml
views:
  # ════════════════════════════════════════════════════
  # Tab 1: Live — Tagesvergleich (5-Min-Auflösung)
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Live"
    icon: mdi:chart-timeline-variant
    max_columns: 1
    sections:
      # ── KPI-Chips ──────────────────────────────────────
      - type: grid
        cards:
          - type: custom:mushroom-chips-card
            chips:
              - type: template
                icon: mdi:cash
                icon_color: >-
                  {% set d = states('sensor.entscheidungs_delta_laufend') | float(0) %}
                  {% if d > 0 %}red{% elif d < 0 %}green{% else %}grey{% endif %}
                content: >-
                  Real {{ states('sensor.1k5_real_kosten_tag') | float(0) | round(2) }}€
                entity: sensor.1k5_real_kosten_tag
              - type: template
                icon: mdi:robot
                icon_color: blue
                content: >-
                  EMHASS {{ states('sensor.emhass_theo_kosten_tag') | float(0) | round(2) }}€
                entity: sensor.emhass_theo_kosten_tag
              - type: template
                icon: mdi:swap-horizontal
                icon_color: >-
                  {% set d = states('sensor.entscheidungs_delta_tag') | float(0) %}
                  {% if d > 0 %}red{% elif d < 0 %}green{% else %}grey{% endif %}
                content: >-
                  {% set d = states('sensor.entscheidungs_delta_tag') | float(0) %}
                  Delta {{ d | round(2) }}€
                entity: sensor.entscheidungs_delta_tag
              - type: template
                icon: mdi:heat-pump
                icon_color: orange
                content: >-
                  WP {{ states('sensor.wp_stromkosten_tag') | float(0) | round(2) }}€
                entity: sensor.wp_stromkosten_tag
              - type: template
                icon: mdi:piggy-bank
                icon_color: green
                content: >-
                  WP-Potenzial {{ states('sensor.wp_einsparpotenzial_tag') | float(0) | round(2) }}€
                entity: sensor.wp_einsparpotenzial_tag
              - type: template
                icon: mdi:heart-pulse
                icon_color: >-
                  {% set m = states('sensor.heartbeat_modus') %}
                  {% if m == 'laden' %}green
                  {% elif m == 'entladen' %}orange
                  {% elif m == 'zero_export' %}red
                  {% else %}grey{% endif %}
                content: >-
                  {{ states('sensor.heartbeat_modus') | capitalize }}
                entity: sensor.heartbeat_modus
```

- [ ] **Step 2: Add Chart 1 — Batterie-Fahrplan-Vergleich**

Append to the Tab 1 sections in `1k5-vs-emhass.yaml`:

```yaml
      # ── Batterie-Fahrplan-Vergleich ────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Batterie: EMHASS-Plan vs. Realität"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Batterie-Leistung (+ Laden / − Entladen)"
              show_states: true
              colorize_states: true
            now:
              show: true
              label: Jetzt
            graph_span: 24h
            span:
              start: day
            apex_config:
              chart:
                height: 300
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: power
                apex_config:
                  title:
                    text: Watt
                  labels:
                    formatter: |
                      EVAL:function(val) { return val ? Math.round(val) : '0'; }
            series:
              - entity: sensor.p_batt_forecast
                name: "EMHASS Plan"
                color: "#4CAF50"
                stroke_width: 2
                stroke_dash: 5
                curve: stepline
                float_precision: 0
                yaxis_id: power
                show:
                  in_header: raw
                extend_to: false
                group_by:
                  func: last
                  duration: 30min
              - entity: sensor.battery_charging_power
                name: "Laden (Real)"
                color: "#22c55e"
                stroke_width: 2
                curve: smooth
                float_precision: 0
                yaxis_id: power
                show:
                  in_header: raw
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
                transform: "return -x;"
              - entity: sensor.battery_discharging_power
                name: "Entladen (Real)"
                color: "#f59e0b"
                stroke_width: 2
                curve: smooth
                float_precision: 0
                yaxis_id: power
                show:
                  in_header: raw
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
```

- [ ] **Step 3: Add Chart 2 — SOC-Vergleich**

Append to the Tab 1 sections:

```yaml
      # ── SOC-Vergleich ──────────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Akkustand: Empfehlung vs. Realität"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "SOC-Verlauf"
            now:
              show: true
              label: Jetzt
            graph_span: 24h
            span:
              start: day
            apex_config:
              chart:
                height: 220
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: soc
                min: 0
                max: 100
                apex_config:
                  title:
                    text: "%"
            series:
              - entity: sensor.soc_batt_forecast
                name: "EMHASS Empfehlung"
                color: "#4CAF50"
                stroke_width: 2
                stroke_dash: 5
                curve: stepline
                extend_to: false
                yaxis_id: soc
                group_by:
                  func: last
                  duration: 30min
              - entity: sensor.battery_level
                name: "Aktuell"
                color: "#FF9800"
                stroke_width: 2
                curve: smooth
                extend_to: false
                yaxis_id: soc
                group_by:
                  func: avg
                  duration: 5min
```

- [ ] **Step 4: Add Chart 3 — Preis + Heartbeat-Modus**

Append to the Tab 1 sections. Heartbeat-Modus als numerische Area-Series (Opacity-Trick):

```yaml
      # ── Preis + Heartbeat-Modus ────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Strompreis & Heartbeat-Modus"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "1komma5° Preis + Modus"
            now:
              show: true
              label: Jetzt
            graph_span: 24h
            span:
              start: day
            apex_config:
              chart:
                height: 250
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: preis
                min: 0
                apex_config:
                  title:
                    text: "EUR/kWh"
                  labels:
                    formatter: |
                      EVAL:function(val) { return val ? val.toFixed(2) : '0'; }
            series:
              - entity: sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45
                name: "Strompreis"
                color: "#4CAF50"
                stroke_width: 2
                curve: stepline
                float_precision: 4
                yaxis_id: preis
                extend_to: false
                group_by:
                  func: last
                  duration: 5min
              - entity: sensor.heartbeat_modus
                name: "Modus"
                yaxis_id: preis
                curve: stepline
                stroke_width: 0
                type: area
                opacity: 0.15
                extend_to: false
                show:
                  in_header: false
                  legend_value: false
                group_by:
                  func: last
                  duration: 5min
                color_threshold:
                  - value: 0
                    color: grey
                  - value: 1
                    color: green
                  - value: 2
                    color: orange
                  - value: 3
                    color: red
                transform: >-
                  if (x === 'laden') return 1;
                  if (x === 'entladen') return 2;
                  if (x === 'zero_export') return 3;
                  return 0;
```

**Hinweis:** Der `transform`-Ansatz wandelt den kategorischen Modus in numerische Werte um. Die Werte werden auf die Preis-Y-Achse gemappt — die absolute Höhe ist weniger relevant als die Farbcodierung. Falls der transform auf einer Text-Entity nicht funktioniert, wird in Task 9 ein Workaround implementiert.

- [ ] **Step 5: Add Chart 4 — Laufende Kosten**

Append to the Tab 1 sections:

```yaml
      # ── Kostenvergleich kumuliert ──────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Kostenvergleich (kumuliert)"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Tageskosten: Real vs. EMHASS"
              show_states: true
              colorize_states: true
            now:
              show: true
              label: Jetzt
            graph_span: 24h
            span:
              start: day
            apex_config:
              chart:
                height: 300
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: kosten
                apex_config:
                  title:
                    text: "EUR/h"
                  labels:
                    formatter: |
                      EVAL:function(val) { return val ? val.toFixed(3) : '0'; }
            series:
              - entity: sensor.1k5_netzbezugskosten_laufend
                name: "1komma5° Real"
                color: "#F44336"
                stroke_width: 2
                curve: smooth
                float_precision: 4
                yaxis_id: kosten
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
              - entity: sensor.emhass_theo_kosten_laufend
                name: "EMHASS Theoretisch"
                color: "#2196F3"
                stroke_width: 2
                stroke_dash: 5
                curve: smooth
                float_precision: 4
                yaxis_id: kosten
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
              - entity: sensor.entscheidungs_delta_laufend
                name: "Delta"
                color: "#FF9800"
                stroke_width: 1
                curve: smooth
                type: area
                opacity: 0.3
                float_precision: 4
                yaxis_id: kosten
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
```

- [ ] **Step 6: Add Chart 5 — Wärmepumpe**

Append to the Tab 1 sections:

```yaml
      # ── Wärmepumpe & Preis ─────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Wärmepumpe & Strompreis"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "WP-Verbrauch bei aktuellem Preisniveau"
              show_states: true
              colorize_states: true
            now:
              show: true
              label: Jetzt
            graph_span: 24h
            span:
              start: day
            apex_config:
              chart:
                height: 300
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: power
                min: 0
                apex_config:
                  title:
                    text: Watt
              - id: preis
                opposite: true
                min: 0
                apex_config:
                  title:
                    text: "EUR/kWh"
                  labels:
                    formatter: |
                      EVAL:function(val) { return val ? val.toFixed(2) : '0'; }
            series:
              - entity: sensor.kg_technik_waermepumpe_3em_leistung
                name: "WP Leistung"
                color: "#F44336"
                stroke_width: 2
                curve: smooth
                type: area
                opacity: 0.3
                float_precision: 0
                yaxis_id: power
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
              - entity: sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45
                name: "Strompreis"
                color: "#4CAF50"
                stroke_width: 2
                curve: stepline
                float_precision: 4
                yaxis_id: preis
                extend_to: false
                group_by:
                  func: last
                  duration: 5min
              - entity: sensor.total_dc_power
                name: "PV"
                color: "#f59e0b"
                stroke_width: 1
                stroke_dash: 5
                curve: smooth
                float_precision: 0
                yaxis_id: power
                show:
                  in_header: false
                extend_to: false
                group_by:
                  func: avg
                  duration: 5min
```

- [ ] **Step 7: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('dashboards/1k5-vs-emhass.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 8: Commit**

```bash
git add config/kamrui-n100/dashboards/1k5-vs-emhass.yaml
git commit -m "feat: add live comparison dashboard (Tab 1) with 5 charts and KPIs"
```

---

## Task 8: Dashboard — Tab 2 (Woche)

**Files:**
- Modify: `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml`

- [ ] **Step 1: Add Tab 2 with weekly cost comparison charts**

Append to the `views:` list in `1k5-vs-emhass.yaml`:

```yaml
  # ════════════════════════════════════════════════════
  # Tab 2: Woche — 7-Tage-Trend
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Woche"
    icon: mdi:calendar-week
    max_columns: 1
    sections:
      # ── Wochen-KPIs ────────────────────────────────────
      - type: grid
        cards:
          - type: custom:mushroom-chips-card
            chips:
              - type: template
                icon: mdi:cash
                icon_color: red
                content: >-
                  Real {{ states('sensor.1k5_real_kosten_woche') | float(0) | round(2) }}€
                entity: sensor.1k5_real_kosten_woche
              - type: template
                icon: mdi:robot
                icon_color: blue
                content: >-
                  EMHASS {{ states('sensor.emhass_theo_kosten_woche') | float(0) | round(2) }}€
                entity: sensor.emhass_theo_kosten_woche
              - type: template
                icon: mdi:swap-horizontal
                icon_color: >-
                  {% set d = states('sensor.entscheidungs_delta_woche') | float(0) %}
                  {% if d > 0 %}red{% elif d < 0 %}green{% else %}grey{% endif %}
                content: >-
                  Delta {{ states('sensor.entscheidungs_delta_woche') | float(0) | round(2) }}€
                entity: sensor.entscheidungs_delta_woche
              - type: template
                icon: mdi:piggy-bank
                icon_color: green
                content: >-
                  WP-Potenzial {{ states('sensor.wp_einsparpotenzial_woche') | float(0) | round(2) }}€
                entity: sensor.wp_einsparpotenzial_woche
      # ── Kostenvergleich 7 Tage ─────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Kosten: Real vs. EMHASS (7 Tage)"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Tägliche Kosten"
            graph_span: 7d
            span:
              start: isoWeek
            apex_config:
              chart:
                height: 300
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: kosten
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.1k5_netzbezugskosten_laufend
                name: "1komma5° Real"
                color: "#F44336"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
              - entity: sensor.emhass_theo_kosten_laufend
                name: "EMHASS Theoretisch"
                color: "#2196F3"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
      # ── Delta-Trend 7 Tage ────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Kumuliertes Delta (7 Tage)"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Delta-Trend (positiv = 1komma5° teurer)"
            graph_span: 7d
            span:
              start: isoWeek
            apex_config:
              chart:
                height: 250
              legend:
                show: true
            yaxis:
              - id: delta
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.entscheidungs_delta_laufend
                name: "Delta"
                color: "#FF9800"
                stroke_width: 2
                curve: smooth
                type: area
                opacity: 0.3
                float_precision: 2
                yaxis_id: delta
                group_by:
                  func: sum
                  duration: 1d
      # ── WP-Kosten Woche ───────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Wärmepumpe: Kosten & Einsparpotenzial"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "WP Tageskosten vs. verpasstes Potenzial"
            graph_span: 7d
            span:
              start: isoWeek
            apex_config:
              chart:
                height: 250
                stacked: true
              legend:
                show: true
            yaxis:
              - id: kosten
                min: 0
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.wp_stromkosten_laufend
                name: "WP Kosten"
                color: "#F44336"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
              - entity: sensor.wp_einsparpotenzial_laufend
                name: "Einsparpotenzial"
                color: "#4CAF50"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
```

- [ ] **Step 2: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('dashboards/1k5-vs-emhass.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/dashboards/1k5-vs-emhass.yaml
git commit -m "feat: add weekly comparison dashboard (Tab 2)"
```

---

## Task 9: Dashboard — Tab 3 (Monat)

**Files:**
- Modify: `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml`

- [ ] **Step 1: Add Tab 3 with monthly overview and summary**

Append to the `views:` list in `1k5-vs-emhass.yaml`:

```yaml
  # ════════════════════════════════════════════════════
  # Tab 3: Monat — Monatsübersicht
  # ════════════════════════════════════════════════════
  - type: sections
    title: "Monat"
    icon: mdi:calendar-month
    max_columns: 1
    sections:
      # ── Monats-KPIs ────────────────────────────────────
      - type: grid
        cards:
          - type: custom:mushroom-chips-card
            chips:
              - type: template
                icon: mdi:cash
                icon_color: red
                content: >-
                  Real {{ states('sensor.1k5_real_kosten_monat') | float(0) | round(2) }}€
                entity: sensor.1k5_real_kosten_monat
              - type: template
                icon: mdi:robot
                icon_color: blue
                content: >-
                  EMHASS {{ states('sensor.emhass_theo_kosten_monat') | float(0) | round(2) }}€
                entity: sensor.emhass_theo_kosten_monat
              - type: template
                icon: mdi:swap-horizontal
                icon_color: >-
                  {% set d = states('sensor.entscheidungs_delta_monat') | float(0) %}
                  {% if d > 0 %}red{% elif d < 0 %}green{% else %}grey{% endif %}
                content: >-
                  Delta {{ states('sensor.entscheidungs_delta_monat') | float(0) | round(2) }}€
                entity: sensor.entscheidungs_delta_monat
              - type: template
                icon: mdi:heat-pump
                icon_color: orange
                content: >-
                  WP {{ states('sensor.wp_stromkosten_monat') | float(0) | round(2) }}€
                entity: sensor.wp_stromkosten_monat
              - type: template
                icon: mdi:piggy-bank
                icon_color: green
                content: >-
                  WP-Potenzial {{ states('sensor.wp_einsparpotenzial_monat') | float(0) | round(2) }}€
                entity: sensor.wp_einsparpotenzial_monat
              - type: template
                icon: mdi:home-lightning-bolt
                icon_color: green
                content: >-
                  Autarkie {{ states('sensor.autarkiegrad') }}%
                entity: sensor.autarkiegrad
              - type: template
                icon: mdi:solar-power-variant
                icon_color: yellow
                content: >-
                  Eigenverbr. {{ states('sensor.eigenverbrauchsquote') }}%
                entity: sensor.eigenverbrauchsquote
      # ── Kostenvergleich 30 Tage ────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Kosten: Real vs. EMHASS (30 Tage)"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Tägliche Kosten"
            graph_span: 30d
            span:
              start: month
            apex_config:
              chart:
                height: 300
              legend:
                show: true
              tooltip:
                shared: true
                intersect: false
            yaxis:
              - id: kosten
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.1k5_netzbezugskosten_laufend
                name: "1komma5° Real"
                color: "#F44336"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
              - entity: sensor.emhass_theo_kosten_laufend
                name: "EMHASS Theoretisch"
                color: "#2196F3"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
      # ── Kumuliertes Delta Monat ────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Kumuliertes Delta (Monat)"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "Delta-Trend (positiv = 1komma5° teurer)"
            graph_span: 30d
            span:
              start: month
            apex_config:
              chart:
                height: 250
            yaxis:
              - id: delta
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.entscheidungs_delta_laufend
                name: "Delta"
                color: "#FF9800"
                stroke_width: 2
                curve: smooth
                type: area
                opacity: 0.3
                float_precision: 2
                yaxis_id: delta
                group_by:
                  func: sum
                  duration: 1d
      # ── WP-Kosten Monat ───────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Wärmepumpe Monat"
          - type: custom:apexcharts-card
            grid_options:
              columns: full
            header:
              show: true
              title: "WP Tageskosten vs. verpasstes Potenzial"
            graph_span: 30d
            span:
              start: month
            apex_config:
              chart:
                height: 250
                stacked: true
              legend:
                show: true
            yaxis:
              - id: kosten
                min: 0
                apex_config:
                  title:
                    text: "EUR"
            series:
              - entity: sensor.wp_stromkosten_laufend
                name: "WP Kosten"
                color: "#F44336"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
              - entity: sensor.wp_einsparpotenzial_laufend
                name: "Einsparpotenzial"
                color: "#4CAF50"
                type: column
                float_precision: 2
                yaxis_id: kosten
                group_by:
                  func: sum
                  duration: 1d
      # ── Zusammenfassung ────────────────────────────────
      - type: grid
        cards:
          - type: heading
            heading: "Monatszusammenfassung"
          - type: markdown
            grid_options:
              columns: full
            content: >-
              {% set real = states('sensor.1k5_real_kosten_monat') | float(0) %}
              {% set theo = states('sensor.emhass_theo_kosten_monat') | float(0) %}
              {% set delta = states('sensor.entscheidungs_delta_monat') | float(0) %}
              {% set wp_kosten = states('sensor.wp_stromkosten_monat') | float(0) %}
              {% set wp_potenzial = states('sensor.wp_einsparpotenzial_monat') | float(0) %}

              ## Batterie-Entscheidungen

              | | Kosten |
              |---|---|
              | **1komma5° Real** | {{ real | round(2) }} € |
              | **EMHASS Theoretisch** | {{ theo | round(2) }} € |
              | **Delta** | {{ delta | round(2) }} € |

              {% if delta > 0 %}
              1komma5° war **{{ delta | round(2) }} € teurer** als EMHASS empfohlen hätte.
              {% elif delta < 0 %}
              1komma5° war **{{ (delta | abs) | round(2) }} € günstiger** als EMHASS empfohlen hätte.
              {% else %}
              Beide Systeme haben gleich abgeschnitten.
              {% endif %}

              {% if theo != 0 %}
              Abweichung: **{{ ((delta / theo) * 100) | round(1) }}%**
              {% endif %}

              ## Wärmepumpe

              | | Betrag |
              |---|---|
              | **WP Stromkosten** | {{ wp_kosten | round(2) }} € |
              | **Einsparpotenzial** | {{ wp_potenzial | round(2) }} € |

              {% if wp_kosten > 0 and wp_potenzial > 0 %}
              Durch Lastverschiebung der WP hätten **{{ wp_potenzial | round(2) }} € ({{ ((wp_potenzial / wp_kosten) * 100) | round(0) }}%)** eingespart werden können.
              {% endif %}
```

- [ ] **Step 2: Validate YAML syntax**

```bash
cd config/kamrui-n100 && python3 -c "import yaml; yaml.safe_load(open('dashboards/1k5-vs-emhass.yaml'))" && echo "OK"
```

Expected: `OK`

- [ ] **Step 3: Commit**

```bash
git add config/kamrui-n100/dashboards/1k5-vs-emhass.yaml
git commit -m "feat: add monthly comparison dashboard (Tab 3) with summary"
```

---

## Task 10: Verify & Deploy

- [ ] **Step 1: Validate all modified YAML files**

```bash
cd config/kamrui-n100
python3 -c "import yaml; yaml.safe_load(open('configuration.yaml'))" && echo "config OK"
python3 -c "import yaml; yaml.safe_load(open('template_sensors.yaml'))" && echo "sensors OK"
python3 -c "import yaml; yaml.safe_load(open('utility_meter.yaml'))" && echo "meters OK"
python3 -c "import yaml; yaml.safe_load(open('dashboards/1k5-vs-emhass.yaml'))" && echo "dashboard OK"
```

Expected: all 4 print `OK`

- [ ] **Step 2: Verify p_batt_forecast sign convention**

After deployment, check in HA Developer Tools → States:
- When battery is **discharging**: `sensor.p_batt_forecast` should be **positive**
- When battery is **charging**: `sensor.p_batt_forecast` should be **negative**

If the sign is inverted, change the formula in `template_sensors.yaml` Task 3 Step 2:
```
{% set net = (verbrauch - pv + batt) / 1000 %}
```
(Change `- batt` to `+ batt`)

- [ ] **Step 3: Register dashboard in HA**

In HA UI: Settings → Dashboards → Add Dashboard → Manual YAML
- Title: "1k5 vs EMHASS"
- Icon: `mdi:scale-balance`
- URL path: `1k5-vs-emhass`
- YAML file: point to `dashboards/1k5-vs-emhass.yaml`

Note: The exact method depends on how dashboards are loaded. If using `lovelace` mode in `configuration.yaml`, add:
```yaml
lovelace:
  dashboards:
    1k5-vs-emhass:
      mode: yaml
      filename: dashboards/1k5-vs-emhass.yaml
      title: "1k5 vs EMHASS"
      icon: mdi:scale-balance
```

- [ ] **Step 4: Verify sensors are working**

In HA Developer Tools → States, check:
- `sensor.heartbeat_modus` — should show `laden`/`entladen`/`idle`/`zero_export`
- `sensor.1k5_netzbezugskosten_laufend` — should show a numeric EUR/h value
- `sensor.emhass_theo_kosten_laufend` — should show a numeric EUR/h value (may be 0 if EMHASS hasn't published yet)
- `sensor.entscheidungs_delta_laufend` — should show a numeric EUR/h value
- `sensor.wp_stromkosten_laufend` — should show a numeric EUR/h value
- `sensor.wp_einsparpotenzial_laufend` — should show a numeric EUR/h value

- [ ] **Step 5: Final commit with any fixes**

```bash
git add -A
git commit -m "fix: post-deployment adjustments for 1k5 vs EMHASS comparison"
```
