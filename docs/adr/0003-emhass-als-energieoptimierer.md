# ADR-0003: EMHASS als Energieoptimierer

**Status:** Akzeptiert (März 2026)

## Kontext

Nach Kündigung des 1komma5° Energy Trader / Heartbeat wird ein Optimierer benötigt, der die Batterie (12.8 kWh) und Wärmepumpe (Novelan LICV 8.2) unter Berücksichtigung von PV-Prognose und dynamischen Strompreisen steuert. Der Optimierer soll die Gesamtkosten minimieren.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **EMHASS** | Echte LP-Optimierung (HiGHS), PV+Last+Preis kombiniert, ML-Lastvorhersage, Day-Ahead-Plan, speziell für Heim-Batterien gebaut | Konfigurationsaufwand, Lernkurve |
| evcc | Gute Sungrow-Unterstützung, aktive Community | Für EV-Laden gebaut, startet nicht ohne Wallbox (Dummy-Workaround nötig), nur einfacher Preisschwellwert statt LP-Optimierung |
| WattWise | Einfacher als EMHASS, AppDaemon-basiert | Weniger ausgereift, kleinere Community, weniger Optimierungsmöglichkeiten |
| Eigene Automationen | Volle Kontrolle, kein Overhead | Kein LP-Solver, Schwellwert-basiert deckt nur ~70-80% des Potenzials |

## Entscheidung

EMHASS Add-on mit HiGHS-Solver auf dem KAMRUI N100.

## Begründung

- **Linear Programming** optimiert Batterie-Lade/Entlade-Zeitpunkte mathematisch optimal (vs. Heuristiken)
- **Day-Ahead-Plan** passt sich täglich an Preise und PV-Prognose an
- **Deferrable Loads** können die Wärmepumpe als thermischen Speicher einbeziehen
- **HiGHS-Solver** läuft nativ auf x86_64 (KAMRUI N100) — kein ARM-Kompatibilitätsproblem
- **LibreHEMS-Doku** bietet spezifische Anleitungen für Sungrow-Wechselrichter
- evcc wäre nur bei einem späteren E-Auto/Wallbox relevant — dann als Ergänzung

## Konsequenzen

- Initiale Konfiguration erfordert exakte Anlagenparameter (Batteriekapazität, Lade-/Entladeleistung, WR-Effizienz)
- EMHASS-Plan muss über HA-Automationen in Modbus-Befehle an den Sungrow übersetzt werden
- In Phase 1 läuft EMHASS im Simulationsmodus (berechnen, aber nicht steuern)
- Einfache Schwellwert-Automationen als Fallback für den Fall, dass EMHASS ausfällt
- Bei späterem E-Auto: evcc als Ergänzung für Wallbox-Steuerung evaluieren
