# ADR-0002: Home Assistant OS als Betriebssystem

**Status:** Akzeptiert (März 2026)

## Kontext

Home Assistant kann in verschiedenen Installationsvarianten betrieben werden. Die Wahl beeinflusst den Wartungsaufwand, die App-Verfügbarkeit und die Systemstabilität.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **HA OS** | Managed OS, App Store, automatische Updates, Backup/Restore integriert | Kein Zugriff auf das Host-OS, weniger Flexibilität |
| HA Supervised (auf Debian) | Voller Host-Zugriff + App Store | Fragile Abhängigkeiten, manuelles OS-Management, nicht offiziell empfohlen |
| HA Container (Docker) | Volle Kontrolle, flexibel | Kein App Store, jedes App manuell als Container, mehr Wartung |
| HA Core (venv) | Minimaler Overhead | Kein Supervisor, keine Apps, maximaler Aufwand |

## Entscheidung

Home Assistant OS direkt auf den KAMRUI N100 flashen.

## Begründung

- **App Store** ermöglicht Ein-Klick-Installation von EMHASS, Mosquitto, InfluxDB, Grafana
- **Integriertes Backup/Restore** auf Synology (SMB) — wichtig für ein System, das die Hausenergiesteuerung übernimmt
- **Automatische Updates** reduzieren Wartungsaufwand
- Kein Bedarf an Host-Level-Zugriff — alle benötigten Dienste sind als Apps verfügbar
- Dedicated Hardware (N100) macht den Overhead eines geteilten OS unnötig

## Konsequenzen

- Kein direkter SSH-Zugriff auf das Host-OS (nur über HA Terminal App)
- Alle Dienste laufen als HA Apps, nicht als eigenständige Docker-Container
- Updates werden zentral über den HA Supervisor verwaltet
- Bei Problemen: Restore aus Backup statt manuellem Debugging
