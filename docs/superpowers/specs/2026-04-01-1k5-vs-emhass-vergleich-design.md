# 1komma5° vs EMHASS — Entscheidungsvergleich

**Datum:** 2026-04-01
**Status:** Draft
**Ziel:** Objektiver Vergleich der Batterie-Steuerungsentscheidungen von 1komma5° Heartbeat vs. EMHASS-Optimierung, inkl. Bewertung des ungenutzten Wärmepumpen-Optimierungspotenzials.

---

## Kontext

Ab 01.04.2026 läuft ein dynamischer Stromtarif über 1komma5°. Der Heartbeat steuert die Batterie (Sungrow SBR128, 12.8 kWh) in Echtzeit. EMHASS läuft parallel im Simulationsmodus (3x täglich Day-Ahead-Optimierung) und gibt einen optimalen Batterie-Fahrplan aus, kontrolliert aber die Hardware nicht.

**Kernfragen:**
1. Trifft 1komma5° Heartbeat gute Batterie-Entscheidungen, oder hätte EMHASS besser optimiert?
2. Wie viel Einsparpotenzial bleibt ungenutzt, weil 1komma5° die Wärmepumpe nicht steuern kann?

## Vergleichslogik

### Preisbasis

- EMHASS optimiert gegen ENTSO-e-Börsenpreise (keine Änderung nötig)
- 1komma5° schlägt fixe Aufschläge auf den Börsenpreis auf (Netzentgelte, Steuern, Marge)
- Die relative Preisstruktur ist identisch → gleiche optimale Lade-/Entladezeitpunkte
- Für den Kostenvergleich werden beide Seiten mit den realen 1komma5°-Preisen nachgerechnet

### Vier Vergleichsebenen

1. **Batterie-Steuerung** — Wann lädt/entlädt Heartbeat vs. wann hätte EMHASS es getan?
2. **Preisoptimierung** — Zu welchen Stunden wird Strom bezogen/eingespeist, zu welchem Preis?
3. **Gesamtergebnis** — Tägliche/wöchentliche/monatliche Kosten, Autarkie, Eigenverbrauch
4. **Wärmepumpen-Potenzial** — Wie viel WP-Strom fließt zu teuren Zeiten, obwohl Vorheizen/Überschussnutzung möglich wäre?

---

## Architektur

### Ansatz: Template-Sensoren + Utility Meters + Dashboard

- **Template-Sensoren** berechnen laufend Kosten und Deltas
- **Utility Meters** aggregieren auf Tages-/Wochen-/Monatsbasis
- **Dashboard** visualisiert Live-Vergleich und historische Trends

Keine externen Skripte, alles in HA-YAML.

### Einspeisevergütung

Die EEG-Einspeisevergütung (aktuell 0.082 EUR/kWh) wird als `input_number.einspeiseverguetung` definiert, um sie zentral ändern zu können. Alle Sensoren referenzieren diesen Helper.

---

## Komponente 1: Template-Sensoren

Alle neuen Template-Sensoren benötigen `state_class: measurement` damit Utility Meters sie als Quelle akzeptieren.

### 1.1 Heartbeat-Modus-Tracking

**Sensor:** `sensor.heartbeat_modus`

Leitet den aktuellen 1komma5°-Betriebsmodus aus dem Batterieverhalten ab:

| Bedingung | Modus |
|-----------|-------|
| `battery_in_power_7fee...` > 100W | `laden` |
| `battery_out_power_7fee...` > 100W | `entladen` |
| `grid_feed_out_power_7fee...` < 10W und kein Laden/Entladen | `zero_export` |
| sonst | `idle` |

Schwellwert 100W filtert Standby-Verluste. Wird als Zeitreihe im Recorder gespeichert für historische Auswertung.

### 1.2 Laufende Ist-Kosten (1komma5° Realität)

**Sensor:** `sensor.1k5_netzbezugskosten_laufend`
**Attribute:** `state_class: measurement`, `unit_of_measurement: "EUR/h"`

```
Netzbezug_kW = grid_feed_in_power_7fee... / 1000
Einspeisung_kW = grid_feed_out_power_7fee... / 1000
Preis = electricity_price_7fee... (EUR/kWh)
Einspeisevergütung = input_number.einspeiseverguetung (EUR/kWh)

Kosten = Netzbezug_kW × Preis - Einspeisung_kW × Einspeisevergütung  (EUR/h)
```

Einheit: EUR/h. Gibt die momentanen Netto-Stromkosten an.

### 1.3 EMHASS-theoretische Kosten

**Sensor:** `sensor.emhass_theo_kosten_laufend`
**Attribute:** `state_class: measurement`, `unit_of_measurement: "EUR/h"`

**EMHASS-Vorzeichen-Konvention:** `p_batt_forecast` positiv = Entladen, negativ = Laden.

```
Verbrauch = consumption_power_7fee... (W)
PV = solar_production_power_7fee... (W)
EMHASS_Batterie = states('sensor.p_batt_forecast') (W, direkt als State nutzbar)

Theo_Netzbezug = max(0, (Verbrauch - PV - EMHASS_Batterie) / 1000) (kW)
Theo_Einspeisung = max(0, (PV + EMHASS_Batterie - Verbrauch) / 1000) (kW)

Theo_Kosten = Theo_Netzbezug × Preis - Theo_Einspeisung × Einspeisevergütung  (EUR/h)
```

Verwendet reale PV- und Verbrauchsdaten, aber den EMHASS-Batterie-Fahrplan statt der realen Batteriesteuerung. Gleiche 1komma5°-Preisbasis.

`sensor.p_batt_forecast` wird direkt als State gelesen — EMHASS publiziert den aktuellen Schrittwert als Sensorstate, kein Index-Zugriff nötig.

**Bekannte Vereinfachung:** Batterie-Roundtrip-Verluste (je 5% Lade-/Entladeeffizienz, ~10% gesamt) sind in der EMHASS-Optimierung intern berücksichtigt, werden aber in der Kostenformel nicht separat modelliert. Der Fahrplan selbst ist bereits effizienzbereinigt.

### 1.4 Delta-Sensor

**Sensor:** `sensor.entscheidungs_delta_laufend`
**Attribute:** `state_class: measurement`, `unit_of_measurement: "EUR/h"`

```
Delta = 1k5_netzbezugskosten_laufend - emhass_theo_kosten_laufend
```

- Positiv → 1komma5° ist gerade teurer als EMHASS empfohlen hätte
- Negativ → 1komma5° ist gerade günstiger

### 1.5 Wärmepumpen-Preisindikator

**Sensor:** `sensor.wp_stromkosten_laufend`
**Attribute:** `state_class: measurement`, `unit_of_measurement: "EUR/h"`

Trackt die laufenden Stromkosten der Wärmepumpe zum aktuellen dynamischen Preis:

```
WP_Leistung_kW = kg_technik_waermepumpe_3em_leistung / 1000 (kW)
Preis = electricity_price_7fee... (EUR/kWh)

WP_Kosten = WP_Leistung_kW × Preis  (EUR/h)
```

### 1.6 Wärmepumpen-Optimierungspotenzial

**Sensor:** `sensor.wp_einsparpotenzial_laufend`
**Attribute:** `state_class: measurement`, `unit_of_measurement: "EUR/h"`

Berechnet, wie viel günstiger die WP hätte laufen können:

```
WP_Leistung_kW = kg_technik_waermepumpe_3em_leistung / 1000 (kW)
Preis_aktuell = electricity_price_7fee... (EUR/kWh)
Preis_tagesmin = state_attr('sensor.electricity_price_7fee...', 'price_today_min') (EUR/kWh)
PV_Überschuss_kW = max(0, (solar_production_power - consumption_power + battery_out_power) / 1000)

# Wenn PV-Überschuss die WP decken könnte → Kosten wären ~0 (nur Einspeisevergütung entgangen)
# Sonst: Differenz zum günstigsten Preis des Tages
Wenn PV_Überschuss_kW >= WP_Leistung_kW:
    Potenzial = WP_Leistung_kW × (Preis_aktuell - Einspeisevergütung)
Sonst:
    Potenzial = WP_Leistung_kW × (Preis_aktuell - Preis_tagesmin)

# Nur positiv — wenn WP gerade eh günstig läuft, kein Potenzial
Potenzial = max(0, Potenzial)
```

Zeigt in Echtzeit: "Die WP verbraucht gerade X EUR/h, hätte aber Y EUR/h günstiger laufen können."

---

## Komponente 2: Utility Meters

Aggregation der laufenden Kostensensoren auf drei Zeitebenen:

### Batterie-Entscheidungsvergleich

| Utility Meter | Source Sensor | Cycle |
|--------------|---------------|-------|
| `utility_meter.1k5_real_kosten_tag` | `sensor.1k5_netzbezugskosten_laufend` | daily |
| `utility_meter.emhass_theo_kosten_tag` | `sensor.emhass_theo_kosten_laufend` | daily |
| `utility_meter.entscheidungs_delta_tag` | `sensor.entscheidungs_delta_laufend` | daily |
| `utility_meter.1k5_real_kosten_woche` | `sensor.1k5_netzbezugskosten_laufend` | weekly |
| `utility_meter.emhass_theo_kosten_woche` | `sensor.emhass_theo_kosten_laufend` | weekly |
| `utility_meter.entscheidungs_delta_woche` | `sensor.entscheidungs_delta_laufend` | weekly |
| `utility_meter.1k5_real_kosten_monat` | `sensor.1k5_netzbezugskosten_laufend` | monthly |
| `utility_meter.emhass_theo_kosten_monat` | `sensor.emhass_theo_kosten_laufend` | monthly |
| `utility_meter.entscheidungs_delta_monat` | `sensor.entscheidungs_delta_laufend` | monthly |

### Wärmepumpen-Tracking

| Utility Meter | Source Sensor | Cycle |
|--------------|---------------|-------|
| `utility_meter.wp_stromkosten_tag` | `sensor.wp_stromkosten_laufend` | daily |
| `utility_meter.wp_einsparpotenzial_tag` | `sensor.wp_einsparpotenzial_laufend` | daily |
| `utility_meter.wp_stromkosten_woche` | `sensor.wp_stromkosten_laufend` | weekly |
| `utility_meter.wp_einsparpotenzial_woche` | `sensor.wp_einsparpotenzial_laufend` | weekly |
| `utility_meter.wp_stromkosten_monat` | `sensor.wp_stromkosten_laufend` | monthly |
| `utility_meter.wp_einsparpotenzial_monat` | `sensor.wp_einsparpotenzial_laufend` | monthly |

Alle Meter resetten automatisch am Beginn des jeweiligen Zeitraums.

---

## Komponente 3: Dashboard

Eigenes Dashboard: `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml`

### Tab 1: Live (Tagesansicht, 5-Min-Auflösung)

**Chart 1: Batterie-Fahrplan-Vergleich** (ApexCharts, Dual-Line)
- EMHASS `p_batt_forecast` als gestrichelte Stufenlinie (grün, 30-Min)
- Reale Batterieleistung (blau, durchgezogen, 5-Min)
- Y-Achse: Leistung (W), positiv = Entladen, negativ = Laden

**Chart 2: SOC-Vergleich** (ApexCharts, Dual-Line)
- `sensor.soc_batt_forecast` (EMHASS-Soll-SOC) vs. realer `sensor.battery_level`

**Chart 3: Preis + Heartbeat-Modus** (ApexCharts, Combo)
- 1komma5°-Preis als Linie (EUR/kWh)
- Heartbeat-Modus als farbige Hintergrundbänder (via `color_threshold` oder sekundäre Area-Series mit Opacity):
  - Laden = grün
  - Entladen = orange
  - Zero Export = rot
  - Idle = grau

**Hinweis:** Farbige Hintergrundbänder aus einem kategorischen Sensor sind in ApexCharts nicht nativ unterstützt. Umsetzung über `data_generator` mit numerischer Modus-Umwandlung + `type: area` mit Opacity-Trick.

**Chart 4: Laufende Kosten** (ApexCharts, Dual-Line + Area)
- Kumulierte reale Kosten vs. EMHASS-theoretische Kosten über den Tag
- Delta als gefüllte Fläche (grün = 1komma5° günstiger, rot = teurer)

**Chart 5: Wärmepumpe** (ApexCharts, Combo)
- WP-Leistung als Fläche (W)
- 1komma5°-Preis als Linie (EUR/kWh, zweite Y-Achse)
- PV-Überschuss als gestrichelte Linie (W)
- Farbcodierung: WP-Fläche grün wenn Preis < Tagesdurchschnitt oder PV-Überschuss vorhanden, rot wenn Preis > Tagesdurchschnitt

**KPI-Chips:** Tageskosten real | Tageskosten EMHASS | Delta EUR | WP-Kosten heute | WP-Einsparpotenzial | Heartbeat-Modus aktuell

### Tab 2: Woche (7-Tage-Trend)

**Chart: Tägliche Kostenbalken** (ApexCharts, Grouped Bar)
- Pro Tag: Balken real vs. EMHASS nebeneinander, Delta als Label
- Datenquelle: `statistics` mit `period: day` auf den Utility-Meter-Sensoren

**Chart: Kumuliertes Delta** (ApexCharts, Line)
- Aufsummiertes Delta über 7 Tage — zeigt Trend

**Chart: WP-Kosten vs. Einsparpotenzial** (ApexCharts, Stacked Bar)
- Pro Tag: Tatsächliche WP-Kosten + verpasstes Einsparpotenzial

**KPI-Cards:** Wochenkosten real | EMHASS | Delta | WP-Einsparpotenzial | Durchschnittspreis

### Tab 3: Monat (Monatsübersicht)

**Chart: Tägliche Kostenbalken** (wie Tab 2, 30 Tage)

**Chart: Kumuliertes Delta** (Line, seit Monatsbeginn)

**Chart: WP-Monatskosten** (Stacked Bar, 30 Tage)

**KPI-Cards:** Monatskosten real | EMHASS | Delta | WP-Kosten | WP-Einsparpotenzial | Autarkie | Eigenverbrauch

**Zusammenfassung:** Markdown-Card mit automatischer Bewertung:
- "1komma5° war X% teurer/günstiger als EMHASS"
- "WP-Einsparpotenzial: X EUR (Y% der WP-Kosten) durch Lastverschiebung"
- Basierend auf Monatswerten der Utility Meters

---

## Verwendete Entity-IDs

### 1komma5° (HACS Integration)
- `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Aktueller Preis + Forecast
- `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Batterie-Ladeleistung
- `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Batterie-Entladeleistung
- `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Netzbezugsleistung
- `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Netzeinspeisung
- `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Haushaltsverbrauch
- `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — PV-Leistung
- `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` — Batterie-SOC

### Sungrow (Modbus)
- `sensor.battery_level` — SOC (%)
- `sensor.battery_charging_power` — Ladeleistung (W)
- `sensor.battery_discharging_power` — Entladeleistung (W)

### EMHASS
- `sensor.p_batt_forecast` — Batterie-Fahrplan (aktueller Schritt als State, W)
- `sensor.soc_batt_forecast` — SOC-Fahrplan (%)
- `sensor.total_cost_fun_value` — Kostenfunktionswert

### Wärmepumpe
- `sensor.kg_technik_waermepumpe_3em_leistung` — WP-Stromverbrauch (W)

### ENTSO-e
- `sensor.average_electricity_price` — Börsenpreis (EUR/kWh)

### Neuer Helper
- `input_number.einspeiseverguetung` — EEG-Einspeisevergütung (initial 0.082 EUR/kWh)

---

## Dateien

| Datei | Beschreibung |
|-------|-------------|
| `config/kamrui-n100/template_sensors.yaml` | Neue Sensoren (Heartbeat-Modus, Kosten, Delta, WP-Tracking) |
| `config/kamrui-n100/utility_meter.yaml` | Neue Utility Meters (15 Stück) |
| `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml` | Neues Vergleichs-Dashboard |
| `config/kamrui-n100/configuration.yaml` | `input_number.einspeiseverguetung` hinzufügen |

---

## Offene Punkte / Risiken

1. **`p_batt_forecast` Verfügbarkeit:** Sensor existiert erst nach erstem EMHASS-Publish. Alle Template-Sensoren müssen graceful mit `unknown`/`unavailable` umgehen (`float(0)` Defaults).
2. **EMHASS-Vorzeichen verifizieren:** Die Spec geht davon aus, dass `p_batt_forecast` positiv = Entladen, negativ = Laden. Dies muss nach dem ersten EMHASS-Lauf gegen das reale Batterieverhalten verifiziert werden. Bei falschem Vorzeichen invertiert sich der gesamte Vergleich.
3. **EMHASS-Forecast-Staleness:** EMHASS läuft 3x täglich (05:30, 13:30, 18:00). Zwischen den Läufen kann der Fahrplan veraltet sein (unerwartete Wolken, Lastspitzen). Der theoretische Kostenvergleich wird in diesen Phasen ungenauer. Dies ist eine bekannte Limitierung der Simulation.
4. **Chart 3 Komplexität:** Farbige Hintergrundbänder aus einem kategorischen Sensor sind in ApexCharts nicht nativ möglich. Erfordert Workaround über numerische Umwandlung + Area-Series.
5. **WP-Einsparpotenzial ist konservativ:** Der Sensor zeigt nur die Preisdifferenz, nicht ob eine Lastverschiebung thermisch möglich wäre (Speicherkapazität Warmwasser, Gebäudemasse). Es ist ein oberes Schätzpotenzial.
