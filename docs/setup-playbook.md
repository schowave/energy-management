# Setup-Playbook: KAMRUI N100 mit Home Assistant OS

> Schritt-für-Schritt-Anleitung für die komplette Einrichtung. Checkboxen abhaken wenn erledigt.

## 0. HAOS installieren

- [x] HAOS-Image für Generic x86-64 herunterladen: https://www.home-assistant.io/installation/generic-x86-64
- [x] Image auf USB-Stick flashen (Balena Etcher oder Ubuntu Live USB)
- [x] KAMRUI N100: Beim Booten `DEL` oder `F7` drücken → Boot von USB
- [x] UEFI Boot-Modus aktiv, Secure Boot deaktiviert
- [x] Von USB booten → HAOS wird auf interne SSD geschrieben
- [x] USB entfernen, Ethernet anschließen, neustarten
- [x] Browser öffnen: http://homeassistant.local:8123
- [x] Onboarding: Benutzer anlegen, Standort, Einheiten

## 1. Grundkonfiguration

- [x] **Erweiterter Modus** aktivieren: Profil (links unten) → "Erweiterter Modus" Toggle
- [x] **App Store** öffnen: Einstellungen → Apps → App Store (oder direkt: http://homeassistant.local:8123/hassio/store)

## 2. App Repositories hinzufügen

Im App Store: **⋮ (3 Punkte oben rechts) → Repositories**

Folgende URLs einzeln einfügen und jeweils "Hinzufügen" klicken:

> **Wichtig:** URLs exakt eingeben, kein Leerzeichen am Anfang/Ende!

| Repository | URL | Enthält |
|---|---|---|
| **Cloudflared** | `https://github.com/brenner-tobias/ha-addons` | Cloudflare Tunnel App |
| **EMHASS** | `https://github.com/davidusb-geek/emhass-add-on` | Energieoptimierung (LP-Solver) |
| ~~GoSunGrow~~ | ~~`https://github.com/MickMake/HomeAssistantAddons`~~ | ~~entfällt – mkaiser Modbus statt GoSungrow (→ ADR-0006)~~ |

Danach "Schließen" und die Seite neu laden (Ctrl+Shift+R).

## 3. Apps installieren & konfigurieren

### 3.1 File Editor ✅

- [x] App Store → "File editor" suchen → **Installieren**
- [x] App Config: "Enforce Basepath" deaktivieren (um alle Verzeichnisse zu sehen)
- [x] App starten → "In Seitenleiste anzeigen" aktivieren

> File Editor wird für viele weitere Schritte gebraucht (configuration.yaml bearbeiten).

### 3.2 Cloudflared (Remote-Zugriff) ✅

**App installieren:**
- [x] App Store → "Cloudflared" suchen → **Installieren**
  - Falls nicht gefunden: Zuerst Repository hinzufügen (siehe Schritt 2)

**App konfigurieren (über UI):**
- [x] Tab "Konfiguration" → Externer Hostname: `ha.schowalter.co` → **Speichern**

**HTTP-Proxy konfigurieren (VOR dem ersten Tunnel-Start!):**
- [x] File Editor → `/config/configuration.yaml` öffnen → folgenden Block einfügen:
  ```yaml
  http:
    use_x_forwarded_for: true
    trusted_proxies:
      - 172.30.33.0/24
  ```
- [x] Home Assistant neustarten (Einstellungen → System → Neustart)

> **Wichtig:** Ohne diesen Block gibt es `400: Bad Request` beim Zugriff über ha.schowalter.co!
> HA muss dem Cloudflare-Proxy vertrauen, sonst blockiert es die weitergeleiteten Anfragen.

**Tunnel einrichten:**
- [x] Tab "Informationen" → App **Starten**
- [x] Tab "Protokoll" → **Cloudflare Login-Link** erscheint
- [x] Link im Browser öffnen → Domain `schowalter.co` autorisieren
- [x] Testen: https://ha.schowalter.co im Browser aufrufen

**External URL setzen:**
- [x] Einstellungen → System → Netzwerk → External URL: `https://ha.schowalter.co`

### 3.3 Mosquitto MQTT Broker ✅

- [x] App Store → "Mosquitto broker" suchen → **Installieren**
- [x] App starten
- [x] Integration einrichten: Einstellungen → Geräte & Dienste → MQTT → Konfigurieren
- [x] Automatisch erkannten Broker bestätigen

> Standardeinstellungen reichen aus. Wird für Shelly MQTT und künftige Integrationen genutzt.

### 3.4 Samba Share (Dateizugriff vom PC) — optional

> **Optional:** Nicht nötig wenn Konfiguration über Git-Repo + File Editor gepflegt wird.
> Samba ist nur sinnvoll wenn man vom PC direkt auf die HA-Dateien zugreifen möchte.

- [ ] App Store → "Samba share" suchen → **Installieren**
- [ ] App Config: Benutzername + Passwort setzen
- [ ] App starten
- [ ] Vom PC verbinden: `\\homeassistant.local` (Windows) / `smb://homeassistant.local` (Mac)

### 3.5 InfluxDB

- [x] App Store → "InfluxDB" suchen → **Installieren**
- [x] App starten → "In Seitenleiste anzeigen" aktivieren
- [x] InfluxDB UI öffnen → Admin → Databases → Datenbank `homeassistant` anlegen
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "InfluxDB"
  - Version: **InfluxDB 1.x** (passend zum Add-on)
  - URL: `http://a0d7b954-influxdb:8086` (Hostname aus App → Info)
  - Datenbank: `homeassistant`
  - Benutzername: `homeassistant` (vorher in InfluxDB Admin → Users anlegen)
  - Passwort: wie vergeben
  - SSL: deaktiviert
- [x] Home Assistant neustarten

> **Hinweis:** Seit HA 2026.9 wird InfluxDB über die UI-Integration konfiguriert, nicht mehr per YAML.

### 3.6 Grafana ✅

- [x] App Store → "Grafana" suchen → **Installieren**
- [x] App starten → "In Seitenleiste anzeigen" aktivieren
- [x] Grafana öffnen → Connections → Data sources → Add data source → **InfluxDB**
  - URL: `http://a0d7b954-influxdb:8086`
  - Database: `homeassistant`
  - User: `homeassistant`
  - Password: wie bei InfluxDB vergeben
  - Save & Test

### 3.7 EMHASS (Energieoptimierung – Simulationsmodus)

> **Repo:** https://github.com/davidusb-geek/emhass-add-on
> EMHASS (Energy Management for Home Assistant) optimiert Batterie-Lade-/Entladezyklen gegen dynamische Strompreise.
> In Phase 1 läuft EMHASS nur als Simulation — es berechnet und publiziert, steuert aber nichts.

**App Repository hinzufügen:**

- [ ] App Store → ⋮ → Repositories → `https://github.com/davidusb-geek/emhass-add-on` hinzufügen
- [ ] Seite neu laden (Ctrl+Shift+R)

**App installieren:**

- [ ] App Store → "emhass" suchen → **Installieren**
- [ ] App starten

**Add-on konfigurieren (Web-UI: http://homeassistant.local:5001/configuration):**

| Parameter | Wert | Erklärung |
|---|---|---|
| `optimization_time_step` | `30` | 30-Min-Intervalle (passend zu Solcast) |
| `set_use_battery` | `true` | Batterie-Optimierung aktiviert |
| `set_use_pv` | `true` | PV-Anlage berücksichtigen |
| `number_of_deferrable_loads` | `0` | Keine steuerbaren Lasten in Phase 1 |
| `sensor_power_load_no_var_loads` | `sensor.load_power` | Hausverbrauch (mkaiser Modbus) |
| `sensor_power_photovoltaics` | `sensor.total_dc_power` | PV-Leistung (mkaiser Modbus) |
| `battery_nominal_energy_capacity` | `12800` | 12,8 kWh SBR128 (in Wh) |
| `battery_discharge_power_max` | `5000` | Max. Entladeleistung (W) |
| `battery_charge_power_max` | `5000` | Max. Ladeleistung (W) |
| `battery_discharge_efficiency` | `0.95` | Entlade-Effizienz 95% |
| `battery_charge_efficiency` | `0.95` | Lade-Effizienz 95% |
| `battery_minimum_state_of_charge` | `0.10` | Min. SOC 10% |
| `battery_maximum_state_of_charge` | `0.95` | Max. SOC 95% |
| `battery_target_state_of_charge` | `0.50` | Ziel-SOC 50% |
| `continual_publish` | `true` | Sensoren automatisch aktualisieren |

**HA-Konfiguration (bereits vorbereitet):**

- [ ] `configuration.yaml` enthält bereits: `emhass: !include emhass.yaml` (Package)
- [ ] Das Package `emhass.yaml` definiert:
  - `rest_command.emhass_dayahead` — POST mit 1komma5° Preisen + Solcast PV-Forecast
  - `rest_command.emhass_publish` — Sensoren in HA aktualisieren
  - `automation.emhass_dayahead_daily` — Trigger täglich um 05:30

**Prüfen:**

- [ ] EMHASS Web-UI: http://homeassistant.local:5001 → Configuration prüfen
- [ ] Manuell testen: Entwicklerwerkzeuge → Dienste → `rest_command.emhass_dayahead` → Aufrufen
- [ ] Sensoren prüfen: Entwicklerwerkzeuge → Zustände → nach `emhass` filtern
  - `sensor.p_pv_forecast` — PV-Prognose
  - `sensor.p_load_forecast` — Lastprognose
  - `sensor.p_batt_forecast` — Batterie-Plan (positiv = Laden, negativ = Entladen)
  - `sensor.p_grid_forecast` — Netz-Plan (positiv = Import, negativ = Export)
  - `sensor.soc_batt_forecast` — SOC-Verlauf
  - `sensor.total_cost_fun_value` — Optimierte Tageskosten

> **Wichtig:** In Phase 1 publiziert EMHASS nur Sensoren. Es gibt keine Automationen, die den Wechselrichter steuern.
> Der Vergleich EMHASS-Plan vs. Heartbeat-Realität zeigt, ob der Eigenbau besser optimiert.

**Preisdaten:**

> Die 1komma5° Preise (Dynamic Pulse inkl. Netzentgelte + MwSt.) werden per `rest_command.emhass_dayahead`
> als `load_cost_forecast` übergeben. Jeder Stundenwert wird für zwei 30-Min-Slots dupliziert.
> `prod_price_forecast` ist fest auf 0,082 EUR/kWh (EEG-Einspeisevergütung).
> Solcast PV-Forecast wird aus `detailedForecast` extrahiert (kW → W × 1000).

### 3.8 Terminal & SSH (optional, für CLI-Zugriff)

- [ ] App Store → "Terminal & SSH" suchen → **Installieren**
- [ ] App starten → "In Seitenleiste anzeigen" aktivieren

## 4. HACS installieren ✅

- [x] App Store → ⋮ → Repositories → `https://github.com/hacs/addons` hinzufügen
- [x] App Store → "Get HACS" suchen → **Installieren** → **Starten**
- [x] App Logs prüfen für Anweisungen
- [x] Home Assistant neustarten
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "HACS"
- [x] GitHub-Konto verknüpfen (Device Code Flow)

## 5. HACS-Integrationen installieren

### 5.1 hacs_1komma5grad (Heartbeat Preise + Energy) ✅

- [x] HACS → ⋮ → Benutzerdefinierte Repositories → `https://github.com/BirknerAlex/hacs_1komma5grad` (Kategorie: Integration)
- [x] HACS → Integrationen → "1KOMMA5GRAD" suchen → **v1.4.0 Herunterladen**
- [x] Home Assistant neustarten
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "1KOMMA5GRAD"
- [x] Mit `app.1komma5grad.com` Zugangsdaten anmelden
- [x] Prüfen: 19 Entitäten erkannt (Preise, Grid, Solar, Batterie, EV, Wärmepumpe)

> **Wichtige Sensoren:**
> - `sensor.electricity_price_*` — dynamische Heartbeat-Strompreise (inkl. Netzkosten + MwSt.)
>   - Attribute: `forecast` (stündliche Prognose), `price_today_min/max/avg`, `cheapest_upcoming_hour`
> - Energiesensoren (kWh) für Grid, Solar, Batterie, EV, Wärmepumpe → Energy Dashboard kompatibel
> - `switch.heartbeat_automatic_mode` — EMS Ein/Aus
>
> **Voraussetzung:** Neues Heartbeat API (`app.1komma5grad.com` Login, nicht `my.1komma5.io`)
>
> **System-ID:** `7fee2e61-1ff6-4eaf-8a8e-7509522abb45`

### 5.2 ApexCharts Card (HACS Frontend) ✅

- [x] HACS → Frontend → "ApexCharts Card" suchen → **Installieren**
- [x] Browser refreshen (oder HA neustarten)

> **Repo:** https://github.com/RomRider/apexcharts-card
> Wird für erweiterte Graphen in den Dashboards genutzt (Overlay, Bar-Charts, data_generator).

### 5.3 Power Flow Card Plus (HACS Frontend) ✅

- [x] HACS → Frontend → "Power Flow Card Plus" suchen → **Installieren**
- [x] Browser refreshen (oder HA neustarten)

> **Repo:** https://github.com/flixlix/power-flow-card-plus
> Animierte Energiefluss-Visualisierung (PV → Batterie → Haus → Netz). Zeigt auf einen Blick wohin der Strom fließt.

### 5.4 Mushroom Cards (HACS Frontend) ✅

- [x] HACS → Frontend → "Mushroom" suchen → **Installieren**
- [x] Browser refreshen (oder HA neustarten)

> **Repo:** https://github.com/piitaya/lovelace-mushroom
> Modernes Dashboard-Design: Entity-Cards, Template-Cards mit dynamischen Icons/Farben, Chips für kompakte KPI-Anzeige.

### 5.5 Dashboard "1komma5" ✅

- [x] Einstellungen → Dashboards → + Dashboard hinzufügen → "1komma5" (`mdi:lightning-bolt`)
- [x] Dashboard-Konfiguration: siehe `config/kamrui-n100/dashboards/1komma5.yaml`
- [x] Abschnitte: Strompreis (inkl. Min/Max/Avg), Preis-Forecast (3-Spalten-Tabelle), Solar, Batterie, Netz, Verbrauch

> Dashboard für 1KOMMA5GRAD Heartbeat-Daten. Wird nach Heartbeat-Kündigung obsolet.

### 5.6 Dashboard "Energiemanagement" ✅

- [x] Einstellungen → Dashboards → + Dashboard hinzufügen → "Energiemanagement" (`mdi:lightning-bolt`)
- [x] Dashboard-Konfiguration: siehe `config/kamrui-n100/dashboards/energiemanagement.yaml`
- [x] Abschnitte:
  - **Energiefluss:** Power Flow Card Plus (PV → Batterie → Haus → Netz animiert) + Mushroom Chips (Autarkie, SOC, Preis)
  - **Strompreis:** ApexCharts Overlay (1komma5° vs. ENTSO-e Börsenpreis + Forecasts), Aufschlag-Berechnung
  - **PV-Erzeugung:** ApexCharts Overlay (PV Real vs. Solcast Forecast + Konfidenzband estimate10/90)
  - **Batterie:** Mushroom Template-Card (dynamisches Icon/Badge je SOC + Lade-/Entladerichtung), ApexCharts Bar-Chart
  - **Netz:** ApexCharts Bar-Chart (Bezug rot/Einspeisung grün)
  - **Verbrauch & Autarkie:** Mushroom Template-Cards (Autarkie + Eigenverbrauch, Hausverbrauch), Verlauf
  - **Solcast Forecast:** Mushroom Entity-Cards (Prognose morgen, Peaks, stündliche Vorschau)

## 6. Integrationen einrichten (über UI)

### 6.1 ENTSO-e (Börsenpreise)

- [x] Account erstellen: https://transparency.entsoe.eu/ → Register (E-Mail: schowalter.david@gmail.com)
- [x] Einstellungen: Country: Germany (DE), Time Zone: CET/CEST
- [x] API-Zugang beantragt: E-Mail an `transparency@entsoe.eu` mit Betreff "RESTful API access" (10. März 2026)
- [x] API-Key erhalten
- [x] Token generieren: My Account → Web API Security Token → "Generate"
- [x] HACS → Integrationen → "ENTSO-e" suchen → **v0.7.5 Herunterladen** (bereits im HACS Default Store)
- [x] Home Assistant neustarten
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "ENTSO-e Transparency Platform"
- [x] API-Key eingeben, Bidding Zone: **DE-LU**, Period: PT60M, MwSt.: 0,19, Energieeinheit: kWh, calculation_mode: publish
- [x] Prüfen: 9 Entitäten erkannt

> **Repo:** https://github.com/JaccoR/hass-entso-e (bereits im HACS Default Store)
> Liefert stündliche Day-Ahead Börsenpreise (EUR/kWh, Brutto inkl. 19% MwSt.) für die Bidding Zone DE-LU.
>
> **Sensoren (9 Entitäten):**
> - `sensor.current_electricity_market_price` — aktueller Börsenpreis (EUR/kWh, Brutto)
> - `sensor.average_electricity_price` — Tagesdurchschnitt
> - `sensor.lowest_energy_price` / `sensor.highest_energy_price` — Tagesextreme
> - `sensor.next_hour_electricity_market_price` — nächste Stunde
> - `sensor.time_of_lowest_price` / `sensor.time_of_highest_price` — Zeitpunkte
> - `sensor.current_percentage_in_electricity_price_range` — Position im Tagesbereich (%)
> - `sensor.current_percentage_of_highest_electricity_price` — Anteil am Höchstpreis (%)

### 6.2 Solcast PV-Prognose ✅

- [x] Solcast Home User Account erstellen: https://solcast.com/
- [x] Zwei Rooftop Sites konfiguriert:

  | Dachfläche | Module | kWp | Azimuth | Tilt | Resource ID |
  |------------|--------|-----|---------|------|-------------|
  | Ost (3× Dach 22° + 6× Gaube 2°) | 9 | 4,005 | 85 | 10 | `73b7-fe86-06ee-e672` |
  | West (12× Dach 22°) | 12 | 5,340 | -85 | 22 | `8692-23f6-68c0-7a6b` |

  > Dach ist ~5° gegen Uhrzeigersinn gedreht: Ost-Seite zeigt leicht nach Süd-Ost (85°), West-Seite leicht nach Nord-West (275°).

- [x] HACS → Integrationen → "Solcast PV Forecast" suchen → **v4.5.0 Herunterladen** (bereits im HACS Default Store)
- [x] Home Assistant neustarten
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "Solcast PV Forecast"
- [x] API-Key eingeben (Solcast Account → API Key)
- [x] Prüfen: Sensoren verfügbar (`sensor.solcast_pv_forecast_aktuelle_leistung`, `sensor.solcast_pv_forecast_prognose_heute`, etc.)

> **Hinweis:** Solcast Home User = max. 10 API-Calls/Tag. Die HA-Integration pollt automatisch — Standard reicht aus.
> Gesamt: 21 Module × 445 Wp = 9,345 kWp (SH10RT-20, AC: 10 kW)

### 6.3 Sungrow Inverterdaten (Phase 1)

> ~~GoSungrow Cloud-API~~ — funktioniert nicht mehr (AppKey-Problem seit Nov 2023, nicht gefixt).
> Stattdessen: **mkaiser Sungrow Modbus-Integration** (lokal, Echtzeit, alle Daten).
> Siehe aktualisierter ADR-0006.

**Quelle:** https://github.com/mkaiser/Sungrow-SHx-Inverter-Modbus-Home-Assistant

- [x] `modbus_sungrow.yaml` (Release 2026-03-09) vom GitHub-Repo herunterladen → nach `/config/` kopieren
- [x] `secrets.yaml` auf dem N100 ergänzen:
  ```yaml
  sungrow_modbus_host_ip: "192.168.1.134"  # gridBox (stabil), NICHT WiNet-S2 (192.168.1.191, instabil)
  sungrow_modbus_port: "502"
  sungrow_modbus_device_address: 1
  sungrow_modbus_wait_milliseconds: 200   # konservativ wg. parallelem Heartbeat
  sungrow_modbus_battery_max_power: 5000
  ```
- [x] `configuration.yaml` ergänzen:
  ```yaml
  homeassistant:
    packages:
      sungrow: !include modbus_sungrow.yaml
  ```
- [x] Home Assistant neustarten
- [x] Prüfen: Entwicklerwerkzeuge → Zustände → nach `sungrow` filtern → Inverter erkannt (SH10RT-20)
- [ ] **Wichtig:** Über mehrere Tage 1komma5° App beobachten (Heartbeat-Tab), ob Steuerung weiterhin funktioniert

> **Netzwerk-Info:** WiNet-S2 (`192.168.1.191`) und gridBox (`192.168.1.134`) antworten beide auf Modbus TCP Port 502.
> **WiNet-S2 ist instabil** (Verbindung bricht nach ~20s ab). Die **gridBox ist stabil** und wird als Modbus-Gateway genutzt.
> Falls Heartbeat-Störungen auftreten → `modbus_sungrow.yaml` Einbindung in `configuration.yaml` auskommentieren und neustarten.
> Siehe ADR-0006 für Details.

## 7. Template-Sensoren ✅

> Die mkaiser Modbus-Integration liefert bereits saubere Entity-Namen (siehe ADR-0008).
> Zusätzlich: eigene berechnete KPI-Sensoren in `config/kamrui-n100/template_sensors.yaml`.

- [x] `template_sensors.yaml` erstellt mit:
  - **`sensor.autarkiegrad`** — `(1 - Netzbezug / Gesamtverbrauch) × 100%` — wie viel % des Verbrauchs aus eigener Erzeugung
  - **`sensor.eigenverbrauchsquote`** — `(1 - Einspeisung / PV-Erzeugung) × 100%` — wie viel % der PV selbst verbraucht
  - **`sensor.1komma5_tagesforecast`** — Trigger-basierter Sensor, speichert täglich um 00:05 den 1komma5°-Tagesforecast
    - Trigger: `time 00:05` + State-Change von `unknown`/`unavailable` (nach HA-Restart)
    - Condition: Quell-Sensor muss verfügbar sein
    - Attribute: `midnight_price` (Preis um 00:00), `forecast_json` (24h Forecast als Liste)
    - Zweck: Forecast-Linie im Strompreis-Chart für den ganzen Tag (nicht nur Zukunft)
- [x] `configuration.yaml` ergänzt: `template: !include template_sensors.yaml`
- [x] Sensoren im Dashboard "Energiemanagement" als Gauges eingebunden

> **Formeln:**
> - Gesamtverbrauch = `daily_pv_generation + daily_imported_energy - daily_exported_energy`
> - Division durch 0 wird abgefangen (nachts/bewölkt → 0%)

## 8. Energy Dashboard einrichten

- [x] Einstellungen → Dashboards → Energie

### 8.1 Stromnetz (Netzanschluss) ✅

- [x] **Verbrauch (Import):** `sensor.daily_imported_energy`
- [x] **Einspeisung (Export):** `sensor.daily_exported_energy`
- [x] Leistungsmessung: Zwei Sensoren
  - Importleistung: `sensor.import_power`
  - Exportleistung: `sensor.export_power`

### 8.2 Solar (PV-Module) ✅

- [x] **Energie der PV-Erzeugung:** `sensor.total_pv_generation`
- [x] **Leistung der PV-Erzeugung:** `sensor.total_dc_power`
- [x] Prognose: leer lassen (Solcast/Forecast.Solar kommt später)

### 8.3 Batterie ✅

- [x] **In die Batterie geladene Energie:** `sensor.daily_battery_charge`
- [x] **Aus der Batterie entladene Energie:** `sensor.daily_battery_discharge`
- [x] Leistungsmessung: Zwei Sensoren
  - Entladeleistung: `sensor.battery_discharging_power`
  - Ladeleistung: `sensor.battery_charging_power`

## 9. Backups auf Synology ✅

- [x] Freigegebener Ordner `ha-backups` auf Synology DS218+ (192.168.1.96)
- [x] Einstellungen → System → Speicher → Netzwerkspeicher hinzufügen
  - Name: `Synology_Backup`
  - Typ: Samba/Windows (CIFS)
  - Server: `192.168.1.96`
  - Share: `ha-backups`
  - Verwendung: Backup
- [x] Einstellungen → System → Backups → Automatische Backups einrichten (Benutzerdefiniert)
  - Zeitplan: Täglich, Systemoptimum (4:45–5:45)
  - Aufbewahrung: 7 Backups
  - Daten: Einstellungen, Verlauf, Share-Ordner, alle Apps
  - Speicherorte: Dieses System + Synology_Backup
- [x] Synology DSM Integration: Backup-Pfad korrigiert → `ha-backups/integration`

> **Hinweis:** Die Synology DSM Integration bietet ebenfalls einen Backup-Speicherort an.
> Freigegebener Ordner: `ha-backups`, Pfad: `integration`. Muss in den DSM-Integrationsoptionen (⚙) korrekt konfiguriert sein, sonst erscheint "Failed to list backups".

## 10. Recorder konfigurieren ✅

- [x] `configuration.yaml` ergänzen:
  ```yaml
  recorder:
    purge_keep_days: 365
    commit_interval: 5
  ```
- [x] Home Assistant neustarten

> **Hinweis:** 365 Tage für volles Jahr im Energy Dashboard. Langzeitdaten zusätzlich in InfluxDB (unbegrenzt).

---

## Reihenfolge zusammengefasst

```
HAOS flashen → Onboarding → Erweiterter Modus          ✅ erledigt
→ File Editor → Cloudflared (Grundlagen + Remote)       ✅ erledigt
→ Mosquitto → (Samba optional) → Terminal               ✅ Mosquitto erledigt
→ InfluxDB → Grafana (Monitoring)                       ✅ erledigt
→ HACS                                                  ✅ erledigt
→ Sungrow Modbus (mkaiser via gridBox)                  ✅ erledigt
→ Energy Dashboard                                      ✅ erledigt
→ Synology Backup (Sicherheit)                        ✅ erledigt
→ Recorder konfigurieren (365 Tage)                    ✅ erledigt
→ hacs_1komma5grad ✅ → Solcast ✅ → ApexCharts ✅ → Power Flow ✅ → Mushroom ✅ → Template-Sensoren ✅
→ ENTSO-e ✅ → 1komma5° Tagesforecast-Sensor ✅
→ EMHASS Add-on + Simulation                         ← NÄCHSTER SCHRITT
```

## API-Zugang (für Claude / Entwicklung)

- Langlebiger Zugriffstoken in `.ha_token` (gitignored)
- API-Basis: `https://ha.schowalter.co/api/`
- Alle Entitäten abrufbar: `curl -H "Authorization: Bearer $(cat .ha_token)" https://ha.schowalter.co/api/states`
- Entity-Referenz: [ha-entities.md](ha-entities.md) (656 Entitäten, kategorisiert nach Integration)

## Nützliche URLs

| Was | URL |
|---|---|
| HA Lokal | http://homeassistant.local:8123 |
| App Store | http://homeassistant.local:8123/hassio/store |
| Systeminformationen | http://homeassistant.local:8123/config/info |
| Entwicklerwerkzeuge | http://homeassistant.local:8123/developer-tools/state |
| HA Extern | https://ha.schowalter.co |
| ENTSO-e Registrierung | https://transparency.entsoe.eu/ |
| Solcast | https://solcast.com/ |
| Cloudflare Dashboard | https://dash.cloudflare.com/ |
