# Home Assistant – Energiemanagement

Projekt-Dokumentation für den Aufbau eines DIY-Energiemanagementsystems mit Home Assistant.

## Setup

- **PV-Anlage:** ~10 kWp mit Sungrow SH10RT Hybrid-Wechselrichter
- **Batterie:** 12.8 kWh Sungrow SBR
- **Wärmepumpe:** Novelan LICV 8.2 (SG-Ready)
- **HA-Server:** KAMRUI N100 Mini PC mit Home Assistant OS 17.1
- **Remote-Zugriff:** https://ha.schowalter.co (Cloudflare Tunnel)
- **NAS:** Synology DS218+ (Backups, Fileserver)
- **Aktuell:** 1komma5° Energy Trader + Heartbeat (Evaluation läuft)

## Dokumentation

- **[docs/setup-playbook.md](docs/setup-playbook.md)** – Schritt-für-Schritt Einrichtungsanleitung
- **[docs/projektplan.md](docs/projektplan.md)** – Phasenplan: Simulation → Umstieg
- **[docs/architektur.md](docs/architektur.md)** – Systemarchitektur (Mermaid-Diagramme)
- **[docs/adr/](docs/adr/)** – Architecture Decision Records (Technologieentscheidungen)
- **[docs/referenz/](docs/referenz/)** – Referenzdokumentation (HA, HACS, Integrationen)

## Repo-Struktur

```
docs/                 Projektdokumentation
docs/referenz/        Referenzdokumentation (HA, HACS, Integrationen)
config/
  kamrui-n100/        HA-Config für KAMRUI N100 (Produktion)
  synology-test/      HA-Config der bestehenden Test-Installation (Synology)
```
