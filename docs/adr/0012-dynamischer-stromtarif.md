# ADR-0012: Dynamischer Stromtarif (Tibber / aWATTar)

**Status:** Vorgeschlagen (März 2026)

## Kontext

Nach Kündigung des 1komma5° Energy Trader wird ein dynamischer Stromtarif benötigt, der stundengenau nach Börsenpreis abrechnet. Nur so kann die EMHASS-Optimierung (Laden bei niedrigen Preisen, Entladen bei hohen) finanziell wirksam werden.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Tibber** | Große Community, gute HA-Integration, transparente Preise, Pulse-Hardware optional | 5,99 €/Mo Grundgebühr, 2 ct/kWh Aufschlag auf Börsenpreis |
| **aWATTar** | Günstiger (4,58 €/Mo), in AT/DE verfügbar | Kleinere Community, weniger HA-Integrationen |
| **Rabot Charge** | AI-basierte Optimierung, 4,99 €/Mo | Intransparenter Aufschlag, junge Firma |
| **1komma5° Dynamic Pulse** | Bereits bekannt | Nur mit Energy Trader (wird gekündigt), 4,49 €/Mo + 9,99 €/Mo ET |
| Festpreis (Grundversorger) | Kein Preisrisiko | ~35 ct/kWh, keine Optimierung möglich |

## Entscheidung

Finale Entscheidung offen — wird nach Phase 1 getroffen. Tendenz: Tibber (größte Community, beste HA-Integration) oder aWATTar (günstiger).

## Bewertungskriterien

- **HA-Integration**: Preis-Sensor muss zuverlässig und aktuell sein
- **Gesamtkosten**: Grundgebühr + Aufschlag auf Börsenpreis
- **Transparenz**: Klare Aufschlüsselung aller Kostenbestandteile
- **Community**: Erfahrungsberichte zu HA + EMHASS Kombination

## Konsequenzen

- In Phase 1 wird mit ENTSO-e-Börsenpreisen + geschätzten Aufschlägen simuliert
- Finale Tarifwahl beeinflusst den Endpreis-Template-Sensor (ADR-0004)
- Wechsel zu dynamischem Tarif erfordert Smart Meter (iMSys) — Verfügbarkeit beim Netzbetreiber prüfen
- Kein Preisdeckel wie bei 1komma5° (25 ct/kWh) — Dunkelflauten-Risiko wird durch Batterie + Optimierung abgefedert (→ ADR-0013 für detaillierten Vergleich)
- Geschätzte Ersparnis bei Fixkosten: ~10 €/Mo (~120 €/Jahr). Messstellenbetrieb (~5,85 €) und Netzentgelt/TEPA (~6 €) fallen in beiden Szenarien an — nur die tarifspezifischen Kosten unterscheiden sich (1komma5° ~22 €/Mo vs. Tibber ~6 €/Mo)
