# ADR-0006: Inverterdaten für Phase 1

**Status:** Superseded (März 2026) — ursprüngliche Entscheidung (GoSungrow Cloud-API) revidiert

## Kontext

In Phase 1 (Simulation) steuert der 1komma5° Heartbeat den Sungrow SH10RT. Home Assistant benötigt Zugriff auf Inverterdaten (PV, Batterie, Grid, Load) für Monitoring und EMHASS-Simulation.

## Ursprüngliche Annahme (widerlegt)

> Sungrow erlaubt nur eine aktive Modbus-TCP-Verbindung, daher kann HA nicht gleichzeitig per Modbus zugreifen.

**Tatsächlich:** Das Setup enthält zwei Modbus-TCP-Endpunkte:
- `192.168.1.191` — **WiNet-S2** (Sungrow Kommunikationsmodul). Verbindung instabil, bricht nach ~20s ab.
- `192.168.1.134` — **gridBox** (1komma5° Heartbeat). Modbus-TCP parallel nutzbar, stabile Verbindung.

Die gridBox fungiert als Modbus-Gateway und erlaubt parallelen Lesezugriff durch HA.

## Betrachtete Alternativen

| Option | Pro | Contra | Ergebnis |
|---|---|---|---|
| **GoSungrow Cloud-API** | Kein Modbus-Konflikt | AppKey-Problem seit Nov 2023, Projekt tot | ❌ Nicht nutzbar |
| **Sungrow Open API** (offiziell) | Offizielle API | Nur Plant-Level, kein Battery SOC, 2-3 Tage Wartezeit | ❌ Unzureichend |
| **Modbus via WiNet-S2** | Direkte lokale Daten | Verbindung bricht nach ~20s ab | ❌ Instabil |
| **Modbus via gridBox** | Lokale Echtzeit-Daten, alle Sensoren, parallel zum Heartbeat | Muss beobachtet werden ob Heartbeat-Steuerung stabil bleibt | ✅ Gewählt |

## Entscheidung

**mkaiser Sungrow Modbus-Integration** via gridBox (`192.168.1.134`) als Datenquelle in Phase 1.

**Quelle:** https://github.com/mkaiser/Sungrow-SHx-Inverter-Modbus-Home-Assistant

## Begründung

- GoSungrow Cloud-API funktioniert nicht mehr (AppKey-Rotation Nov 2023, nie gefixt)
- Sungrow Open API liefert keine Battery-Daten (SOC, Charge/Discharge) — für EMHASS unbrauchbar
- Modbus via gridBox liefert **alle** Daten lokal in Echtzeit (~100 Entities)
- Kein Cloud-Abhängigkeit, kein API-Key nötig
- mkaiser-Integration ist ausgereift und aktiv gepflegt (Release 2026-03-09)

## Konfiguration

```yaml
# secrets.yaml
sungrow_modbus_host_ip: "192.168.1.134"  # gridBox (NICHT WiNet-S2!)
sungrow_modbus_port: "502"
sungrow_modbus_device_address: 1
sungrow_modbus_wait_milliseconds: 200     # konservativ, Heartbeat-schonend
sungrow_modbus_battery_max_power: 5000
```

## Netzwerk-Topologie

```
SH10RT (Inverter)
  ├── WiNet-S2 (192.168.1.191) — Sungrow Cloud-Anbindung, Modbus instabil für HA
  └── gridBox (192.168.1.134) — 1komma5° Heartbeat, Modbus-Gateway → HA liest hierüber
        └── Home Assistant (192.168.1.9) — Modbus TCP Client (read-only)
```

## Risiken & Monitoring

- **Heartbeat-Störung:** Paralleler Modbus-Zugriff könnte die Heartbeat-Steuerung beeinflussen
  - **Maßnahme:** 1komma5° App täglich prüfen (Heartbeat-Tab, Energie-Tab auf Lücken)
  - **Fallback:** Modbus-Integration in `configuration.yaml` auskommentieren + HA neustarten
- **Modbus-Lesefehler:** Gelegentliche `unavailable`-Flacker bei einzelnen Registern
  - **Maßnahme:** `wait_milliseconds` erhöhen (200 → 300 → 500) falls nötig

## Konsequenzen

- Template-Sensoren (ADR-0008) müssen an mkaiser-Entity-IDs angepasst werden (statt GoSungrow-IDs)
- Phase-2-Migration wird einfacher — mkaiser-Integration unterstützt auch Schreibzugriff (Batterie-Steuerung)
- GoSungrow Add-on kann deinstalliert werden
