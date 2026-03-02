# ADR-0010: Mosquitto als MQTT Broker

**Status:** Akzeptiert (März 2026)

## Kontext

MQTT wird als Kommunikationsprotokoll zwischen mehreren Komponenten benötigt: GoSungrow Cloud-Bridge, Shelly-Geräte und perspektivisch weitere IoT-Sensoren. Ein MQTT Broker ist dafür die zentrale Vermittlungsinstanz.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Mosquitto** | De-facto-Standard, HA Add-on, minimaler Ressourcenverbrauch, stabil | Keine Web-UI (nur CLI-Config) |
| EMQX | Feature-reich, Web-Dashboard | Overkill für Heimanwendung, höherer Ressourcenverbrauch |
| HiveMQ CE | Enterprise-Features | Zu komplex, Java-basiert |
| Kein MQTT | Weniger Komplexität | GoSungrow-Bridge und Shelly setzen MQTT voraus |

## Entscheidung

Mosquitto MQTT Broker als HA OS Add-on.

## Begründung

- **HA-Standard**: Mosquitto ist das offizielle HA Add-on für MQTT
- **Minimaler Ressourcenverbrauch**: ~10 MB RAM
- **Bewährt**: Millionen HA-Installationen nutzen Mosquitto
- GoSungrow-Cloud-Bridge und Shelly-Geräte kommunizieren nativ über MQTT

## Konsequenzen

- Einmalige Konfiguration (Benutzer, Passwort, ACLs)
- Alle MQTT-Geräte werden über die HA MQTT-Integration automatisch erkannt (Discovery)
- Kein separater Server nötig — läuft als Add-on auf dem KAMRUI N100
