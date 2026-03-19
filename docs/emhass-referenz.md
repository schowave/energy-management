# EMHASS Referenz

> Basierend auf der offiziellen Dokumentation: https://emhass.readthedocs.io/en/latest/
> Stand: 2026-03-19

## Inhaltsverzeichnis

- [Überblick](#überblick)
- [Konfiguration](#konfiguration)
- [Optimierungsmethoden](#optimierungsmethoden)
- [REST API Endpoints](#rest-api-endpoints)
- [Runtime-Parameter](#runtime-parameter)
- [Veröffentlichte Sensoren](#veröffentlichte-sensoren)
- [Home Assistant Integration](#home-assistant-integration)
- [Batterie-Optimierung](#batterie-optimierung)
- [Deferrable Loads](#deferrable-loads)
- [Thermisches Modell](#thermisches-modell)
- [ML Forecaster](#ml-forecaster)
- [Regressor-Modell](#regressor-modell)

---

## Überblick

EMHASS (Energy Management for Home Assistant Systems) ist ein Optimierungstool, das PV-Erzeugung, Batteriespeicher, verschiebbare Lasten und Strompreise nutzt, um den Eigenverbrauch zu maximieren bzw. die Kosten zu minimieren.

**Drei Optimierungsmethoden:**
1. **Day-Ahead** — plant den ganzen nächsten Tag in einem Durchlauf
2. **Naive MPC** — Model Predictive Control, läuft häufiger mit kürzerem Horizont
3. **Perfect** — nutzt historische Daten für Backtesting

---

## Konfiguration

### Zentrale Parameter (config.json)

```json
{
  "method_ts_round": "first",
  "continual_publish": true,
  "weather_forecast_method": "solcast"
}
```

| Parameter | Beschreibung |
|---|---|
| `method_ts_round` | Zeitstempel-Rundung: `"first"` oder `"nearest"` |
| `continual_publish` | `true` = automatische Sensor-Veröffentlichung in Schleife. `false` = manuell via `publish-data` |
| `weather_forecast_method` | PV-Prognosemethode: `"solcast"`, `"scrapper"`, `"list"` |

### Stromtarif-Konfiguration (Peak/Off-Peak)

```yaml
load_peak_hour_periods:
  - period_hp_1:
      - start: '02:54'
      - end: '15:24'
  - period_hp_2:
      - start: '17:24'
      - end: '20:24'
load_peak_hours_cost: 0.1907
load_offpeak_hours_cost: 0.1419
```

### ML Forecaster Defaults

```json
{
  "historic_days_to_retrieve": 9,
  "model_type": "long_train_data",
  "var_model": "sensor.power_load_no_var_loads",
  "sklearn_model": "KNeighborsRegressor",
  "num_lags": 48,
  "split_date_delta": "48h",
  "perform_backtest": false
}
```

---

## Optimierungsmethoden

### Day-Ahead (`dayahead-optim`)

Plant den gesamten nächsten Tag. Typisch 1x täglich (z.B. 05:30).

```bash
# Minimal
curl -i -H 'Content-Type:application/json' -X POST -d '{}' \
  http://localhost:5000/action/dayahead-optim

# Mit eigenem PV-Forecast (Array mit 48 Halbstundenwerten)
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "pv_power_forecast": [0, 0, 0, 0, 0, 0, 70, 141, 246, 513, ...]
}' http://localhost:5000/action/dayahead-optim

# Mit Publish-Prefix (für parallele DA + MPC Nutzung)
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "publish_prefix": "dh_"
}' http://localhost:5000/action/dayahead-optim
```

### Naive MPC (`naive-mpc-optim`)

Model Predictive Control — läuft häufiger (z.B. alle 5 Min), kürzerer Horizont, reagiert auf aktuelle Bedingungen.

```bash
# Mit SOC-Vorgabe
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "pv_power_forecast": [0, 70, 141, 246, 513, 753, 1049, 1797, 1697, 3078],
  "prediction_horizon": 10,
  "soc_init": 0.5,
  "soc_final": 0.6
}' http://localhost:5000/action/naive-mpc-optim

# Mit Deferrable Loads und Zeitfenstern
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "prediction_horizon": 30,
  "operating_hours_of_each_deferrable_load": [4, 2],
  "start_timesteps_of_each_deferrable_load": [4, 0],
  "end_timesteps_of_each_deferrable_load": [27, 23]
}' http://localhost:5000/action/naive-mpc-optim

# Mit eigenem Zeitschritt und Prefix
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "continual_publish": false,
  "optimization_time_step": 5,
  "publish_prefix": "mpc_"
}' http://localhost:5000/action/naive-mpc-optim
```

### Perfect (`perfect-optim`)

Nutzt tatsächliche (historische) Daten — für Backtesting und Benchmarking.

```bash
curl -i -H 'Content-Type:application/json' -X POST -d '{}' \
  http://localhost:5000/action/perfect-optim
```

### Gemischte Strategie (DA + MPC parallel)

```bash
# Dayahead (im continual_publish Loop)
curl ... -d '{"publish_prefix":"dh_"}' .../action/dayahead-optim

# MPC (separater Prefix, manuelles Publish)
curl ... -d '{"optimization_time_step":5,"publish_prefix":"mpc_"}' .../action/naive-mpc-optim
```

---

## REST API Endpoints

Alle Endpoints: `POST http://localhost:5000/action/<action>` mit `Content-Type: application/json`.

| Endpoint | Beschreibung |
|---|---|
| `/action/dayahead-optim` | Day-Ahead Optimierung |
| `/action/naive-mpc-optim` | Naive MPC Optimierung |
| `/action/perfect-optim` | Perfect (historische) Optimierung |
| `/action/publish-data` | Optimierungsergebnisse als HA-Sensoren veröffentlichen |
| `/action/forecast-model-fit` | ML-Lastprognose-Modell trainieren |
| `/action/forecast-model-predict` | ML-Lastprognose ausführen |
| `/action/forecast-model-tune` | ML-Modell tunen |
| `/action/regressor-model-fit` | Regressionsmodell trainieren |
| `/action/regressor-model-predict` | Regressionsmodell-Vorhersage |

> **Hinweis (HA OS):** Im Docker-Netzwerk von HA OS muss der Add-on-Hostname statt `localhost` verwendet werden: `http://5b918bf2-emhass:5000/action/...`

---

## Runtime-Parameter

Diese Parameter werden im POST-Body an die Optimierungs-Endpoints übergeben:

| Parameter | Typ | Beschreibung |
|---|---|---|
| `pv_power_forecast` | `float[]` | PV-Leistung in W pro Zeitschritt |
| `load_power_forecast` | `float[]` | Lastprognose in W pro Zeitschritt |
| `load_cost_forecast` | `float[]` | Stromkosten in €/kWh pro Zeitschritt |
| `prod_price_forecast` | `float[]` | Einspeisevergütung in €/kWh pro Zeitschritt |
| `prediction_horizon` | `int` | Anzahl Zeitschritte für Optimierung |
| `optimization_time_step` | `int` | Zeitschritt in Minuten (Standard: 30) |
| `soc_init` | `float` | Anfangs-SOC der Batterie (0.0–1.0) |
| `soc_final` | `float` | Gewünschter End-SOC (0.0–1.0) |
| `operating_hours_of_each_deferrable_load` | `int[]` | Betriebsstunden pro Last |
| `start_timesteps_of_each_deferrable_load` | `int[]` | Frühester Zeitschritt pro Last |
| `end_timesteps_of_each_deferrable_load` | `int[]` | Spätester Zeitschritt pro Last |
| `publish_prefix` | `string` | Prefix für Sensor-Namen (z.B. `"dh_"`, `"mpc_"`) |
| `continual_publish` | `bool` | Überschreibt globale continual_publish-Einstellung |
| `def_load_config` | `object[]` | Deferrable-Load-Konfiguration (inkl. Thermal) |
| `outdoor_temperature_forecast` | `float[]` | Außentemperaturen für Thermalmodell |

---

## Veröffentlichte Sensoren

Nach `publish-data` (oder via `continual_publish`) erstellt EMHASS diese HA-Sensoren:

| Sensor | Beschreibung |
|---|---|
| `sensor.p_pv_forecast` | PV-Leistungsprognose |
| `sensor.p_load_forecast` | Lastprognose |
| `sensor.p_batt_forecast` | Batterie-Fahrplan (positiv = Laden, negativ = Entladen) |
| `sensor.p_grid_forecast` | Netz-Fahrplan |
| `sensor.p_deferrable0` | Verschiebbare Last 0 — Fahrplan |
| `sensor.p_deferrable1` | Verschiebbare Last 1 — Fahrplan |
| `sensor.soc_batt_forecast` | Batterie-SOC-Prognose |
| `sensor.total_cost_profit` | Gesamtkosten/-gewinn |
| `sensor.unit_load_cost` | Stromkosten pro kWh |
| `sensor.unit_prod_price` | Einspeisepreis pro kWh |
| `sensor.optim_status` | Optimierungsstatus |

Mit `publish_prefix` werden Sensoren geprefixed, z.B. `sensor.dh_p_batt_forecast`, `sensor.mpc_p_batt_forecast`.

### Custom Sensor-IDs

```bash
curl ... -d '{
  "custom_deferrable_forecast_id": [
    {"entity_id": "sensor.p_deferrable0", "unit_of_measurement": "W", "friendly_name": "WP Heizstab"},
    {"entity_id": "sensor.p_deferrable1", "unit_of_measurement": "W", "friendly_name": "Warmwasser Boost"}
  ]
}' http://localhost:5000/action/publish-data
```

---

## Home Assistant Integration

### Shell Commands

```yaml
shell_command:
  dayahead_optim: >-
    curl -i -H "Content-Type: application/json" -X POST -d '{
      "operating_hours_of_each_deferrable_load": {{states("sensor.list_operating_hours_of_each_deferrable_load")}}
    }' http://5b918bf2-emhass:5000/action/dayahead-optim
  publish_data: >-
    curl -i -H "Content-Type: application/json" -X POST -d '{}'
    http://5b918bf2-emhass:5000/action/publish-data
```

### REST Commands (Alternative)

```yaml
rest_command:
  emhass_forecast:
    url: http://5b918bf2-emhass:5000/action/naive-mpc-optim
    method: post
    timeout: 300
    headers:
      content-type: application/json
    payload: >
      {"prediction_horizon": 24, "soc_init": {{states("sensor.battery_level") | float / 100}}}
```

### Automations

```yaml
# Day-Ahead 1x täglich
- alias: EMHASS Day-Ahead
  trigger:
    platform: time
    at: '05:30:00'
  action:
    - service: shell_command.dayahead_optim

# Publish alle 5 Minuten (wenn continual_publish = false)
- alias: EMHASS Publish
  trigger:
    platform: time_pattern
    minutes: /5
  action:
    - service: shell_command.publish_data

# Deferrable Load steuern
- alias: WP Heizstab nach EMHASS
  trigger:
    platform: time_pattern
    minutes: /5
  condition:
    - condition: numeric_state
      entity_id: sensor.p_deferrable0
      above: 0.1
  action:
    - service: homeassistant.turn_on
      entity_id: switch.water_heater_switch
```

### Dynamische Betriebsstunden per Template-Sensor

```yaml
- platform: template
  sensors:
    list_operating_hours_of_each_deferrable_load:
      value_template: >-
        {% set temp = states("sensor.outdoor_temperature_mean") | float %}
        {% if temp < 10 %}{{ [5, 0] }}
        {% elif temp < 15 %}{{ [4, 0] }}
        {% elif temp < 20 %}{{ [4, 6] }}
        {% elif temp < 25 %}{{ [3, 9] }}
        {% else %}{{ [3, 12] }}{% endif %}
```

---

## Batterie-Optimierung

### Steuerung über Runtime-Parameter

| Parameter | Beschreibung |
|---|---|
| `soc_init` | Aktueller SOC (0.0–1.0), typisch aus `sensor.battery_level` |
| `soc_final` | Gewünschter End-SOC (0.0–1.0) |

**Ergebnis-Sensoren:**
- `sensor.p_batt_forecast` — Batterie-Fahrplan (positiv = Laden, negativ = Entladen)
- `sensor.soc_batt_forecast` — SOC-Verlaufsprognose

### Beispiel: MPC mit dynamischen Strompreisen + SOC

```yaml
shell_command:
  mpc_optim: >-
    curl -i -H "Content-Type: application/json" -X POST -d '{
      "load_cost_forecast": {{
        ([states("sensor.current_electricity_market_price") | float(0)] +
         state_attr("sensor.current_electricity_market_price", "prices") | map(attribute="price") | list)[:48]
      }},
      "prod_price_forecast": {{
        ([states("sensor.current_electricity_market_price") | float(0) * 0.8] +
         state_attr("sensor.current_electricity_market_price", "prices") | map(attribute="price") | map("multiply", 0.8) | list)[:48]
      }},
      "pv_power_forecast": {{ states("sensor.solcast_24hrs_forecast") }},
      "prediction_horizon": 48,
      "soc_init": {{ states("sensor.battery_level") | float(0) / 100 }},
      "soc_final": 0.05
    }' http://5b918bf2-emhass:5000/action/naive-mpc-optim
```

---

## Deferrable Loads

Verschiebbare Lasten, deren Betriebszeit optimiert wird (z.B. Wärmepumpe, Warmwasser-Boost, Waschmaschine).

### Parameter

| Parameter | Beschreibung |
|---|---|
| `operating_hours_of_each_deferrable_load` | Wie viele Stunden muss jede Last laufen? z.B. `[4, 2]` |
| `start_timesteps_of_each_deferrable_load` | Frühester erlaubter Zeitschritt pro Last, z.B. `[4, 0]` |
| `end_timesteps_of_each_deferrable_load` | Spätester erlaubter Zeitschritt pro Last, z.B. `[27, 23]` |

### Beispiel: 2 Lasten mit Zeitfenstern

```bash
curl -i -H 'Content-Type:application/json' -X POST -d '{
  "prediction_horizon": 30,
  "operating_hours_of_each_deferrable_load": [4, 2],
  "start_timesteps_of_each_deferrable_load": [4, 0],
  "end_timesteps_of_each_deferrable_load": [27, 23]
}' http://5b918bf2-emhass:5000/action/naive-mpc-optim
```

---

## Thermisches Modell

Ermöglicht die Optimierung von Heiz-/Kühllasten basierend auf thermischer Dynamik (Gebäudeträgheit, Außentemperatur).

### Parameter (via `def_load_config`)

```json
{
  "def_load_config": [
    {"thermal_config": {
      "heating_rate": 5.0,
      "cooling_constant": 0.1,
      "overshoot_temperature": 24.0,
      "start_temperature": 20.0,
      "desired_temperatures": [21.0, 21.0, 15.0, ...]
    }}
  ]
}
```

| Parameter | Beschreibung |
|---|---|
| `heating_rate` | Grad pro Stunde bei aktiver Heizung |
| `cooling_constant` | Abkühlrate (Wärmeverlust-Konstante) |
| `overshoot_temperature` | Maximal erlaubte Temperatur |
| `start_temperature` | Aktuelle Raumtemperatur |
| `desired_temperatures` | Zieltemperatur pro Zeitschritt |

**Zusätzlich benötigt:** `outdoor_temperature_forecast` als Array von Außentemperaturen.

### Beispiel: REST Command mit Thermalmodell

```yaml
rest_command:
  emhass_thermal:
    url: http://5b918bf2-emhass:5000/action/naive-mpc-optim
    method: post
    timeout: 300
    headers:
      content-type: application/json
    payload: >
      {% macro time_to_timestep(time) -%}
        {{ (((today_at(time) - now()) / timedelta(minutes=30)) | round(0, 'ceiling')) % 48 }}
      {%- endmacro %}
      {%- set horizon = 24 -%}
      {%- set heated_intervals = [
        [time_to_timestep("06:30") | int, time_to_timestep("07:30") | int],
        [time_to_timestep("17:30") | int, time_to_timestep("23:00") | int]
      ] -%}
      {
        "prediction_horizon": {{ horizon }},
        "load_cost_forecast": {{ (state_attr('sensor.electricity_price_forecast', 'forecasts')
            | map(attribute='currency_per_kWh') | list)[:horizon] | tojson }},
        "def_load_config": [
          {"thermal_config": {
            "heating_rate": 5.0,
            "cooling_constant": 0.1,
            "overshoot_temperature": {{ (states('sensor.raumtemperatur') | float) + 3.0 }},
            "start_temperature": {{ states('sensor.raumtemperatur') }},
            "desired_temperatures": [
              {%- for i in range(horizon) -%}
                {%- set ts = i -%}
                {% for interval in heated_intervals if ts >= interval[0] and ts <= interval[1] %}21.0
                {%- else -%}15.0{%- endfor %}
                {%- if not loop.last %}, {% endif -%}
              {%- endfor %}
            ]
          }}
        ],
        "outdoor_temperature_forecast": {{ (state_attr("sensor.weather_hourly", "forecast")
            | map(attribute="temperature") | list)[:horizon] | tojson }}
      }
```

---

## ML Forecaster

Trainiert ein Machine-Learning-Modell auf historischen Lastdaten, um zukünftigen Verbrauch vorherzusagen.

### Konfiguration

```json
{
  "historic_days_to_retrieve": 9,
  "model_type": "long_train_data",
  "var_model": "sensor.power_load_no_var_loads",
  "sklearn_model": "KNeighborsRegressor",
  "num_lags": 48,
  "split_date_delta": "48h",
  "perform_backtest": false
}
```

### Workflow

1. **Fit**: `POST /action/forecast-model-fit` — Modell mit historischen Daten trainieren
2. **Predict**: `POST /action/forecast-model-predict` — Vorhersage erstellen
3. **Tune**: `POST /action/forecast-model-tune` — Hyperparameter optimieren

---

## Regressor-Modell

Trainiert ein Regressionsmodell auf eigenen CSV-Daten (z.B. Heizstunden vs. Gradtage).

### Fit

```bash
curl -i -H "Content-Type:application/json" -X POST -d '{
  "csv_file": "heating_prediction.csv",
  "features": ["degreeday", "solar"],
  "target": "hour",
  "regression_model": "RandomForestRegression",
  "model_type": "heating_hours_degreeday",
  "timestamp": "timestamp",
  "date_features": ["month", "day_of_week"],
  "new_values": [12.79, 4.766, 1, 2]
}' http://5b918bf2-emhass:5000/action/regressor-model-fit
```

### Predict

```bash
curl -i -H "Content-Type:application/json" -X POST -d '{
  "mlr_predict_entity_id": "sensor.mlr_predict",
  "mlr_predict_unit_of_measurement": "h",
  "mlr_predict_friendly_name": "Heizstunden Prognose",
  "new_values": [8.2, 7.23, 2, 6],
  "model_type": "heating_hours_degreeday"
}' http://5b918bf2-emhass:5000/action/regressor-model-predict
```
