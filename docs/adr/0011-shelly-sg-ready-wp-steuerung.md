# ADR-0011: Shelly Relay für SG-Ready Wärmepumpensteuerung

**Status:** Akzeptiert (März 2026)

## Kontext

Die Novelan LICV 8.2 Wärmepumpe unterstützt SG-Ready (Klemmen für potentialfreie Kontakte). Zwei Relaiskontakte steuern vier Betriebsmodi. Ein Aktor muss diese Kontakte schalten und in HA integrierbar sein.

## SG-Ready Betriebsmodi

| Kontakt 1 | Kontakt 2 | Modus |
|---|---|---|
| AUS | AUS | Normalbetrieb |
| EIN | AUS | Eco / Sperre (kein Heizen) |
| AUS | EIN | Boost (PV-Überschuss / billiger Strom) |
| EIN | EIN | Erzwungener Boost |

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Shelly Plus Relay** | WiFi, MQTT-nativ, ~15 €, kompakt, HA-Integration, OTA-Updates | Abhängig von WiFi |
| ESP32 + Relais-Modul | Maximale Flexibilität, ESPHome | Selbstbau, Löten, Gehäuse, mehr Aufwand |
| Shelly Pro (DIN-Rail) | Hutschiene, professioneller | Teurer (~40 €), hier nicht nötig |
| KNX/Loxone Aktor | Industriestandard | Teuer, eigenes System, Overkill |

## Entscheidung

Shelly Plus Relay (~15 €) für die SG-Ready-Ansteuerung.

## Begründung

- **Günstig und kompakt** — passt direkt an die WP-Platine
- **MQTT-nativ** — kommuniziert direkt mit dem Mosquitto Broker (ADR-0010)
- **HA Auto-Discovery** — wird automatisch erkannt und als Entity verfügbar
- **OTA-Updates** — Firmware-Updates ohne physischen Zugriff
- **Kein Lötaufwand** — im Gegensatz zu ESP32-Eigenbau
- Die WP-Steuerung ist unabhängig vom Heartbeat und kann schon in Phase 1 eingerichtet werden

## Konsequenzen

- WiFi muss am Standort der WP stabil sein
- Shelly muss potentialfrei an die SG-Ready-Klemmen angeschlossen werden
- Voraussetzung: SG-Ready muss bei der Novelan LICV 8.2 freigeschaltet sein (ggf. Heizungsbauer kontaktieren)
- Zwei Shelly-Kanäle (oder ein Dual-Relay) für die zwei SG-Ready-Kontakte nötig
- EMHASS kann die WP als Deferrable Load einbeziehen (Phase 2)
