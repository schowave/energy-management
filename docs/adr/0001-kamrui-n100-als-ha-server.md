# ADR-0001: KAMRUI N100 als Home-Assistant-Server

**Status:** Akzeptiert (März 2026)

## Kontext

Für den Betrieb von Home Assistant OS mit EMHASS (HiGHS LP-Solver), InfluxDB, Grafana und weiteren Add-ons wird ein dauerhaft laufender Server benötigt. Der Stromverbrauch muss minimal sein, da der Server 24/7 läuft.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **KAMRUI N100** | x86_64 (HiGHS nativ), 16 GB RAM, 512 GB SSD, ~8W idle | 180 € Anschaffung |
| Raspberry Pi 4/5 | Günstig (~80 €), ~5W | ARM (HiGHS-Kompatibilität fraglich), max 8 GB RAM, SD-Karte unzuverlässig |
| Synology DS218+ (vorhanden) | Keine Zusatzkosten | ARM (Realtek RTD1296), nur 2 GB RAM, Docker-only, HiGHS nicht lauffähig |
| Intel NUC | Bewährt, x86_64 | Teurer (~300 €+), höherer Verbrauch (~15W) |

## Entscheidung

KAMRUI N100 Mini-PC (Intel N100, 16 GB RAM, 512 GB SSD) für 179,99 €.

## Begründung

- **x86_64-Architektur** ist Voraussetzung für den HiGHS-Solver in EMHASS (LP-Optimierung)
- **16 GB RAM** bietet Headroom für alle Add-ons (HA + EMHASS + InfluxDB + Grafana + Mosquitto)
- **~8W idle** (~21 €/Jahr Strom) macht den 24/7-Betrieb wirtschaftlich
- **512 GB SSD** reicht für InfluxDB-Langzeitdaten (Jahre an Sensordaten)
- Die Synology DS218+ bleibt als NAS/Backup-Ziel erhalten

## Konsequenzen

- Einmalige Investition von 179,99 € (amortisiert sich in ~7 Monaten durch Fixkosten-Ersparnis)
- Home Assistant OS kann direkt auf die SSD geflasht werden (kein separates OS nötig)
- Alle EMHASS-Solver laufen nativ ohne Emulation
- Synology DS218+ wird zum reinen Backup-Ziel degradiert
