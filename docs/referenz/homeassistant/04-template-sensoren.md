# Template-Sensoren

> Quelle: https://www.home-assistant.io/integrations/template/

## Übersicht

Template-Sensoren leiten ihre Werte von anderen Daten ab. Unterstützt: Sensor, Binary Sensor, Switch, Light, Cover, und viele mehr.

## Zustandsbasierte Templates

Aktualisieren sich automatisch bei Änderung der Quell-Daten:

```yaml
template:
  - sensor:
      - name: "Durchschnittstemperatur"
        unit_of_measurement: "°C"
        state: >
          {% set value1 = states('sensor.temp1') | float %}
          {% set value2 = states('sensor.temp2') | float %}
          {{ ((value1 + value2) / 2) | round(1) }}
```

## Trigger-basierte Templates

Aktualisieren nur bei bestimmten Triggern:

```yaml
template:
  - triggers:
      - trigger: time_pattern
        hours: 0
        minutes: 0
    sensor:
      - name: "Tageswert"
        state: "{{ berechneter_wert }}"
```

## Wichtige Optionen

| Option | Beschreibung |
|---|---|
| `availability` | Steuert Verfügbarkeit per Template |
| `icon` | Dynamisches Icon |
| `name` | Anzeigename |
| `unique_id` | Persistente Entity-ID |
| `unit_of_measurement` | Einheit (z.B. kWh, W, °C) |
| `state_class` | `measurement`, `total`, `total_increasing` |

## Beispiele

### Abgeleiteter Wert
```yaml
template:
  - sensor:
      - name: "Netto-Batterieleistung"
        unit_of_measurement: "W"
        state: >
          {{ states('sensor.battery_charge') | float - states('sensor.battery_discharge') | float }}
```

### Bedingter Status
```yaml
template:
  - sensor:
      - name: "Gerätestatus"
        state: >
          {% if is_state('switch.geraet', 'off') %}
            offline
          {% elif state_attr('switch.geraet', 'power') | float < 1 %}
            standby
          {% else %}
            aktiv
          {% endif %}
```

### Binary Sensor
```yaml
template:
  - binary_sensor:
      - name: "Jemand Zuhause"
        state: >
          {{ is_state('device_tracker.person1', 'home') or
             is_state('device_tracker.person2', 'home') }}
```

### Eigene Attribute
```yaml
template:
  - sensor:
      - name: "Standort"
        state: "{{ states('device_tracker.handy') }}"
        attributes:
          latitude: "{{ state_attr('device_tracker.handy', 'latitude') }}"
          longitude: "{{ state_attr('device_tracker.handy', 'longitude') }}"
```

### Verfügbarkeit steuern
```yaml
availability: "{{ states('sensor.quelle') not in ['unknown', 'unavailable'] }}"
```
