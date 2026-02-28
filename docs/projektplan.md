# TODO: Energiemanagement mit Home Assistant

## Entscheidung: 1komma5° Heartbeat vs. Eigenbau

### Status Quo
- **1komma5° Energy Trader** Tarif ist aktiv, Heartbeat steuert bereits
- Heartbeat verbindet sich per **Modbus TCP** (scannt Port 502 im Netzwerk)
- Sungrow erlaubt nur **eine aktive Modbus-TCP-Verbindung** → Konflikt mit HA
- Fixkosten 1komma5°: ~34 €/Monat (Energy Trader 9,99 + Dynamic Pulse 4,49 + Gebühren 9,29 + Smart Meter 9,90)

### Option A: Bei 1komma5° bleiben
- Heartbeat steuert Batterie + Verbraucher
- HA nur für **Monitoring** (über GoSungrow Cloud-API / MQTT, kein Modbus)
- Kein Modbus-Konflikt
- Preisgarantie (15 ct/kWh Deckel bei Dunkelflauten)

### Option B: Eigenbau mit HA (dieses TODO)
- Wechsel zu günstigerem dynamischen Tarif (Tibber 5,99 €/Mo, aWATTar 4,58 €/Mo, Rabot Charge 4,99 €/Mo)
- **Ersparnis: ~300 €/Jahr** an Fixkosten
- Volle Kontrolle, aber eigene Verantwortung für Optimierung + Preisrisiko

> **Heartbeat ist Pflicht für Energy Trader** → beides zusammen kündigen.
> **Noch klären:** Kündigungsfristen und Mindestlaufzeit des Energy-Trader-Vertrags.

---

## Phase 1: Simulation (parallel zu Heartbeat)

> Alles hier läuft **ohne Modbus** – kein Konflikt mit Heartbeat.
> Ziel: Stack aufbauen, EMHASS-Ergebnisse mit Heartbeat vergleichen, fundierte Entscheidung treffen.
> Architektur-Diagramm: [architektur.md](architektur.md)

### 1.0 Hardware: Intel N100 Mini PC
- [ ] Mini PC bestellen (z.B. Beelink Mini S12 Pro, 16GB RAM, 500GB NVMe, ~180 €)
- [ ] Home Assistant OS auf USB-Stick flashen, von dort auf interne SSD installieren
- [ ] Grundkonfiguration: Netzwerk, Benutzer, MQTT Broker (Mosquitto Add-on)
- [ ] GoSungrow / MQTT Integration von bestehender HA-Instanz migrieren
- [ ] HA-Backups automatisch auf Synology ablegen (SMB/NFS Netzlaufwerk)

> **Warum N100?** x86_64 → EMHASS HiGHS-Solver läuft nativ. 16 GB RAM = Headroom für alle Add-ons. ~10W idle.
>
> **Rolle der Geräte:**
> - **N100 Mini PC** = dediziertes HA OS Gerät (kein Windows, reines HA-System)
> - **Synology DS218** = NAS (Fileserver, Backups, Medien) + HA-Backup-Ziel

### 1.1 Börsenpreise als Sensor (nur lesend)
- [ ] **ENTSO-e Transparency Platform** Integration installieren (kostenlos, nur Registrierung nötig)
  - Liefert stündliche Day-Ahead Börsenpreise für DE/AT
  - Kein Stromvertrag nötig, reine Marktdaten-API
  - https://transparency.entsoe.eu/ → kostenlosen API-Key beantragen
- [ ] Stündliche Börsenpreise als Sensor in HA verfügbar machen

### 1.2 PV-Prognose
- [ ] **Solcast** oder **Forecast.Solar** Integration einrichten
- [ ] Anlagendaten hinterlegen (Ausrichtung, Neigung, kWp)
- [ ] Prüfen ob Prognosedaten plausibel sind

### 1.3 EMHASS im Simulationsmodus
- [ ] **EMHASS Add-on** in HA OS installieren (läuft als Docker-Container auf dem N100)
  - Linear-Programming-Optimierer mit **HiGHS-Solver** (x86 nativ)
  - Kombiniert: Strompreise + PV-Prognose + Verbrauchsmuster
  - ML-basierte Lastvorhersage
  - Doku speziell für Sungrow: [LibreHEMS](https://www.librehems.com)
- [ ] Strompreis- und PV-Sensoren anbinden
- [ ] Verbrauchsdaten über **GoSungrow Cloud-API** (bereits vorhanden) einspeisen
- [ ] EMHASS berechnet Day-Ahead-Plan → **nur anzeigen, nicht ausführen**
- [ ] Alternative: **WattWise** (AppDaemon-App, einfacher als EMHASS)

### 1.4 Heartbeat-Tracking (Entscheidungen nachvollziehen)
- [ ] Folgende Sensoren im HA Recorder / InfluxDB langfristig loggen:
  - **Börsenpreis** (ENTSO-e, stündlich)
  - **Battery SOC** (GoSungrow: `p13141`)
  - **Battery Charge/Discharge Power** (GoSungrow: `p13126` / `p13150`)
  - **Grid Import/Export Power** (GoSungrow: `p13149` / `p13121`)
  - **PV-Erzeugung** (GoSungrow: `p13003`)
  - **Load Power** (GoSungrow: `p13119`)
- [ ] HA Recorder `purge_keep_days` hochsetzen (z.B. 90 Tage)
- [ ] Optional: InfluxDB + Grafana für langfristige Analyse

### 1.5 Vergleichs-Dashboard
- [ ] Dashboard bauen mit **Zeitstrahl-Überlagerung**:
  - Börsenpreis-Kurve (ct/kWh)
  - Battery SOC Verlauf
  - Lade-/Entlade-Zeitpunkte von Heartbeat
  - Import/Export Zeitpunkte
- [ ] Fragen die das Dashboard beantworten soll:
  - Lädt Heartbeat die Batterie in günstigen Stunden?
  - Wird vor PV-Spitzen entladen um Platz zu schaffen?
  - Wird bei hohen Preisen aus Batterie versorgt statt importiert?
  - Wie oft wird bei teuren Preisen trotzdem importiert?
- [ ] EMHASS-Empfehlung daneben legen (wenn 1.3 läuft)
- [ ] Über Wochen Daten sammeln und vergleichen
- [ ] Bewertung: Bringt Heartbeat mehr als ~300 €/Jahr Mehrkosten?

---

## Phase 2: Umstieg (nach Kündigung)

> Erst starten, wenn Phase 1 zeigt, dass der Eigenbau sich lohnt.

### 2.1 Vertrag & Kündigung
- [ ] Kündigungsfristen Energy Trader Vertrag prüfen
- [ ] Dynamischen Tarif abschließen (Tibber/aWATTar) – Übergang planen
- [ ] Energy Trader + Heartbeat kündigen

### 2.2 Batteriesteuerung (Sungrow SH10RT)
- [ ] Heartbeat vom Netz trennen
- [ ] **mkaiser Sungrow-SHx-Modbus-Integration** einrichten
- [ ] Modbus TCP Zugriff auf Wechselrichter (Port 502) testen
- [ ] Lade-/Entladezeiten und -modi per Automation steuern

### 2.3 Wärmepumpensteuerung (Novelan)
- [ ] **SG-Ready** Ansteuerung über HA einrichten
- [ ] Bei PV-Überschuss oder niedrigen Börsenpreisen → Boost-Modus
- [ ] Thermische Trägheit des Warmwasserspeichers als Energiespeicher nutzen

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
