# Home Assistant Entities

> Automatisch generiert am **2026-03-11** — 768 Entitäten gesamt

## Inhaltsverzeichnis

- [myUplink / Novelan Entitäten](#myuplink--novelan-entitäten) (105)
- [automation](#automation) (3)
- [binary_sensor](#binary_sensor) (165)
- [button](#button) (36)
- [conversation](#conversation) (1)
- [cover](#cover) (18)
- [device_tracker](#device_tracker) (1)
- [event](#event) (37)
- [media_player](#media_player) (5)
- [number](#number) (25)
- [person](#person) (1)
- [remote](#remote) (4)
- [scene](#scene) (7)
- [select](#select) (16)
- [sensor](#sensor) (363)
- [sun](#sun) (1)
- [switch](#switch) (27)
- [todo](#todo) (1)
- [tts](#tts) (1)
- [update](#update) (54)
- [weather](#weather) (1)
- [zone](#zone) (1)

## Zusammenfassung nach Domain

| Domain | Anzahl |
|---|---|
| automation | 3 |
| binary_sensor | 165 |
| button | 36 |
| conversation | 1 |
| cover | 18 |
| device_tracker | 1 |
| event | 37 |
| media_player | 5 |
| number | 25 |
| person | 1 |
| remote | 4 |
| scene | 7 |
| select | 16 |
| sensor | 363 |
| sun | 1 |
| switch | 27 |
| todo | 1 |
| tts | 1 |
| update | 54 |
| weather | 1 |
| zone | 1 |

## myUplink / Novelan Entitäten

**Gerät:** Novelan LICV 8.2R1/3 (Luft-Wasser-Wärmepumpe, Luxtronik 2.x Steuerung)
**Integration:** myUplink (offizielle HA-Integration, OAuth2)
**Präfix:** `licv_8_2r1_3` in allen Entity-IDs

#### Abkürzungsverzeichnis (Luxtronik)

| Kürzel | Bedeutung |
|--------|-----------|
| **HUP** | Heizungsumwälzpumpe — Hauptumwälzpumpe im Heizkreis |
| **BUP** | Brauchwasser-Umwälzpumpe — Ladepumpe für den Warmwasserspeicher |
| **ZUP** | Zusatzumwälzpumpe — Sekundäre Umwälzpumpe (z.B. für Pufferspeicher) |
| **ZIP** | Zirkulationspumpe — Hält warmes Wasser in der Leitung vor (Komfort) |
| **VD1** | Verdichter 1 — Kompressor der Wärmepumpe |
| **VBO** | Ventilator/Brunnen/Sole-Umwälzpumpe — Bei Luft-WP: Verdampfer-Ventilator |
| **MOT** | Mischkreis-Motor — Stellmotor für Mischventil (regelt Vorlauftemperatur MK1) |
| **ASD** | Abtau/Soledruck/Durchfluss — Abtauvorgang des Verdampfers bei Vereisung |
| **HD** | Hochdruckpressostat — Sicherheitsabschaltung bei zu hohem Kältemitteldruck |
| **EVU** | Energieversorgungs-Unternehmen — Sperre/Freigabe durch den Netzbetreiber |
| **ZWE** | Zusätzlicher Wärmeerzeuger — Heizstab als Backup bei niedrigen Außentemperaturen |
| **SST** | Solarspeicher-Thermostat — Zweiter Zuheizer oder Solareinbindung |

### Schalter (switch) — Steuerung

| Entity ID | Beschreibung | State |
|---|---|---|
| `switch.licv_8_2r1_3_extra_dhw` | **Extra Warmwasser (Extra DHW)** — Zeitgesteuerter WW-Boost: heizt den Speicher für exakt 2 Stunden (`duration_extra_dhw` = 7200s) auf die Temperatur `number.…_desired_value` (aktuell 48°C, einstellbar 30–65°C). Verdichter moduliert normal. Schaltet sich nach Ablauf automatisch ab, auch wenn Zieltemperatur nicht erreicht wurde. Typischer Einsatz: vor dem Duschen aktivieren oder per EMHASS bei PV-Überschuss triggern | on |
| `switch.licv_8_2r1_3_high_speed_charge` | **Schnellladung (High-Speed Charge)** — Bedarfsgesteuerte WW-Eilladung: Verdichter läuft mit **maximaler Leistung ohne Modulation** bis der normale WW-Sollwert (`targ_value` = 55°C) erreicht ist. Dauer abhängig von der Temperaturdifferenz, typisch 30–60 Min. Schaltet sich bei Erreichen des Sollwerts automatisch ab. Nutzen: schnellstmöglich WW bereitstellen, z.B. nach längerer Abwesenheit. **Achtung:** Zieht maximale Leistung, daher weniger geeignet für PV-Optimierung als Extra DHW | off |
| `switch.licv_8_2r1_3_heating_blocked` | **Heizung sperren (Heating blocked)** — Sperrt den kompletten Heizkreis. Die WP produziert keine Heizwärme mehr, Umwälzpumpen stoppen. Nutzen für EMHASS: bei sehr teurem Strom oder negativen Preisen die Heizung vorübergehend sperren. **Vorsicht:** Bei Frost kann das Gebäude auskühlen, besser über Offset steuern | off |
| `switch.licv_8_2r1_3_dhw_blocked` | **Warmwasser sperren (DHW blocked)** — Sperrt die Warmwasserbereitung komplett. Die WP heizt den WW-Speicher nicht nach. Nutzen: WW-Bereitung in teure Stunden verhindern. **Vorsicht:** WW-Temperatur sinkt bei Nutzung ab, Legionellengefahr bei längerer Sperrung unter 55°C | off |
| `switch.licv_8_2r1_3_cooling_blocked` | **Kühlung sperren (Cooling blocked)** — Sperrt die Kühlfunktion der WP (passive/aktive Kühlung). Relevant im Sommer, wenn die WP über den Heizkreis kühlen kann. Aktuell `cooling_enabled` = 0, daher ohne Funktion | off |
| `switch.licv_8_2r1_3_pool_blocked` | **Pool sperren (Pool blocked)** — Sperrt die Poolheizung. Nicht genutzt (kein Pool angeschlossen, `pool_enabled` = 0) | off |
| `switch.licv_8_2r1_3_secondary_return` | **Sekundärer Rücklauf (Secondary return)** — Aktiviert ein Umschaltventil für einen sekundären Rücklauf-Kreislauf. Wird bei Anlagen mit Pufferspeicher oder getrenntem Heiz-/WW-Kreislauf genutzt, um den Rücklauf über einen anderen Pfad zu führen | off |

### Sollwerte (number) — Temperaturen & Offsets

| Entity ID | Beschreibung | Wert | Min | Max | Step |
|---|---|---|---|---|---|
| `number.licv_8_2r1_3_desired_value` | **WW-Zieltemperatur Extra DHW** — Solltemperatur, die bei aktiviertem Extra-DHW-Boost angefahren wird. Nur relevant wenn `switch.…_extra_dhw` = on. Höherer Wert = mehr Energie im Speicher, aber auch längere Laufzeit und höherer Verbrauch | 48.0°C | 30.0 | 65.0 | 0.5 |
| `number.licv_8_2r1_3_targ_value` | **WW-Zieltemperatur Normal** — Standard-Warmwasser-Sollwert im Normalbetrieb. Die WP startet WW-Bereitung wenn die Speichertemperatur unter die Hysterese fällt (ca. 5°C unter Sollwert). Wird auch von High-Speed Charge als Ziel verwendet | 55.0°C | 48.0 | 65.0 | 0.5 |
| `number.licv_8_2r1_3_sollwert_heizen` | **Sollwert Heizung** — Feste Vorlauf-Solltemperatur für den Hauptheizkreis. Nur aktiv wenn `modus_heizen` = "Setpoint". Ersetzt dann die Heizkurvenberechnung komplett. Nutzen für EMHASS: bei PV-Überschuss auf z.B. 40°C setzen um thermisch vorzuladen | 35.0°C | 15.0 | 75.0 | 0.1 |
| `number.licv_8_2r1_3_sollwert_mk1_heizen` | **Sollwert Mischkreis 1** — Feste Vorlauf-Solltemperatur für MK1 (z.B. Fußbodenheizung). Nur aktiv wenn `modus_mk1_heizen` = "Setpoint". MK1 hat typisch niedrigere Vorlauftemperaturen als der Hauptheizkreis | 35.0°C | 20.0 | 65.0 | 0.1 |
| `number.licv_8_2r1_3_sollwert_warmw` | **Sollwert Warmwasser (SG-Ready)** — WW-Solltemperatur wenn `modus_warmw` = "Setpoint". Überschreibt dann `targ_value` für die externe Steuerung. Nutzen: dynamisch zwischen 40°C (Sparmode) und 55°C (PV-Überschuss) wechseln | 40.0°C | 30.0 | 75.0 | 0.1 |
| `number.licv_8_2r1_3_heating_limit` | **Heizgrenze (Außentemperatur)** — Ab dieser Außentemperatur (Durchschnitt) schaltet die Heizung ab. 20°C bedeutet: bei >20°C Außentemperatur wird nicht mehr geheizt. Sinnvoller Bereich: 15–20°C je nach Gebäudedämmung | 20.0°C | 5.0 | 30.0 | 1.0 |
| `number.licv_8_2r1_3_offset_heizen` | **Offset Heizung** — Parallelverschiebung der Heizkurve für den Hauptheizkreis in °C. Nur aktiv wenn `modus_heizen` = "Offset". +5 = Vorlauf 5°C wärmer als Heizkurve berechnet (mehr heizen), -5 = 5°C kühler (weniger heizen). **Idealer Hebel für PV-Optimierung:** Heizkurve bleibt erhalten, nur verschoben | 0.0 | -20.0 | +20.0 | 0.1 |
| `number.licv_8_2r1_3_offset_mk1_heizen` | **Offset Mischkreis 1** — Parallelverschiebung der Heizkurve für MK1. Nur aktiv wenn `modus_mk1_heizen` = "Offset". Kleinerer Bereich als Hauptheizkreis, da Fußbodenheizung träger reagiert | 0.0 | -5.0 | +5.0 | 0.1 |
| `number.licv_8_2r1_3_offset_overall_heizen` | **Offset Gesamt-Heizung** — Globaler Offset, der auf **alle** Heizkreise gleichzeitig wirkt. Nur aktiv wenn `modus_overall_heizen` = "Offset". Praktisch wenn beide Kreise gleich verschoben werden sollen | 0.0 | -5.0 | +5.0 | 0.1 |
| `number.licv_8_2r1_3_offset_overall_heizen_2` | **Offset Gesamt-Heizung 2** — Zweiter globaler Offset (Parallel-Parameter, wird von myUplink als Duplikat exponiert). Gleiche Funktion wie `offset_overall_heizen` | 0.0 | -5.0 | +5.0 | 0.1 |
| `number.licv_8_2r1_3_offset_warmw` | **Offset Warmwasser** — Verschiebung des WW-Sollwerts in °C. Nur aktiv wenn `modus_warmw` = "Offset". +5 = WW wird 5°C wärmer als normal gehalten. Nutzen: bei PV-Überschuss Offset erhöhen, WW als thermischen Speicher nutzen | 0.0 | -20.0 | +20.0 | 0.1 |
| `number.licv_8_2r1_3_offset_warmw_2` | **Offset Warmwasser 2** — Zweiter WW-Offset (Parallel-Parameter, Duplikat von myUplink) | 0.0 | -20.0 | +20.0 | 0.1 |
| `number.licv_8_2r1_3_temperature` | **Temperatur +/- (Raumeinfluss)** — Globale Parallelverschiebung der Heizkurve, wirkt direkt auf den Luxtronik-Regler. Unabhängig von SG-Ready-Modus, immer aktiv. Wird typisch über das WP-Display eingestellt, kann aber auch remote geändert werden | 0.0 | -5.0 | +5.0 | 0.5 |

### Betriebsmodi (select) — Modi & Steuerungsart

#### Hauptbetriebsarten

> Steuern den Grundbetrieb der einzelnen Kreise. Im Normalbetrieb auf "Automatic" lassen.

| Entity ID | Beschreibung | Wert | Optionen |
|---|---|---|---|
| `select.licv_8_2r1_3_mode_of_operation` | **Betriebsart Heizung** — Hauptbetriebsmodus des Heizkreises. **Automatic:** WP heizt nach Heizkurve und Außentemperatur. **Party:** Heizt für einige Stunden auf erhöhtem Niveau (z.B. bei Besuch), kehrt danach zu Automatic zurück. **Holiday:** Reduzierter Betrieb auf Frostschutz-Niveau für Abwesenheit. **Add. heat gen.:** Nur Heizstab (ZWE) aktiv, Verdichter aus — für Notbetrieb/Service. **Off:** Heizung komplett aus | Automatic | Automatic, Party, Holiday, Add. heat gen., Off |
| `select.licv_8_2r1_3_mode_of_operation_2` | **Betriebsart Warmwasser** — Hauptbetriebsmodus der WW-Bereitung. Gleiche Optionen wie Heizung. **Automatic:** WW-Bereitung nach Sollwert und Hysterese. **Party:** Erhöhte WW-Temperatur für einige Stunden. **Add. heat gen.:** Nur Heizstab für WW. **Off:** Keine WW-Bereitung | Automatic | Automatic, Party, Holiday, Add. heat gen., Off |
| `select.licv_8_2r1_3_mode_of_operation_3` | **Betriebsart Mischkreis 1** — Modus für MK1 (z.B. Fußbodenheizung). **Off:** MK1 deaktiviert. **On:** MK1 läuft dauerhaft (Umwälzpumpe an). **Heat:** MK1 heizt nach Heizkurve/Sollwert (Normalmodus) | Heat | Off, On, Heat |
| `select.licv_8_2r1_3_mode_of_operation_4` | **Betriebsart Kühlung** — Kühlmodus der WP. **Off:** Keine Kühlung. **On:** Kühlung dauerhaft aktiv. **Heat:** Nur Heizen (Standardeinstellung, Kühlung deaktiviert). Kühlung nutzt den Heizkreis invers — Kältemittelkreis wird umgekehrt, Fußbodenheizung wird zur Flächenkühlung | Heat | Off, On, Heat |
| `select.licv_8_2r1_3_mode_of_operation_5` | **Betriebsart Pool** — Poolheizung (nicht angeschlossen). **Off:** Deaktiviert | Off | Off, On, Heat |

#### SG-Ready / Smart-Grid-Steuerung

> Diese Parameter steuern, **wie** die WP auf externe Signale reagiert (z.B. von EMHASS oder einem Energiemanagement-System).
> Das SG-Ready-Protokoll definiert 4 Stufen: **Blocked** (EVU-Sperre, Netz überlastet) → **Normal** (Standardbetrieb) → **Encouraged** (PV-Überschuss/günstiger Strom, mehr heizen empfohlen) → **Ordered** (Zwangseinschaltung, maximale Leistung, inkl. Heizstab).

| Entity ID | Beschreibung | Wert | Optionen |
|---|---|---|---|
| `select.licv_8_2r1_3_power_control_mode` | **SG-Ready Leistungsvorgabe** — Zentrale SG-Ready-Stufe, entspricht den 4 Kontaktstufen am EVU-Eingang. **Individually:** Kein globaler SG-Ready-Modus, jeder Kreis wird über die einzelnen Modus-Selektoren gesteuert. **Blocked:** EVU-Sperre — WP wird abgeschaltet (nur Frostschutz bleibt aktiv). Netzbetreiber kann dies bei Netzüberlastung erzwingen (bis zu 2h/Tag). **Normal:** Normalbetrieb nach Heizkurve, keine externe Beeinflussung. **Encouraged:** WP erhöht Sollwerte und nutzt thermische Speicher (Gebäude + WW) aktiv — ideal bei PV-Überschuss oder günstigem Börsenstrom. **Ordered:** Zwangseinschaltung mit maximaler Leistung, **Heizstab wird zugeschaltet** — nur bei massivem Überschuss oder negativen Strompreisen sinnvoll | Individually | Individually, Blocked, Normal, Encouraged, Ordered |
| `select.licv_8_2r1_3_modus_overall_heizen` | **SG-Ready Gesamt-Heizung** — Bestimmt ob alle Heizkreise global oder individuell extern gesteuert werden. **Individual:** Jeder Heizkreis (`modus_heizen`, `modus_mk1_heizen`) hat eigene SG-Ready-Einstellungen. **Offset:** Alle Heizkreise nutzen den `offset_overall_heizen`-Wert als globale Heizkurvenverschiebung. **Level:** Alle Heizkreise nutzen eine gemeinsame Leistungsstufe | Individual | Individual, Offset, Level |
| `select.licv_8_2r1_3_modus_heizen` | **SG-Ready Heizkreis** — Bestimmt die Art der externen Steuerung für den Hauptheizkreis. **Off:** Keine externe Beeinflussung, WP heizt nach eigener Heizkurve. **Setpoint:** `sollwert_heizen` wird direkt als Vorlauftemperatur verwendet (Heizkurve ignoriert). **Offset:** `offset_heizen` verschiebt die Heizkurve parallel nach oben/unten (Heizkurve bleibt erhalten, **empfohlen für EMHASS**). **Level:** Leistungsstufe wird extern vorgegeben | Off | Off, Setpoint, Offset, Level |
| `select.licv_8_2r1_3_modus_mk1_heizen` | **SG-Ready Mischkreis 1** — Wie `modus_heizen`, aber für MK1. Nutzt `sollwert_mk1_heizen` (Setpoint), `offset_mk1_heizen` (Offset) oder `level_mk1_heizen` (Level) als Eingangswert | Off | Off, Setpoint, Offset, Level |
| `select.licv_8_2r1_3_modus_warmw` | **SG-Ready Warmwasser** — Externe Steuerungsart für WW-Bereitung. **Off:** WW nach internem Sollwert. **Setpoint:** `sollwert_warmw` als fester WW-Sollwert. **Offset:** `offset_warmw` verschiebt den WW-Sollwert (z.B. +5°C bei PV-Überschuss → WW als thermischer Speicher). **Level:** Leistungsstufe für WW-Bereitung | Off | Off, Setpoint, Offset, Level |
| `select.licv_8_2r1_3_smart_mode` | **Smart-Modus (Komfortprofil)** — Globales Komfortprofil, beeinflusst alle Sollwerte gleichzeitig. **Default:** Normalbetrieb, alle Sollwerte wie eingestellt. **Away:** Abwesenheitsmodus — Raumtemperatur-Sollwert abgesenkt (z.B. -3°C), WW-Temperatur reduziert. Sinnvoll für Arbeitstage. **Vacation:** Urlaubsmodus — Minimalbetrieb auf Frostschutz-Niveau, WW stark reduziert. Für mehrtägige Abwesenheit | Default | Default, Away, Vacation |
| `select.licv_8_2r1_3_lpc_mode` | **Leistungsbegrenzung (LPC = Leistungs-Power-Control)** — Begrenzt die maximale elektrische Aufnahme der WP auf den Wert in `pc_limit` (aktuell 30 kW). **No limit:** Keine Begrenzung, WP nutzt volle Leistung. **Soft limit:** WP drosselt sanft auf den Grenzwert, Verdichter moduliert herunter. **Hard limit:** WP schaltet sofort ab wenn Grenzwert überschritten wird. Nutzen: bei begrenztem PV-Überschuss die WP-Leistung deckeln | No limit | No limit, Soft limit, Hard limit |

### Temperatursensoren

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_outdoor_temp` | **Außentemperatur** — Aktueller Messwert am Außentemperaturfühler der WP. Wird für die Heizkurvenberechnung verwendet. Kann von HA-Wetterdaten abweichen (Einbauort, Sonneneinstrahlung) | 14.6 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | **Außentemperatur Durchschnitt (ø)** — Gedämpfter 24h-Mittelwert der Außentemperatur. Die Heizkurve nutzt diesen geglätteten Wert, damit kurzfristige Temperaturspitzen nicht zu ständigem Ein-/Ausschalten führen. Auch relevant für die Heizgrenze | 11.5 | °C |
| `sensor.licv_8_2r1_3_flow` | **Vorlauftemperatur (TVL)** — Temperatur des Heizwassers, das die WP Richtung Heizkreis verlässt. Bei aktivem Heizbetrieb typisch 25–55°C je nach Heizkurve und Außentemperatur. Differenz zu Rücklauf = Spreizung (Indikator für Wärmeübertragung) | 58.8 | °C |
| `sensor.licv_8_2r1_3_return` | **Rücklauftemperatur (TRL)** — Temperatur des Heizwassers, das von den Heizkörpern/Fußbodenheizung zurückkommt. Niedrigere Rücklauftemperatur = bessere Wärmeabgabe im Gebäude = höherer COP | 56.3 | °C |
| `sensor.licv_8_2r1_3_return_target` | **Rücklauf-Solltemperatur** — Von der Heizkurve berechneter Zielwert für den Rücklauf. Der Luxtronik-Regler nutzt den Rücklauf (nicht Vorlauf) als Regelgröße | 25.7 | °C |
| `sensor.licv_8_2r1_3_dhw` | **Warmwassertemperatur (WW)** — Aktuelle Temperatur im Warmwasserspeicher (oberer Fühler). Wenn diese unter den Sollwert minus Hysterese fällt, startet die WW-Bereitung | 44.7 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | **Warmwassertemperatur 2** — Zweiter WW-Fühler, bei myUplink als Duplikat exponiert (identischer Wert). Manche Speicher haben zwei Fühler (oben/unten) | 44.7 | °C |
| `sensor.licv_8_2r1_3_dhw_target` | **WW-Solltemperatur (aktiv)** — Der aktuell aktive WW-Sollwert, den die WP als Ziel verwendet. Kann von `targ_value` abweichen wenn SG-Ready oder Komfortprofil aktiv | 55.0 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | **WW-Maximaltemperatur** — Absoluter oberer Grenzwert für den WW-Speicher. Sicherheitsabschaltung: WW-Bereitung stoppt bei diesem Wert. Auch für Verbrühschutz relevant | 65.0 | °C |
| `sensor.licv_8_2r1_3_heat_source_inlet` | **Wärmequelleneintritt** — Temperatur der Außenluft am Verdampfer-Eingang. Bei Luft-WP = Luftansaugtemperatur. Kann durch Windchill oder Sonneneinstrahlung von `outdoor_temp` abweichen. Direkter Einfluss auf den COP | 14.3 | °C |
| `sensor.licv_8_2r1_3_coverage_hp` | **Deckungsgrad WP (Bivalenzpunkt)** — Vorlauftemperatur, bis zu der die WP allein (ohne Heizstab) den Wärmebedarf decken kann. Darüber muss der Heizstab (ZWE1) zugeschaltet werden. Hängt von Außentemperatur und Heizlast ab | 37.5 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_flow` | **Vorlauf Mischkreis 1 (Ist)** — Aktuelle Vorlauftemperatur im MK1 nach dem Mischventil. Der Mischkreis-Motor (MOT) regelt das Mischventil, um diese Temperatur auf den Sollwert zu bringen | 75.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_target` | **Sollwert Mischkreis 1** — Von der Heizkurve berechnete Ziel-Vorlauftemperatur für MK1. Der MOT-Stellmotor steuert das Mischventil um diesen Wert zu erreichen | 25.7 | °C |
| `sensor.licv_8_2r1_3_max_flow_temp` | **Max. Vorlauftemperatur** — Obere Grenze für den Vorlauf des Hauptheizkreises. Sicherheitsparameter, WP schaltet ab wenn dieser Wert überschritten wird | 60.0 | °C |
| `sensor.licv_8_2r1_3_maximaler_vorlauf_mk_1` | **Max. Vorlauf MK1** — Obere Grenze für den Vorlauf des Mischkreises 1. Bei Fußbodenheizung typisch 45°C um Estrich-/Bodenbelagschäden zu vermeiden | 45.0 | °C |
| `sensor.licv_8_2r1_3_minimaler_vorlauf_mk_1` | **Min. Vorlauf MK1** — Untere Grenze für den Vorlauf des Mischkreises 1. Verhindert Taupunktunterschreitung bei Kühlung | 20.0 | °C |
| `sensor.licv_8_2r1_3_min_return_targ_temp` | **Min. Rücklauf-Solltemperatur** — Untere Grenze für den Rücklauf-Sollwert. Schützt vor zu niedrigem Rücklauf (Frostschutz, Kondensatbildung) | 15.0 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | **Rücklauftemperatur-Grenze** — Maximaler Rücklauf. Sicherheitsabschaltung wenn Rücklauf diesen Wert überschreitet (z.B. bei Mischventil-Fehler) | 50.0 | °C |
| `sensor.licv_8_2r1_3_tvl_calc_max` | **Berechneter max. Vorlauf (TVL calc)** — Von der Heizkurve berechnete maximale Vorlauftemperatur für die aktuelle Außentemperatur. Zeigt, was die Heizkurve bei der aktuellen Witterung als Maximum vorgibt | 28.9 | °C |

### Leistung & Verbrauch

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_heating_capacity` | **Heizleistung (thermisch)** — Aktuelle thermische Leistungsabgabe der WP in kW. Berechnet aus Volumenstrom × Spreizung (Vorlauf - Rücklauf) × spezifische Wärmekapazität. Zusammen mit `power_consumption` ergibt sich der COP: `heating_capacity / power_consumption`. Für genauere COP-Berechnung den Shelly 3EM statt `power_consumption` nutzen | 0.0 | kW |
| `sensor.licv_8_2r1_3_power_consumption` | **Stromaufnahme (elektrisch)** — Elektrische Leistungsaufnahme der WP laut internem Sensor. **Weniger genau als Shelly 3EM** am WP-Anschluss, da myUplink nur periodisch aktualisiert (ca. alle 5 Min.). Für COP-Trending OK, für exakte Verbrauchsmessung besser Shelly nutzen | 0.0 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | **Min. Leistungsaufnahme** — Unterste Modulationsstufe des Verdichters (Hersteller-Parameter). Wert ist ein interner Index, kein kW-Wert | 9.0 | — |
| `sensor.licv_8_2r1_3_pc_limit` | **Leistungsbegrenzung (PC limit)** — Eingestellte maximale elektrische Leistungsaufnahme. Wird von `lpc_mode` genutzt. 30 kW = effektiv keine Begrenzung bei einer 8 kW WP | 30.0 | kW |
| `sensor.licv_8_2r1_3_flow_rate` | **Volumenstrom** — Durchflussmenge im Heizkreis. 0 l/h = Umwälzpumpe steht, WP im Standby. Normaler Betrieb: 800–2000 l/h je nach Heizbedarf. Zu niedriger Durchfluss führt zu hoher Spreizung und Sicherheitsabschaltung | 0.0 | l/h |

### Kältekreis (Diagnose)

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_hd` | **Hochdruck (HD)** — Druck auf der Hochdruckseite des Kältemittelkreises (nach Verdichter, vor Kondensator). Normalbereich: 15–30 bar je nach Betriebspunkt. Bei zu hohem Druck (>38 bar) löst der Hochdruckpressostat (HD) aus und schaltet den Verdichter ab. Zu hoher HD deutet auf Durchflussproblem oder Überladung hin | 10.54 | bar |
| `sensor.licv_8_2r1_3_nd` | **Niederdruck (ND)** — Druck auf der Niederdruckseite des Kältemittelkreises (nach Verdampfer, vor Verdichter). Normalbereich: 3–8 bar. Zu niedriger ND deutet auf Kältemittelmangel, vereisten Verdampfer oder zu wenig Wärmequelle hin | 10.34 | bar |
| `sensor.licv_8_2r1_3_ao_1` | **Analogausgang 1 (AO1)** — Steuerspannung 0–10V für den **Verdichter** (Inverter-Drehzahl). 10V = maximale Drehzahl/Leistung, 0V = aus. Zeigt indirekt die aktuelle Modulation: 5V ≈ 50% Leistung, 10V = 100% | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | **Analogausgang 2 (AO2)** — Steuerspannung 0–10V für den **Verdampfer-Ventilator**. Regelt die Luftmenge über den Verdampfer. Höhere Spannung = mehr Luft = mehr Wärmequelle. Im Standby 0V | 10.0 | V |

### Energiezähler (kumulativ, state_class: total_increasing)

> Alle Werte sind **thermische** Energie (Wärmeabgabe), nicht elektrischer Verbrauch.
> Die "_2"-Varianten beinhalten zusätzlich die Energie des Heizstabs (ZWE1, 696h Betrieb).

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_heating` | **Thermische Energie Heizung (nur WP)** — Kumulierte Wärmeenergie für Heizung, ausschließlich durch den Verdichter erzeugt. Für COP-Langzeitberechnung: `heating / (elektrischer Verbrauch Heizung)` | 7069.9 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | **Thermische Energie Heizung (WP + Heizstab)** — Kumulierte Heizenergie inkl. Heizstab. Differenz `heating_2 - heating` = Heizstab-Anteil (hier: ~11.000 kWh = 61% Heizstab!) | 18066.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water` | **Thermische Energie WW (nur WP)** — Kumulierte Wärmeenergie für Warmwasser, nur Verdichter | 515.5 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | **Thermische Energie WW (WP + Heizstab)** — Kumulierte WW-Energie inkl. Heizstab. Differenz zeigt Heizstab-Anteil bei WW-Bereitung | 1554.6 | kWh |
| `sensor.licv_8_2r1_3_total` | **Thermische Energie Gesamt (nur WP)** — Summe `heating + domestic_hot_water`. Gesamte durch den Verdichter erzeugte Wärme | 7585.4 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | **Thermische Energie Gesamt (WP + Heizstab)** — Summe `heating_2 + domestic_hot_water_2`. Gesamte erzeugte Wärme inkl. aller Zuheizer | 19621.3 | kWh |

### Betriebsstunden

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_operat_hours_heat` | **Betriebsstunden Heizung** — Gesamtlaufzeit des Verdichters im Heizbetrieb. Zusammen mit `operating_hours_dhw` ergibt sich die Verteilung Heizen vs. WW | 3028.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | **Betriebsstunden WW** — Gesamtlaufzeit des Verdichters im WW-Betrieb | 307.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | **Betriebsstunden WP gesamt** — Gesamtlaufzeit der Wärmepumpe (Heizung + WW). Sollte ≈ `operat_hours_heat + operating_hours_dhw` sein | 3337.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | **Betriebsstunden Verdichter 1 (VD1)** — Laufzeit des Kompressors. Bei Single-Verdichter identisch mit `operating_hours_hp`. Wichtig für Wartungsintervalle (Hersteller empfiehlt Service alle ~10.000h) | 3337.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | **Betriebsstunden Heizstab (ZWE1)** — Laufzeit des Zusatz-Wärmeerzeugers 1 (elektrischer Heizstab). 696h bei 3337h WP-Gesamt = Heizstab läuft ~21% der Zeit — relativ hoch, deutet auf häufige Tiefsttemperaturphasen oder zu hoch eingestellte Sollwerte hin | 696.0 | h |
| `sensor.licv_8_2r1_3_impulse_vd1` | **Starts Verdichter 1** — Anzahl Einschaltvorgänge des Kompressors. Hohe Taktzahl (>3 Starts/h) deutet auf Überdimensionierung oder fehlenden Pufferspeicher hin. 1112 Starts bei 3337h = Ø 3h pro Lauf — guter Wert | 1112.0 | — |

### Status & Diagnose

| Entity ID | Beschreibung | Wert | Unit |
|---|---|---|---|
| `sensor.licv_8_2r1_3_status_heating` | **Status Heizung** — Betriebszustand Heizkreis: **0**=Aus, **1**=Bereit (Standby, Sollwert erreicht), **2**=Aktiv (Verdichter läuft für Heizung), **3**=Abtauung, **5**=Gesperrt | 1.0 | — |
| `sensor.licv_8_2r1_3_status_dhw` | **Status Warmwasser** — Betriebszustand WW: **0**=Aus, **1**=Bereit (Sollwert erreicht), **2**=Aktiv (WW-Bereitung läuft), **3**=Abtauung, **5**=Gesperrt | 2.0 | — |
| `sensor.licv_8_2r1_3_operation_mode` | **Betriebsmodus (numerisch)** — Interner Luxtronik-Betriebsmodus-Code: **0**=Heizen, **1**=WW, **2**=Kühlen, **3**=Abtauen, **4**=Schwimmbad, **5**=Bereitschaft (Standby — aktueller Wert), **6**=EVU-Sperre, **7**=Fehler | 5.0 | — |
| `sensor.licv_8_2r1_3_heat_generator_status` | **Status Wärmeerzeuger** — Status des zusätzlichen Wärmeerzeugers (Heizstab): **0**=Aus (Heizstab nicht aktiv), **1**=Heizstab für Heizung, **2**=Heizstab für WW | 0.0 | — |
| `sensor.licv_8_2r1_3_error` | **Fehlercode** — Letzter aufgetretener Fehlercode im Luxtronik-Fehlerspeicher. **0**=kein Fehler. Wert 51 bedeutet "Niederdruckstörung" in der Luxtronik-Fehlerliste. Bei error_number=0 ist der Fehler nicht mehr aktiv (historisch) | 51.0 | — |
| `sensor.licv_8_2r1_3_error_number` | **Fehlernummer** — Laufende Fehlernummer für aktive Störungen. **0**=kein aktiver Fehler. Werte >0 zeigen eine aktive Störung an, die ggf. Reset/Service erfordert | 0.0 | — |
| `sensor.licv_8_2r1_3_cooling_enabled` | **Kühlung aktiviert** — Konfigurationsparameter: **0**=Kühlfunktion deaktiviert (in WP-Konfiguration nicht freigeschaltet), **1**=Kühlung verfügbar | 0.0 | — |
| `sensor.licv_8_2r1_3_pool_enabled` | **Pool aktiviert** — **0**=Pool-Funktion deaktiviert (kein Pool angeschlossen) | 0.0 | — |
| `sensor.licv_8_2r1_3_heating_demand_border` | **Heizbedarfsgrenze** — Interner Luxtronik-Schwellwert: Summenwert aus Außentemperatur-Integral, ab dem die Heizung anspringt. Niedrigerer Wert = Heizung startet schneller. Wird von der Luxtronik-Steuerung automatisch berechnet | 237.0 | — |
| `sensor.licv_8_2r1_3_dhw_demand_border` | **WW-Bedarfsgrenze** — Interner Schwellwert für WW-Anforderung. Höherer Wert als Heizung, da WW-Bereitung Priorität hat und weniger oft anspringt | 650.0 | — |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | **Dauer Extra-Warmwasser** — Konfigurierte Laufzeit des Extra-DHW-Boost in Sekunden. **7200s = 2 Stunden** (Werkseinstellung). Dieser Wert ist ein Konfigurations-Sensor, keine Restlaufzeit | 7200.0 | s |
| `sensor.licv_8_2r1_3_integration` | **Integrations-Kennung** — myUplink-interner Parameter: **1**=System korrekt in myUplink integriert und verbunden | 1.0 | — |

### SG-Ready Level-Feedback (read-only)

> Zeigen die aktuell **vom SG-Ready-System angeforderten Leistungsstufen** pro Kreis.
> Werte: **0**=keine Vorgabe, **1**=reduziert, **2**=normal, **3**=erhöht (Encouraged), **4**=maximal (Ordered).
> Nur relevant wenn der jeweilige `modus_*` auf "Level" steht.

| Entity ID | Beschreibung | Wert |
|---|---|---|
| `sensor.licv_8_2r1_3_level_heizen` | **Level Heizung** — Aktuell angeforderter SG-Ready-Level für den Hauptheizkreis | 0.0 |
| `sensor.licv_8_2r1_3_level_mk1_heizen` | **Level MK1** — Aktuell angeforderter SG-Ready-Level für Mischkreis 1 | 0.0 |
| `sensor.licv_8_2r1_3_level_overall_heizen` | **Level Gesamt-Heizung** — Aktuell angeforderter globaler SG-Ready-Level | 0.0 |
| `sensor.licv_8_2r1_3_level_warmw` | **Level Warmwasser** — Aktuell angeforderter SG-Ready-Level für WW-Bereitung | 0.0 |

### Binary Sensors — Komponentenstatus

> Zeigen den Echtzeit-Betriebszustand der einzelnen WP-Komponenten. **on** = aktiv/läuft, **off** = inaktiv/steht.

| Entity ID | Beschreibung | State |
|---|---|---|
| `binary_sensor.licv_8_2r1_3_alarm` | **Alarm** — Aktive Störungsmeldung. on = WP hat eine Störung erkannt und ggf. Betrieb eingestellt. Fehlercode in `sensor.…_error` prüfen | off |
| `binary_sensor.licv_8_2r1_3_asd` | **ASD (Abtau/Soledruck/Durchfluss)** — Abtauvorgang aktiv. Bei Luft-WP: Verdampfer wird enteist, indem der Kältekreis kurzzeitig umgekehrt wird (Heißgas-Abtauung). Tritt bei Außentemperaturen um 0°C und hoher Luftfeuchtigkeit häufiger auf. Während der Abtauung wird kurzzeitig dem Heizkreis Wärme entzogen | off |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | **BUP — Warmwasser-Ladepumpe** — Umwälzpumpe, die heißes Wasser vom Kondensator in den WW-Speicher transportiert. on = WW-Bereitung findet gerade statt | off |
| `binary_sensor.licv_8_2r1_3_el_heater` | **Heizstab (elektrisch)** — Elektrischer Zuheizer (Heizstab/Heizpatrone) aktiv. Wird zugeschaltet wenn Verdichter allein den Wärmebedarf nicht decken kann (unter Bivalenzpunkt) oder bei SG-Ready "Ordered". **Hoher Stromverbrauch** (~3–9 kW), verschlechtert COP drastisch | off |
| `binary_sensor.licv_8_2r1_3_evu` | **EVU-Freigabe** — Signal vom Energieversorger. **on = WP freigegeben** (Normalbetrieb). off = EVU-Sperre aktiv (Netzbetreiber hat WP gesperrt, max. 2h/Tag bei Wärmepumpen-Tarif). Während EVU-Sperre läuft nur Frostschutz | on |
| `binary_sensor.licv_8_2r1_3_evu_2` | **EVU-Sperre 2** — Zweiter EVU-Kontakt für erweiterte Sperrzeitfenster oder separate Tarifschaltung. Bei dir nicht genutzt | off |
| `binary_sensor.licv_8_2r1_3_hd` | **HD — Hochdruckpressostat** — Sicherheitsabschaltung: on = Hochdruck im Kältekreis zu hoch, Verdichter wurde abgeschaltet. Ursachen: Durchflussprobleme, verstopfter Filter, defekte Umwälzpumpe, zu wenig Wärmeabnahme. Sollte im Normalbetrieb immer off sein | off |
| `binary_sensor.licv_8_2r1_3_hup` | **HUP — Heizungsumwälzpumpe** — Hauptumwälzpumpe im Heizkreis. on = Heizwasser zirkuliert durch Heizkörper/Fußbodenheizung. Läuft auch im Standby nach, um Wärme zu verteilen | off |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | **Konnektivität** — Verbindungsstatus zur myUplink-Cloud. on = WP ist online und sendet Daten. off = Verbindung unterbrochen (WLAN/Internet-Problem am WP-Gateway) | on |
| `binary_sensor.licv_8_2r1_3_mot` | **MOT — Mischkreis-Motor** — Stellmotor für das Mischventil im MK1. on = Motor stellt gerade das Mischventil (regelt Vorlauftemperatur MK1 durch Beimischung von Rücklaufwasser). Kann dauerhaft on sein wenn der MK1 aktiv regelt | on |
| `binary_sensor.licv_8_2r1_3_vbo` | **VBO — Ventilator/Brunnen/Sole-Pumpe** — Bei Luft-WP: Verdampfer-Ventilator. on = Ventilator läuft, Außenluft wird über den Verdampfer geblasen. Läuft immer wenn der Verdichter aktiv ist, teilweise auch beim Abtauen | off |
| `binary_sensor.licv_8_2r1_3_vd1` | **VD1 — Verdichter 1** — Kompressor der Wärmepumpe. on = Verdichter läuft, Kältemittel wird komprimiert, Wärme wird erzeugt. **Zentraler Indikator** ob die WP gerade aktiv heizt. Bei Inverter-WP moduliert die Drehzahl (siehe AO1) | off |
| `binary_sensor.licv_8_2r1_3_zip` | **ZIP — Zirkulationspumpe** — WW-Zirkulationspumpe. on = Warmwasser zirkuliert in der Leitung, damit sofort warmes Wasser an den Zapfstellen verfügbar ist. Läuft typisch nach Zeitprogramm (z.B. morgens 6–8 Uhr) | off |
| `binary_sensor.licv_8_2r1_3_zup` | **ZUP — Zusatzumwälzpumpe** — Sekundäre Umwälzpumpe (z.B. für Pufferspeicher oder zweiten Heizkreis). on = Pumpe läuft | off |
| `binary_sensor.licv_8_2r1_3_zwe_1` | **ZWE1 — Zusatz-Wärmeerzeuger 1 (Heizstab)** — Elektrischer Heizstab aktiv. Identisch mit `el_heater`, von Luxtronik als separater Ausgang geführt. on = Heizstab heizt (hoher Stromverbrauch!) | off |
| `binary_sensor.licv_8_2r1_3_zwe_2_sst` | **ZWE2/SST — Zusatz-Wärmeerzeuger 2 / Solarspeicher-Thermostat** — Zweiter Zuheizer oder Solareinbindung. Bei Anlagen mit Solarthermie: Schaltausgang für Solarregelung. Ohne Solar: zweiter Heizstab oder nicht belegt | off |

### Firmware

| Entity ID | Beschreibung | State |
|---|---|---|
| `update.licv_8_2r1_3_firmware` | **Firmware-Update** — Verfügbarkeit eines WP-Firmware-Updates über myUplink. off = kein Update verfügbar, on = Update bereit. Firmware-Updates können neue Parameter freischalten oder Bugs beheben. Update über myUplink-App oder WP-Display durchführen | off |

## automation

3 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `automation.sungrow_dashboard_enable_danger_mode_auto_reset` | sungrow dashboard enable danger mode auto reset | on |  |
| `automation.sungrow_max_export_scene_sets_rated_limit` | sungrow max export scene sets rated limit | on |  |
| `automation.sungrow_self_consumption_mode_max_battery_discharge_scene_sets_rated_limit` | sungrow self consumption mode max battery discharge scene sets rated limit | on |  |

## binary_sensor

165 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `binary_sensor.battery_charging` | Battery charging | on |  |
| `binary_sensor.battery_charging_delay` | Battery charging (delay) | on |  |
| `binary_sensor.battery_discharging` | Battery discharging | off |  |
| `binary_sensor.battery_discharging_delay` | Battery discharging (delay) | off |  |
| `binary_sensor.dg_bad_jalousie_uberhitzung` | DG_Bad_Jalousie Überhitzung | off |  |
| `binary_sensor.dg_bad_jalousie_uberlast` | DG_Bad_Jalousie Überlast | off |  |
| `binary_sensor.dg_bad_jalousie_uberspannung` | DG_Bad_Jalousie Überspannung | off |  |
| `binary_sensor.dg_bad_jalousie_uberstrom` | DG_Bad_Jalousie Überstrom | off |  |
| `binary_sensor.dg_buero_jalousie_uberhitzung` | DG_Buero_Jalousie Überhitzung | off |  |
| `binary_sensor.dg_buero_jalousie_uberlast` | DG_Buero_Jalousie Überlast | off |  |
| `binary_sensor.dg_buero_jalousie_uberspannung` | DG_Buero_Jalousie Überspannung | off |  |
| `binary_sensor.dg_buero_jalousie_uberstrom` | DG_Buero_Jalousie Überstrom | off |  |
| `binary_sensor.dg_buero_workstation_uberhitzung` | DG_Buero_Workstation Überhitzung | off |  |
| `binary_sensor.dg_buero_workstation_uberlast` | DG_Buero_Workstation Überlast | off |  |
| `binary_sensor.dg_buero_workstation_uberspannung` | DG_Buero_Workstation Überspannung | off |  |
| `binary_sensor.dg_buero_workstation_uberstrom` | DG_Buero_Workstation Überstrom | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberhitzung` | DG_Schlafen_Jalousie_1 Überhitzung | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberlast` | DG_Schlafen_Jalousie_1 Überlast | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberspannung` | DG_Schlafen_Jalousie_1 Überspannung | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberstrom` | DG_Schlafen_Jalousie_1 Überstrom | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberhitzung` | DG_Schlafen_Jalousie_2 Überhitzung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberlast` | DG_Schlafen_Jalousie_2 Überlast | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberspannung` | DG_Schlafen_Jalousie_2 Überspannung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberstrom` | DG_Schlafen_Jalousie_2 Überstrom | off |  |
| `binary_sensor.ds218_drive_1_max_fehlerhafte_sektoren_uberschritten` | DS218 (Drive 1) Max. fehlerhafte Sektoren überschritten | off |  |
| `binary_sensor.ds218_drive_1_unterhalb_der_mindestrestlebensdauer` | DS218 (Drive 1) Unterhalb der Mindestrestlebensdauer | off |  |
| `binary_sensor.ds218_drive_2_max_fehlerhafte_sektoren_uberschritten` | DS218 (Drive 2) Max. fehlerhafte Sektoren überschritten | off |  |
| `binary_sensor.ds218_drive_2_unterhalb_der_mindestrestlebensdauer` | DS218 (Drive 2) Unterhalb der Mindestrestlebensdauer | off |  |
| `binary_sensor.ds218_sicherheitsstatus` | DS218 Sicherheitsstatus | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberhitzung` | EG_Diele_Jalousie-1 Überhitzung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberlast` | EG_Diele_Jalousie-1 Überlast | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberspannung` | EG_Diele_Jalousie-1 Überspannung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberstrom` | EG_Diele_Jalousie-1 Überstrom | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberhitzung` | EG_Diele_Jalousie-2 Überhitzung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberlast` | EG_Diele_Jalousie-2 Überlast | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberspannung` | EG_Diele_Jalousie-2 Überspannung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberstrom` | EG_Diele_Jalousie-2 Überstrom | off |  |
| `binary_sensor.eg_essen_jalousie_uberhitzung` | EG_Essen_Jalousie Überhitzung | off |  |
| `binary_sensor.eg_essen_jalousie_uberlast` | EG_Essen_Jalousie Überlast | off |  |
| `binary_sensor.eg_essen_jalousie_uberspannung` | EG_Essen_Jalousie Überspannung | off |  |
| `binary_sensor.eg_essen_jalousie_uberstrom` | EG_Essen_Jalousie Überstrom | off |  |
| `binary_sensor.eg_kueche_jalousie_uberhitzung` | EG_Kueche_Jalousie Überhitzung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberlast` | EG_Kueche_Jalousie Überlast | off |  |
| `binary_sensor.eg_kueche_jalousie_uberspannung` | EG_Kueche_Jalousie Überspannung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberstrom` | EG_Kueche_Jalousie Überstrom | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberhitzung` | EG_Kueche_Spuelmaschine Überhitzung | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberlast` | EG_Kueche_Spuelmaschine Überlast | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberspannung` | EG_Kueche_Spuelmaschine Überspannung | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberstrom` | EG_Kueche_Spuelmaschine Überstrom | off |  |
| `binary_sensor.eg_wc_jalousie_uberhitzung` | EG_WC_Jalousie Überhitzung | off |  |
| `binary_sensor.eg_wc_jalousie_uberlast` | EG_WC_Jalousie Überlast | off |  |
| `binary_sensor.eg_wc_jalousie_uberspannung` | EG_WC_Jalousie Überspannung | off |  |
| `binary_sensor.eg_wc_jalousie_uberstrom` | EG_WC_Jalousie Überstrom | off |  |
| `binary_sensor.eg_wc_licht_eingang_0` | EG_WC_Licht Eingang 0 | on |  |
| `binary_sensor.eg_wc_licht_uberhitzung` | EG_WC_Licht Überhitzung | off |  |
| `binary_sensor.eg_wc_licht_uberlast` | EG_WC_Licht Überlast | off |  |
| `binary_sensor.eg_wc_licht_uberspannung` | EG_WC_Licht Überspannung | off |  |
| `binary_sensor.eg_wc_licht_uberstrom` | EG_WC_Licht Überstrom | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberhitzung` | EG_Wohnen_Jalousie_1 Überhitzung | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberlast` | EG_Wohnen_Jalousie_1 Überlast | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberspannung` | EG_Wohnen_Jalousie_1 Überspannung | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberstrom` | EG_Wohnen_Jalousie_1 Überstrom | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberhitzung` | EG_Wohnen_Jalousie_2 Überhitzung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberlast` | EG_Wohnen_Jalousie_2 Überlast | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberspannung` | EG_Wohnen_Jalousie_2 Überspannung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberstrom` | EG_Wohnen_Jalousie_2 Überstrom | off |  |
| `binary_sensor.exporting_power` | Exporting Power | off |  |
| `binary_sensor.exporting_power_delay` | Exporting Power (delay) | off |  |
| `binary_sensor.importing_power` | Importing Power | off |  |
| `binary_sensor.importing_power_delay` | Importing Power (delay) | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberhitzung` | KG_Flur_Kuehlschrank Überhitzung | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberlast` | KG_Flur_Kuehlschrank Überlast | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberspannung` | KG_Flur_Kuehlschrank Überspannung | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberstrom` | KG_Flur_Kuehlschrank Überstrom | off |  |
| `binary_sensor.kg_keller_licht_eingang_0` | KG_Keller_Licht Eingang 0 | on |  |
| `binary_sensor.kg_keller_licht_uberhitzung` | KG_Keller_Licht Überhitzung | off |  |
| `binary_sensor.kg_keller_licht_uberlast` | KG_Keller_Licht Überlast | off |  |
| `binary_sensor.kg_keller_licht_uberspannung` | KG_Keller_Licht Überspannung | off |  |
| `binary_sensor.kg_keller_licht_uberstrom` | KG_Keller_Licht Überstrom | off |  |
| `binary_sensor.kg_technik_serverschrank_uberhitzung` | KG_Technik_Serverschrank Überhitzung | off |  |
| `binary_sensor.kg_technik_serverschrank_uberlast` | KG_Technik_Serverschrank Überlast | off |  |
| `binary_sensor.kg_technik_serverschrank_uberspannung` | KG_Technik_Serverschrank Überspannung | off |  |
| `binary_sensor.kg_technik_serverschrank_uberstrom` | KG_Technik_Serverschrank Überstrom | off |  |
| `binary_sensor.kg_technik_trockner_uberhitzung` | KG_Technik_Trockner Überhitzung | off |  |
| `binary_sensor.kg_technik_trockner_uberlast` | KG_Technik_Trockner Überlast | off |  |
| `binary_sensor.kg_technik_trockner_uberspannung` | KG_Technik_Trockner Überspannung | off |  |
| `binary_sensor.kg_technik_trockner_uberstrom` | KG_Technik_Trockner Überstrom | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberhitzung` | KG_Technik_Waschmaschine Überhitzung | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberlast` | KG_Technik_Waschmaschine Überlast | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberspannung` | KG_Technik_Waschmaschine Überspannung | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberstrom` | KG_Technik_Waschmaschine Überstrom | off |  |
| `binary_sensor.licv_8_2r1_3_alarm` | LICV 8.2R1/3 Alarm | off |  |
| `binary_sensor.licv_8_2r1_3_asd` | LICV 8.2R1/3 ASD | off |  |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | LICV 8.2R1/3 BUP - DHW pump | off |  |
| `binary_sensor.licv_8_2r1_3_el_heater` | LICV 8.2R1/3 el. heater | off |  |
| `binary_sensor.licv_8_2r1_3_evu` | LICV 8.2R1/3 EVU | on |  |
| `binary_sensor.licv_8_2r1_3_evu_2` | LICV 8.2R1/3 EVU 2 | off |  |
| `binary_sensor.licv_8_2r1_3_hd` | LICV 8.2R1/3 HD | off |  |
| `binary_sensor.licv_8_2r1_3_hup` | LICV 8.2R1/3 HUP | off |  |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | LICV 8.2R1/3 Konnektivität | on |  |
| `binary_sensor.licv_8_2r1_3_mot` | LICV 8.2R1/3 MOT | on |  |
| `binary_sensor.licv_8_2r1_3_vbo` | LICV 8.2R1/3 VBO | off |  |
| `binary_sensor.licv_8_2r1_3_vd1` | LICV 8.2R1/3 VD1 | off |  |
| `binary_sensor.licv_8_2r1_3_zip` | LICV 8.2R1/3 ZIP | off |  |
| `binary_sensor.licv_8_2r1_3_zup` | LICV 8.2R1/3 ZUP | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_1` | LICV 8.2R1/3 ZWE 1 | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_2_sst` | LICV 8.2R1/3 ZWE 2 - SST | off |  |
| `binary_sensor.negative_load_power` | Negative Load Power | off |  |
| `binary_sensor.negative_load_power_delay` | Negative Load Power (delay) | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberhitzung` | OG_Ankleide_Jalousie_1 Überhitzung | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberlast` | OG_Ankleide_Jalousie_1 Überlast | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberspannung` | OG_Ankleide_Jalousie_1 Überspannung | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberstrom` | OG_Ankleide_Jalousie_1 Überstrom | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberhitzung` | OG_Ankleide_Jalousie_2 Überhitzung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberlast` | OG_Ankleide_Jalousie_2 Überlast | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberspannung` | OG_Ankleide_Jalousie_2 Überspannung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberstrom` | OG_Ankleide_Jalousie_2 Überstrom | off |  |
| `binary_sensor.og_ankleide_licht_eingang_0` | OG_Ankleide_Licht Eingang 0 | off |  |
| `binary_sensor.og_ankleide_licht_uberhitzung` | OG_Ankleide_Licht Überhitzung | off |  |
| `binary_sensor.og_ankleide_licht_uberlast` | OG_Ankleide_Licht Überlast | off |  |
| `binary_sensor.og_ankleide_licht_uberspannung` | OG_Ankleide_Licht Überspannung | off |  |
| `binary_sensor.og_ankleide_licht_uberstrom` | OG_Ankleide_Licht Überstrom | off |  |
| `binary_sensor.og_bad_jalousie_1_uberhitzung` | OG_Bad_Jalousie_1 Überhitzung | off |  |
| `binary_sensor.og_bad_jalousie_1_uberlast` | OG_Bad_Jalousie_1 Überlast | off |  |
| `binary_sensor.og_bad_jalousie_1_uberspannung` | OG_Bad_Jalousie_1 Überspannung | off |  |
| `binary_sensor.og_bad_jalousie_1_uberstrom` | OG_Bad_Jalousie_1 Überstrom | off |  |
| `binary_sensor.og_bad_jalousie_2_uberhitzung` | OG_Bad_Jalousie_2 Überhitzung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberlast` | OG_Bad_Jalousie_2 Überlast | off |  |
| `binary_sensor.og_bad_jalousie_2_uberspannung` | OG_Bad_Jalousie_2 Überspannung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberstrom` | OG_Bad_Jalousie_2 Überstrom | off |  |
| `binary_sensor.og_bad_licht_eingang_0` | OG_Bad_Licht Eingang 0 | on |  |
| `binary_sensor.og_bad_licht_uberhitzung` | OG_Bad_Licht Überhitzung | off |  |
| `binary_sensor.og_bad_licht_uberlast` | OG_Bad_Licht Überlast | off |  |
| `binary_sensor.og_bad_licht_uberspannung` | OG_Bad_Licht Überspannung | off |  |
| `binary_sensor.og_bad_licht_uberstrom` | OG_Bad_Licht Überstrom | off |  |
| `binary_sensor.og_flur_jalousie_uberhitzung` | OG_Flur_Jalousie Überhitzung | off |  |
| `binary_sensor.og_flur_jalousie_uberlast` | OG_Flur_Jalousie Überlast | off |  |
| `binary_sensor.og_flur_jalousie_uberspannung` | OG_Flur_Jalousie Überspannung | off |  |
| `binary_sensor.og_flur_jalousie_uberstrom` | OG_Flur_Jalousie Überstrom | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberhitzung` | OG_Zimmer1_Jalousie Überhitzung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberlast` | OG_Zimmer1_Jalousie Überlast | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberspannung` | OG_Zimmer1_Jalousie Überspannung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberstrom` | OG_Zimmer1_Jalousie Überstrom | off |  |
| `binary_sensor.og_zimmer1_licht_eingang_0` | OG_Zimmer1_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer1_licht_uberhitzung` | OG_Zimmer1_Licht Überhitzung | off |  |
| `binary_sensor.og_zimmer1_licht_uberlast` | OG_Zimmer1_Licht Überlast | off |  |
| `binary_sensor.og_zimmer1_licht_uberspannung` | OG_Zimmer1_Licht Überspannung | off |  |
| `binary_sensor.og_zimmer1_licht_uberstrom` | OG_Zimmer1_Licht Überstrom | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberhitzung` | OG_Zimmer2_Jalousie Überhitzung | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberlast` | OG_Zimmer2_Jalousie Überlast | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberspannung` | OG_Zimmer2_Jalousie Überspannung | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberstrom` | OG_Zimmer2_Jalousie Überstrom | off |  |
| `binary_sensor.og_zimmer2_licht_eingang_0` | OG_Zimmer2_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer2_licht_uberhitzung` | OG_Zimmer2_Licht Überhitzung | off |  |
| `binary_sensor.og_zimmer2_licht_uberlast` | OG_Zimmer2_Licht Überlast | off |  |
| `binary_sensor.og_zimmer2_licht_uberspannung` | OG_Zimmer2_Licht Überspannung | off |  |
| `binary_sensor.og_zimmer2_licht_uberstrom` | OG_Zimmer2_Licht Überstrom | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberhitzung` | OG_Zimmer2_Lichtstreifen Überhitzung | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberlast` | OG_Zimmer2_Lichtstreifen Überlast | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberspannung` | OG_Zimmer2_Lichtstreifen Überspannung | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberstrom` | OG_Zimmer2_Lichtstreifen Überstrom | off |  |
| `binary_sensor.positive_load_power` | Positive Load Power | on |  |
| `binary_sensor.positive_load_power_delay` | Positive Load Power (delay) | on |  |
| `binary_sensor.pv_generating` | PV generating | on |  |
| `binary_sensor.pv_generating_delay` | PV generating (delay) | on |  |

## button

36 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `button.dg_bad_jalousie_neu_starten` | DG_Bad_Jalousie Neu starten | unknown |  |
| `button.dg_buero_jalousie_neu_starten` | DG_Buero_Jalousie Neu starten | unknown |  |
| `button.dg_buero_workstation_neu_starten` | DG_Buero_Workstation Neu starten | unknown |  |
| `button.dg_schlafen_jalousie_1_neu_starten` | DG_Schlafen_Jalousie_1 Neu starten | unknown |  |
| `button.dg_schlafen_jalousie_2_neu_starten` | DG_Schlafen_Jalousie_2 Neu starten | unknown |  |
| `button.ds218_reboot` | DS218 Reboot | unknown |  |
| `button.ds218_shutdown` | DS218 Shutdown | unknown |  |
| `button.eg_diele_jalousie_1_neu_starten` | EG_Diele_Jalousie-1 Neu starten | unknown |  |
| `button.eg_diele_jalousie_2_neu_starten` | EG_Diele_Jalousie-2 Neu starten | unknown |  |
| `button.eg_essen_jalousie_neu_starten` | EG_Essen_Jalousie Neu starten | unknown |  |
| `button.eg_kueche_jalousie_neu_starten` | EG_Kueche_Jalousie Neu starten | unknown |  |
| `button.eg_kueche_spuelmaschine_neu_starten` | EG_Kueche_Spuelmaschine Neu starten | unknown |  |
| `button.eg_wc_jalousie_neu_starten` | EG_WC_Jalousie Neu starten | unknown |  |
| `button.eg_wc_licht_neu_starten` | EG_WC_Licht Neu starten | unknown |  |
| `button.eg_wohnen_jalousie_1_neu_starten` | EG_Wohnen_Jalousie_1 Neu starten | unknown |  |
| `button.eg_wohnen_jalousie_2_neu_starten` | EG_Wohnen_Jalousie_2 Neu starten | unknown |  |
| `button.kg_flur_kuehlschrank_neu_starten` | KG_Flur_Kuehlschrank Neu starten | unknown |  |
| `button.kg_keller_licht_neu_starten` | KG_Keller_Licht Neu starten | unknown |  |
| `button.kg_technik_serverschrank_neu_starten` | KG_Technik_Serverschrank Neu starten | unknown |  |
| `button.kg_technik_trockner_neu_starten` | KG_Technik_Trockner Neu starten | unknown |  |
| `button.kg_technik_waermepumpe_3em_neu_starten` | KG_Technik_Waermepumpe_3EM Neu starten | unknown |  |
| `button.kg_technik_waschmaschine_neu_starten` | KG_Technik_Waschmaschine Neu starten | unknown |  |
| `button.og_ankleide_jalousie_1_neu_starten` | OG_Ankleide_Jalousie_1 Neu starten | unknown |  |
| `button.og_ankleide_jalousie_2_neu_starten` | OG_Ankleide_Jalousie_2 Neu starten | unknown |  |
| `button.og_ankleide_licht_neu_starten` | OG_Ankleide_Licht Neu starten | unknown |  |
| `button.og_bad_jalousie_1_neu_starten` | OG_Bad_Jalousie_1 Neu starten | unknown |  |
| `button.og_bad_jalousie_2_neu_starten` | OG_Bad_Jalousie_2 Neu starten | unknown |  |
| `button.og_bad_licht_neu_starten` | OG_Bad_Licht Neu starten | unknown |  |
| `button.og_flur_jalousie_neu_starten` | OG_Flur_Jalousie Neu starten | unknown |  |
| `button.og_zimmer1_jalousie_neu_starten` | OG_Zimmer1_Jalousie Neu starten | unknown |  |
| `button.og_zimmer1_licht_neu_starten` | OG_Zimmer1_Licht Neu starten | unknown |  |
| `button.og_zimmer2_jalousie_neu_starten` | OG_Zimmer2_Jalousie Neu starten | unknown |  |
| `button.og_zimmer2_licht_neu_starten` | OG_Zimmer2_Licht Neu starten | unknown |  |
| `button.og_zimmer2_lichtstreifen_neu_starten` | OG_Zimmer2_Lichtstreifen Neu starten | unknown |  |
| `button.start_inverter` | Start inverter | unknown |  |
| `button.stop_inverter` | Stop inverter | unknown |  |

## conversation

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `conversation.home_assistant` | Home Assistant | 2026-03-08T20:43:20.952038+00:00 |  |

## cover

18 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `cover.dg_bad_jalousie` | DG_Bad_Jalousie | open |  |
| `cover.dg_buero_jalousie` | DG_Buero_Jalousie | open |  |
| `cover.dg_schlafen_jalousie_1` | DG_Schlafen_Jalousie_1 | open |  |
| `cover.dg_schlafen_jalousie_2` | DG_Schlafen_Jalousie_2 | open |  |
| `cover.eg_diele_jalousie_1` | EG_Diele_Jalousie-1 | open |  |
| `cover.eg_diele_jalousie_2` | EG_Diele_Jalousie-2 | open |  |
| `cover.eg_essen_jalousie` | EG_Essen_Jalousie | open |  |
| `cover.eg_kueche_jalousie` | EG_Kueche_Jalousie | open |  |
| `cover.eg_wc_jalousie` | EG_WC_Jalousie | open |  |
| `cover.eg_wohnen_jalousie_1` | EG_Wohnen_Jalousie_1 | open |  |
| `cover.eg_wohnen_jalousie_2` | EG_Wohnen_Jalousie_2 | open |  |
| `cover.og_ankleide_jalousie_1` | OG_Ankleide_Jalousie_1 | open |  |
| `cover.og_ankleide_jalousie_2` | OG_Ankleide_Jalousie_2 | open |  |
| `cover.og_bad_jalousie_1` | OG_Bad_Jalousie_1 | open |  |
| `cover.og_bad_jalousie_2` | OG_Bad_Jalousie_2 | open |  |
| `cover.og_flur_jalousie` | OG_Flur_Jalousie | open |  |
| `cover.og_zimmer1_jalousie` | OG_Zimmer1_Jalousie | open |  |
| `cover.og_zimmer2_jalousie` | OG_Zimmer2_Jalousie | open |  |

## device_tracker

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `device_tracker.iphone_von_david` | iPhone von David | not_home |  |

## event

37 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `event.backup_automatic_backup` | Backup Automatisches Backup | 2026-03-11T04:03:39.687+00:00 |  |
| `event.dg_bad_jalousie_eingang_0` | DG_Bad_Jalousie Eingang 0 | 2026-03-10T16:33:19.205+00:00 |  |
| `event.dg_bad_jalousie_eingang_1` | DG_Bad_Jalousie Eingang 1 | 2026-03-10T07:35:40.802+00:00 |  |
| `event.dg_buero_jalousie_eingang_0` | DG_Buero_Jalousie Eingang 0 | 2026-03-09T19:01:26.919+00:00 |  |
| `event.dg_buero_jalousie_eingang_1` | DG_Buero_Jalousie Eingang 1 | unknown |  |
| `event.dg_schlafen_jalousie_1_eingang_0` | DG_Schlafen_Jalousie_1 Eingang 0 | 2026-03-11T05:46:39.577+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_1` | DG_Schlafen_Jalousie_1 Eingang 1 | 2026-03-10T07:35:54.263+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_0` | DG_Schlafen_Jalousie_2 Eingang 0 | 2026-03-11T05:46:38.888+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_1` | DG_Schlafen_Jalousie_2 Eingang 1 | 2026-03-10T07:35:54.570+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_0` | EG_Diele_Jalousie-1 Eingang 0 | 2026-03-10T17:34:54.294+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_1` | EG_Diele_Jalousie-1 Eingang 1 | 2026-03-10T17:34:55.420+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_0` | EG_Diele_Jalousie-2 Eingang 0 | unknown |  |
| `event.eg_diele_jalousie_2_eingang_1` | EG_Diele_Jalousie-2 Eingang 1 | unknown |  |
| `event.eg_essen_jalousie_eingang_0` | EG_Essen_Jalousie Eingang 0 | 2026-03-11T12:38:59.861+00:00 |  |
| `event.eg_essen_jalousie_eingang_1` | EG_Essen_Jalousie Eingang 1 | 2026-03-11T12:39:04.593+00:00 |  |
| `event.eg_kueche_jalousie_eingang_0` | EG_Kueche_Jalousie Eingang 0 | 2026-03-10T18:44:41.872+00:00 |  |
| `event.eg_kueche_jalousie_eingang_1` | EG_Kueche_Jalousie Eingang 1 | 2026-03-10T18:46:00.439+00:00 |  |
| `event.eg_wc_jalousie_eingang_0` | EG_WC_Jalousie Eingang 0 | unknown |  |
| `event.eg_wc_jalousie_eingang_1` | EG_WC_Jalousie Eingang 1 | unknown |  |
| `event.eg_wohnen_jalousie_1_eingang_0` | EG_Wohnen_Jalousie_1 Eingang 0 | 2026-03-10T18:44:33.855+00:00 |  |
| `event.eg_wohnen_jalousie_1_eingang_1` | EG_Wohnen_Jalousie_1 Eingang 1 | 2026-03-10T06:47:47.959+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_0` | EG_Wohnen_Jalousie_2 Eingang 0 | 2026-03-10T18:44:35.795+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_1` | EG_Wohnen_Jalousie_2 Eingang 1 | 2026-03-10T06:47:57.833+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_0` | OG_Ankleide_Jalousie_1 Eingang 0 | 2026-03-11T05:46:08.234+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_1` | OG_Ankleide_Jalousie_1 Eingang 1 | 2026-03-09T18:52:19.936+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_0` | OG_Ankleide_Jalousie_2 Eingang 0 | 2026-03-11T05:46:08.820+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_1` | OG_Ankleide_Jalousie_2 Eingang 1 | unknown |  |
| `event.og_bad_jalousie_1_eingang_0` | OG_Bad_Jalousie_1 Eingang 0 | unknown |  |
| `event.og_bad_jalousie_1_eingang_1` | OG_Bad_Jalousie_1 Eingang 1 | 2026-03-09T18:51:07.920+00:00 |  |
| `event.og_bad_jalousie_2_eingang_0` | OG_Bad_Jalousie_2 Eingang 0 | 2026-03-11T05:21:54.086+00:00 |  |
| `event.og_bad_jalousie_2_eingang_1` | OG_Bad_Jalousie_2 Eingang 1 | 2026-03-10T17:31:47.046+00:00 |  |
| `event.og_flur_jalousie_eingang_0` | OG_Flur_Jalousie Eingang 0 | 2026-03-10T05:48:37.411+00:00 |  |
| `event.og_flur_jalousie_eingang_1` | OG_Flur_Jalousie Eingang 1 | unknown |  |
| `event.og_zimmer1_jalousie_eingang_0` | OG_Zimmer1_Jalousie Eingang 0 | 2026-03-11T06:26:57.420+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_1` | OG_Zimmer1_Jalousie Eingang 1 | 2026-03-10T19:13:01.543+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_0` | OG_Zimmer2_Jalousie Eingang 0 | 2026-03-11T05:15:14.441+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_1` | OG_Zimmer2_Jalousie Eingang 1 | 2026-03-10T19:29:03.301+00:00 |  |

## media_player

5 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `media_player.box` | Box | idle |  |
| `media_player.dg` | DG | idle |  |
| `media_player.eg` | HomePod-EG | idle |  |
| `media_player.lounge` | Lounge | off |  |
| `media_player.og` | OG | idle |  |

## number

25 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `number.battery_charging_start_power` | Battery charging start power | 0.0 | W |
| `number.battery_discharging_start_power` | Battery discharging start power | 0.0 | W |
| `number.battery_forced_charge_discharge_power` | Battery forced charge discharge power | 0.0 | W |
| `number.battery_max_charge_power` | Battery max charge power | 10600.0 | W |
| `number.battery_max_discharge_power` | Battery max discharge power | 10600.0 | W |
| `number.battery_max_soc` | Battery Max Soc | 100.0 | % |
| `number.battery_min_soc` | Battery Min Soc | 5.0 | % |
| `number.battery_reserved_soc_for_backup` | Battery Reserved SoC for Backup | 0.0 | % |
| `number.box_balance` | Box Balance | 0 |  |
| `number.box_bass` | Box Bass | 0 |  |
| `number.box_treble` | Box Höhen | 0 |  |
| `number.export_power_limit` | Export power limit | 1000.0 | W |
| `number.licv_8_2r1_3_desired_value` | LICV 8.2R1/3 desired value | 48.0 |  |
| `number.licv_8_2r1_3_heating_limit` | LICV 8.2R1/3 heating limit | 20.0 |  |
| `number.licv_8_2r1_3_offset_heizen` | LICV 8.2R1/3 Offset Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_mk1_heizen` | LICV 8.2R1/3 Offset MK1 Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen` | LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen_2` | LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw` | LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw_2` | LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_sollwert_heizen` | LICV 8.2R1/3 Sollwert Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_mk1_heizen` | LICV 8.2R1/3 Sollwert MK1 Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_warmw` | LICV 8.2R1/3 Sollwert Warmw. | 40.0 |  |
| `number.licv_8_2r1_3_targ_value` | LICV 8.2R1/3 targ.value | 55.0 |  |
| `number.licv_8_2r1_3_temperature` | LICV 8.2R1/3 temperature + - | 0.0 |  |

## person

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `person.david` | David | not_home |  |

## remote

4 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `remote.dg` | DG | on |  |
| `remote.eg` | HomePod-EG | on |  |
| `remote.lounge` | Lounge | on |  |
| `remote.og` | OG | on |  |

## scene

7 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `scene.battery_bypass_mode` | Battery Bypass Mode | unknown |  |
| `scene.battery_forced_charge` | Battery Forced Charge | unknown |  |
| `scene.battery_forced_discharge` | Battery Forced Discharge | unknown |  |
| `scene.max_export_power` | Max Export Power | unknown |  |
| `scene.self_consumption_mode_max_battery_discharge` | Self-Consumption Mode (max battery discharge) | unknown |  |
| `scene.self_consumption_mode_no_battery_discharge` | Self-Consumption Mode (no battery discharge) | unknown |  |
| `scene.zero_export_power` | Zero Export Power | unknown |  |

## select

16 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `select.battery_forced_charge_discharge` | Battery forced charge discharge | Forced charge |  |
| `select.ems_mode` | EMS mode | Self-consumption mode (default) |  |
| `select.licv_8_2r1_3_lpc_mode` | LICV 8.2R1/3 LPC mode | No limit |  |
| `select.licv_8_2r1_3_mode_of_operation` | LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_2` | LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_3` | LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_4` | LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_5` | LICV 8.2R1/3 mode of operation | Off |  |
| `select.licv_8_2r1_3_modus_heizen` | LICV 8.2R1/3 Modus Heizen | Off |  |
| `select.licv_8_2r1_3_modus_mk1_heizen` | LICV 8.2R1/3 Modus MK1 Heizen | Off |  |
| `select.licv_8_2r1_3_modus_overall_heizen` | LICV 8.2R1/3 Modus Overall Heizen | Individual |  |
| `select.licv_8_2r1_3_modus_warmw` | LICV 8.2R1/3 Modus Warmw. | Off |  |
| `select.licv_8_2r1_3_power_control_mode` | LICV 8.2R1/3 Power control mode | Individually |  |
| `select.licv_8_2r1_3_smart_mode` | LICV 8.2R1/3 Smart mode | Default |  |
| `select.load_adjustment_mode` | Load adjustment mode | Disabled |  |
| `select.solcast_pv_forecast_verwenden_sie_das_prognosefeld` | Solcast PV Forecast Verwenden Sie das Prognosefeld | estimate |  |

## sensor

363 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `sensor.1komma5_tagesforecast` | 1komma5 Tagesforecast | 2026-03-11 |  |
| `sensor.active_power_limitation_ratio_raw` | Active power limitation ratio raw | 6554 | % |
| `sensor.active_power_limitation_raw` | Active power limitation raw | 65535 |  |
| `sensor.apl_shutdown_at_zero_raw` | APL shutdown at zero raw | 85 |  |
| `sensor.autarkiegrad` | Autarkiegrad | 97.8 | % |
| `sensor.average_electricity_price` | Average electricity price | 0.1304 | €/kWh |
| `sensor.backup_backup_manager_state` | Backup Backup-Manager-Zustand | idle |  |
| `sensor.backup_last_attempted_automatic_backup` | Backup Letztes versuchtes automatisches Backup | 2026-03-11T04:03:36+00:00 |  |
| `sensor.backup_last_successful_automatic_backup` | Backup Letztes erfolgreiches automatisches Backup | 2026-03-11T04:03:39+00:00 |  |
| `sensor.backup_mode_raw` | Backup mode raw | 85 |  |
| `sensor.backup_next_scheduled_automatic_backup` | Backup Nächstes geplantes automatisches Backup | 2026-03-12T04:41:59+00:00 |  |
| `sensor.backup_phase_a_power` | Backup phase A power | 0 | W |
| `sensor.backup_phase_b_power` | Backup phase B power | 0 | W |
| `sensor.backup_phase_c_power` | Backup phase C power | 0 | W |
| `sensor.battery_capacity_high_precision` | Battery capacity high precision | 12.80 | kWh |
| `sensor.battery_charge` | Battery charge | 10.7 | kWh |
| `sensor.battery_charge_health_rated` | Battery charge (health-rated) | 10.59 | kWh |
| `sensor.battery_charge_nominal` | Battery charge (nominal) | 11.3 | kWh |
| `sensor.battery_charging_power` | Battery charging power | 1030 | W |
| `sensor.battery_charging_power_signed` | Battery charging power signed | 1030 | W |
| `sensor.battery_charging_start_power` | Battery charging start power | 0 | W |
| `sensor.battery_current` | Battery current | -3.7 | A |
| `sensor.battery_discharging_power` | Battery discharging power | 0 | W |
| `sensor.battery_discharging_power_signed` | Battery discharging power signed | -1030 | W |
| `sensor.battery_discharging_start_power` | Battery discharging start power | 0 | W |
| `sensor.battery_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 11.0428141987462 | kWh |
| `sensor.battery_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0508215538373194 | kWh |
| `sensor.battery_firmware_version` | Battery Firmware Version |                                |  |
| `sensor.battery_forced_charge_discharge_cmd_raw` | Battery forced charge discharge cmd raw | 170 |  |
| `sensor.battery_forced_charge_discharge_power` | Battery forced charge discharge power | 0 | W |
| `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1207.595 | W |
| `sensor.battery_level` | Battery level | 88.0 | % |
| `sensor.battery_level_nominal` | Battery level (nominal) | 88.6 | % |
| `sensor.battery_max_charge_power` | Battery max charge power | 10600 | W |
| `sensor.battery_max_discharge_power` | Battery max discharge power | 10600 | W |
| `sensor.battery_max_soc` | Battery max SoC | 100.0 | % |
| `sensor.battery_min_soc` | Battery min SoC | 5.0 | % |
| `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.battery_power` | Battery power | -1030 | W |
| `sensor.battery_reserved_soc_for_backup` | Battery reserved SoC for backup | 0 | % |
| `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery State of Charge 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 87.0 | % |
| `sensor.battery_state_of_health` | Battery state of health | 99 | % |
| `sensor.battery_temperature` | Battery temperature | 28.0 | °C |
| `sensor.battery_voltage` | Battery voltage | 269.0 | V |
| `sensor.bdc_rated_power` | BDC rated power | 10000 | W |
| `sensor.bms_max_charging_current` | BMS max. charging current | 30 | A |
| `sensor.bms_max_discharging_current` | BMS max. discharging current | 30 | A |
| `sensor.communication_module_firmware_version` | Communication Module Firmware Version |                                |  |
| `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Consumption Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 391.697 | W |
| `sensor.current_electricity_market_price` | Current electricity market price | 0.05625 | €/kWh |
| `sensor.current_percentage_in_electricity_price_range` | Current percentage in electricity price range | 17.9 | % |
| `sensor.current_percentage_of_highest_electricity_price` | Current percentage of highest electricity price | 21.7 | % |
| `sensor.daily_battery_charge` | Daily battery charge | 10.8 | kWh |
| `sensor.daily_battery_charge_from_pv` | Daily battery charge from PV | 10.8 | kWh |
| `sensor.daily_battery_discharge` | Daily battery discharge | 6.2 | kWh |
| `sensor.daily_consumed_energy` | Daily consumed energy | 9.2 | kWh |
| `sensor.daily_consumed_energy_filtered` | Daily consumed energy (filtered) | 9.23 | kWh |
| `sensor.daily_direct_energy_consumption` | Daily direct energy consumption | 2.7 | kWh |
| `sensor.daily_exported_energy` | Daily exported energy | 0.0 | kWh |
| `sensor.daily_exported_energy_from_pv` | Daily exported energy from PV | 0.0 | kWh |
| `sensor.daily_imported_energy` | Daily imported energy | 0.3 | kWh |
| `sensor.daily_pv_generation` | Daily PV generation | 13.5 | kWh |
| `sensor.daily_pv_generation_battery_discharge` | Daily PV generation & battery discharge | 8.3 | kWh |
| `sensor.dg_bad_jalousie_energie` | DG_Bad_Jalousie Energie | 0.139122 | kWh |
| `sensor.dg_bad_jalousie_leistung` | DG_Bad_Jalousie Leistung | 0.0 | W |
| `sensor.dg_buero_jalousie_energie` | DG_Buero_Jalousie Energie | 0.159991 | kWh |
| `sensor.dg_buero_jalousie_leistung` | DG_Buero_Jalousie Leistung | 0 | W |
| `sensor.dg_buero_workstation_energie` | DG_Buero_Workstation Energie | 13.350539 | kWh |
| `sensor.dg_buero_workstation_energieeinspeisung` | DG_Buero_Workstation Energieeinspeisung | 0.0 | kWh |
| `sensor.dg_buero_workstation_leistung` | DG_Buero_Workstation Leistung | 76.2 | W |
| `sensor.dg_schlafen_jalousie_1_energie` | DG_Schlafen_Jalousie_1 Energie | 0.080519 | kWh |
| `sensor.dg_schlafen_jalousie_1_leistung` | DG_Schlafen_Jalousie_1 Leistung | 0.0 | W |
| `sensor.dg_schlafen_jalousie_2_energie` | DG_Schlafen_Jalousie_2 Energie | 0.204 | kWh |
| `sensor.dg_schlafen_jalousie_2_leistung` | DG_Schlafen_Jalousie_2 Leistung | 0.0 | W |
| `sensor.ds218_cpu_auslastung_benutzer` | DS218 CPU-Auslastung (Benutzer) | 47 | % |
| `sensor.ds218_cpu_auslastung_gesamt` | DS218 CPU-Auslastung (gesamt) | 51 | % |
| `sensor.ds218_download_durchsatz` | DS218 Download-Durchsatz | 9.368 | kB/s |
| `sensor.ds218_drive_1_status` | DS218 (Drive 1) Status | normal |  |
| `sensor.ds218_drive_1_temperatur` | DS218 (Drive 1) Temperatur | 35 | °C |
| `sensor.ds218_drive_2_status` | DS218 (Drive 2) Status | normal |  |
| `sensor.ds218_drive_2_temperatur` | DS218 (Drive 2) Temperatur | 35 | °C |
| `sensor.ds218_durchschnittliche_cpu_last_15_min` | DS218 Durchschnittliche CPU-Last (15 min) | 1.09 | load |
| `sensor.ds218_durchschnittliche_cpu_last_5_min` | DS218 Durchschnittliche CPU-Last (5 min) | 1.14 | load |
| `sensor.ds218_speicher_gesamt_real` | DS218 Speicher gesamt (real) | 10282.41408 | MB |
| `sensor.ds218_speicher_gesamt_swap` | DS218 Speicher gesamt (Swap) | 8317.227008 | MB |
| `sensor.ds218_speicher_verfugbar_real` | DS218 Speicher verfügbar (real) | 648.704 | MB |
| `sensor.ds218_speicher_verfugbar_swap` | DS218 Speicher verfügbar (Swap) | 8029.810688 | MB |
| `sensor.ds218_speichernutzung_real` | DS218 Speichernutzung (real) | 24 | % |
| `sensor.ds218_temperatur` | DS218 Temperatur | 42 | °C |
| `sensor.ds218_upload_durchsatz` | DS218 Upload-Durchsatz | 0.886 | kB/s |
| `sensor.ds218_volume_1_belegter_speicherplatz` | DS218 (Volume 1) Belegter Speicherplatz | 3.675754348544 | TB |
| `sensor.ds218_volume_1_durchschnittliche_festplattentemperatur` | DS218 (Volume 1) Durchschnittliche Festplattentemperatur | 35.0 | °C |
| `sensor.ds218_volume_1_status` | DS218 (Volume 1) Status | normal |  |
| `sensor.ds218_volume_1_volume_nutzung` | DS218 (Volume 1) Volume-Nutzung | 63.9 | % |
| `sensor.eg_diele_jalousie_1_energie` | EG_Diele_Jalousie-1 Energie | 0.096826 | kWh |
| `sensor.eg_diele_jalousie_1_leistung` | EG_Diele_Jalousie-1 Leistung | 0.0 | W |
| `sensor.eg_diele_jalousie_2_energie` | EG_Diele_Jalousie-2 Energie | 0.104533 | kWh |
| `sensor.eg_diele_jalousie_2_leistung` | EG_Diele_Jalousie-2 Leistung | 0.0 | W |
| `sensor.eg_essen_jalousie_energie` | EG_Essen_Jalousie Energie | 0.494044 | kWh |
| `sensor.eg_essen_jalousie_leistung` | EG_Essen_Jalousie Leistung | 0 | W |
| `sensor.eg_kueche_jalousie_energie` | EG_Kueche_Jalousie Energie | 0.200774 | kWh |
| `sensor.eg_kueche_jalousie_leistung` | EG_Kueche_Jalousie Leistung | 0.0 | W |
| `sensor.eg_kueche_spuelmaschine_energie` | EG_Kueche_Spuelmaschine Energie | 61.978591 | kWh |
| `sensor.eg_kueche_spuelmaschine_energieeinspeisung` | EG_Kueche_Spuelmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_kueche_spuelmaschine_leistung` | EG_Kueche_Spuelmaschine Leistung | 0.0 | W |
| `sensor.eg_wc_jalousie_energie` | EG_WC_Jalousie Energie | 0.091821 | kWh |
| `sensor.eg_wc_jalousie_leistung` | EG_WC_Jalousie Leistung | 0.0 | W |
| `sensor.eg_wc_licht_energie` | EG_WC_Licht Energie | 0.055514 | kWh |
| `sensor.eg_wc_licht_energieeinspeisung` | EG_WC_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_wc_licht_leistung` | EG_WC_Licht Leistung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_1_energie` | EG_Wohnen_Jalousie_1 Energie | 0.267987 | kWh |
| `sensor.eg_wohnen_jalousie_1_leistung` | EG_Wohnen_Jalousie_1 Leistung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_2_energie` | EG_Wohnen_Jalousie_2 Energie | 0.463263 | kWh |
| `sensor.eg_wohnen_jalousie_2_leistung` | EG_Wohnen_Jalousie_2 Leistung | 0.0 | W |
| `sensor.eigenverbrauchsquote` | Eigenverbrauchsquote | 100.0 | % |
| `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Electricity Price 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.2215 | EUR/kWh |
| `sensor.ems_mode_selection_raw` | EMS mode selection raw | 0 |  |
| `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power` | Battery Power | -1030.0 | W |
| `sensor.energy_grid_import_power_export_power_net_power` | Grid Power | 0.0 | W |
| `sensor.entso_e_tagespreise` | ENTSO-e Tagespreise | 2026-03-11 |  |
| `sensor.ev_chargers_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | EV Chargers Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.ev_chargers_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | EV Chargers Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.export_power` | Export power | 0 | W |
| `sensor.export_power_limit` | Export power limit | 1000 | W |
| `sensor.export_power_limit_mode_raw` | Export power limit mode raw | 170 |  |
| `sensor.export_power_raw` | Export power raw | 0 | W |
| `sensor.grid_feed_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0742875255082692 | kWh |
| `sensor.grid_feed_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.345675001813863 | kWh |
| `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 20 | W |
| `sensor.grid_feed_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 20 | W |
| `sensor.grid_frequency` | Grid frequency | 49.99 | Hz |
| `sensor.heat_pumps_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Heat Pumps Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.heat_pumps_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Heat Pumps Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.highest_energy_price` | Highest energy price | 0.25969 | €/kWh |
| `sensor.hp_officejet_pro_8600` | HP Officejet Pro 8600 | idle |  |
| `sensor.hp_officejet_pro_8600_black_ink` | HP Officejet Pro 8600 black ink | 20 | % |
| `sensor.hp_officejet_pro_8600_cyan_ink` | HP Officejet Pro 8600 cyan ink | 90 | % |
| `sensor.hp_officejet_pro_8600_magenta_ink` | HP Officejet Pro 8600 magenta ink | 20 | % |
| `sensor.hp_officejet_pro_8600_yellow_ink` | HP Officejet Pro 8600 yellow ink | 30 | % |
| `sensor.import_power` | Import power | 0 | W |
| `sensor.inverter_firmware_version` | Inverter Firmware Version |                                |  |
| `sensor.inverter_rated_output` | Inverter rated output | 10000 | W |
| `sensor.inverter_temperature` | Inverter temperature | 49.0 | °C |
| `sensor.iphone_von_david_app_version` | iPhone von David App Version | 2026.2.1 |  |
| `sensor.iphone_von_david_audio_output` | iPhone von David Audio Output | unavailable |  |
| `sensor.iphone_von_david_battery_level` | iPhone von David Battery Level | 75 | % |
| `sensor.iphone_von_david_battery_state` | iPhone von David Battery State | Not Charging |  |
| `sensor.iphone_von_david_bssid` | iPhone von David BSSID | unavailable |  |
| `sensor.iphone_von_david_connection_type` | iPhone von David Connection Type | unavailable |  |
| `sensor.iphone_von_david_geocoded_location` | iPhone von David Geocoded Location | unavailable |  |
| `sensor.iphone_von_david_last_update_trigger` | iPhone von David Last Update Trigger | unavailable |  |
| `sensor.iphone_von_david_location_permission` | iPhone von David Location permission | Authorized when in use |  |
| `sensor.iphone_von_david_sim_1` | iPhone von David SIM 1 | unavailable |  |
| `sensor.iphone_von_david_sim_2` | iPhone von David SIM 2 | unavailable |  |
| `sensor.iphone_von_david_ssid` | iPhone von David SSID | unavailable |  |
| `sensor.iphone_von_david_storage` | iPhone von David Storage | unavailable |  |
| `sensor.kg_flur_kuehlschrank_energie` | KG_Flur_Kuehlschrank Energie | 16.753435 | kWh |
| `sensor.kg_flur_kuehlschrank_energieeinspeisung` | KG_Flur_Kuehlschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_flur_kuehlschrank_leistung` | KG_Flur_Kuehlschrank Leistung | 0.0 | W |
| `sensor.kg_keller_licht_energie` | KG_Keller_Licht Energie | 1.995383 | kWh |
| `sensor.kg_keller_licht_energieeinspeisung` | KG_Keller_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_keller_licht_leistung` | KG_Keller_Licht Leistung | 0.0 | W |
| `sensor.kg_technik_serverschrank_energie` | KG_Technik_Serverschrank Energie | 51.155341 | kWh |
| `sensor.kg_technik_serverschrank_energieeinspeisung` | KG_Technik_Serverschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_serverschrank_leistung` | KG_Technik_Serverschrank Leistung | 83.0 | W |
| `sensor.kg_technik_trockner_energie` | KG_Technik_Trockner Energie | 12.065149 | kWh |
| `sensor.kg_technik_trockner_energieeinspeisung` | KG_Technik_Trockner Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_trockner_leistung` | KG_Technik_Trockner Leistung | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_energie` | KG_Technik_Waermepumpe_3EM Energie | 789.56632 | kWh |
| `sensor.kg_technik_waermepumpe_3em_energieeinspeisung` | KG_Technik_Waermepumpe_3EM Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_waermepumpe_3em_leistung` | KG_Technik_Waermepumpe_3EM Leistung | 11.288 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistung` | KG_Technik_Waermepumpe_3EM Phase A Leistung | 4.1 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase A Leistungsfaktor | 0.05 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_a_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase A Scheinleistung | 78.6 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistung` | KG_Technik_Waermepumpe_3EM Phase B Leistung | 7.2 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase B Leistungsfaktor | 0.53 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_b_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase B Scheinleistung | 13.1 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistung` | KG_Technik_Waermepumpe_3EM Phase C Leistung | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase C Leistungsfaktor | 0.0 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_c_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase C Scheinleistung | 6.6 | VA |
| `sensor.kg_technik_waermepumpe_3em_scheinleistung` | KG_Technik_Waermepumpe_3EM Scheinleistung | 98.294 | VA |
| `sensor.kg_technik_waermepumpe_3em_temperatur` | KG_Technik_Waermepumpe_3EM Temperatur | 50.1 | °C |
| `sensor.kg_technik_waschmaschine_energie` | KG_Technik_Waschmaschine Energie | 32.678712 | kWh |
| `sensor.kg_technik_waschmaschine_energieeinspeisung` | KG_Technik_Waschmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_waschmaschine_leistung` | KG_Technik_Waschmaschine Leistung | 0.0 | W |
| `sensor.licv_8_2r1_3_ao_1` | LICV 8.2R1/3 AO 1 | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | LICV 8.2R1/3 AO 2 | 10.0 | V |
| `sensor.licv_8_2r1_3_cooling_enabled` | LICV 8.2R1/3 Cooling enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_coverage_hp` | LICV 8.2R1/3 coverage HP | 38.5 | °C |
| `sensor.licv_8_2r1_3_dhw` | LICV 8.2R1/3 DHW | 38.4 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | LICV 8.2R1/3 DHW | 38.4 | °C |
| `sensor.licv_8_2r1_3_dhw_demand_border` | LICV 8.2R1/3 DHW Demand border | 365.0 |  |
| `sensor.licv_8_2r1_3_dhw_target` | LICV 8.2R1/3 DHW target | 38.5 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | LICV 8.2R1/3 DHW temp. max. | 65.0 | °C |
| `sensor.licv_8_2r1_3_domestic_hot_water` | LICV 8.2R1/3 domestic hot water | 513.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | LICV 8.2R1/3 domestic hot water | 1547.8 | kWh |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | LICV 8.2R1/3 duration extra DHW | 7200.0 |  |
| `sensor.licv_8_2r1_3_error` | LICV 8.2R1/3 error | 51.0 |  |
| `sensor.licv_8_2r1_3_error_number` | LICV 8.2R1/3 error number | 0.0 |  |
| `sensor.licv_8_2r1_3_flow` | LICV 8.2R1/3 flow | 26.2 | °C |
| `sensor.licv_8_2r1_3_flow_rate` | LICV 8.2R1/3 flow rate | 0.0 | l/h |
| `sensor.licv_8_2r1_3_hd` | LICV 8.2R1/3 HD | 11.34 | bar |
| `sensor.licv_8_2r1_3_heat_generator_status` | LICV 8.2R1/3 Heat generator status | 0.0 |  |
| `sensor.licv_8_2r1_3_heat_source_inlet` | LICV 8.2R1/3 heat source inlet | 15.2 | °C |
| `sensor.licv_8_2r1_3_heating` | LICV 8.2R1/3 heating | 7069.9 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | LICV 8.2R1/3 heating | 18066.7 | kWh |
| `sensor.licv_8_2r1_3_heating_capacity` | LICV 8.2R1/3 Heating capacity | 0.0 | kW |
| `sensor.licv_8_2r1_3_heating_demand_border` | LICV 8.2R1/3 Heating demand border | 235.0 |  |
| `sensor.licv_8_2r1_3_impulse_vd1` | LICV 8.2R1/3 impulse VD1 | 1111.0 |  |
| `sensor.licv_8_2r1_3_integration` | LICV 8.2R1/3 integration | 1.0 |  |
| `sensor.licv_8_2r1_3_level_heizen` | LICV 8.2R1/3 Level Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_mk1_heizen` | LICV 8.2R1/3 Level MK1 Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_overall_heizen` | LICV 8.2R1/3 Level Overall Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_warmw` | LICV 8.2R1/3 Level Warmw. | 0.0 |  |
| `sensor.licv_8_2r1_3_max_flow_temp` | LICV 8.2R1/3 max. flow temp. | 60.0 | °C |
| `sensor.licv_8_2r1_3_maximaler_vorlauf_mk_1` | LICV 8.2R1/3 Maximaler Vorlauf MK 1 | 45.0 | °C |
| `sensor.licv_8_2r1_3_min_return_targ_temp` | LICV 8.2R1/3 min return targ.temp | 15.0 | °C |
| `sensor.licv_8_2r1_3_minimaler_vorlauf_mk_1` | LICV 8.2R1/3 Minimaler Vorlauf MK 1 | 20.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_flow` | LICV 8.2R1/3 mix circ1 flow | 75.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_target` | LICV 8.2R1/3 mix circ1 target | 25.6 | °C |
| `sensor.licv_8_2r1_3_nd` | LICV 8.2R1/3 ND | 11.35 | bar |
| `sensor.licv_8_2r1_3_operat_hours_heat` | LICV 8.2R1/3 operat. hours heat. | 3028.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | LICV 8.2R1/3 operating hours DHW | 306.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | LICV 8.2R1/3 operating hours HP | 3336.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | LICV 8.2R1/3 operating hours VD1 | 3336.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | LICV 8.2R1/3 operating hours ZWE1 | 696.0 | h |
| `sensor.licv_8_2r1_3_operation_mode` | LICV 8.2R1/3 operation mode | 5.0 |  |
| `sensor.licv_8_2r1_3_outdoor_temp` | LICV 8.2R1/3 outdoor temp. | 14.9 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | LICV 8.2R1/3 outdoor temp. ø | 11.7 | °C |
| `sensor.licv_8_2r1_3_pc_limit` | LICV 8.2R1/3 PC limit | 30.0 | kW |
| `sensor.licv_8_2r1_3_pool_enabled` | LICV 8.2R1/3 Pool enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_power_consumption` | LICV 8.2R1/3 Power Consumption | 0.0 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | LICV 8.2R1/3 Power consumption min | 6.0 |  |
| `sensor.licv_8_2r1_3_return` | LICV 8.2R1/3 return | 26.2 | °C |
| `sensor.licv_8_2r1_3_return_target` | LICV 8.2R1/3 return target | 25.6 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | LICV 8.2R1/3 return temp. limit. | 50.0 | °C |
| `sensor.licv_8_2r1_3_status_dhw` | LICV 8.2R1/3 Status DHW | 1.0 |  |
| `sensor.licv_8_2r1_3_status_heating` | LICV 8.2R1/3 Status Heating | 1.0 |  |
| `sensor.licv_8_2r1_3_total` | LICV 8.2R1/3 total | 7583.6 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | LICV 8.2R1/3 total heat quant. HS | 19614.5 | kWh |
| `sensor.licv_8_2r1_3_tvl_calc_max` | LICV 8.2R1/3 TVL calc max | 28.8 | °C |
| `sensor.load_adjustment_mode_enable_raw` | Load adjustment mode enable raw | 85 |  |
| `sensor.load_adjustment_mode_selection_raw` | Load adjustment mode selection raw | 3 |  |
| `sensor.load_power` | Load power | 335 | W |
| `sensor.lowest_energy_price` | Lowest energy price | 0.01179 | €/kWh |
| `sensor.meter_active_power` | Meter active power | 30 | W |
| `sensor.meter_phase_a_active_power` | Meter phase A active power | 24 | W |
| `sensor.meter_phase_a_current` | Meter phase A current | unavailable | A |
| `sensor.meter_phase_a_voltage` | Meter phase A voltage | unavailable | V |
| `sensor.meter_phase_b_active_power` | Meter phase B active power | 77 | W |
| `sensor.meter_phase_b_current` | Meter phase B current | unavailable | A |
| `sensor.meter_phase_b_voltage` | Meter phase B voltage | unavailable | V |
| `sensor.meter_phase_c_active_power` | Meter phase C active power | -61 | W |
| `sensor.meter_phase_c_current` | Meter phase C current | unavailable | A |
| `sensor.meter_phase_c_voltage` | Meter phase C voltage | unavailable | V |
| `sensor.mppt1_current` | MPPT1 current | 2.0 | A |
| `sensor.mppt1_power` | MPPT1 power | 799 | W |
| `sensor.mppt1_voltage` | MPPT1 voltage | 399.5 | V |
| `sensor.mppt2_current` | MPPT2 current | 1.9 | A |
| `sensor.mppt2_power` | MPPT2 power | 553 | W |
| `sensor.mppt2_voltage` | MPPT2 voltage | 291.5 | V |
| `sensor.mppt3_current` | MPPT3 current | 0.0 | A |
| `sensor.mppt3_power` | MPPT3 power | 0 | W |
| `sensor.mppt3_voltage` | MPPT3 voltage | 0.0 | V |
| `sensor.mppt4_current` | MPPT4 current | 0.0 | A |
| `sensor.mppt4_power` | MPPT4 power | 0 | W |
| `sensor.mppt4_voltage` | MPPT4 voltage | 0.0 | V |
| `sensor.next_hour_electricity_market_price` | Next hour electricity market price | 0.0944 | €/kWh |
| `sensor.og_ankleide_jalousie_1_energie` | OG_Ankleide_Jalousie_1 Energie | 0.095505 | kWh |
| `sensor.og_ankleide_jalousie_1_leistung` | OG_Ankleide_Jalousie_1 Leistung | 0.0 | W |
| `sensor.og_ankleide_jalousie_2_energie` | OG_Ankleide_Jalousie_2 Energie | 0.092551 | kWh |
| `sensor.og_ankleide_jalousie_2_leistung` | OG_Ankleide_Jalousie_2 Leistung | 0.0 | W |
| `sensor.og_ankleide_licht_energie` | OG_Ankleide_Licht Energie | 0.752925 | kWh |
| `sensor.og_ankleide_licht_energieeinspeisung` | OG_Ankleide_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_ankleide_licht_leistung` | OG_Ankleide_Licht Leistung | 0.0 | W |
| `sensor.og_bad_jalousie_1_energie` | OG_Bad_Jalousie_1 Energie | 0.047737 | kWh |
| `sensor.og_bad_jalousie_1_leistung` | OG_Bad_Jalousie_1 Leistung | 0.0 | W |
| `sensor.og_bad_jalousie_2_energie` | OG_Bad_Jalousie_2 Energie | 0.058241 | kWh |
| `sensor.og_bad_jalousie_2_leistung` | OG_Bad_Jalousie_2 Leistung | 0.0 | W |
| `sensor.og_bad_licht_energie` | OG_Bad_Licht Energie | 1.179617 | kWh |
| `sensor.og_bad_licht_energieeinspeisung` | OG_Bad_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_bad_licht_leistung` | OG_Bad_Licht Leistung | 0.0 | W |
| `sensor.og_flur_jalousie_energie` | OG_Flur_Jalousie Energie | 0.217393 | kWh |
| `sensor.og_flur_jalousie_leistung` | OG_Flur_Jalousie Leistung | 0.0 | W |
| `sensor.og_zimmer1_jalousie_energie` | OG_Zimmer1_Jalousie Energie | 0.191016 | kWh |
| `sensor.og_zimmer1_jalousie_leistung` | OG_Zimmer1_Jalousie Leistung | 0 | W |
| `sensor.og_zimmer1_licht_energie` | OG_Zimmer1_Licht Energie | 2.153477 | kWh |
| `sensor.og_zimmer1_licht_energieeinspeisung` | OG_Zimmer1_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer1_licht_leistung` | OG_Zimmer1_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_jalousie_energie` | OG_Zimmer2_Jalousie Energie | 0.140182 | kWh |
| `sensor.og_zimmer2_jalousie_leistung` | OG_Zimmer2_Jalousie Leistung | 0.0 | W |
| `sensor.og_zimmer2_licht_energie` | OG_Zimmer2_Licht Energie | 0.043028 | kWh |
| `sensor.og_zimmer2_licht_energieeinspeisung` | OG_Zimmer2_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_licht_leistung` | OG_Zimmer2_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_lichtstreifen_energie` | OG_Zimmer2_Lichtstreifen Energie | 2.020677 | kWh |
| `sensor.og_zimmer2_lichtstreifen_energieeinspeisung` | OG_Zimmer2_Lichtstreifen Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_lichtstreifen_leistung` | OG_Zimmer2_Lichtstreifen Leistung | 0.0 | W |
| `sensor.phase_a_current` | Phase A current | 0.6 | A |
| `sensor.phase_a_power` | Phase A power | 141 | W |
| `sensor.phase_a_voltage` | Phase A voltage | 235.1 | V |
| `sensor.phase_b_current` | Phase B current | 0.6 | A |
| `sensor.phase_b_power` | Phase B power | 141 | W |
| `sensor.phase_b_voltage` | Phase B voltage | 235.2 | V |
| `sensor.phase_c_current` | Phase C current | 0.6 | A |
| `sensor.phase_c_power` | Phase C power | 141 | W |
| `sensor.phase_c_voltage` | Phase C voltage | 236.0 | V |
| `sensor.power_factor` | Power factor | 1.000 | % |
| `sensor.power_flow_status` | Power Flow Status | 11 |  |
| `sensor.reactive_power` | Reactive power | -1 | W |
| `sensor.running_state_raw` | Running state raw | 33024 |  |
| `sensor.solar_energy_production_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Solar Energy Production 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 13.877392806608 | kWh |
| `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Solar Production Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1579.292 | W |
| `sensor.solcast_pv_forecast_aktuelle_leistung` | Solcast PV Forecast Aktuelle Leistung | 2526 | W |
| `sensor.solcast_pv_forecast_fester_grenzwert_eingestellt` | Solcast PV Forecast Fester Grenzwert eingestellt | False |  |
| `sensor.solcast_pv_forecast_leistung_in_1_stunde` | Solcast PV Forecast Leistung in 1 Stunde | 1383 | W |
| `sensor.solcast_pv_forecast_leistung_in_30_minuten` | Solcast PV Forecast Leistung in 30 Minuten | 1679 | W |
| `sensor.solcast_pv_forecast_max_api_abrufe` | Solcast PV Forecast max. API-Abrufe | 10 |  |
| `sensor.solcast_pv_forecast_prognose_aktuelle_stunde` | Solcast PV Forecast Prognose aktuelle Stunde | 1868 | Wh |
| `sensor.solcast_pv_forecast_prognose_heute` | Solcast PV Forecast Prognose heute | 15.137 | kWh |
| `sensor.solcast_pv_forecast_prognose_morgen` | Solcast PV Forecast Prognose morgen | 29.139 | kWh |
| `sensor.solcast_pv_forecast_prognose_nachste_stunde` | Solcast PV Forecast Prognose nächste Stunde | 1244 | Wh |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute` | Solcast PV Forecast Prognose Spitzenleistung heute | 3019 | W |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen` | Solcast PV Forecast Prognose Spitzenleistung morgen | 4526 | W |
| `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute` | Solcast PV Forecast Prognose verbleibende Leistung heute | 4.3402 | kWh |
| `sensor.solcast_pv_forecast_verwendete_api_abrufe` | Solcast PV Forecast Verwendete API-Abrufe | 8 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_letzter_api_abruf` | Solcast PV Forecast Zeitpunkt letzter API-Abruf | 2026-03-11T12:46:05+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_heute` | Solcast PV Forecast Zeitpunkt Spitzenleistung heute | 2026-03-11T10:30:00+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_morgen` | Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | 2026-03-12T11:00:00+00:00 |  |
| `sensor.sun_next_dawn` | Sun Nächste Morgendämmerung | 2026-03-12T05:14:07+00:00 |  |
| `sensor.sun_next_dusk` | Sun Nächste Abenddämmerung | 2026-03-11T17:56:43+00:00 |  |
| `sensor.sun_next_midnight` | Sun Nächste Mitternacht | 2026-03-11T23:35:44+00:00 |  |
| `sensor.sun_next_noon` | Sun Nächster Höchststand | 2026-03-12T11:35:50+00:00 |  |
| `sensor.sun_next_rising` | Sun Nächster Aufgang | 2026-03-12T05:46:08+00:00 |  |
| `sensor.sun_next_setting` | Sun Nächster Untergang | 2026-03-11T17:24:36+00:00 |  |
| `sensor.sungrow_arm_software` | Sungrow Arm Software | ARM_SAPPHIRE-H_V11_V01_B       |  |
| `sensor.sungrow_device_type` | Sungrow device type | SH10RT-20 |  |
| `sensor.sungrow_device_type_code` | Sungrow device type code | 3603 |  |
| `sensor.sungrow_dsp_software` | Sungrow DSP Software | MDSP_SAPPHIRE-H_V11_V01_B      |  |
| `sensor.sungrow_inverter_serial` | Sungrow inverter serial | A2352614033          |  |
| `sensor.sungrow_inverter_state` | Sungrow inverter state | Derating Running |  |
| `sensor.sungrow_protocol_version` | Sungrow Protocol Version | 16781568 |  |
| `sensor.sungrow_version_1` | Sungrow Version 1 | SAPPHIRE-H_01011.95.07 |  |
| `sensor.sungrow_version_2` | Sungrow Version 2 | unavailable |  |
| `sensor.sungrow_version_3` | Sungrow Version 3 | unavailable |  |
| `sensor.sungrow_version_4_sungrow_battery` | Sungrow Version 4 (Sungrow Battery) | unavailable |  |
| `sensor.time_of_highest_price` | Time of highest price | 2026-03-10T17:00:00+00:00 |  |
| `sensor.time_of_lowest_price` | Time of lowest price | 2026-03-11T11:00:00+00:00 |  |
| `sensor.total_active_power` | Total active power | 317 | W |
| `sensor.total_backup_power` | Total backup power | 0 | W |
| `sensor.total_battery_charge` | Total battery charge | 860.4 | kWh |
| `sensor.total_battery_charge_from_pv` | Total battery charge from PV | 796.6 | kWh |
| `sensor.total_battery_discharge` | Total battery discharge | 781.9 | kWh |
| `sensor.total_consumed_energy` | Total consumed energy | 8464.7 | kWh |
| `sensor.total_dc_power` | Total DC power | 1415 | W |
| `sensor.total_direct_energy_consumption` | Total direct energy consumption | 1374.0 | kWh |
| `sensor.total_exported_energy` | Total exported energy | 80.2 | kWh |
| `sensor.total_exported_energy_from_pv` | Total exported energy from PV | 83.8 | kWh |
| `sensor.total_imported_energy` | Total imported energy | 6369.0 | kWh |
| `sensor.total_pv_generation` | Total PV generation | 2254.4 | kWh |
| `sensor.total_pv_generation_battery_discharge` | Total PV generation & battery discharge | 2105.9 | kWh |
| `sensor.vorderer_schaftrieb_10` | Vorderer Schaftrieb 10 | 6.5847 | kWh |
| `sensor.vorderer_schaftrieb_10_west` | Vorderer Schaftrieb 10 (West) | 8.5523 | kWh |

## sun

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `sun.sun` | Sun | above_horizon |  |

## switch

27 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `switch.backup_mode` | Backup Mode | off |  |
| `switch.box_crossfade` | Box Überblenden | off |  |
| `switch.box_loudness` | Box Loudness | on |  |
| `switch.dg_buero_workstation` | DG_Buero_Workstation | on |  |
| `switch.eg_kueche_spuelmaschine` | EG_Kueche_Spuelmaschine | on |  |
| `switch.eg_wc_licht` | EG_WC_Licht | off |  |
| `switch.export_power_limit` | Export power limit | on |  |
| `switch.heartbeat_automatic_mode_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Heartbeat Automatic Mode 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | on |  |
| `switch.kg_flur_kuehlschrank` | KG_Flur_Kuehlschrank | on |  |
| `switch.kg_keller_licht` | KG_Keller_Licht | off |  |
| `switch.kg_technik_serverschrank` | KG_Technik_Serverschrank | on |  |
| `switch.kg_technik_trockner` | KG_Technik_Trockner | on |  |
| `switch.kg_technik_waschmaschine` | KG_Technik_Waschmaschine | on |  |
| `switch.licv_8_2r1_3_cooling_blocked` | LICV 8.2R1/3 Cooling blocked | off |  |
| `switch.licv_8_2r1_3_dhw_blocked` | LICV 8.2R1/3 DHW blocked | off |  |
| `switch.licv_8_2r1_3_extra_dhw` | LICV 8.2R1/3 Extra DHW | off |  |
| `switch.licv_8_2r1_3_heating_blocked` | LICV 8.2R1/3 Heating blocked | off |  |
| `switch.licv_8_2r1_3_high_speed_charge` | LICV 8.2R1/3 high-speed charge | off |  |
| `switch.licv_8_2r1_3_pool_blocked` | LICV 8.2R1/3 Pool blocked | off |  |
| `switch.licv_8_2r1_3_secondary_return` | LICV 8.2R1/3 secondary return | off |  |
| `switch.load_adjustment_mode` | Load adjustment mode | off |  |
| `switch.og_ankleide_licht` | OG_Ankleide_Licht | off |  |
| `switch.og_bad_licht` | OG_Bad_Licht | off |  |
| `switch.og_zimmer1_licht` | OG_Zimmer1_Licht | off |  |
| `switch.og_zimmer2_licht` | OG_Zimmer2_Licht | off |  |
| `switch.og_zimmer2_lichtstreifen` | OG_Zimmer2_Lichtstreifen | off |  |
| `switch.sungrow_dashboard_enable_danger_mode` | Sungrow dashboard enable danger mode | off |  |

## todo

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `todo.einkaufsliste` | Einkaufsliste | 0 |  |

## tts

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `tts.google_translate_en_com` | Google Translate en com | unknown |  |

## update

54 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `update.1komma5grad_update` | 1KOMMA5GRAD update | off |  |
| `update.apexcharts_card_update` | apexcharts-card update | off |  |
| `update.cloudflared_update` | Cloudflared Update | off |  |
| `update.dg_bad_jalousie_firmware` | DG_Bad_Jalousie Firmware | off |  |
| `update.dg_buero_jalousie_firmware` | DG_Buero_Jalousie Firmware | off |  |
| `update.dg_buero_workstation_firmware` | DG_Buero_Workstation Firmware | off |  |
| `update.dg_schlafen_jalousie_1_firmware` | DG_Schlafen_Jalousie_1 Firmware | off |  |
| `update.dg_schlafen_jalousie_2_firmware` | DG_Schlafen_Jalousie_2 Firmware | off |  |
| `update.ds218_dsm_update` | DS218 DSM-Update | off |  |
| `update.eg_diele_jalousie_1_firmware` | EG_Diele_Jalousie-1 Firmware | off |  |
| `update.eg_diele_jalousie_2_firmware` | EG_Diele_Jalousie-2 Firmware | off |  |
| `update.eg_essen_jalousie_firmware` | EG_Essen_Jalousie Firmware | off |  |
| `update.eg_kueche_jalousie_firmware` | EG_Kueche_Jalousie Firmware | off |  |
| `update.eg_kueche_spuelmaschine_firmware` | EG_Kueche_Spuelmaschine Firmware | off |  |
| `update.eg_wc_jalousie_firmware` | EG_WC_Jalousie Firmware | off |  |
| `update.eg_wc_licht_firmware` | EG_WC_Licht Firmware | off |  |
| `update.eg_wohnen_jalousie_1_firmware` | EG_Wohnen_Jalousie_1 Firmware | off |  |
| `update.eg_wohnen_jalousie_2_firmware` | EG_Wohnen_Jalousie_2 Firmware | off |  |
| `update.emhass_update` | EMHASS Update | off |  |
| `update.entso_e_transparency_platform_update` | ENTSO-e Transparency Platform update | off |  |
| `update.file_editor_update` | File editor Update | off |  |
| `update.get_hacs_update` | Get HACS Update | off |  |
| `update.grafana_update` | Grafana Update | off |  |
| `update.hacs_update` | HACS update | off |  |
| `update.home_assistant_core_update` | Home Assistant Core Update | off |  |
| `update.home_assistant_operating_system_update` | Home Assistant Operating System Update | off |  |
| `update.home_assistant_supervisor_update` | Home Assistant Supervisor Update | off |  |
| `update.influxdb_update` | InfluxDB Update | off |  |
| `update.kg_flur_kuehlschrank_firmware` | KG_Flur_Kuehlschrank Firmware | off |  |
| `update.kg_keller_licht_firmware` | KG_Keller_Licht Firmware | off |  |
| `update.kg_technik_serverschrank_firmware` | KG_Technik_Serverschrank Firmware | off |  |
| `update.kg_technik_trockner_firmware` | KG_Technik_Trockner Firmware | off |  |
| `update.kg_technik_waermepumpe_3em_firmware` | KG_Technik_Waermepumpe_3EM Firmware | off |  |
| `update.kg_technik_waschmaschine_firmware` | KG_Technik_Waschmaschine Firmware | off |  |
| `update.licv_8_2r1_3_firmware` | LICV 8.2R1/3 Firmware | off |  |
| `update.matter_server_update` | Matter Server Update | off |  |
| `update.mini_graph_card_update` | mini-graph-card update | off |  |
| `update.mosquitto_broker_update` | Mosquitto broker Update | off |  |
| `update.mushroom_update` | Mushroom update | off |  |
| `update.og_ankleide_jalousie_1_firmware` | OG_Ankleide_Jalousie_1 Firmware | off |  |
| `update.og_ankleide_jalousie_2_firmware` | OG_Ankleide_Jalousie_2 Firmware | off |  |
| `update.og_ankleide_licht_firmware` | OG_Ankleide_Licht Firmware | off |  |
| `update.og_bad_jalousie_1_firmware` | OG_Bad_Jalousie_1 Firmware | off |  |
| `update.og_bad_jalousie_2_firmware` | OG_Bad_Jalousie_2 Firmware | off |  |
| `update.og_bad_licht_firmware` | OG_Bad_Licht Firmware | off |  |
| `update.og_flur_jalousie_firmware` | OG_Flur_Jalousie Firmware | off |  |
| `update.og_zimmer1_jalousie_firmware` | OG_Zimmer1_Jalousie Firmware | off |  |
| `update.og_zimmer1_licht_firmware` | OG_Zimmer1_Licht Firmware | off |  |
| `update.og_zimmer2_jalousie_firmware` | OG_Zimmer2_Jalousie Firmware | off |  |
| `update.og_zimmer2_licht_firmware` | OG_Zimmer2_Licht Firmware | off |  |
| `update.og_zimmer2_lichtstreifen_firmware` | OG_Zimmer2_Lichtstreifen Firmware | off |  |
| `update.plotly_graph_card_update` | Plotly Graph Card update | off |  |
| `update.power_flow_card_plus_update` | Power Flow Card Plus update | off |  |
| `update.solcast_pv_forecast_update` | Solcast PV Forecast update | off |  |

## weather

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `weather.forecast_home` | Forecast Home | rainy |  |

## zone

1 Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `zone.home` | Home | 0 |  |
