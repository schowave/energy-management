# configuration.yaml

> Quelle: https://www.home-assistant.io/docs/configuration/

## Übersicht

Die `configuration.yaml` enthält Integrationen und Einstellungen, die nicht über die UI verwaltet werden können.

## Datei bearbeiten

### Zugriff (HAOS)

- **File Editor App** (empfohlen für Einsteiger)
- **Studio Code Server App** (Syntax-Check, Autocomplete)
- **Samba App** → Datei auf dem PC bearbeiten

### Pfad finden

Einstellungen → System → Reparaturen → 3-Punkt-Menü → Systeminformationen → **Konfigurationsverzeichnis**

Standard: `/config`

## Konfiguration validieren

Validierung erfolgt automatisch bei Reload/Restart. Manuell über CLI: `ha core check`

## Änderungen laden

1. Einstellungen → 3-Punkt-Menü (oben rechts)
2. **Home Assistant neustarten → Schnelles Neuladen**
3. Falls Änderungen nicht greifen: vollständiger Neustart

## Beispiel-Struktur

```yaml
# Grundkonfiguration
homeassistant:
  name: Home
  unit_system: metric

# HTTP-Konfiguration (z.B. für Cloudflare Tunnel)
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24

# Template-Sensoren
template:
  - sensor:
      - name: "Mein Sensor"
        state: "{{ states('sensor.quelle') }}"

# InfluxDB
influxdb:
  host: a]0d7b0f9-influxdb
  port: 8086
  database: homeassistant
```
