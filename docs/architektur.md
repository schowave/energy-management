# DIY Energy Management – Architektur

> KAMRUI N100 (HA OS) · Synology DS218+ (NAS/Backup) · Sungrow SH10RT · 12.8 kWh Batterie · Novelan LICV 8.2

## Phase 1: Parallelbetrieb (Simulation)

> Heartbeat steuert weiterhin per Modbus. HA liest nur über GoSungrow Cloud-API. Kein Modbus-Konflikt.

```mermaid
graph TB
    subgraph CLOUD["☁️ Cloud / APIs"]
        ENTSOE["ENTSO-e<br/><small>Day-Ahead Börsenpreise</small>"]
        SOLCAST["Solcast / Forecast.Solar<br/><small>PV-Prognose 48h</small>"]
        GOSUNGROW["GoSungrow Cloud<br/><small>PV · Batterie · Grid Daten</small>"]
    end

    subgraph N100P1["🖥️ KAMRUI N100 (Home Assistant OS)"]
        HAP1["🏠 Home Assistant<br/><small>Monitoring · Dashboard · Sensoren</small>"]
        TMPL["📐 Template-Sensoren<br/><small>Abstraktionsschicht</small>"]
        EMHASSP1["🧠 EMHASS Add-on<br/><small>Simulationsmodus · nur berechnen</small>"]
        INFLUXP1["📈 InfluxDB Add-on<br/><small>Langzeit-Logging</small>"]
        GRAFANAP1["📊 Grafana Add-on<br/><small>Vergleichs-Dashboard</small>"]
        MQTTP1["MQTT Broker<br/><small>Mosquitto Add-on</small>"]
    end

    subgraph LOKAL1["🏠 Lokales Netzwerk"]
        HEARTBEAT["💚 1komma5° Heartbeat<br/><small>steuert per Modbus TCP :502</small>"]
        SUNGROW1["Sungrow SH10RT<br/><small>Modbus TCP :502</small>"]
    end

    %% Cloud → HA (nur lesend)
    ENTSOE -->|Börsenpreise| HAP1
    SOLCAST -->|PV-Forecast| HAP1
    GOSUNGROW -->|SOC · Power · Grid| HAP1

    %% HA → Template → EMHASS
    HAP1 --> TMPL
    TMPL -->|generische Sensoren| EMHASSP1
    EMHASSP1 -.->|simulierter Plan| HAP1
    HAP1 --> INFLUXP1
    INFLUXP1 --> GRAFANAP1

    %% Heartbeat steuert (HA hat keinen Modbus-Zugriff)
    HEARTBEAT ==>|Modbus TCP| SUNGROW1

    %% Styling
    classDef cloud fill:#1e3a5f,stroke:#3b82f6,color:#f1f5f9
    classDef haos fill:#14532d,stroke:#22c55e,color:#f1f5f9
    classDef lokal fill:#422006,stroke:#f59e0b,color:#f1f5f9
    classDef heartbeat fill:#14532d,stroke:#22c55e,color:#f1f5f9

    class ENTSOE,SOLCAST,GOSUNGROW cloud
    class HAP1,TMPL,EMHASSP1,INFLUXP1,GRAFANAP1,MQTTP1 haos
    class HEARTBEAT,SUNGROW1 lokal
```

> HA hat **keinen Modbus-Zugriff** – alle Daten kommen über GoSungrow Cloud-API. EMHASS berechnet, was es tun **würde**, führt aber nichts aus. Heartbeat bleibt alleiniger Steuerer.

## Phase 2: Systemarchitektur (nach Umstieg)

```mermaid
graph TB
    subgraph CLOUD["☁️ Cloud / APIs"]
        ENTSOE["ENTSO-e<br/><small>Day-Ahead Börsenpreise</small>"]
        SOLCAST["Solcast / Forecast.Solar<br/><small>PV-Prognose 48h</small>"]
        TIBBER["Tibber / aWATTar<br/><small>Dynamischer Tarif</small>"]
        GOSUNGROW["GoSungrow Cloud<br/><small>Backup-Monitoring</small>"]
    end

    subgraph SERVER["🖥️ KAMRUI N100 (Home Assistant OS)"]
        HA["🏠 Home Assistant<br/><small>Automationen · Dashboard · Sensoren</small>"]
        EMHASS["🧠 EMHASS<br/><small>LP Optimizer · HiGHS Solver (x86)</small>"]
        MQTT["MQTT Broker<br/><small>Mosquitto</small>"]
        GRAFANA["📊 Grafana<br/><small>Langzeit-Visualisierung</small>"]
        INFLUX["📈 InfluxDB<br/><small>Langzeit-Speicher</small>"]
    end

    subgraph LOKAL["🏠 Lokales Netzwerk"]
        SUNGROW["Sungrow SH10RT<br/><small>Modbus TCP :502</small>"]
        METER["Smart Meter<br/><small>iMSys</small>"]
        SHELLY["Shelly / ESP32<br/><small>SG-Ready Relais</small>"]
    end

    subgraph HARDWARE["⚡ Hardware"]
        PV["☀️ PV-Module<br/><small>~10 kWp</small>"]
        BATTERIE["🔋 Batterie<br/><small>12.8 kWh SBR</small>"]
        WP["🌡️ Novelan WP<br/><small>LICV 8.2 · SG-Ready</small>"]
        HAUS["🏠 Hausverbrauch"]
    end

    %% Cloud → HA
    ENTSOE -->|Preise| HA
    SOLCAST -->|Forecast| HA
    TIBBER -->|Preise| HA
    GOSUNGROW -.->|MQTT| MQTT
    MQTT --> HA

    %% HA ↔ Add-ons
    HA -->|Sensordaten| EMHASS
    EMHASS -->|Optimierungsplan| HA
    HA --> INFLUX
    INFLUX --> GRAFANA

    SYNOLOGY["🗄️ Synology DS218<br/><small>NAS · HA-Backups</small>"]

    %% HA → Lokal
    HA ==>|Modbus TCP| SUNGROW
    HA -->|REST/MQTT| SHELLY
    HA -.->|Backup via SMB| SYNOLOGY
    METER -.-> HA

    %% Lokal → Hardware
    SUNGROW --- PV
    SUNGROW --- BATTERIE
    SHELLY -->|SG-Ready| WP
    SUNGROW --- HAUS

    %% Styling
    classDef cloud fill:#1e3a5f,stroke:#3b82f6,color:#f1f5f9
    classDef haos fill:#14532d,stroke:#22c55e,color:#f1f5f9
    classDef lokal fill:#422006,stroke:#f59e0b,color:#f1f5f9
    classDef hw fill:#450a0a,stroke:#ef4444,color:#f1f5f9

    class ENTSOE,SOLCAST,TIBBER,GOSUNGROW cloud
    class HA,EMHASS,MQTT,GRAFANA,INFLUX haos
    class SUNGROW,METER,SHELLY,SYNOLOGY lokal
    class PV,BATTERIE,WP,HAUS hw
```

> Durchgezogene Linien = aktive Steuerung · Gestrichelte Linien = Monitoring / Backup · Dicke Linie = Modbus TCP

## Rollout-Phasen

```mermaid
gantt
    title Rollout-Plan
    dateFormat YYYY-MM-DD
    axisFormat %b

    section Phase 1 – Simulation (KAMRUI N100)
    KAMRUI N100 + HA OS einrichten          :p1hw, 2026-03-01, 3d
    ENTSO-e API-Key + Integration           :p1a, after p1hw, 2d
    Solcast/Forecast.Solar einrichten       :p1b, after p1a, 2d
    GoSungrow Langzeit-Logging (90 Tage)    :p1c, after p1a, 3d
    Vergleichs-Dashboard bauen              :p1d, after p1c, 5d
    EMHASS Docker Simulationsmodus           :p1e, after p1d, 5d
    Daten sammeln & vergleichen             :p1f, after p1e, 42d

    section Phase 2 – Umstieg
    Kündigungsfristen prüfen & kündigen     :p2a, after p1f, 7d
    Dynamischen Tarif abschließen           :p2b, after p2a, 7d
    Heartbeat trennen + Modbus freigeben    :p2c, after p2b, 2d
    Sungrow Modbus-Integration (mkaiser)    :p2d, after p2c, 3d
    EMHASS scharf schalten                  :p2e, after p2d, 3d
    WP SG-Ready über Shelly einbinden       :p2f, after p2e, 3d
    Feintuning & Monitoring                 :p2g, after p2f, 14d
```

## Hardware

### HA-Server: KAMRUI N100 (bestellt)

| Spec | Detail |
|---|---|
| **CPU** | Intel N100 (x86_64, 4C/4T, 3.4 GHz) |
| **RAM** | 16 GB DDR4 |
| **Storage** | 512 GB SSD |
| **Stromverbrauch** | ~8W idle (~21 €/Jahr) |
| **Preis** | 179,99 € |

> HA OS wird direkt geflasht (kein Windows). HiGHS-Solver läuft nativ (x86_64).
> 16 GB RAM = Headroom für alle Add-ons.

### Weitere Hardware

| Komponente | Empfehlung | Preis |
|---|---|---|
| **SG-Ready Relais** | Shelly Plus oder ESP32 Relay | ~15 € einmalig |

## Software-Komponenten

| Komponente | Rolle | Kosten |
|---|---|---|
| **Home Assistant OS** | Auf KAMRUI N100 | Kostenlos |
| **ENTSO-e** | Börsenpreise | Kostenlos |
| **Tibber / aWATTar** | Dynamischer Tarif (Phase 2) | ~6 €/Mo |
| **Solcast / Forecast.Solar** | PV-Prognose 48h | Kostenlos |
| **Sungrow Modbus (mkaiser)** | Inverter + Batterie Steuerung (Phase 2) | Kostenlos |
| **EMHASS** | LP-Optimierer · HiGHS Solver (Heartbeat-Ersatz) | Kostenlos |
| **Novelan SG-Ready** | WP-Steuerung via Shelly/ESP32 (Phase 2) | Kostenlos |
| **GoSungrow Cloud** | Monitoring via MQTT | Kostenlos |
| **InfluxDB + Grafana** | Langzeit-Analyse | Kostenlos |

> **Laufende Kosten (Phase 2): ~6 €/Mo** (nur Tibber Grundgebühr) vs. ~34 €/Mo bei 1komma5° → **Ersparnis ~336 €/Jahr**
>
> **Einmalige Kosten: ~195 €** (KAMRUI 179,99 € + Shelly ~15 €) – amortisiert sich in ~7 Monaten

## Entscheidungslog

### EMHASS statt evcc (März 2026)

evcc wurde als Alternative für das Batterie-Management evaluiert. Ergebnis: **nicht geeignet** für diesen Use Case.

| Kriterium | evcc | EMHASS |
|---|---|---|
| Ohne Wallbox nutzbar | Nein (Dummy-Workaround, unsupported) | Ja |
| Optimierung | Einfacher Preisschwellwert | LP-Optimierer (PV + Last + Preis) |
| Tägliche Anpassung | Manuell / Cron-Script nötig | Automatisch (Day-Ahead-Plan) |
| Sungrow SH10RT | Supported, aber bekannte Bugs | Über HA Modbus-Integration |

evcc wäre nur relevant bei einem späteren E-Auto mit Wallbox – dann als Ergänzung neben EMHASS.
