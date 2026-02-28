# Projektplan: Energiemanagement mit Home Assistant

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

### 1.0 Hardware: KAMRUI N100 Mini PC
- [ ] **KAMRUI N100** bestellen (N100, 16GB DDR4, 512GB SSD, 179,99 € auf Amazon.de)
- [ ] Home Assistant OS auf USB-Stick flashen, von dort auf interne SSD installieren
- [ ] Grundkonfiguration: Netzwerk, Benutzer, MQTT Broker (Mosquitto Add-on)
- [ ] GoSungrow / MQTT Integration von bestehender HA-Instanz migrieren
- [ ] HA-Backups automatisch auf Synology ablegen (SMB/NFS Netzlaufwerk)

> **Warum N100?** x86_64 → EMHASS HiGHS-Solver läuft nativ. 16 GB RAM = Headroom für alle Add-ons. ~8W idle = ~21 €/Jahr Strom.
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
- [ ] **Dynamischer Endpreis-Sensor** (Template-Sensor): Börsenpreis + Netzentgelte + Steuern + Abgaben + Aufschlag
  - Damit EMHASS gegen einen realistischen dynamischen Endpreis optimiert
  - Aufschläge aus Tibber/aWATTar Tarifbedingungen entnehmen
- [ ] **Festpreis-Sensor** (als Baseline): Aktueller Arbeitspreis des lokalen Grundversorgers (z.B. ~35 ct/kWh)
  - Einfacher `input_number` Helper in HA reicht

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
- [ ] **Anlagen-Parameter exakt konfigurieren** (für validen Vergleich entscheidend!):
  - Batteriekapazität: 12.8 kWh
  - Max. Lade-/Entladeleistung (aus Sungrow Datenblatt)
  - Wechselrichter-Effizienz (~97%)
  - Min/Max SOC Grenzen
- [ ] Strompreis- und PV-Sensoren anbinden (Endpreis-Sensor aus 1.1!)
- [ ] Verbrauchsdaten über **GoSungrow Cloud-API** (bereits vorhanden) einspeisen
- [ ] EMHASS berechnet Day-Ahead-Plan → **nur anzeigen, nicht ausführen**
- [ ] **EMHASS-Plan in erwartete Kosten umrechnen** (Template-Sensoren):
  - Erwarteter SOC-Verlauf über den Tag
  - Erwartete Import/Export-kWh pro Stunde
  - Erwartete Tageskosten mit dynamischem Endpreis
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
- [ ] Bewertung: Lohnt sich der Wechsel? (EMHASS-Ersparnis > 300 €/Jahr Fixkosten-Ersparnis?)

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
