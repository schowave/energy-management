# ADR-0007: mkaiser Sungrow-Modbus-Integration für Phase 2

**Status:** Vorgeschlagen (März 2026)

## Kontext

Nach Kündigung des 1komma5° Heartbeat wird der Modbus-TCP-Port 502 am Sungrow SH10RT frei. HA benötigt dann eine Integration, die sowohl Sensordaten liest als auch Steuerungsbefehle (Lademodus, SOC-Grenzen, Zeitpläne) an den Wechselrichter sendet.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **mkaiser Sungrow-SHx-Modbus** | Speziell für Sungrow SHx, aktive Community, HACS-verfügbar, Steuerungsentities | Custom Integration (kein offizieller HA Core) |
| HA Core Modbus Integration | Offiziell, stabil | Generisch, alle Register manuell konfigurieren, kein Sungrow-spezifisches Mapping |
| SunGather | Python-basiert, gute Doku | Weniger HA-Integration, eher standalone |
| GoSungrow Cloud (weiterhin) | Bereits eingerichtet | Kein Schreibzugriff, Cloud-Abhängigkeit, Latenz |

## Entscheidung

mkaiser Sungrow-SHx-Modbus-Integration (via HACS) für Phase 2.

## Begründung

- **Sungrow-spezifisches Register-Mapping** — alle relevanten Sensoren und Steuerungsentities vorkonfiguriert
- **Aktive Entwicklung und Community** — Bugs werden zeitnah gefixt
- **Steuerungsentities** für Batterie-Lademodus, SOC-Grenzen und Zeitpläne direkt verfügbar
- Template-Sensoren (ADR-0008) ermöglichen nahtlosen Wechsel von GoSungrow → Modbus

## Konsequenzen

- HACS (Home Assistant Community Store) muss installiert werden
- Custom Integration — Updates kommen nicht über den offiziellen HA-Kanal
- Exakte Entity-Namen ergeben sich erst bei Installation (Template-Sensoren dann anpassen)
- Bei Problemen ist die Community der erste Anlaufpunkt (kein offizieller HA-Support)
