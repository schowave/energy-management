# Energiemanagement Dashboard Redesign

## Problemstellung

Das aktuelle Dashboard hat 2 Tabs mit folgenden Problemen:
- **Zusammengehöriges getrennt:** Batterie-Monitoring (Tab 1) vs. Batterie-Steuerung (Tab 2)
- **Redundanz:** Solcast-Forecast als eigene Sektion, obwohl Daten im PV-Chart enthalten
- **Wärmepumpe dominiert Optimierungs-Tab:** 5 WP-Sektionen mischen sich mit EMHASS/Batterie-Steuerung

## Nutzungsprofil

- Primär **Quick-Check am Handy** (1-2 Sek.) und **aktive Steuerung** (Buttons klicken)
- Maximal 2-3 Tabs gewünscht

## Design: 3 Tabs

### Tab 1: Cockpit (⚡) — Icon: `mdi:home-lightning-bolt`

Kompakt, minimales Scrollen am Handy. Nur KPIs und Aktionen.

**Layout:** `type: sections`, `max_columns: 1` (mobil-optimiert, am Desktop automatisch breiter).

**Sektionen (von oben nach unten):**

1. **Energiefluss** — `custom:power-flow-card-plus` (PV, Batterie+SOC, Netz, Verbrauch). Beibehalten wie bisher (entities: `sensor.total_dc_power`, `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power`, `sensor.battery_level`, `sensor.energy_grid_import_power_export_power_net_power`, `sensor.load_power`).
2. **KPI-Chips** — `custom:mushroom-chips-card` in einer Zeile: Autarkie (`sensor.autarkiegrad`), Eigenverbrauch (`sensor.eigenverbrauchsquote`), aktueller Strompreis (`sensor.current_electricity_market_price`).
3. **EMHASS-Empfehlung + Modus** — Eine `custom:mushroom-template-card` mit:
   - Primary: Akku-Empfehlung (Laden/Entladen/Halten + Ziel-SOC) — Entities: `sensor.p_batt_forecast`, `sensor.soc_batt_forecast`
   - Secondary: Status (`sensor.optim_status`) + letzte Berechnung (`automation.emhass_day_ahead_optimierung` Attribut `last_triggered`) + Tagesgewinn (`sensor.total_cost_fun_value`) + aktueller Modus (`select.battery_forced_charge_discharge`)
   - Icon-Farbe: grün bei Optimal, rot bei Fehler, grau bei unavailable
4. **Batterie-Steuerung** — Aktions-Buttons (`type: button`) in einer Reihe:
   - Zwangsladen 1h/5kW → `script.batterie_zwangsladen` (data: dauer_stunden: 1, ladeleistung: 5000)
   - Zwangsladen 2h/5kW → `script.batterie_zwangsladen` (data: dauer_stunden: 2, ladeleistung: 5000)
   - Stoppen → `scene.turn_on` target: `scene.self_consumption_mode_max_battery_discharge`
   - EMHASS Day-Ahead → `rest_command.emhass_dayahead`
   - EMHASS Publish → `rest_command.emhass_publish`
   - Alle Buttons mit `confirmation.text` Prompts wie bisher

**Entfernt aus Cockpit (→ Analyse-Tab):** Alle Zeitreihen-Charts, Strompreis-Details, Verbraucher, Hardware-Status.

### Tab 2: Analyse (📊) — Icon: `mdi:chart-line`

Alle Zeitreihen-Charts, thematisch gruppiert. Für Desktop-Monitoring.

**Layout:** `type: sections`, `max_columns: 3`. Charts bekommen `grid_options.columns: full` für volle Breite.

**Sektionen:**

1. **PV & Forecast** — Ein ApexChart (`columns: full`): PV Real (`sensor.total_dc_power`) + Solcast Forecast + Konfidenzband 10/90 (`sensor.solcast_pv_forecast_prognose_heute` Attribut `detailedForecast`). Darunter MPPT1 (`sensor.mppt1_power`) vs. MPPT2 (`sensor.mppt2_power`) Chart (`columns: full`). Prognose heute/morgen + PV verbleibend als Chips (`sensor.solcast_pv_forecast_prognose_heute`, `sensor.solcast_pv_forecast_prognose_morgen`, `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute`).
2. **Batterie & EMHASS-Plan** — Drei Charts (`columns: full` jeweils):
   - **Empfohlener Leistungsverlauf** (aus bisherigem Tab 2): 6-Serien-Chart mit PV Real + Forecast (`sensor.p_pv_forecast`), Hausverbrauch Real + Forecast (`sensor.p_load_forecast`), Akku (`sensor.p_batt_forecast`), Netz Real + Forecast (`sensor.p_grid_forecast`). Now-Linie.
   - **SOC: Empfehlung vs. Realität** (aus bisherigem Tab 2): `sensor.soc_batt_forecast` (inkl. Forecast aus Attribut `battery_scheduled_soc`) vs. `sensor.battery_level`. Now-Linie.
   - **Lade-/Entladeleistung** (aus bisherigem Tab 1): `sensor.battery_charging_power` / `sensor.battery_discharging_power` als Balken.
   - Chips: Geladen heute (`sensor.daily_battery_charge`), Entladen heute (`sensor.daily_battery_discharge`).
3. **Netz & Strompreis** — Dual-Y-Achsen ApexChart (`columns: full`, Now-Linie): Netzbezug/Einspeisung (`sensor.import_power`, `sensor.export_power`) als Balken auf Y1 + Preisverlauf als Linien auf Y2: 1komma5° Real (`sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45`) + 1komma5° Forecast (`sensor.1komma5_tagesforecast`, Attribute `forecast_json` + `midnight_price`, via `data_generator`), ENTSO-e Real (`sensor.current_electricity_market_price`) + ENTSO-e Forecast (`sensor.average_electricity_price`, Attribute `prices_today`/`prices_tomorrow` via `data_generator`). Günstigste Stunde + Börsen-Aufschlag als Markdown darunter. Entity-Cards: 1komma5° aktuell, ENTSO-e Min/Max (`sensor.lowest_energy_price`, `sensor.highest_energy_price`). Chips: Import heute (`sensor.daily_imported_energy`), Export heute (`sensor.daily_exported_energy`).
4. **Verbrauch** — Hausverbrauch-Verlauf (`sensor.load_power`, Area-Chart, `columns: full`). Grundlast-Template-Card + Entity-Cards: Serverschrank, Kühlschrank, Workstation, Waschmaschine, Trockner.
5. **Hardware** — Entity-Cards: Batterie-Temperatur (`sensor.battery_temperature`), WR-Temperatur (`sensor.inverter_temperature`), SOH (`sensor.battery_state_of_health`). Kompakt.

**Eliminierte Redundanz:**
- Solcast-Forecast eigene Sektion → integriert in PV-Chart + Chips
- Einzelne Solcast Entity-Cards (Peak, nächste Stunde, in 30 Min) → entfernt (PV verbleibend bleibt als Chip)
- Separate Entity-Cards für daily Import/Export → Chips in Netz & Strompreis Sektion
- SOC-Chip aus KPI-Zeile → redundant mit Power-Flow-Card (zeigt SOC bereits)
- Batterie-Section (Tab 1) + EMHASS-Charts (Tab 2) → eine Sektion

### Tab 3: Wärmepumpe (🌡️) — Icon: `mdi:heat-pump-outline`

Eigenständiger Tab, kompakter als die bisherigen 5 Sektionen im Optimierungs-Tab.

**Layout:** `type: sections`, `max_columns: 2`.

**Sektionen:**

1. **Status** — Template-Card: aktuelle Leistung (`sensor.kg_technik_waermepumpe_3em_leistung`), Heizleistung (`sensor.licv_8_2r1_3_heating_capacity`), berechneter COP, Betriebszustand. Chips für Betriebsmodus-Indikatoren (Kompressor, Heizstab, HUP, EVU — aus bestehenden Chips im aktuellen Dashboard). Extra-WW-Status.
2. **Temperaturen** — Entity-Cards: Vorlauf (`sensor.licv_8_2r1_3_flow`), Rücklauf (`sensor.licv_8_2r1_3_return`), Warmwasser (`sensor.licv_8_2r1_3_dhw`), Außentemperatur (`sensor.licv_8_2r1_3_outdoor_temp`), Wärmequelle-Eintritt (`sensor.licv_8_2r1_3_heat_source_inlet`), Durchfluss (`sensor.licv_8_2r1_3_flow_rate`). Soll/Ist-Vergleich für Heizung (`sensor.licv_8_2r1_3_return` vs. `sensor.licv_8_2r1_3_return_target`) und Warmwasser (`sensor.licv_8_2r1_3_dhw` vs. `sensor.licv_8_2r1_3_dhw_target`) als Template-Cards.
3. **Steuerung** — Extra-WW-Toggle (`switch.licv_8_2r1_3_extra_dhw` mit confirmation), Sollwert Heizung (`number.licv_8_2r1_3_sollwert_heizen`, `display_mode: buttons`), Sollwert Warmwasser (`number.licv_8_2r1_3_sollwert_warmw`, `display_mode: buttons` — **kein Slider**, um versehentliches Verstellen zu verhindern). Heizung sperren (`switch.licv_8_2r1_3_heating_blocked` mit confirmation), WW sperren (`switch.licv_8_2r1_3_dhw_blocked` mit confirmation). SG-Ready/PV-Optimierung: Modus Heizung (`select.licv_8_2r1_3_modus_heizen`), Offset Heizung (`number.licv_8_2r1_3_offset_heizen`, `display_mode: buttons`), Modus WW (`select.licv_8_2r1_3_modus_warmw`), Offset WW (`number.licv_8_2r1_3_offset_warmw`, `display_mode: buttons`), SG-Ready Stufe (`select.licv_8_2r1_3_power_control_mode`), Smart-Modus (`select.licv_8_2r1_3_smart_mode`).
4. **Diagnose & Statistik** — WP-Temperatur-Verlauf ApexChart (`columns: full`): Vorlauf, Rücklauf, Warmwasser, Wärmequelle, Soll Rücklauf, Außentemp (6 Serien, wie im aktuellen Dashboard). WP-Leistungsverlauf ApexChart (`sensor.kg_technik_waermepumpe_3em_leistung`, `columns: full`). COP-Übersicht als Markdown-Tabelle (monatlich/gesamt, wie im aktuellen Dashboard). Entity-Cards: Kompressor-Status, Alarm-Status, Druckwerte (HD/ND), Betriebsstunden, Stromaufnahme myUplink (`sensor.licv_8_2r1_3_power_consumption`), Heizung gesamt (`sensor.licv_8_2r1_3_heating`), Warmwasser gesamt (`sensor.licv_8_2r1_3_domestic_hot_water`). Shelly 3EM Energiezähler + Wärmemenge.

## Technische Details

- **Card-Typen:** Bestehende Custom Cards beibehalten (`power-flow-card-plus`, `apexcharts-card`, `mushroom-*-card`)
- **Layout:** `type: sections` für alle Tabs
- **Confirmation Dialogs:** Alle Aktions-Buttons behalten ihre `confirmation.text` Prompts
- **Keine neuen Custom Cards** nötig — alles mit vorhandenen Cards umsetzbar

## Migration

Die bestehende Datei `energiemanagement.yaml` wird umstrukturiert:
- Tab 1 (Übersicht) → wird zu Cockpit (stark gekürzt) + Analyse (Charts)
- Tab 2 (Optimierung) → EMHASS-Empfehlung + Batterie-Steuerung wandern in Cockpit, WP wird Tab 3
- Empfohlener Leistungsverlauf (6-Serien EMHASS-Chart) wandert in Analyse-Tab Sektion "Batterie & EMHASS-Plan"
- WP-Diagnose-Inhalte (Betriebsstunden, COP-Tabelle, Druckwerte, Alarm) bleiben erhalten in Tab 3
- Kein Inhalt geht verloren, nur Redundanz wird eliminiert
