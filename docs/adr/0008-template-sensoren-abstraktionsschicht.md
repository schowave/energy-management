# ADR-0008: Template-Sensoren als Abstraktionsschicht

**Status:** Akzeptiert (März 2026)

## Kontext

Die Datenquelle für Inverterdaten wechselt zwischen Phase 1 (GoSungrow Cloud-API) und Phase 2 (Modbus TCP). Dashboards, EMHASS-Konfiguration und Automationen sollen bei diesem Wechsel nicht angepasst werden müssen.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Template-Sensoren** | Klare Abstraktion, ein Ort zum Ändern, HA-nativ | Zusätzliche Entities, minimale Latenz |
| Direkte Referenz | Kein Overhead | Jede Referenz muss bei Quellwechsel geändert werden (Dashboards, EMHASS, Automationen) |
| Customization (entity_id rename) | Kein Template nötig | Fragil, bricht bei Updates, nicht für Quellwechsel gedacht |

## Entscheidung

Template-Sensoren mit generischen Namen, die alle nachgelagerten Systeme referenzieren.

## Begründung

- **Single Point of Change**: Beim Wechsel GoSungrow → Modbus wird nur die Template-Quelle angepasst
- **Generische Namen** (`sensor.pv_power`, `sensor.battery_soc`, etc.) sind sprechend und quellenunabhängig
- EMHASS, Dashboards, InfluxDB-Recording und Automationen referenzieren ausschließlich die Templates
- Minimaler Overhead (Template-Sensoren sind leichtgewichtig in HA)

## Mapping

| Template-Sensor | Phase 1 (GoSungrow) | Phase 2 (Modbus) |
|---|---|---|
| `sensor.pv_power` | `gosungrow...p13003` | `sungrow_total_dc_power` |
| `sensor.battery_soc` | `gosungrow...p13141` | `sungrow_battery_level` |
| `sensor.battery_charge_power` | `gosungrow...p13126` | `sungrow_battery_charging_power` |
| `sensor.battery_discharge_power` | `gosungrow...p13150` | `sungrow_battery_discharging_power` |
| `sensor.grid_import_power` | `gosungrow...p13149` | `sungrow_import_power` |
| `sensor.grid_export_power` | `gosungrow...p13121` | `sungrow_export_power` |
| `sensor.load_power` | `gosungrow...p13119` | `sungrow_load_power` |

## Konsequenzen

- Alle nachgelagerten Konfigurationen verwenden ausschließlich Template-Sensor-Namen
- Beim Quellwechsel wird nur `configuration.yaml` (Template-Bereich) angepasst
- Steuerungs-Entities (Batterie-Lademodus, SOC-Grenzen) gibt es nur in Phase 2 — keine Migration nötig
- Exakte Modbus-Entity-Namen stehen erst bei Installation der mkaiser-Integration fest
