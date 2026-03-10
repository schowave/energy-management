# ADR-0008: Template-Sensoren als Abstraktionsschicht

**Status:** Superseded (März 2026) — Abstraktionsschicht nicht mehr nötig

## Kontext

Die Datenquelle für Inverterdaten wechselt zwischen Phase 1 (GoSungrow Cloud-API) und Phase 2 (Modbus TCP). Dashboards, EMHASS-Konfiguration und Automationen sollen bei diesem Wechsel nicht angepasst werden müssen.

## Ursprüngliche Entscheidung

Template-Sensoren mit generischen Namen (`sensor.pv_power`, `sensor.battery_soc`, etc.) als Abstraktionsschicht.

## Warum nicht mehr nötig

- **GoSungrow ist ausgefallen** (AppKey-Problem, siehe ADR-0006) — der geplante Quellwechsel GoSungrow → Modbus entfällt
- Die **mkaiser Modbus-Integration** wird bereits in Phase 1 eingesetzt (statt GoSungrow)
- Die mkaiser-Entity-Namen sind **sauber und stabil** (z.B. `sensor.total_dc_power`, `sensor.battery_level`, `sensor.load_power`)
- Die mkaiser-Integration bringt **eigene Template-Sensoren** mit (z.B. `sensor.import_power`, `sensor.export_power`, `sensor.battery_charging_power`)
- Da Phase 1 und Phase 2 **dieselbe Integration** nutzen, gibt es keinen Quellwechsel mehr

## Aktuelle Entity-Namen (mkaiser Modbus)

| Zweck | Entity |
|---|---|
| PV-Leistung | `sensor.total_dc_power` |
| Batterie SOC | `sensor.battery_level` |
| Batterie Laden | `sensor.battery_charging_power` |
| Batterie Entladen | `sensor.battery_discharging_power` |
| Netz Import | `sensor.import_power` |
| Netz Export | `sensor.export_power` |
| Hausverbrauch | `sensor.load_power` |

## Konsequenzen

- `templates.yaml` wurde entfernt
- Alle Dashboards, EMHASS und Automationen referenzieren direkt die mkaiser-Entity-IDs
- Kein zusätzlicher Template-Overhead
