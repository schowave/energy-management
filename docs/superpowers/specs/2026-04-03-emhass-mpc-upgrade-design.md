# EMHASS MPC-Upgrade — Design Spec

**Datum:** 2026-04-03
**Status:** Approved
**Ziel:** Umstellung EMHASS von Day-Ahead (30-Min-Schritte) auf MPC (5-Min-Schritte, Echtzeit) für akkuratere Simulation im 1k5-vs-EMHASS-Vergleich.

---

## Architektur

```
05:30 täglich:  Day-Ahead → sensor.dh_p_batt_forecast (24h-Überblick)
Alle 5 Min:     MPC       → sensor.mpc_p_batt_forecast (Echtzeit-Entscheidung)
                           → sensor.mpc_soc_batt_forecast

Theo-SOC-Tracker → nutzt mpc_p_batt_forecast
Kosten-Sensor   → nutzt mpc_p_batt_forecast
```

## REST-Commands (emhass.yaml)

### 1. emhass_dayahead (1× täglich 05:30)

- Endpoint: `/action/dayahead-optim`
- `publish_prefix: "dh_"`
- Nutzt 1k5 Preise + Solcast (wie bisher)
- Erzeugt: `sensor.dh_p_batt_forecast`, `sensor.dh_soc_batt_forecast`

### 2. emhass_mpc (alle 5 Min)

- Endpoint: `/action/naive-mpc-optim`
- `prediction_horizon: 48` (4h bei 5-Min-Schritten)
- `optimization_time_step: 5`
- `publish_prefix: "mpc_"`
- `soc_init`: `sensor.emhass_theo_soc` / 100
- `soc_final: 0.1`
- Forecast-Arrays (je 48 Werte):
  - `load_cost_forecast`: 1k5 Forecast (15-Min → 3× wiederholen pro Schritt)
  - `pv_power_forecast`: Solcast (30-Min → 6× wiederholen pro Schritt)
  - `load_power_forecast`: aktueller `sensor.load_power` × 48 (naive Annahme)
  - `prod_price_forecast`: `input_number.einspeiseverguetung` × 48
- Erzeugt: `sensor.mpc_p_batt_forecast`, `sensor.mpc_soc_batt_forecast`

### 3. emhass_publish (unverändert)

- Endpoint: `/action/publish-data`

## Automationen (emhass.yaml)

1. **Day-Ahead**: `time: "05:30:00"` → `emhass_dayahead` + `emhass_publish`
2. **MPC**: `time_pattern: minutes: "/5"` → `emhass_mpc` + `emhass_publish`, `mode: single`
3. Bestehende 30-Min Day-Ahead Automation entfernen

## Sensoren-Mapping

| Alt | Neu | Verwendung |
|---|---|---|
| `sensor.p_batt_forecast` | `sensor.dh_p_batt_forecast` | Day-Ahead, Energiemanagement-Dashboard |
| — | `sensor.mpc_p_batt_forecast` | MPC Echtzeit, 1k5-vs-EMHASS Simulation |
| `sensor.soc_batt_forecast` | `sensor.dh_soc_batt_forecast` | Day-Ahead SOC |
| — | `sensor.mpc_soc_batt_forecast` | MPC SOC |

## Zu ändernde Dateien

| Datei | Änderung |
|---|---|
| `config/kamrui-n100/emhass.yaml` | Neuer MPC REST-Command, Day-Ahead mit dh_ Prefix, Automationen |
| `config/kamrui-n100/template_sensors.yaml` | Theo-SOC + Kosten: `p_batt_forecast` → `mpc_p_batt_forecast` |
| `config/kamrui-n100/dashboards/1k5-vs-emhass.yaml` | Charts: `p_batt_forecast` → `mpc_p_batt_forecast`, SOC → `mpc_soc_batt_forecast` |
| `config/kamrui-n100/dashboards/energiemanagement.yaml` | `p_batt_forecast` → `dh_p_batt_forecast`, `soc_batt_forecast` → `dh_soc_batt_forecast` |

## Forecast-Array Aufbereitung

### load_cost_forecast (1k5 Preise → 48 × 5-Min)

1k5 Forecast hat 15-Min-Auflösung. Für 4h = 16 Forecast-Einträge.
Jeder 15-Min-Wert wird 3× wiederholt → 48 Werte.

### pv_power_forecast (Solcast → 48 × 5-Min)

Solcast hat 30-Min-Auflösung. Für 4h = 8 Forecast-Einträge.
Jeder 30-Min-Wert wird 6× wiederholt → 48 Werte.

### load_power_forecast (naiv)

Aktueller `sensor.load_power` als konstanter Wert × 48.

### prod_price_forecast

`input_number.einspeiseverguetung` × 48.
