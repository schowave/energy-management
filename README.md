# Home Assistant – Energiemanagement

Projekt-Dokumentation für den Aufbau eines DIY-Energiemanagementsystems mit Home Assistant.

## Setup

- **PV-Anlage:** ~10 kWp mit Sungrow SH10RT Hybrid-Wechselrichter
- **Batterie:** 12.8 kWh Sungrow SBR
- **Wärmepumpe:** Novelan LICV 8.2 (SG-Ready)
- **HA-Server:** Intel N100 Mini PC mit Home Assistant OS (geplant)
- **NAS:** Synology DS218 (Backups, Fileserver)
- **Aktuell:** 1komma5° Energy Trader + Heartbeat (Evaluation läuft)

## Repo-Struktur

```
docs/
  projektplan.md      Phasenplan: Simulation → Umstieg
  architektur.md      Systemarchitektur (Mermaid-Diagramme)
config/
  synology-test/      HA-Config der bestehenden Test-Installation (Synology)
```

## Status

**Phase 1 – Simulation:** Heartbeat-Entscheidungen tracken und mit EMHASS vergleichen, bevor 1komma5° gekündigt wird. Siehe [docs/projektplan.md](docs/projektplan.md).
