# Home Assistant – Energiemanagement

Projekt-Dokumentation für den Aufbau eines DIY-Energiemanagementsystems mit Home Assistant.

## Setup

- **PV-Anlage:** ~10 kWp mit Sungrow SH10RT Hybrid-Wechselrichter
- **Batterie:** 12.8 kWh Sungrow SBR
- **Wärmepumpe:** Novelan LICV 8.2 (SG-Ready)
- **HA-Server:** KAMRUI N100 Mini PC mit Home Assistant OS (bestellt)
- **NAS:** Synology DS218+ (Backups, Fileserver)
- **Aktuell:** 1komma5° Energy Trader + Heartbeat (Evaluation läuft)

## Dokumentation

- **[docs/projektplan.md](docs/projektplan.md)** – Phasenplan: Simulation → Umstieg
- **[docs/architektur.md](docs/architektur.md)** – Systemarchitektur (Mermaid-Diagramme)
- **[docs/adr/](docs/adr/)** – Architecture Decision Records (Technologieentscheidungen)

## Repo-Struktur

```
docs/                 Projektdokumentation
config/
  synology-test/      HA-Config der bestehenden Test-Installation (Synology)
```
