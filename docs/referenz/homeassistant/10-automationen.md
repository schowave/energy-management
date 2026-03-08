# Automationen

> Quelle: https://www.home-assistant.io/docs/automation/

## Übersicht

Automationen reagieren automatisch auf Ereignisse im und rund ums Haus.

## Aufbau

Jede Automation besteht aus:

1. **Trigger** – Was löst die Automation aus?
2. **Conditions** (optional) – Welche Bedingungen müssen erfüllt sein?
3. **Actions** – Was soll passieren?

## Einstieg

### Blueprints (vorgefertigte Automationen)
Einstellungen → Automationen & Szenen → Blueprints → Community-Blueprints

### Eigene Automationen
Einstellungen → Automationen & Szenen → Automation erstellen

## YAML-Beispiel

```yaml
automation:
  - alias: "Licht bei Sonnenuntergang einschalten"
    triggers:
      - trigger: sun
        event: sunset
        offset: "-00:30:00"
    conditions:
      - condition: state
        entity_id: binary_sensor.jemand_zuhause
        state: "on"
    actions:
      - action: light.turn_on
        target:
          entity_id: light.wohnzimmer
        data:
          brightness_pct: 80
```

## Häufige Trigger-Typen

| Trigger | Beschreibung |
|---|---|
| `state` | Entity ändert Zustand |
| `numeric_state` | Wert über/unter Schwelle |
| `time` | Bestimmte Uhrzeit |
| `time_pattern` | Wiederkehrendes Muster |
| `sun` | Sonnenauf-/untergang |
| `mqtt` | MQTT-Nachricht empfangen |
| `template` | Template wird wahr |

## Run Modes

| Modus | Verhalten bei erneutem Trigger |
|---|---|
| `single` | Ignoriert (Standard) |
| `restart` | Startet neu |
| `queued` | Reiht ein |
| `parallel` | Läuft parallel |

## Troubleshooting

- Entwicklerwerkzeuge → Zustände → Entity-Werte prüfen
- Einstellungen → Automationen → Automation → Trace ansehen
- Logger: `homeassistant.components.automation: debug`
