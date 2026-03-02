# ADR-0013: Energiemanagement-Ansatz — EMHASS-Eigenbau statt Managed-Lösungen

**Status:** Akzeptiert (März 2026)

## Kontext

Für die Optimierung von Batterie (12.8 kWh Sungrow SBR) und Wärmepumpe (Novelan LICV 8.2) mit dynamischem Stromtarif gibt es drei grundsätzliche Ansätze: den bestehenden 1komma5° Heartbeat, Sungrows eigenen iHomeManager oder einen Eigenbau mit EMHASS auf Home Assistant.

## Feature-Vergleich im Detail

### Preisprognose & Stromhandel

| Feature | 1komma5° Heartbeat | Sungrow iHomeManager | EMHASS-Eigenbau |
|---|---|---|---|
| **Day-Ahead-Preise** | Ja, über Dynamic Pulse Tarif | Ja, Anbindung an Nord Pool + weitere Börsen | Ja, über ENTSO-e Integration |
| **Intraday-Handel** | Ja — seit 2025, Erlöse bis 1.000 €/Jahr beworben (realistisch eher 50-200 €/Jahr pro Haushalt) | Nein | Nein (nur Day-Ahead, siehe Abschnitt unten) |
| **Preis-Algorithmus** | EUPHEMIA-basiert, proprietäre AI | Deep-Learning, kontinuierliches Lernen aus Verbrauchsmustern | LP-Optimierung (HiGHS Solver), deterministisch |
| **Prognosehorizont** | Echtzeit + Day-Ahead | 24h Vorausplanung | 24-48h (konfigurierbar) |
| **Virtuelles Kraftwerk** | Ja — 40.000+ Anlagen vernetzt, Netzdienstleistungen, Frequenzregelung (Skandinavien) | Nein (angekündigt als "virtual power banks") | Nein |
| **Preisdeckel** | 25 ct/kWh bei Dunkelflauten | Nein | Nein |
| **Negative Strompreise** | Nutzt aktiv (Laden bei negativen Preisen) | Nutzt aktiv | Nutzt aktiv |

### Batterie-Management

| Feature | 1komma5° Heartbeat | Sungrow iHomeManager | EMHASS-Eigenbau |
|---|---|---|---|
| **Lade-/Entlade-Optimierung** | AI-gesteuert, Echtzeit-Marktdaten | AI-gesteuert, SOC-Reservierung für PV-Absorption | LP-optimiert, mathematisch optimaler Day-Ahead-Plan |
| **SOC-Management** | Automatisch (Blackbox) | Automatisch, reserviert SOC für erwartete PV-Erzeugung | Konfigurierbare Min/Max-Grenzen, Hysterese-Regeln |
| **Arbitrage-Trading** | Ja (günstig laden, teuer entladen/verkaufen) | Ja (niedrig laden, hoch entladen) | Ja (über Day-Ahead-Preisdifferenzen) |
| **Notstrom-Backup** | Unklar | Ja, automatische Backup-Vorbereitung bei Extremwetter | Manuell konfigurierbar (SOC-Reserve) |

### Gerätesteuerung

| Feature | 1komma5° Heartbeat | Sungrow iHomeManager | EMHASS-Eigenbau |
|---|---|---|---|
| **Batterie/Inverter** | Multi-Hersteller per Modbus TCP | Nur Sungrow (SHT, SHRT, SGRT), max 5 Inverter, max 50 kW | Herstellerunabhängig über HA-Integrationen |
| **Wärmepumpe** | Ja, viele Hersteller — aber Novelan LICV 8.2 wird aktuell nicht gesteuert | Ja, SG-Ready integriert | Ja, per Shelly Relay + SG-Ready |
| **Wallbox/EV** | Ja, intelligentes Laden | Ja, Sungrow 22kW AC Charger | Nein (ggf. evcc als Ergänzung) |
| **Weitere Verbraucher** | Eingeschränkt | Eingeschränkt auf Sungrow-Ökosystem | Beliebig über HA (Shelly, Tasmota, ZigBee, etc.) |
| **Reaktionszeit** | Echtzeit | Sekunden | Planbasiert (alle 15-60 Min), Schwellwert-Automationen Echtzeit |

### Prognose & Wetter

| Feature | 1komma5° Heartbeat | Sungrow iHomeManager | EMHASS-Eigenbau |
|---|---|---|---|
| **PV-Prognose** | Integriert (proprietär) | 72h-Wettervorhersage, PV-Yield-Prognose | Solcast (Satellit) oder Forecast.Solar |
| **Lastprognose** | AI lernt Verbrauchsmuster | Deep-Learning auf Verbrauchsmustern | ML-basierte Lastvorhersage (integriert in EMHASS) |
| **Wetterintegration** | Integriert | 72h-Forecast | Über PV-Prognose-Dienst |

### Infrastruktur & Kosten

| Feature | 1komma5° Heartbeat | Sungrow iHomeManager | EMHASS-Eigenbau |
|---|---|---|---|
| **Hardware** | Heartbeat-Controller (599 €) + Smart Meter | DIN-Rail-Gerät (~200-400 €, Preis regional variabel) | KAMRUI N100 (179,99 €, ADR-0001) + Shelly (~15 €, ADR-0011) |
| **Laufende Kosten** | ~22 €/Mo tarifspezifisch (Energy Trader 9,99 + Dynamic Pulse 4,49 + Gebühren) + ~12 €/Mo tarifunabhängig = **~34 €/Mo gesamt** | ~6 €/Mo Grundgebühr (z.B. Tibber, ADR-0012) + ~12 €/Mo tarifunabhängig = **~18 €/Mo gesamt** | ~6 €/Mo Grundgebühr (z.B. Tibber, ADR-0012) + ~12 €/Mo tarifunabhängig = **~18 €/Mo gesamt** |
| **Cloud-Abhängigkeit** | Ja (1komma5°-Cloud, 200+ Entwickler in Berlin) | Ja (Sungrow iSolarCloud) | Nein — vollständig lokal |
| **Protokoll** | Modbus TCP (belegt Port 502) | Modbus RS485/LAN/WiFi + Cloud | Modbus TCP über HA |
| **Monitoring** | 1komma5°-App | iSolarCloud App + Web | InfluxDB + Grafana (volle Kontrolle) |
| **IT-Sicherheit** | Unklar | ETSI EN 303 645, DSGVO-konform | Lokal, kein Cloud-Datenabfluss |
| **Vendor Lock-in** | Stark (Tarif + HW + SW gekoppelt) | Mittel (Sungrow-HW, aber freie Tarifwahl) | Keiner |

## Entscheidung

EMHASS-Eigenbau auf Home Assistant (KAMRUI N100).

## Begründung

### Gegen 1komma5° Heartbeat
- **Steuert die Novelan WP nicht** — ein großer Optimierungshebel bleibt ungenutzt
- **~10 €/Mo teurer** als Tibber + Eigenbau (tarifspezifische Mehrkosten → ~120 €/Jahr)
- **Blackbox** — nicht nachvollziehbar, ob/wann schlecht eingekauft wird
- **Starker Vendor Lock-in** — Tarif, Hardware und Software gekoppelt, bei Kündigung alles weg
- **Intraday-Handel und VPP** sind echte Stärken — allerdings sind die versprochenen 1.000 €/Jahr Erlöse Marketing, realistisch eher deutlich weniger
- Der 25 ct/kWh Preisdeckel schützt bei Dunkelflauten, aber das Risiko ist bei 12.8-kWh-Batterie + Optimierung gering

### Gegen Sungrow iHomeManager
- **Cloud-Abhängigkeit** — gleiche Kategorie wie Heartbeat, nur anderer Anbieter
- **Blackbox** — keine Einsicht in Optimierungsentscheidungen
- **Zusätzliche Hardware-Kosten** für ein Problem, das EMHASS bereits löst
- **Modbus-Konflikt** — belegt den Modbus-Anschluss, HA kann dann nicht direkt steuern
- **Nur Sungrow** — bei zukünftigem Wechselrichter-Wechsel nicht portierbar
- **Dynamic Tariff Feature** noch relativ neu (2025), Reifegrad unklar
- Allerdings: 72h-Wetterprognose + Deep-Learning-Lastprognose sind technisch stark; als Quick-Win für Sungrow-Besitzer ohne HA-Ambitionen eine solide Option

### Für EMHASS-Eigenbau
- **Volle Transparenz** — jede Optimierungsentscheidung ist nachvollziehbar und anpassbar
- **WP-Steuerung** inklusive (Shelly SG-Ready + EMHASS Deferrable Loads)
- **Kein Vendor Lock-in** — herstellerunabhängig, eigene Infrastruktur
- **Lokal** — keine Cloud-Abhängigkeit, funktioniert auch bei Internet-Ausfall
- **Langzeit-Monitoring** — InfluxDB + Grafana für beliebig detaillierte Analyse
- **Erweiterbar** — zukünftige Verbraucher (Wallbox, Waschmaschine) einfach integrierbar
- **LP-Optimierung** ist mathematisch optimal für den Day-Ahead-Horizont (vs. Heuristiken)

### Ehrliche Schwächen des Eigenbaus
- **Kein Intraday-Handel** — EMHASS optimiert nur Day-Ahead (siehe Erklärung unten)
- **Kein virtuelles Kraftwerk** — keine Netzdienstleistungen, keine Frequenzregelung
- **Kein Preisdeckel** — volles Preisrisiko bei Extremereignissen
- **Wartungsaufwand** — Updates, Fehlerbehebung, Konfiguration in eigener Verantwortung
- **Reaktionszeit** — planbasiert statt Echtzeit (für Batterie-Arbitrage ausreichend, für Netzdienstleistungen nicht)

## Warum Intraday-Handel nicht nachbaubar ist

Die Frage liegt nahe, ob man Intraday-Handel über Tibber-API o.ä. selbst abbilden kann. Die Antwort: **Nein**, aus strukturellen Gründen.

**Was 1komma5° beim Intraday-Handel tut:**
- Agiert als **Aggregator / Bilanzkreisverantwortlicher (BKV)** mit Börsenlizenz
- Bündelt 40.000+ Batterien zu einem virtuellen Kraftwerk
- **Verkauft** gespeicherte Energie auf dem EPEX Spot Intraday-Markt, wenn Preise untertägig steigen
- **Kauft nach**, wenn Preise fallen — Echtzeit-Steuerung tausender Batterien
- Bietet Netzdienstleistungen (Frequenzregelung) an

**Was ein Einzelhaushalt mit Tibber kann:**
- Tibber liefert **Day-Ahead-Preise** (stehen ab ~13:00 Vortag fest, danach unveränderlich)
- Man **verbraucht** zum jeweiligen Stundenpreis — aber handelt nicht aktiv
- Einspeisung wird mit **fester EEG-Vergütung** (~8 ct/kWh) vergütet, nicht zu Marktpreisen
- Die Tibber-API liefert Preisdaten, aber **keinen Marktzugang**

**Ergebnis:** Intraday-Handel erfordert eine BKV-Lizenz, EPEX-Spot-Anbindung und Echtzeit-Steuerung vieler Anlagen. Das ist kein Feature, das man als Einzelhaushalt nachbauen kann. Day-Ahead-Optimierung deckt jedoch ~90% des Preisoptimierungspotenzials ab. Die realistischen Intraday-Erlöse pro Haushalt liegen bei 50-200 €/Jahr (nicht 1.000 €), und ein Teil bleibt als Marge beim Aggregator.

## Konsequenzen

- Kein Preisdeckel — Extrempreise bei Dunkelflauten werden nicht gekappt (Batterie + Optimierung als Mitigation)
- Kein Intraday-Handel — Day-Ahead deckt ~90% des Potenzials, Intraday erfordert Aggregator-Lizenz
- Eigene Verantwortung für Wartung, Updates und Fehlerbehebung
- Höherer initialer Einrichtungsaufwand (~2-3 Wochenenden)
- Phase 1 (Simulation) validiert den Ansatz vor dem endgültigen Umstieg
- Einmalige Kosten ~195 € (KAMRUI + Shelly) statt laufende Mehrkosten
- Bei späterem E-Auto: evcc als Ergänzung für Wallbox-Steuerung evaluieren

## Quellen

- [1komma5° Heartbeat AI](https://1komma5.com/de/heartbeat/)
- [1komma5° Energy Trader](https://1komma5.com/de/heartbeat/energy-trader/)
- [1komma5° startet Intraday-Handel](https://1komma5.com/de/magazin/pressemitteilungen/1komma5-gruendet-heartbeat-ai-aus-und-startet-intraday-handel/)
- [Sungrow iHomeManager Produktseite](https://www.sungrowpower.com/en/products/energy-management-system/ihomemanager)
- [Sungrow iHomeManager – Memodo](https://www.memodo-shop.com/m/news/sungrow-ihomemanager/)
- [Sungrow Dynamic Tariff Feature](https://en.sungrowpower.com/newsDetail/6349/sungrow-unveils-dynamic-tariff-feature-on-isolarcloud-empowering-european-homes-to-reduce-energy-bills)
