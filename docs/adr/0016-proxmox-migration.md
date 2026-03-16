# ADR-0016: Migration von HA OS (bare metal) auf Proxmox VE

**Status:** Vorgeschlagen (März 2026)

## Kontext

Auf dem KAMRUI N100 läuft aktuell HA OS direkt auf der Hardware (ADR-0002). Neben Home Assistant sollen künftig weitere Dienste betrieben werden (Pi-hole, Cloudflared als eigenständiger Dienst, Grafana, InfluxDB). Das ist mit HA OS als alleinigem Betriebssystem nicht möglich.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Proxmox VE + HA OS VM** | Volle Add-on-Kompatibilität, Snapshots, weitere VMs/LXCs möglich, Community-Standard | Migrations-Aufwand, ~1-2 GB RAM Overhead |
| HA OS bleiben (Status quo) | Kein Aufwand | Keine zusätzlichen Dienste möglich |
| Docker (HA Container) + andere Container | Flexibel, kein Hypervisor-Overhead | Kein HA Supervisor, keine Add-ons |
| HA Supervised auf Debian | Add-ons + Host-Zugriff | Fragile Abhängigkeiten, nicht offiziell empfohlen |

## Entscheidung

Migration auf **Proxmox VE** mit HA OS als VM und weiteren Diensten als LXC-Container.

## Begründung

- **Proxmox ist Community-Standard** für HA auf Mini-PCs/NUCs — gut dokumentiert, Community Helper Scripts verfügbar
- **HA OS als VM** verhält sich identisch wie bare metal — Supervisor, Add-ons, Backups funktionieren wie gewohnt
- **Snapshots** vor Updates erlauben Rollback in Sekunden
- **LXC-Container** sind extrem leichtgewichtig und isolieren Dienste voneinander
- **16 GB RAM** reichen für das geplante Setup mit ~5-7 GB Verbrauch und ~10 GB Reserve
- **Zukunftssicher** — weitere Dienste können jederzeit hinzugefügt werden

## Ziel-Architektur

```
┌──────────────────────────────────────────────────────┐
│                   Proxmox VE 9.x                     │
│                 KAMRUI N100, 16 GB RAM                │
│                                                      │
│  ┌──────────┐ ┌──────────┐ ┌───────────┐            │
│  │  HA OS   │ │ InfluxDB │ │  Grafana  │            │
│  │   VM     │ │   LXC    │ │   LXC     │            │
│  │  4 GB    │ │  1 GB    │ │  512 MB   │            │
│  └──────────┘ └──────────┘ └───────────┘            │
│                                                      │
│  ┌──────────┐ ┌──────────┐                           │
│  │ Pi-hole  │ │cloudflared│                          │
│  │   LXC    │ │   LXC    │                          │
│  │  512 MB  │ │  256 MB  │                          │
│  └──────────┘ └──────────┘                           │
│                                                      │
│          ~7 GB belegt, ~9 GB frei                    │
└──────────────────────────────────────────────────────┘
```

## Dienste: HA Add-on vs. eigener LXC

| Dienst | Bisher | Neu | Warum |
|---|---|---|---|
| **HA Core** | Bare metal | VM | Volle Add-on-Kompatibilität |
| **EMHASS** | HA Add-on | HA Add-on (bleibt) | Enge HA-Integration, REST-Commands |
| **Mosquitto** | HA Add-on | HA Add-on (bleibt) | Enge MQTT-Integration mit HA |
| **Cloudflared** | HA Add-on | Eigener LXC | Unabhängig von HA, bedient alle Dienste |
| **InfluxDB** | HA Add-on | Eigener LXC | Eigene Ressourcen, besser bei vielen Sensoren |
| **Grafana** | HA Add-on | Eigener LXC | Eigene Subdomain, unabhängig von HA |
| **Pi-hole** | — | Eigener LXC | Neu, DNS-Werbeblocker |

### Faustregel: Was bleibt als HA Add-on?

Dienste mit enger HA-Integration (EMHASS REST-Commands, Mosquitto MQTT-Broker) bleiben als Add-on. Dienste die eigenständig funktionieren oder von mehreren Quellen genutzt werden, wandern in eigene LXCs.

## Konsequenzen

- **Downtime**: ~1-2 Stunden während der Migration (keine Automationen in der Zeit)
- **Backup**: Vollständiges HA-Backup VOR der Migration zwingend erforderlich
- **USB-Passthrough**: USB-Geräte müssen in Proxmox an die HA-VM durchgereicht werden
- **Cloudflare Tunnel**: Muss in neuem LXC neu konfiguriert werden, Routen für alle Dienste anlegen
- **InfluxDB-Daten**: Migration der bestehenden Daten aus dem HA Add-on in den neuen LXC
- **ADR-0002** wird durch diese ADR ersetzt (HA OS bleibt, aber als VM statt bare metal)
