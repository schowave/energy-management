# MQTT in Home Assistant

> Quelle: https://www.home-assistant.io/docs/mqtt/

## Übersicht

MQTT ist ein leichtgewichtiges Publish/Subscribe-Protokoll für IoT. Die HA MQTT-Integration ermöglicht Gerätekommunikation und Automatisierung.

## Setup

1. **Einstellungen → Geräte & Dienste → Integration hinzufügen → MQTT**
2. Empfohlen: **Mosquitto Broker App** (generiert sichere Credentials automatisch)

## Broker-Konfiguration

| Einstellung | Beschreibung |
|---|---|
| Hostname/IP | Adresse des Brokers |
| Port | Standard: 1883 (unverschlüsselt), 8883 (TLS) |
| Benutzername/Passwort | Optional bei lokalem Setup |
| TLS/Zertifikat | Für verschlüsselte Verbindung |

## MQTT Discovery

Automatische Entity-Erstellung aus MQTT-Nachrichten:

```
<discovery_prefix>/<component>/[<node_id>/]<object_id>/config
```

Standard-Prefix: `homeassistant`. Kompatibel mit ESPHome, Zigbee2MQTT, Tasmota, OpenMQTTGateway.

## Testen

### Nachricht senden
```bash
mosquitto_pub -h 127.0.0.1 -t homeassistant/switch/1/on -m "Switch is ON"
```

### Topics abonnieren
```bash
mosquitto_sub -h 127.0.0.1 -v -t "homeassistant/#"
```

Oder über UI: Einstellungen → Geräte & Dienste → Mosquitto Broker → Konfigurieren → Paket veröffentlichen.

## YAML-Konfiguration

```yaml
mqtt:
  - binary_sensor:
      name: "Bewegung"
      state_topic: "home/motion"
  - sensor:
      name: "Temperatur"
      state_topic: "home/temperature"
      unit_of_measurement: "°C"
```

## Nachrichten per Automation senden

```yaml
action: mqtt.publish
data:
  topic: home/notification
  payload: "Nachricht"
  qos: 2
  retain: true
```

## Debugging

```yaml
logger:
  logs:
    homeassistant.components.mqtt: debug
```
