# ADR-0006: GoSungrow Cloud-API für Inverterdaten in Phase 1

**Status:** Akzeptiert (März 2026)

## Kontext

In Phase 1 (Simulation) steuert der 1komma5° Heartbeat den Sungrow SH10RT per Modbus TCP. Sungrow erlaubt nur **eine aktive Modbus-TCP-Verbindung**, daher kann HA nicht gleichzeitig per Modbus zugreifen.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **GoSungrow Cloud-API** | Kein Modbus-Konflikt, alle relevanten Sensoren verfügbar, MQTT-Bridge möglich | Cloud-Abhängigkeit, Latenz (~30s), kein Schreibzugriff |
| Modbus TCP parallel | Direkte Daten, kein Cloud | Nicht möglich — Sungrow erlaubt nur eine Verbindung |
| Sungrow WiNet-S Logger sniffen | Lokale Daten | Instabil, nicht supportet, kann Heartbeat stören |

## Entscheidung

GoSungrow Cloud-API (via MQTT oder REST) als Datenquelle in Phase 1.

## Begründung

- **Einzige konfliktfreie Option**, solange Heartbeat per Modbus verbunden ist
- Alle für EMHASS-Simulation relevanten Sensoren sind verfügbar (SOC, PV-Power, Grid, Load)
- MQTT-Bridge liefert Daten in nahezu Echtzeit
- Lesezugriff reicht für Phase 1 (Simulation, kein Schreibzugriff nötig)

## Konsequenzen

- Abhängigkeit von Sungrow-Cloud-Verfügbarkeit (kein lokaler Fallback in Phase 1)
- Daten haben ~30s Latenz gegenüber Echtzeit — für Simulation akzeptabel
- Kein Schreibzugriff → Batterie-Steuerung erst in Phase 2 (Modbus)
- Template-Sensoren abstrahieren die GoSungrow-Entity-Namen (→ ADR-0008)
