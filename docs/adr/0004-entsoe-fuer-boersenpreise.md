# ADR-0004: ENTSO-e Transparency Platform für Börsenpreise

**Status:** Akzeptiert (März 2026)

## Kontext

Für die preisbasierte Optimierung benötigt EMHASS stündliche Day-Ahead-Börsenpreise. Diese Preise bilden die Basis für die Berechnung optimaler Lade-/Entladezeitpunkte.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **ENTSO-e Transparency Platform** | Kostenlos, offizielle EU-Datenquelle, stündliche Day-Ahead-Preise DE/AT, HA-Integration vorhanden | Registrierung nötig, nur Börsenpreise (ohne Netzentgelte/Steuern) |
| Tibber API | Endpreis inkl. Aufschläge | Nur mit Tibber-Vertrag, nicht in Phase 1 verfügbar |
| aWATTar API | Kostenlos, Endpreis-nahe | Weniger verbreitet, kleinere HA-Integration |
| Nordpool | Etabliert | Primär Skandinavien, ENTSO-e deckt DE besser ab |

## Entscheidung

ENTSO-e Transparency Platform als primäre Preisdatenquelle.

## Begründung

- **Kostenlos und vertragsunabhängig** — funktioniert in Phase 1 ohne dynamischen Stromvertrag
- **Offizielle EU-Quelle** für Day-Ahead-Auktionspreise
- **HA-Integration** (`entso-e`) liefert stündliche Sensoren direkt
- Endpreis wird per Template-Sensor berechnet: Börsenpreis + Netzentgelte + Steuern + Abgaben
- In Phase 2 können Tibber/aWATTar-Preise zusätzlich als Validierung dienen

## Konsequenzen

- Kostenloser API-Key muss bei ENTSO-e beantragt werden
- Template-Sensor für den dynamischen Endpreis muss manuell konfiguriert werden (Aufschläge aus Tarifbedingungen)
- Preise sind Börsenpreise — der tatsächliche Endpreis hängt vom gewählten Tarif ab
- Festpreis-Sensor (Grundversorger) als Baseline-Vergleich separat als `input_number` anlegen
