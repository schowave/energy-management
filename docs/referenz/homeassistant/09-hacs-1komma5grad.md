# hacs_1komma5grad – 1KOMMA5GRAD Heartbeat Integration

> Quelle: https://github.com/BirknerAlex/hacs_1komma5grad

## Übersicht

Community-HACS-Integration für 1KOMMA5GRAD Heartbeat-Systeme. **Nicht offiziell** von 1KOMMA5GRAD supportet.

## Voraussetzungen

- Neue Heartbeat API: Login auf `app.1komma5grad.com` muss funktionieren
- Falls nur `my.1komma5.io` geht → Legacy-Integration (derlangemarkus) verwenden

## Unterstützte Regionen (Dez 2025)

Österreich, Deutschland, Niederlande, Schweden, Schweiz

## Installation

1. HACS öffnen → Repository hinzufügen
2. "1KOMMA5GRAD" suchen und installieren
3. HA neustarten
4. Einstellungen → Geräte & Dienste → 1KOMMA5GRAD hinzufügen

## Entities pro System

### Power-Sensoren (W)
- Electricity Price (inkl. Forecast-Attribute)
- Grid Feed In/Out Power
- Grid Feed Power (netto)
- Consumption Power
- Solar Production Power
- EV Chargers Aggregated Power
- Heat Pumps Aggregated Power
- Battery State of Charge (%)
- Battery In/Out Power

### Energy-Sensoren (kWh)
Entsprechende kWh-Werte für das HA Energy Dashboard.

### Switches
- **Heartbeat Automatic Mode**: EMS ein/ausschalten

### Select-Entities
- **EV Charging Mode**: SMART_CHARGE, SOLAR_CHARGE, QUICK_CHARGE

### Number-Entities
- **EV Current State of Charge**: Batterie-Level manuell setzen (0-100%)

## Strompreis-Forecast

Der Preis-Sensor enthält Attribute:

| Attribut | Beschreibung |
|---|---|
| `forecast` | Stündliche Preise als datetime/price-Objekte |
| `price_today_min/max/avg` | Tagesstatistiken |
| `cheapest_upcoming_hour` | ISO-Datetime der günstigsten Stunde |
| `cheapest_upcoming_price` | Preis der günstigsten Stunde |
| `forecast_hours_available` | Verfügbare Forecast-Stunden |

Preise für heute immer verfügbar. Nächster Tag ab ~14:00 CET.

## Template-Beispiele

```jinja2
{# Aktueller Preis #}
{{ states('sensor.electricity_price_SYSTEM_ID') }}

{# Forecast #}
{{ state_attr('sensor.electricity_price_SYSTEM_ID', 'forecast') }}

{# Günstigste Stunde #}
{{ state_attr('sensor.electricity_price_SYSTEM_ID', 'cheapest_upcoming_hour') }}
```

## Getestet mit

- Chint DTSU666 Stromzähler
- Mennekes Amtron Compact 2.0S Wallbox
- Wärmepumpen: kein Hardware-Test vorhanden
