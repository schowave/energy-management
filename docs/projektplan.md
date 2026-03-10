# Projektplan: Energiemanagement mit Home Assistant

## Entscheidung: 1komma5° Heartbeat vs. Eigenbau

### Status Quo
- **1komma5° Energy Trader** Tarif ist aktiv, Heartbeat steuert bereits
- Heartbeat verbindet sich per **Modbus TCP** (scannt Port 502 im Netzwerk)
- Sungrow erlaubt nur **eine aktive Modbus-TCP-Verbindung** → Konflikt mit HA
- Fixkosten 1komma5°: ~34 €/Monat (Energy Trader 9,99 + Dynamic Pulse 4,49 + Gebühren 9,29 + Smart Meter 9,90)
- Davon tarifunabhängig (fallen auch bei Tibber an): ~12 €/Mo (Messstellenbetrieb ~5,85 + Netzentgelt/TEPA ~6)
- 1komma5°-spezifische Mehrkosten: ~22 €/Mo → bei Tibber nur ~6 €/Mo Grundgebühr → **Differenz ~10 €/Mo**

### Option A: Bei 1komma5° bleiben
- Heartbeat steuert Batterie + Verbraucher
- HA nur für **Monitoring** (über GoSungrow Cloud-API / MQTT, kein Modbus)
- Kein Modbus-Konflikt
- Preisgarantie (25 ct/kWh Deckel bei Dunkelflauten)

### Option B: Eigenbau mit HA (dieses TODO)
- Wechsel zu günstigerem dynamischen Tarif (Tibber 5,99 €/Mo, aWATTar 4,58 €/Mo, Rabot Charge 4,99 €/Mo)
- **Ersparnis: ~120 €/Jahr** an Fixkosten (Differenz ~10 €/Mo, da Messstellenbetrieb + Netzentgelt in beiden Szenarien anfallen)
- Volle Kontrolle, aber eigene Verantwortung für Optimierung + Preisrisiko

> **Heartbeat ist Pflicht für Energy Trader** → beides zusammen kündigen.
> **Noch klären:** Kündigungsfristen und Mindestlaufzeit des Energy-Trader-Vertrags.

---

## Phase 1: Simulation (parallel zu Heartbeat)

> Alles hier läuft **ohne Modbus** – kein Konflikt mit Heartbeat.
> Ziel: Stack aufbauen, EMHASS-Ergebnisse mit Heartbeat vergleichen, fundierte Entscheidung treffen.
> Architektur-Diagramm: [architektur.md](architektur.md)

### 1.0 Plattform: KAMRUI N100

> Detaillierte Setup-Anleitung: [setup-playbook.md](setup-playbook.md)

- [x] Home Assistant OS auf USB-Stick flashen, von dort auf interne SSD installieren
- [x] Grundkonfiguration: Netzwerk, Benutzer
- [x] **Cloudflared App** → Remote-Zugriff via `https://ha.schowalter.co` (→ ADR-0015)
- [x] Apps installieren: Mosquitto, InfluxDB, Grafana
- [x] HACS (Home Assistant Community Store) installieren
- [x] ~~GoSungrow / MQTT~~ → **mkaiser Sungrow Modbus** via gridBox (192.168.1.134) — siehe ADR-0006
- [x] [hacs_1komma5grad](https://github.com/BirknerAlex/hacs_1komma5grad) über HACS installieren (→ ADR-0014)
- [x] HA-Backups automatisch auf Synology ablegen (SMB/CIFS)
- [x] Recorder: 365 Tage Aufbewahrung
- [x] Energy Dashboard konfiguriert (Solar, Batterie, Netz)
- [x] ApexCharts Card (HACS Frontend) installiert
- [x] Template-Sensoren: Autarkiegrad + Eigenverbrauchsquote
- [x] Dashboards: "1komma5" (Heartbeat-Daten) + "Energiemanagement" (Modbus + Solcast + Preise)

> **KAMRUI N100:** Intel N100 (x86_64, 4C/4T), 16 GB RAM, 512 GB SSD.
> Home Assistant OS 17.1 installiert. HiGHS-Solver läuft nativ (x86_64).
> **Synology DS218+** bleibt als NAS + Backup-Ziel.

### ~~1.0a Abstraktionsschicht~~ — entfällt ✅

> **Entfällt:** GoSungrow wurde übersprungen, mkaiser Modbus liefert direkt saubere Entity-Namen.
> Dashboards und EMHASS referenzieren direkt die mkaiser-Entities:
> `sensor.total_dc_power`, `sensor.battery_level`, `sensor.load_power`, `sensor.import_power`, `sensor.export_power`, etc.
> Zusätzlich: eigene KPI-Sensoren in `template_sensors.yaml` (Autarkiegrad, Eigenverbrauchsquote).

### 1.1 Börsenpreise als Sensor (nur lesend)
- [x] **1komma5° Dynamic Pulse Preis** bereits verfügbar via hacs_1komma5grad (Brutto-Spotpreis inkl. Netzentgelte + MwSt.)
  - `sensor.electricity_price_*` mit Forecast-Attributen
  - Kann als Preissensor für EMHASS-Simulation genutzt werden
- [x] **ENTSO-e Transparency Platform** — eingerichtet (HACS, JaccoR v0.7.5)
  - Bidding Zone: DE-LU, Period: PT60M, MwSt.: 19%, Energieeinheit: kWh
  - `sensor.current_electricity_market_price` — Brutto-Börsenpreis (EUR/kWh)
  - Weitere: `sensor.average_electricity_price`, `sensor.lowest/highest_energy_price`, `sensor.next_hour_electricity_market_price`, etc.
- [ ] **Dynamischer Endpreis-Sensor** (Template-Sensor): Börsenpreis + Netzentgelte + Steuern + Abgaben + Aufschlag
  - Damit EMHASS gegen einen realistischen dynamischen Endpreis optimiert
  - Aufschläge aus Tibber/aWATTar Tarifbedingungen entnehmen
- [ ] **Festpreis-Sensor** (als Baseline): Aktueller Arbeitspreis des lokalen Grundversorgers (z.B. ~35 ct/kWh)
  - Einfacher `input_number` Helper in HA reicht

### 1.2 PV-Prognose ✅
- [x] **Solcast PV Forecast** (BJReplay v4.5.0) über HACS installiert
- [x] Zwei Rooftop Sites konfiguriert: Ost (9 Module, 4 kWp, Az 85°) + West (12 Module, 5,3 kWp, Az -85°)
- [x] Prognosedaten im Dashboard "Energiemanagement" visualisiert (ApexCharts: Real vs. Forecast + Konfidenzband)
- [x] Plausibilität geprüft: Forecast liegt nah an realen Werten

### 1.3 EMHASS im Simulationsmodus ← **NÄCHSTER SCHRITT**
- [ ] **EMHASS App** in HA OS installieren (auf dem KAMRUI N100)
  - Linear-Programming-Optimierer mit **HiGHS-Solver** (x86 nativ)
  - Kombiniert: Strompreise + PV-Prognose + Verbrauchsmuster
  - ML-basierte Lastvorhersage
  - Doku speziell für Sungrow: [LibreHEMS](https://www.librehems.com)
- [ ] **Anlagen-Parameter exakt konfigurieren** (für validen Vergleich entscheidend!):
  - Batteriekapazität: 12.8 kWh
  - Max. Lade-/Entladeleistung: 5000 W (aus mkaiser config)
  - Wechselrichter-Effizienz (~97%)
  - Min/Max SOC Grenzen
- [ ] Strompreis-Sensor anbinden: **1komma5° Dynamic Pulse** (vorläufig), später ENTSO-e + Aufschläge
- [ ] PV-Prognose anbinden: **Solcast** (`sensor.solcast_pv_forecast_prognose_heute`)
- [ ] Verbrauchsdaten über **mkaiser Modbus** (`sensor.load_power`, `sensor.daily_*`)
- [ ] EMHASS berechnet Day-Ahead-Plan → **nur anzeigen, nicht ausführen**
- [ ] **EMHASS-Plan in erwartete Kosten umrechnen** (Template-Sensoren):
  - Erwarteter SOC-Verlauf über den Tag
  - Erwartete Import/Export-kWh pro Stunde
  - Erwartete Tageskosten mit dynamischem Endpreis
- [ ] Alternative: **WattWise** (AppDaemon-App, einfacher als EMHASS)

> **Warum EMHASS statt evcc?**
> evcc ist für EV-Laden gebaut und startet nicht ohne Wallbox (Dummy-Workaround nötig, nicht supported).
> Die Batterie-Optimierung nutzt nur einen einfachen Preisschwellwert statt echtem LP-Optimierer.
> EMHASS ist für genau diesen Use Case (Heim-Batterie + dynamischer Tarif) gebaut.
> evcc wäre nur relevant bei einem späteren E-Auto mit Wallbox – dann als Ergänzung zu EMHASS.

### 1.4 Heartbeat-Tracking (Entscheidungen nachvollziehen) ✅

- [x] **hacs_1komma5grad** (BirknerAlex v1.4.0) installiert → 19 Entitäten (→ ADR-0014)
  - Strompreis (Dynamic Pulse inkl. Netzentgelte + MwSt.) + Forecast-Attribute
  - Grid Import/Export, Solar, Batterie, EV, Wärmepumpe (kWh)
- [x] Dashboard "1komma5" mit Preisverlauf, Forecast-Tabelle (3-Spalten), Solar, Batterie, Netz, Verbrauch
- [x] Preisberechnung dokumentiert: warum Heartbeat-Preis irreführend niedrig ist (→ ADR-0014)
- [ ] Heartbeat-Preissensor mit ENTSO-e-Börsenpreis vergleichen

**Datenquellen (aktuell):**
- [x] **mkaiser Modbus** — granulare Power-Daten (W) in Echtzeit via gridBox
- [x] **hacs_1komma5grad** — Preisdaten (Dynamic Pulse) + aggregierte Energy-Daten (kWh)
- [x] **Solcast** — PV-Prognose (30-Min-Intervalle, estimate + estimate10/90)
- [x] HA Recorder: 365 Tage Aufbewahrung
- [x] InfluxDB + Grafana für langfristige Analyse

### 1.5 Vergleichs-Dashboard (3 Szenarien)
- [ ] Dashboard bauen mit **Zeitstrahl-Überlagerung**:
  - Börsenpreis-Kurve (ct/kWh) + Festpreis-Linie als Referenz
  - Battery SOC Verlauf (Heartbeat real) vs. EMHASS-Simulation
  - Lade-/Entlade-Zeitpunkte von Heartbeat
  - Import/Export Zeitpunkte
- [ ] **Täglicher Kostenvergleich – 3 Szenarien:**
  - **① Baseline (Festpreis, keine Optimierung):** Σ(Gesamtverbrauch kWh × Festpreis Grundversorger)
    - = was der Strom ohne jede Optimierung kosten würde
  - **② Heartbeat real (1komma5°):** Σ(tatsächlicher Import kWh × Festpreis) + 1komma5 Fixkosten anteilig
    - Heartbeat-Preis ist unbekannt, aber die Import-kWh sind messbar
    - Zeigt: wieviel kWh Heartbeat durch Batterieverschiebung vermeidet
  - **③ EMHASS simuliert (dynamischer Tarif):** Σ(simulierter Import kWh × dynamischer Endpreis) + Tibber Fixkosten anteilig
    - Zeigt: was EMHASS mit stundengenauer Preisoptimierung rausholen würde
  - Alle drei als Tagessaldo + kumuliert über Wochen
- [ ] **Einsparungs-Metriken:**
  - Heartbeat-Ersparnis vs. Baseline: ② vs. ① (was bringt Heartbeat?)
  - EMHASS-Ersparnis vs. Baseline: ③ vs. ① (was würde EMHASS bringen?)
  - EMHASS vs. Heartbeat: ③ vs. ② (lohnt sich der Wechsel?)
- [ ] Fragen die das Dashboard beantworten soll:
  - Lädt Heartbeat die Batterie in günstigen Stunden?
  - Wird vor PV-Spitzen entladen um Platz zu schaffen?
  - Wird bei hohen Preisen aus Batterie versorgt statt importiert?
  - **Wieviel spart Heartbeat vs. gar keine Optimierung?**
  - **Würde EMHASS + dynamischer Tarif mehr sparen?**
- [ ] Über Wochen Daten sammeln und vergleichen
- [ ] Bewertung: Lohnt sich der Wechsel? (EMHASS-Ersparnis + ~120 €/Jahr Fixkosten-Ersparnis)

### 1.6 Wärmepumpe einbinden (parallel, unabhängig von Heartbeat)

**Stromverbrauch (Shelly vorhanden):**
- [ ] Vorhandenen Shelly (Stromverbrauch WP) in HA einbinden
- [ ] Template-Sensor `sensor.wp_power` anlegen (Abstraktionsschicht)
- [ ] In InfluxDB langfristig loggen (Verbrauchsmuster der WP verstehen)

**SG-Ready Steuerung (Shelly noch kaufen):**
- [ ] **Klären: Ist SG-Ready bei der Novelan LICV 8.2 freigeschaltet?**
  - Servicemenü der WP prüfen (SG-Ready Einstellung vorhanden?)
  - Falls nicht: Heizungsbauer kontaktieren → kann er freischalten?
  - Falls nicht: Novelan/LE Support kontaktieren → Freischaltung anfordern
  - Kosten und Garantie-Auswirkungen klären
- [ ] SG-Ready Klemmen auf der WP-Platine identifizieren (Anschlussplan/Serviceanleitung)
- [ ] Shelly Plus Relay besorgen (~15 €)
- [ ] Verkabelung: Shelly → SG-Ready Klemmen (potentialfreie Kontakte)
- [ ] Shelly in HA einbinden → 4 Betriebszustände testen:
  - Kontakt 1 AUS + Kontakt 2 AUS = Normalbetrieb
  - Kontakt 1 EIN + Kontakt 2 AUS = Eco / Sperre
  - Kontakt 1 AUS + Kontakt 2 EIN = Boost (PV-Überschuss / billiger Strom)
  - Kontakt 1 EIN + Kontakt 2 EIN = Erzwungener Boost
- [ ] Einfache Test-Automation: bei PV-Überschuss > X kW → Boost-Modus

> **1komma5 steuert die Novelan nicht** – SG-Ready ist komplett unabhängig von Heartbeat.
> Kann jetzt schon eingerichtet und getestet werden.

### 1.7 Weitere Sensoren einbinden

**Digitaler Wasserzähler:**
- [ ] Hersteller und Modell des Zählers prüfen (Aufschrift am Zähler)
- [ ] Schnittstelle klären:
  - Impulsgeber vorhanden? (Cyble-Anschluss bei Itron/Actaris)
  - Wireless M-Bus? (Funk-Zähler → M-Bus USB-Stick)
  - Keine Schnittstelle? → Optische Erkennung (ESP32-CAM + AI-on-the-edge)
- [ ] Passende Hardware besorgen und in HA einbinden
- [ ] Verbrauchsdaten langfristig loggen

---

## Phase 2: Umstieg (nach Kündigung)

> Erst starten, wenn Phase 1 zeigt, dass der Eigenbau sich lohnt.

### 2.1 Vertrag & Kündigung
- [ ] Kündigungsfristen Energy Trader Vertrag prüfen
- [ ] Dynamischen Tarif abschließen (Tibber/aWATTar) – Übergang planen
- [ ] Energy Trader + Heartbeat kündigen

### 2.2 Batteriesteuerung (Sungrow SH10RT)
- [ ] Heartbeat vom Netz trennen
- [x] **mkaiser Sungrow-SHx-Modbus-Integration** bereits eingerichtet (Phase 1, via gridBox)
- [x] Modbus TCP Zugriff auf Wechselrichter getestet und stabil
- [ ] Neue Steuerungs-Entities einrichten (nur über Modbus verfügbar):
  - Batterie-Lademodus (Forced Charge, Self-Consumption, etc.)
  - Lade-/Entladezeiten und -zeitpläne
  - Min/Max SOC Grenzen

### 2.3 Wärmepumpensteuerung (Novelan)
- [ ] SG-Ready Steuerung bereits aus Phase 1.6 vorhanden
- [ ] EMHASS als Deferrable Load konfigurieren (WP-Boost bei optimalem Preis)
- [ ] Thermische Trägheit des Warmwasserspeichers als Energiespeicher nutzen
- [ ] Automationen: Boost bei PV-Überschuss ODER niedrigem Börsenpreis

### 2.4 EMHASS scharf schalten
- [ ] EMHASS von Simulation auf aktive Steuerung umstellen
- [ ] Automationen erstellen, die EMHASS-Plan umsetzen:
  - Sungrow-Batterie über Modbus steuern
  - Novelan WP über SG-Ready steuern
- [ ] Einfache Schwellwert-Automationen als Fallback (deckt ~70-80% des Potenzials)
- [ ] Monitoring & Alerting für Fehlerfälle

---

## Geschätzter Aufwand
- **Phase 1:** 1-2 Wochenenden + einige Wochen Daten sammeln
- **Phase 2:** 1-2 Wochenenden für Umstieg und Tuning
- Danach läuft es autonom
