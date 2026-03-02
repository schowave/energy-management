# ADR-0005: Solcast / Forecast.Solar für PV-Prognose

**Status:** Vorgeschlagen (März 2026)

## Kontext

EMHASS benötigt eine 24-48h PV-Prognose, um den optimalen Batterie-Fahrplan zu berechnen. Die Qualität der Prognose beeinflusst direkt die Optimierungsqualität.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Solcast** | Hohe Genauigkeit, Satellite-basiert, 2 Standorte kostenlos (Hobbyist), 48h-Prognose | API-Limit (10 Calls/Tag im Free-Tier), Registrierung nötig |
| **Forecast.Solar** | Kostenlos, einfache Einrichtung, HA-Integration | Weniger genau als Solcast, statistisches Modell statt Satellit |
| Open-Meteo Solar | Kostenlos, keine Registrierung | Geringere Genauigkeit, weniger erprobt mit HA |
| EMHASS-interne Prognose | Kein externer Dienst nötig | ML-basiert auf historischen Daten, braucht Anlernphase |

## Entscheidung

Beide evaluieren: Solcast als primäre Quelle, Forecast.Solar als Fallback. Finale Entscheidung nach Vergleich der Prognosequalität in Phase 1.

## Begründung

- **Solcast Hobbyist-Plan** reicht für den Eigenbedarf (10 API-Calls/Tag, 2 Standorte)
- **Satelliten-basierte Prognose** berücksichtigt aktuelle Bewölkung besser als statistische Modelle
- **Forecast.Solar** als Zero-Config-Fallback, falls Solcast-API-Limits nicht ausreichen
- Beide haben gut gewartete HA-Integrationen

## Konsequenzen

- Anlagendaten (Ausrichtung, Neigung, kWp) müssen bei beiden Diensten hinterlegt werden
- Bei Solcast: API-Calls auf max 10/Tag begrenzen (Automation nicht zu häufig triggern)
- Prognosequalität sollte in Phase 1 gegen die tatsächliche PV-Erzeugung geprüft werden
- Langfristig kann EMHASS die Prognose intern durch ML-Modelle verbessern
