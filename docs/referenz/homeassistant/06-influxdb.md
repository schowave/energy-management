# InfluxDB Integration

> Quelle: https://www.home-assistant.io/integrations/influxdb/

## Übersicht

Zeichnet alle Zustandsänderungen in eine externe InfluxDB auf. Unterstützt:
- **InfluxDB 3.x** (v1/v2 Write-API, InfluxQL Queries)
- **InfluxDB 2.x** (Flux Queries)
- **InfluxDB 1.x** (InfluxQL Queries)

Läuft **parallel** zur internen HA-Datenbank, ersetzt diese nicht.

## Setup

### Über UI
Einstellungen → Geräte & Dienste → Integration hinzufügen → InfluxDB

### YAML (erweiterte Optionen)

#### InfluxDB 1.x
```yaml
influxdb:
  host: localhost
  port: 8086
  database: homeassistant
  username: user
  password: pass
  max_retries: 3
```

#### InfluxDB 2.x
```yaml
influxdb:
  api_version: 2
  host: localhost
  port: 8086
  organization: YOUR_ORG_ID
  bucket: homeassistant
  token: YOUR_TOKEN
```

## Entity-Filterung

```yaml
influxdb:
  include:
    domains:
      - sensor
      - binary_sensor
    entity_globs:
      - sensor.pv_*
      - sensor.battery_*
  exclude:
    entities:
      - sensor.unwichtig
    domains:
      - automation
      - persistent_notification
```

Glob-Patterns: `*` (beliebige Zeichen), `?` (ein Zeichen)

## Tags & Attribute

```yaml
influxdb:
  default_measurement: state
  tags:
    instance: prod
    source: hass
  tags_attributes:
    - friendly_name
  ignore_attributes:
    - icon
    - entity_picture
```

## Sensoren aus InfluxDB lesen

### InfluxDB 1.x (InfluxQL)
```yaml
sensor:
  - platform: influxdb
    host: localhost
    queries:
      - name: "Letzte Temperatur"
        measurement: '"°C"'
        where: '"entity_id" = ''sensor.temperatur'''
        group_function: last
        unit_of_measurement: "°C"
```

### InfluxDB 2.x (Flux)
```yaml
sensor:
  - platform: influxdb
    api_version: 2
    token: YOUR_TOKEN
    organization: YOUR_ORG_ID
    queries_flux:
      - name: "Durchschnitt Feuchte"
        query: >
          filter(fn: (r) => r._field == "value" and r.domain == "sensor")
        group_function: mean
        range_start: "-1d"
```

## Daten abfragen

Sensoren mit Einheit → Einheit als Measurement-Name:
```sql
SELECT * FROM "%" WHERE time > now() - 12h AND "entity_id" = 'batterie_soc';
```

Entities ohne Einheit → Entity-ID als Measurement:
```sql
SELECT * FROM "binary_sensor.bewegung" WHERE time > now() - 24h;
```
