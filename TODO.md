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

## Bausteine für den Eigenbau

### 1. Dynamische Strompreise
- [ ] Dynamischen Tarif wählen (Tibber, aWATTar oder Ostrom)
- [ ] HA-Integration installieren → liefert stündliche Börsenpreise als Sensor

### 2. PV-Prognose
- [ ] **Solcast** oder **Forecast.Solar** Integration einrichten
- [ ] Liefert erwartete PV-Erzeugung für Day-Ahead-Planung

### 3. Batteriesteuerung (Sungrow SH10RT)
- [ ] **mkaiser Sungrow-SHx-Modbus-Integration** einrichten (nach Heartbeat-Abschaltung!)
- [ ] Modbus TCP Zugriff auf Wechselrichter (Port 502)
- [ ] Lade-/Entladezeiten und -modi per Automation steuern

### 4. Wärmepumpensteuerung (Novelan)
- [ ] **SG-Ready** Ansteuerung über HA
- [ ] Bei PV-Überschuss oder niedrigen Börsenpreisen → Boost-Modus
- [ ] Thermische Trägheit des Warmwasserspeichers als Energiespeicher nutzen

### 5. Energieoptimierung (der "Heartbeat-Ersatz")
- [ ] **EMHASS** (Energy Management for Home Assistant) einrichten
  - Läuft als HA Add-on oder Docker-Container (Synology)
  - Linear-Programming-Optimierer
  - Kombiniert: Strompreise + PV-Prognose + Verbrauchsmuster
  - ML-basierte Lastvorhersage
  - Doku speziell für Sungrow: [LibreHEMS](https://www.librehems.com)
  - Berechnet **Day-Ahead-Plan**: wann Batterie laden/entladen, wann WP steuern
- [ ] Alternative: **WattWise** (AppDaemon-App, einfacher als EMHASS)

### 6. HA-Automationen
- [ ] Automationen erstellen, die EMHASS-Plan umsetzen:
  - Sungrow-Batterie über Modbus steuern
  - Novelan WP über SG-Ready steuern
- [ ] Einfache Schwellwert-Automationen als Fallback (deckt ~70-80% des Potenzials)

---

## Geschätzter Aufwand
- **2-3 Wochenenden** für Ersteinrichtung und Tuning
- Danach läuft es autonom

## Reihenfolge
1. **Kündigungsfristen** Energy Trader Vertrag prüfen
2. Dynamischen Tarif abschließen (Tibber/aWATTar) – Übergang planen
3. PV-Prognose einrichten (kann schon parallel laufen)
4. Energy Trader + Heartbeat kündigen, Heartbeat vom Netz trennen
5. Modbus-Zugriff für HA freigeben (Sungrow-SHx-Integration)
6. EMHASS aufsetzen und konfigurieren
7. Automationen bauen und testen
8. Monitoring-Dashboard in HA aufbauen
