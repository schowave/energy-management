# ADR-0009: InfluxDB + Grafana für Langzeit-Monitoring

**Status:** Akzeptiert (März 2026)

## Kontext

Für den Vergleich von Heartbeat vs. EMHASS (Phase 1) und das langfristige Monitoring (Phase 2) werden Sensordaten über Monate hinweg gespeichert und visualisiert. Der HA-eigene Recorder (SQLite) ist für Langzeitdaten und komplexe Abfragen nicht ausgelegt.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **InfluxDB + Grafana** | Zeitreihen-optimiert, mächtige Abfragen (Flux/InfluxQL), Grafana-Dashboards, HA Add-ons verfügbar | Zwei zusätzliche Add-ons, RAM-Verbrauch |
| HA Recorder (SQLite) | Keine Zusatzsoftware, integriert | Nicht für Langzeitdaten, keine komplexen Aggregationen, wird bei großen Datenmengen langsam |
| Prometheus + Grafana | Pull-basiert, industriestandard | Weniger geeignet für HA (Push-basiert), komplexere Einrichtung |
| TimescaleDB | SQL + Zeitreihen | Kein HA Add-on, komplexere Einrichtung |

## Entscheidung

InfluxDB als Langzeit-Speicher, Grafana als Visualisierung — beide als HA OS Add-ons.

## Begründung

- **Zeitreihen-optimiert**: InfluxDB ist für genau diesen Use Case gebaut (Sensordaten über Zeit)
- **HA-Integration**: Nativer InfluxDB-Export in HA, ein Klick Add-on-Installation
- **Grafana-Dashboards**: Zeitstrahl-Überlagerungen (Heartbeat vs. EMHASS vs. Baseline) sind mit Grafana einfach umsetzbar
- **512 GB SSD** (KAMRUI N100) bietet ausreichend Speicher für Jahre an Sensordaten
- **16 GB RAM** verkraftet InfluxDB + Grafana neben HA + EMHASS

## Konsequenzen

- HA Recorder `purge_keep_days` kann niedrig bleiben (10-14 Tage) — InfluxDB übernimmt Langzeit
- Alle relevanten Sensoren müssen explizit für InfluxDB-Export konfiguriert werden
- Retention Policies in InfluxDB konfigurieren (z.B. 1-Minuten-Daten für 90 Tage, Stundenwerte unbegrenzt)
- Grafana-Dashboards müssen initial gebaut werden (Phase 1: Vergleichs-Dashboard)
- RAM-Verbrauch steigt um ca. 500 MB–1 GB (bei 16 GB kein Problem)
