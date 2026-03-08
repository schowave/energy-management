# Energy Dashboard

> Quelle: https://www.home-assistant.io/docs/energy/

## Übersicht

Das Energy Dashboard in Home Assistant ermöglicht Monitoring von Verbrauch, Solarproduktion und Kosten.

## Unterstützte Energiequellen

1. **Stromnetz** – Import/Export
2. **Solaranlage** – Erzeugung
3. **Hausbatterie** – Laden/Entladen
4. **Gas** – Verbrauch
5. **Wasser** – Verbrauch
6. **Einzelgeräte** – Geräte-Level Monitoring

> Man kann das Dashboard auch mit nur einer Quelle nutzen.

## Sensor-Anforderungen

| Typ | Einheit | Beschreibung |
|---|---|---|
| **Energy-Sensor** | kWh | Kumulativer Verbrauch (`state_class: total_increasing`) |
| **Power-Sensor** | W / kW | Momentanleistung (`state_class: measurement`) |

> Wenn nur Power-Sensoren (W) vorhanden: Die **Riemann Sum Integral**-Integration erstellt daraus einen kWh-Sensor.

## Einrichtung

Einstellungen → Dashboards → Energie

### Stromnetz
- **Verbrauch (Grid Import)**: kWh-Sensor für Netzbezug
- **Einspeisung (Grid Export)**: kWh-Sensor für Einspeisung
- **Kosten**: Fester Preis oder dynamischer Preis-Sensor (z.B. Tibber, ENTSO-e)

### Solaranlage
- **Produktion**: kWh-Sensor für PV-Erzeugung

### Hausbatterie
- **Laden (Battery In)**: kWh-Sensor
- **Entladen (Battery Out)**: kWh-Sensor

### Einzelgeräte
- Beliebige kWh-Sensoren für individuelle Geräte (z.B. Shelly, Tasmota)

## Relevanz für dieses Projekt

Die **hacs_1komma5grad**-Integration liefert fertige Energy-Sensoren (kWh) für:
- Grid Import/Export
- Solar Production
- Battery In/Out
- Heat Pump (falls erfasst)

Diese sind direkt im Energy Dashboard nutzbar.
