# ADR-0014: 1komma5grad HACS-Integration für Heartbeat-Daten in Phase 1

**Status:** Akzeptiert (März 2026)

## Kontext

In Phase 1 (Simulation) läuft der 1komma5° Heartbeat parallel weiter. Um die Heartbeat-Entscheidungen zu tracken und einen fundierten Kostenvergleich (Heartbeat vs. EMHASS) durchzuführen, werden die **Dynamic Pulse Strompreise** und **Energy-Sensoren** (kWh) des Heartbeat-Systems in Home Assistant benötigt.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **[BirknerAlex/hacs_1komma5grad](https://github.com/BirknerAlex/hacs_1komma5grad)** | Neue Heartbeat API, Strompreise + Forecast, Energy-Sensoren (kWh), HACS-Installation, aktiv gepflegt | Inoffizielle Community-Integration, kann bei API-Änderungen brechen |
| [derlangemarkus/1komma5grad_ha](https://github.com/derlangemarkus/1komma5grad_ha) | Einfache REST-Sensoren | **Archiviert** (Dez 2025), nur Legacy-API (`my.1komma5.io`), keine Preisdaten, keine WP/Wallbox/Batterie-Sensoren |
| [domenik1023/1komma5grad](https://github.com/domenik1023/1komma5grad) | Alternative Integration | Weniger verbreitet, Feature-Umfang unklar |
| Manuelles Scraping / REST-Sensoren | Volle Kontrolle | Hoher Aufwand, fragil bei API-Änderungen, Authentifizierung komplex |

## Entscheidung

**BirknerAlex/hacs_1komma5grad** als HACS-Integration für Phase 1.

## Begründung

- **Strompreise verfügbar** — Dynamic Pulse Preis (aktuell + Forecast) als Sensor, inkl. Netzentgelte und MwSt.
- **Energy-Sensoren** — Grid in/out, Solar, Batterie in/out, WP, Wallbox als kWh-Sensoren → kompatibel mit HA Energy Dashboard
- **Neue API** — nutzt die aktuelle Heartbeat-API (`app.1komma5grad.com`), nicht die veraltete Legacy-API
- **HACS-Installation** — einfache Installation und Updates über den HA Community Store
- **Ergänzt GoSungrow** — GoSungrow liefert granulare Power-Daten (W), hacs_1komma5grad liefert Preise und aggregierte Energy-Daten (kWh)

## Verfügbare Sensoren

| Sensor | Beschreibung | Nutzen |
|---|---|---|
| Electricity Price | Aktueller Dynamic Pulse Preis (inkl. Netzentgelte + MwSt.) | Kostenvergleich Heartbeat vs. EMHASS |
| Price Forecast | Preisvorhersage (Attribute) | Vergleich mit ENTSO-e Day-Ahead |
| Grid Import/Export (kWh) | Netz-Bezug/Einspeisung | HA Energy Dashboard |
| Solar Production (kWh) | PV-Erzeugung | Plausibilitäts-Check vs. GoSungrow |
| Battery In/Out (kWh) | Batterie-Lade/Entlade-Energie | Heartbeat-Strategie nachvollziehen |

## Konsequenzen

- **Temporäre Abhängigkeit** — Integration wird nur in Phase 1 benötigt (nach Heartbeat-Kündigung obsolet)
- **Keine offizielle Unterstützung** — Community-Integration, kann bei 1komma5°-API-Änderungen brechen
- **HACS erforderlich** — muss als Voraussetzung vor der Integration installiert werden
- **Zwei Datenquellen parallel** — GoSungrow (Power/W) + hacs_1komma5grad (Preise/kWh) ergänzen sich, überschneiden sich teilweise bei Energy-Sensoren → Plausibilitäts-Crosscheck möglich
- **Preisvergleich möglich** — Heartbeat Dynamic Pulse Preis vs. ENTSO-e Börsenpreis macht die 1komma5°-Marge sichtbar
