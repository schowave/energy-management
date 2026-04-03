# 1komma5° vs EMHASS — Entscheidungsvergleich

**Datum:** 2026-04-01 (aktualisiert 2026-04-03)
**Status:** Implementiert
**Ziel:** Objektiver Vergleich der Batterie-Steuerungsentscheidungen von 1komma5° Heartbeat vs. EMHASS MPC-Optimierung, inkl. Bewertung des ungenutzten Wärmepumpen-Optimierungspotenzials.

---

## Kontext

Ab 01.04.2026 läuft ein dynamischer Stromtarif über 1komma5°. Der Heartbeat steuert die Batterie (Sungrow SBR128, 12.8 kWh) in Echtzeit. EMHASS läuft parallel im MPC-Simulationsmodus (alle 5 Min) und gibt einen optimalen Batterie-Fahrplan aus, kontrolliert aber die Hardware nicht.

**Kernfragen:**
1. Trifft 1komma5° Heartbeat gute Batterie-Entscheidungen, oder hätte EMHASS besser optimiert?
2. Wie viel Einsparpotenzial bleibt ungenutzt, weil 1komma5° die Wärmepumpe nicht steuern kann?

## Vergleichslogik

### Preisbasis

- EMHASS optimiert gegen **1komma5°-Preise** (gleiche Preisbasis wie die realen Kosten)
- 1k5 Forecast: 15-Min-Auflösung, je 2 Werte gemittelt → 30-Min für EMHASS
- Einspeisevergütung: `input_number.einspeiseverguetung` (aktuell 0.082 EUR/kWh)

### Vergleichsebenen

1. **Batterie-Steuerung** — Wann lädt/entlädt Heartbeat vs. wann hätte EMHASS es getan?
2. **Preisoptimierung** — Zu welchen Stunden wird Strom bezogen/eingespeist, zu welchem Preis?
3. **Gesamtergebnis** — Tägliche/wöchentliche/monatliche Kosten
4. **Wärmepumpen-Potenzial** — Wie viel WP-Strom fließt zu teuren Zeiten?

---

## Architektur

### EMHASS-Konfiguration

```
00:01 + 05:30:  Day-Ahead → sensor.p_batt_forecast (24h-Überblick)
Alle 5 Min:     MPC       → sensor.p_batt_forecast (überschreibt mit Echtzeit)
                             48 Schritte × 30 Min = 24h Horizont
                             Echtzeit-Load + Theo-SOC + 1k5-Preise
```

Day-Ahead und MPC nutzen die gleichen Sensornamen (kein Prefix).
MPC überschreibt alle 5 Min mit frischen Werten.

### Simulations-Pipeline

```
sensor.p_batt_forecast (MPC, alle 5 Min)
    ↓
sensor.emhass_theo_soc (simulierter Akkustand, jede Minute)
    ↓ SOC-Clipping (Entladen nur wenn Theo-SOC > 12%, Laden nur wenn < 94%)
sensor.emhass_theo_kosten_laufend (EUR/h)
    ↓ Riemann-Summe (trigger-basiert, jede Minute)
sensor.emhass_theo_kosten_kumuliert (EUR)
    ↓
utility_meter (Tag/Woche/Monat)
```

### Theo-SOC-Tracker

Simuliert den Akkustand als ob EMHASS die Batterie steuern würde:
- **Jede Minute:** SOC ± (p_batt_forecast × 1/60h / 12800Wh × 100%)
- **Effizienz:** 95% Laden, 95% Entladen
- **Grenzen:** 10% ≤ SOC ≤ 95%
- **Midnight-Reset:** Um 00:00 wird Theo-SOC auf den realen SOC synchronisiert → fairer Tagesvergleich

### EMHASS-Vorzeichen-Konvention

`p_batt_forecast` **positiv = Entladen**, negativ = Laden.
(Verifiziert 2026-04-01: SOC-Ziel 37% bei Batterie 86% → p_batt_forecast +1321W = Entladen)

---

## Komponenten

### Template-Sensoren (`template_sensors.yaml`)

| Sensor | Einheit | Beschreibung |
|---|---|---|
| `sensor.wp_betriebsmodus` | Text | WP-Modus: Heizen/Warmwasser/Standby/... |
| `sensor.heartbeat_modus` | Text | Heartbeat: laden/entladen/idle/zero_export |
| `sensor.1k5_netzbezugskosten_laufend` | EUR/h | Reale Netzkosten (Import × Preis - Export × Einspeisevergütung) |
| `sensor.emhass_theo_kosten_laufend` | EUR/h | Theoretische EMHASS-Kosten (mit SOC-Clipping) |
| `sensor.wp_stromkosten_laufend` | EUR/h | WP-Stromkosten zum aktuellen Preis |
| `sensor.wp_einsparpotenzial_laufend` | EUR/h | Wie viel günstiger WP hätte laufen können |
| `sensor.emhass_theo_soc` | % | Simulierter EMHASS-Akkustand |

### Kumulierte Sensoren (trigger-basiert, jede Minute)

| Sensor | Beschreibung |
|---|---|
| `sensor.1k5_netzbezugskosten_kumuliert` | Aufsummierte reale Netzkosten (EUR) |
| `sensor.emhass_theo_kosten_kumuliert` | Aufsummierte theoretische Kosten (EUR) |
| `sensor.wp_stromkosten_kumuliert` | Aufsummierte WP-Kosten (EUR) |
| `sensor.wp_einsparpotenzial_kumuliert` | Aufsummiertes WP-Potenzial (EUR) |

### Utility Meters (`utility_meter.yaml`)

12 Meter: je Tag/Woche/Monat für Real-Kosten, EMHASS-Kosten, WP-Kosten, WP-Potenzial.
Delta wird inline berechnet (real - emhass), nicht als eigener Sensor.

### EMHASS REST-Commands (`emhass.yaml`)

**emhass_dayahead** — Day-Ahead, 1× täglich (00:01 + 05:30)
- 48 × 30-Min, 1k5-Preise, Solcast-PV, Theo-SOC als soc_init

**emhass_mpc** — MPC, alle 5 Min
- `/action/naive-mpc-optim`
- 48 × 30-Min (24h Horizont)
- Echtzeit-Load (`sensor.load_power` × 48, naive Annahme)
- 1k5-Preise, Solcast-PV, Theo-SOC als soc_init
- Kein separates publish-data nötig (`continual_publish: true`)

---

## Dashboard (`1k5-vs-emhass.yaml`)

### Tab 1: Live (Tagesansicht, 5-Min-Auflösung)

- KPI-Chips: Real €, EMHASS €, Delta €, WP €, WP-Potenzial €, Heartbeat-Modus
- Batterie: EMHASS-Plan vs. Realität (+ Entladen / − Laden)
- SOC: EMHASS-Empfehlung vs. Heartbeat (real) vs. Simulation (theo)
- Preis + Heartbeat-Modus (separate Y-Achsen)
- Kostenvergleich kumuliert (EUR)
- WP-Leistung vs. Strompreis
- Betriebsmodus-Verlauf (History-Graph: Heartbeat + WP Modus)

### Tab 2: Woche (7-Tage-Trend)

- KPI-Chips + Tägliche Kostenbalken + Delta-Trend + WP-Kosten

### Tab 3: Monat (Monatsübersicht)

- KPI-Chips + Tägliche Kostenbalken + Delta-Trend + WP-Kosten
- Monatszusammenfassung (Markdown mit Tabellen + Bewertung)

---

## Bekannte Limitierungen

1. **EMHASS plant mit Forecasts, nicht Ist-Werten** — Solcast-PV und naiver Lastforecast weichen von der Realität ab. MPC alle 5 Min reduziert diesen Effekt deutlich.
2. **SOC-Clipping nutzt den simulierten Theo-SOC** — fair, aber der Theo-SOC akkumuliert kleine Fehler über den Tag. Midnight-Reset begrenzt die Drift auf 24h.
3. **Load-Forecast ist naiv** — aktueller Verbrauch × 48 Schritte. Könnte durch ML-basierte Prognose verbessert werden.
4. **EMHASS publish_prefix funktioniert nicht** — EMHASS-Bug: Sensoren mit Prefix werden nicht in HA erstellt. Workaround: kein Prefix, MPC und Day-Ahead überschreiben dieselben Sensoren.
5. **EMHASS optimization_time_step ≠ 30 crasht Publish** — EMHASS-Bug: 5-Min-Schritte erzeugen ValueError beim Publish. Workaround: 30-Min-Schritte, aber MPC alle 5 Min neu berechnen.

---

## Dateien

| Datei | Beschreibung |
|---|---|
| `config/kamrui-n100/emhass.yaml` | Day-Ahead + MPC REST-Commands + Automationen |
| `config/kamrui-n100/template_sensors.yaml` | Alle Sensoren (Modus, Kosten, Theo-SOC, kumuliert) |
| `config/kamrui-n100/utility_meter.yaml` | 12 Utility Meters (Tag/Woche/Monat) |
| `config/kamrui-n100/configuration.yaml` | input_number.einspeiseverguetung |
| `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml` | Vergleichs-Dashboard (3 Tabs) |
| `config/kamrui-n100/dashboards/energiemanagement.yaml` | Energiemanagement-Dashboard (nutzt gleiche Sensoren) |
