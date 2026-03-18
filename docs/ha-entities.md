# Home Assistant Entitäten

> Automatisch generiert am **2026-03-18** — 794 Entitäten gesamt

## Inhaltsverzeichnis

- [automation](#automation) (5)
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
- [script](#script) (1)
- [select](#select) (16)
- [sensor](#sensor) (385)
- [sun](#sun) (1)
- [switch](#switch) (27)
- [todo](#todo) (1)
- [tts](#tts) (1)
- [update](#update) (55)
- [weather](#weather) (1)
- [zone](#zone) (1)

## Zusammenfassung nach Domain

| Domain | Anzahl | Beschreibung |
|---|---|---|
| `automation` | 5 | Automatisierungen und Regeln für die Hausautomation |
| `binary_sensor` | 165 | Binäre Sensoren (an/aus, true/false) für verschiedene Zustände |
| `button` | 36 | Schaltflächenentitäten für einmalige Aktionen und Befehle |
| `conversation` | 1 | Konversations-Integrationen für Sprachinteraktion |
| `cover` | 18 | Abdeckungen wie Jalousien, Rollläden, Garagen und Türen |
| `device_tracker` | 1 | Geräteverfolgung zur Standortbestimmung von Geräten |
| `event` | 37 | Ereignisse aus verschiedenen Integrationen und Geräten |
| `media_player` | 5 | Medienwiedergabegeräte wie Lautsprecher, Fernseher und Receiver |
| `number` | 25 | Numerische Eingabeentitäten für Einstellungen mit Zahlenwerten |
| `person` | 1 | Personenentitäten mit Statusverfolgung |
| `remote` | 4 | Fernbedienungs- und Infrarot-Geräte |
| `scene` | 7 | Szenen für vordefinierte Einstellungen mehrerer Entitäten |
| `script` | 1 | Skripte für automatisierte Abläufe |
| `select` | 16 | Dropdown-Auswahlentitäten für mehrere Optionen |
| `sensor` | 385 | Sensoren für Messwerte, Zustände und Informationen |
| `sun` | 1 | Sonnen- und Astro-Daten (Auf-/Untergang) |
| `switch` | 27 | Schalter zum Ein- und Ausschalten von Geräten |
| `todo` | 1 | To-Do Listen und Aufgaben |
| `tts` | 1 | Text-to-Speech für Sprachausgabe |
| `update` | 55 | Verfügbare Updates für Komponenten und Add-ons |
| `weather` | 1 | Wetterdaten und Vorhersagen |
| `zone` | 1 | Geografische Zonen für Ortsbestimmung |

---

## automation

**5 Entitäten** — Automatisierungen und Regeln für die Hausautomation

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `automation.emhass_day_ahead_optimierung` | EMHASS Day-Ahead Optimierung | on |  |
| `automation.jalousien_abends_schliessen` | Jalousien abends schließen | on |  |
| `automation.sungrow_dashboard_enable_danger_mode_auto_reset` | sungrow dashboard enable danger mode auto reset | on |  |
| `automation.sungrow_max_export_scene_sets_rated_limit` | sungrow max export scene sets rated limit | on |  |
| `automation.sungrow_self_consumption_mode_max_battery_discharge_scene_sets_rated_limit` | sungrow self consumption mode max battery discharge scene sets rated limit | on |  |

## binary_sensor

**165 Entitäten** — Binäre Sensoren (an/aus, true/false) für verschiedene Zustände

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `binary_sensor.battery_charging` | Battery charging | off |  |
| `binary_sensor.battery_charging_delay` | Battery charging (delay) | off |  |
| `binary_sensor.battery_discharging` | Battery discharging | on |  |
| `binary_sensor.battery_discharging_delay` | Battery discharging (delay) | on |  |
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
| `binary_sensor.licv_8_2r1_3_asd` | LICV 8.2R1/3 ASD | on |  |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | LICV 8.2R1/3 BUP - DHW pump | off |  |
| `binary_sensor.licv_8_2r1_3_el_heater` | LICV 8.2R1/3 el. heater | off |  |
| `binary_sensor.licv_8_2r1_3_evu` | LICV 8.2R1/3 EVU | on |  |
| `binary_sensor.licv_8_2r1_3_evu_2` | LICV 8.2R1/3 EVU 2 | off |  |
| `binary_sensor.licv_8_2r1_3_hd` | LICV 8.2R1/3 HD | off |  |
| `binary_sensor.licv_8_2r1_3_hup` | LICV 8.2R1/3 HUP | on |  |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | LICV 8.2R1/3 Konnektivität | on |  |
| `binary_sensor.licv_8_2r1_3_mot` | LICV 8.2R1/3 MOT | on |  |
| `binary_sensor.licv_8_2r1_3_vbo` | LICV 8.2R1/3 VBO | on |  |
| `binary_sensor.licv_8_2r1_3_vd1` | LICV 8.2R1/3 VD1 | on |  |
| `binary_sensor.licv_8_2r1_3_zip` | LICV 8.2R1/3 ZIP | off |  |
| `binary_sensor.licv_8_2r1_3_zup` | LICV 8.2R1/3 ZUP | on |  |
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
| `binary_sensor.og_bad_licht_eingang_0` | OG_Bad_Licht Eingang 0 | off |  |
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
| `binary_sensor.pv_generating` | PV generating | off |  |
| `binary_sensor.pv_generating_delay` | PV generating (delay) | off |  |

## button

**36 Entitäten** — Schaltflächenentitäten für einmalige Aktionen und Befehle

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

**1 Entitäten** — Konversations-Integrationen für Sprachinteraktion

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `conversation.home_assistant` | Home Assistant | 2026-03-08T20:43:20.952038+00:00 |  |

## cover

**18 Entitäten** — Abdeckungen wie Jalousien, Rollläden, Garagen und Türen

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `cover.dg_bad_jalousie` | DG_Bad_Jalousie | closed |  |
| `cover.dg_buero_jalousie` | DG_Buero_Jalousie | closed |  |
| `cover.dg_schlafen_jalousie_1` | DG_Schlafen_Jalousie_1 | open |  |
| `cover.dg_schlafen_jalousie_2` | DG_Schlafen_Jalousie_2 | closed |  |
| `cover.eg_diele_jalousie_1` | EG_Diele_Jalousie-1 | closed |  |
| `cover.eg_diele_jalousie_2` | EG_Diele_Jalousie-2 | closed |  |
| `cover.eg_essen_jalousie` | EG_Essen_Jalousie | open |  |
| `cover.eg_kueche_jalousie` | EG_Kueche_Jalousie | open |  |
| `cover.eg_wc_jalousie` | EG_WC_Jalousie | closed |  |
| `cover.eg_wohnen_jalousie_1` | EG_Wohnen_Jalousie_1 | closed |  |
| `cover.eg_wohnen_jalousie_2` | EG_Wohnen_Jalousie_2 | closed |  |
| `cover.og_ankleide_jalousie_1` | OG_Ankleide_Jalousie_1 | closed |  |
| `cover.og_ankleide_jalousie_2` | OG_Ankleide_Jalousie_2 | closed |  |
| `cover.og_bad_jalousie_1` | OG_Bad_Jalousie_1 | closed |  |
| `cover.og_bad_jalousie_2` | OG_Bad_Jalousie_2 | closed |  |
| `cover.og_flur_jalousie` | OG_Flur_Jalousie | closed |  |
| `cover.og_zimmer1_jalousie` | OG_Zimmer1_Jalousie | closed |  |
| `cover.og_zimmer2_jalousie` | OG_Zimmer2_Jalousie | open |  |

## device_tracker

**1 Entitäten** — Geräteverfolgung zur Standortbestimmung von Geräten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `device_tracker.iphone_von_david` | iPhone von David | not_home |  |

## event

**37 Entitäten** — Ereignisse aus verschiedenen Integrationen und Geräten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `event.backup_automatic_backup` | Backup Automatisches Backup | 2026-03-18T04:15:03.823+00:00 |  |
| `event.dg_bad_jalousie_eingang_0` | DG_Bad_Jalousie Eingang 0 | 2026-03-14T10:00:14.144+00:00 |  |
| `event.dg_bad_jalousie_eingang_1` | DG_Bad_Jalousie Eingang 1 | 2026-03-10T07:35:40.802+00:00 |  |
| `event.dg_buero_jalousie_eingang_0` | DG_Buero_Jalousie Eingang 0 | 2026-03-16T21:42:30.406+00:00 |  |
| `event.dg_buero_jalousie_eingang_1` | DG_Buero_Jalousie Eingang 1 | 2026-03-13T05:27:49.668+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_0` | DG_Schlafen_Jalousie_1 Eingang 0 | 2026-03-14T07:15:32.091+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_1` | DG_Schlafen_Jalousie_1 Eingang 1 | 2026-03-14T05:14:05.163+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_0` | DG_Schlafen_Jalousie_2 Eingang 0 | 2026-03-14T07:15:32.536+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_1` | DG_Schlafen_Jalousie_2 Eingang 1 | 2026-03-14T05:02:56.031+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_0` | EG_Diele_Jalousie-1 Eingang 0 | 2026-03-10T17:34:54.294+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_1` | EG_Diele_Jalousie-1 Eingang 1 | 2026-03-17T18:13:59.736+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_0` | EG_Diele_Jalousie-2 Eingang 0 | 2026-03-18T06:27:50.610+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_1` | EG_Diele_Jalousie-2 Eingang 1 | 2026-03-17T18:13:58.517+00:00 |  |
| `event.eg_essen_jalousie_eingang_0` | EG_Essen_Jalousie Eingang 0 | 2026-03-18T17:13:13.954+00:00 |  |
| `event.eg_essen_jalousie_eingang_1` | EG_Essen_Jalousie Eingang 1 | 2026-03-18T11:35:12.171+00:00 |  |
| `event.eg_kueche_jalousie_eingang_0` | EG_Kueche_Jalousie Eingang 0 | 2026-03-18T17:13:14.466+00:00 |  |
| `event.eg_kueche_jalousie_eingang_1` | EG_Kueche_Jalousie Eingang 1 | 2026-03-18T11:35:33.935+00:00 |  |
| `event.eg_wc_jalousie_eingang_0` | EG_WC_Jalousie Eingang 0 | unknown |  |
| `event.eg_wc_jalousie_eingang_1` | EG_WC_Jalousie Eingang 1 | unknown |  |
| `event.eg_wohnen_jalousie_1_eingang_0` | EG_Wohnen_Jalousie_1 Eingang 0 | 2026-03-14T22:48:17.189+00:00 |  |
| `event.eg_wohnen_jalousie_1_eingang_1` | EG_Wohnen_Jalousie_1 Eingang 1 | 2026-03-18T20:02:17.415+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_0` | EG_Wohnen_Jalousie_2 Eingang 0 | 2026-03-14T22:48:20.666+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_1` | EG_Wohnen_Jalousie_2 Eingang 1 | 2026-03-18T20:02:17.803+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_0` | OG_Ankleide_Jalousie_1 Eingang 0 | 2026-03-18T06:07:46.703+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_1` | OG_Ankleide_Jalousie_1 Eingang 1 | 2026-03-18T18:21:11.696+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_0` | OG_Ankleide_Jalousie_2 Eingang 0 | 2026-03-18T06:07:41.151+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_1` | OG_Ankleide_Jalousie_2 Eingang 1 | 2026-03-18T18:21:12.295+00:00 |  |
| `event.og_bad_jalousie_1_eingang_0` | OG_Bad_Jalousie_1 Eingang 0 | 2026-03-14T16:40:32.165+00:00 |  |
| `event.og_bad_jalousie_1_eingang_1` | OG_Bad_Jalousie_1 Eingang 1 | 2026-03-09T18:51:07.920+00:00 |  |
| `event.og_bad_jalousie_2_eingang_0` | OG_Bad_Jalousie_2 Eingang 0 | 2026-03-17T19:04:35.724+00:00 |  |
| `event.og_bad_jalousie_2_eingang_1` | OG_Bad_Jalousie_2 Eingang 1 | 2026-03-17T19:04:33.597+00:00 |  |
| `event.og_flur_jalousie_eingang_0` | OG_Flur_Jalousie Eingang 0 | 2026-03-10T05:48:37.411+00:00 |  |
| `event.og_flur_jalousie_eingang_1` | OG_Flur_Jalousie Eingang 1 | 2026-03-18T18:20:57.193+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_0` | OG_Zimmer1_Jalousie Eingang 0 | 2026-03-18T05:53:07.059+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_1` | OG_Zimmer1_Jalousie Eingang 1 | 2026-03-18T19:24:10.311+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_0` | OG_Zimmer2_Jalousie Eingang 0 | 2026-03-18T12:47:42.810+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_1` | OG_Zimmer2_Jalousie Eingang 1 | 2026-03-18T19:03:19.877+00:00 |  |

## media_player

**5 Entitäten** — Medienwiedergabegeräte wie Lautsprecher, Fernseher und Receiver

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `media_player.box` | Box | idle |  |
| `media_player.dg` | DG | playing |  |
| `media_player.eg` | HomePod-EG | idle |  |
| `media_player.lounge` | Lounge | playing |  |
| `media_player.og` | OG | idle |  |

## number

**25 Entitäten** — Numerische Eingabeentitäten für Einstellungen mit Zahlenwerten

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
| `number.export_power_limit` | Export power limit | 10000.0 | W |
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
| `number.licv_8_2r1_3_sollwert_warmw` | LICV 8.2R1/3 Sollwert Warmw. | 46.0 |  |
| `number.licv_8_2r1_3_targ_value` | LICV 8.2R1/3 targ.value | 55.0 |  |
| `number.licv_8_2r1_3_temperature` | LICV 8.2R1/3 temperature + - | 0.0 |  |

## person

**1 Entitäten** — Personenentitäten mit Statusverfolgung

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `person.david` | David | not_home |  |

## remote

**4 Entitäten** — Fernbedienungs- und Infrarot-Geräte

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `remote.dg` | DG | on |  |
| `remote.eg` | HomePod-EG | on |  |
| `remote.lounge` | Lounge | on |  |
| `remote.og` | OG | on |  |

## scene

**7 Entitäten** — Szenen für vordefinierte Einstellungen mehrerer Entitäten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `scene.battery_bypass_mode` | Battery Bypass Mode | unknown |  |
| `scene.battery_forced_charge` | Battery Forced Charge | unknown |  |
| `scene.battery_forced_discharge` | Battery Forced Discharge | unknown |  |
| `scene.max_export_power` | Max Export Power | unknown |  |
| `scene.self_consumption_mode_max_battery_discharge` | Self-Consumption Mode (max battery discharge) | unknown |  |
| `scene.self_consumption_mode_no_battery_discharge` | Self-Consumption Mode (no battery discharge) | unknown |  |
| `scene.zero_export_power` | Zero Export Power | unknown |  |

## script

**1 Entitäten** — Skripte für automatisierte Abläufe

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `script.batterie_zwangsladen` | Batterie Zwangsladen | off |  |

## select

**16 Entitäten** — Dropdown-Auswahlentitäten für mehrere Optionen

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

**385 Entitäten** — Sensoren für Messwerte, Zustände und Informationen

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `sensor.1komma5_tagesforecast` | 1komma5 Tagesforecast | 2026-03-18 |  |
| `sensor.active_power_limitation_ratio_raw` | Active power limitation ratio raw | 6554 | % |
| `sensor.active_power_limitation_raw` | Active power limitation raw | 65535 |  |
| `sensor.apl_shutdown_at_zero_raw` | APL shutdown at zero raw | 85 |  |
| `sensor.autarkiegrad` | Autarkiegrad | 76.5 | % |
| `sensor.average_electricity_price` | Average electricity price | 0.12061 | €/kWh |
| `sensor.backup_backup_manager_state` | Backup Backup-Manager-Zustand | idle |  |
| `sensor.backup_last_attempted_automatic_backup` | Backup Letztes versuchtes automatisches Backup | 2026-03-18T04:14:56+00:00 |  |
| `sensor.backup_last_successful_automatic_backup` | Backup Letztes erfolgreiches automatisches Backup | 2026-03-18T04:15:03+00:00 |  |
| `sensor.backup_mode_raw` | Backup mode raw | 85 |  |
| `sensor.backup_next_scheduled_automatic_backup` | Backup Nächstes geplantes automatisches Backup | 2026-03-19T04:43:18+00:00 |  |
| `sensor.backup_phase_a_power` | Backup phase A power | 0 | W |
| `sensor.backup_phase_b_power` | Backup phase B power | 0 | W |
| `sensor.backup_phase_c_power` | Backup phase C power | 0 | W |
| `sensor.battery_capacity_high_precision` | Battery capacity high precision | 12.80 | kWh |
| `sensor.battery_charge` | Battery charge | 6.23 | kWh |
| `sensor.battery_charge_health_rated` | Battery charge (health-rated) | 6.17 | kWh |
| `sensor.battery_charge_nominal` | Battery charge (nominal) | 6.9 | kWh |
| `sensor.battery_charging_power` | Battery charging power | 0 | W |
| `sensor.battery_charging_power_signed` | Battery charging power signed | -1000 | W |
| `sensor.battery_charging_start_power` | Battery charging start power | 0 | W |
| `sensor.battery_current` | Battery current | 3.6 | A |
| `sensor.battery_discharging_power` | Battery discharging power | 1000 | W |
| `sensor.battery_discharging_power_signed` | Battery discharging power signed | 1000 | W |
| `sensor.battery_discharging_start_power` | Battery discharging start power | 0 | W |
| `sensor.battery_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.battery_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.598875821925819 | kWh |
| `sensor.battery_firmware_version` | Battery Firmware Version |                                |  |
| `sensor.battery_forced_charge_discharge_cmd_raw` | Battery forced charge discharge cmd raw | 170 |  |
| `sensor.battery_forced_charge_discharge_power` | Battery forced charge discharge power | 0 | W |
| `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.battery_level` | Battery level | 51.2 | % |
| `sensor.battery_level_nominal` | Battery level (nominal) | 53.6 | % |
| `sensor.battery_max_charge_power` | Battery max charge power | 10600 | W |
| `sensor.battery_max_discharge_power` | Battery max discharge power | 10600 | W |
| `sensor.battery_max_soc` | Battery max SoC | 100.0 | % |
| `sensor.battery_min_soc` | Battery min SoC | 5.0 | % |
| `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1004.094 | W |
| `sensor.battery_power` | Battery power | 1000 | W |
| `sensor.battery_reserved_soc_for_backup` | Battery reserved SoC for backup | 0 | % |
| `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Battery State of Charge 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 50.0 | % |
| `sensor.battery_state_of_health` | Battery state of health | 99 | % |
| `sensor.battery_temperature` | Battery temperature | 25.0 | °C |
| `sensor.battery_voltage` | Battery voltage | 261.3 | V |
| `sensor.bdc_rated_power` | BDC rated power | 10000 | W |
| `sensor.bms_max_charging_current` | BMS max. charging current | 30 | A |
| `sensor.bms_max_discharging_current` | BMS max. discharging current | 30 | A |
| `sensor.communication_module_firmware_version` | Communication Module Firmware Version |                                |  |
| `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Consumption Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1009.571 | W |
| `sensor.current_electricity_market_price` | Current electricity market price | 0.13492 | €/kWh |
| `sensor.current_percentage_in_electricity_price_range` | Current percentage in electricity price range | 53.5 | % |
| `sensor.current_percentage_of_highest_electricity_price` | Current percentage of highest electricity price | 52.9 | % |
| `sensor.daily_battery_charge` | Daily battery charge | 12.8 | kWh |
| `sensor.daily_battery_charge_from_pv` | Daily battery charge from PV | 12.8 | kWh |
| `sensor.daily_battery_discharge` | Daily battery discharge | 8.9 | kWh |
| `sensor.daily_consumed_energy` | Daily consumed energy | 22.9 | kWh |
| `sensor.daily_consumed_energy_filtered` | Daily consumed energy (filtered) | 22.7 | kWh |
| `sensor.daily_direct_energy_consumption` | Daily direct energy consumption | 7.6 | kWh |
| `sensor.daily_exported_energy` | Daily exported energy | 14.4 | kWh |
| `sensor.daily_exported_energy_from_pv` | Daily exported energy from PV | 14.5 | kWh |
| `sensor.daily_imported_energy` | Daily imported energy | 6.3 | kWh |
| `sensor.daily_pv_generation` | Daily PV generation | 34.9 | kWh |
| `sensor.daily_pv_generation_battery_discharge` | Daily PV generation & battery discharge | 29.9 | kWh |
| `sensor.dg_bad_jalousie_energie` | DG_Bad_Jalousie Energie | 0.159528 | kWh |
| `sensor.dg_bad_jalousie_leistung` | DG_Bad_Jalousie Leistung | 0.0 | W |
| `sensor.dg_buero_jalousie_energie` | DG_Buero_Jalousie Energie | 0.182944 | kWh |
| `sensor.dg_buero_jalousie_leistung` | DG_Buero_Jalousie Leistung | 0.0 | W |
| `sensor.dg_buero_workstation_energie` | DG_Buero_Workstation Energie | 15.937189 | kWh |
| `sensor.dg_buero_workstation_energieeinspeisung` | DG_Buero_Workstation Energieeinspeisung | 0.0 | kWh |
| `sensor.dg_buero_workstation_leistung` | DG_Buero_Workstation Leistung | 0.0 | W |
| `sensor.dg_schlafen_jalousie_1_energie` | DG_Schlafen_Jalousie_1 Energie | 0.085622 | kWh |
| `sensor.dg_schlafen_jalousie_1_leistung` | DG_Schlafen_Jalousie_1 Leistung | 0.0 | W |
| `sensor.dg_schlafen_jalousie_2_energie` | DG_Schlafen_Jalousie_2 Energie | 0.224368 | kWh |
| `sensor.dg_schlafen_jalousie_2_leistung` | DG_Schlafen_Jalousie_2 Leistung | 0.0 | W |
| `sensor.ds218_cpu_auslastung_benutzer` | DS218 CPU-Auslastung (Benutzer) | 51 | % |
| `sensor.ds218_cpu_auslastung_gesamt` | DS218 CPU-Auslastung (gesamt) | 54 | % |
| `sensor.ds218_download_durchsatz` | DS218 Download-Durchsatz | 2.907 | kB/s |
| `sensor.ds218_drive_1_status` | DS218 (Drive 1) Status | normal |  |
| `sensor.ds218_drive_1_temperatur` | DS218 (Drive 1) Temperatur | 36 | °C |
| `sensor.ds218_drive_2_status` | DS218 (Drive 2) Status | normal |  |
| `sensor.ds218_drive_2_temperatur` | DS218 (Drive 2) Temperatur | 35 | °C |
| `sensor.ds218_durchschnittliche_cpu_last_15_min` | DS218 Durchschnittliche CPU-Last (15 min) | 1.06 | load |
| `sensor.ds218_durchschnittliche_cpu_last_5_min` | DS218 Durchschnittliche CPU-Last (5 min) | 1.15 | load |
| `sensor.ds218_speicher_gesamt_real` | DS218 Speicher gesamt (real) | 10282.41408 | MB |
| `sensor.ds218_speicher_gesamt_swap` | DS218 Speicher gesamt (Swap) | 8317.227008 | MB |
| `sensor.ds218_speicher_verfugbar_real` | DS218 Speicher verfügbar (real) | 559.886336 | MB |
| `sensor.ds218_speicher_verfugbar_swap` | DS218 Speicher verfügbar (Swap) | 7979.90912 | MB |
| `sensor.ds218_speichernutzung_real` | DS218 Speichernutzung (real) | 21 | % |
| `sensor.ds218_temperatur` | DS218 Temperatur | 43 | °C |
| `sensor.ds218_upload_durchsatz` | DS218 Upload-Durchsatz | 1.1 | kB/s |
| `sensor.ds218_volume_1_belegter_speicherplatz` | DS218 (Volume 1) Belegter Speicherplatz | 3.668687065088 | TB |
| `sensor.ds218_volume_1_durchschnittliche_festplattentemperatur` | DS218 (Volume 1) Durchschnittliche Festplattentemperatur | 36.0 | °C |
| `sensor.ds218_volume_1_status` | DS218 (Volume 1) Status | normal |  |
| `sensor.ds218_volume_1_volume_nutzung` | DS218 (Volume 1) Volume-Nutzung | 63.7 | % |
| `sensor.eg_diele_jalousie_1_energie` | EG_Diele_Jalousie-1 Energie | 0.115131 | kWh |
| `sensor.eg_diele_jalousie_1_leistung` | EG_Diele_Jalousie-1 Leistung | 0.0 | W |
| `sensor.eg_diele_jalousie_2_energie` | EG_Diele_Jalousie-2 Energie | 0.122768 | kWh |
| `sensor.eg_diele_jalousie_2_leistung` | EG_Diele_Jalousie-2 Leistung | 0.0 | W |
| `sensor.eg_essen_jalousie_energie` | EG_Essen_Jalousie Energie | 0.521538 | kWh |
| `sensor.eg_essen_jalousie_leistung` | EG_Essen_Jalousie Leistung | 0.0 | W |
| `sensor.eg_kueche_jalousie_energie` | EG_Kueche_Jalousie Energie | 0.207716 | kWh |
| `sensor.eg_kueche_jalousie_leistung` | EG_Kueche_Jalousie Leistung | 0.0 | W |
| `sensor.eg_kueche_spuelmaschine_energie` | EG_Kueche_Spuelmaschine Energie | 71.361417 | kWh |
| `sensor.eg_kueche_spuelmaschine_energieeinspeisung` | EG_Kueche_Spuelmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_kueche_spuelmaschine_leistung` | EG_Kueche_Spuelmaschine Leistung | 0.0 | W |
| `sensor.eg_wc_jalousie_energie` | EG_WC_Jalousie Energie | 0.110668 | kWh |
| `sensor.eg_wc_jalousie_leistung` | EG_WC_Jalousie Leistung | 0.0 | W |
| `sensor.eg_wc_licht_energie` | EG_WC_Licht Energie | 0.063327 | kWh |
| `sensor.eg_wc_licht_energieeinspeisung` | EG_WC_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_wc_licht_leistung` | EG_WC_Licht Leistung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_1_energie` | EG_Wohnen_Jalousie_1 Energie | 0.291347 | kWh |
| `sensor.eg_wohnen_jalousie_1_leistung` | EG_Wohnen_Jalousie_1 Leistung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_2_energie` | EG_Wohnen_Jalousie_2 Energie | 0.48805 | kWh |
| `sensor.eg_wohnen_jalousie_2_leistung` | EG_Wohnen_Jalousie_2 Leistung | 0.0 | W |
| `sensor.eigenverbrauchsquote` | Eigenverbrauchsquote | 58.7 | % |
| `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Electricity Price 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.3002 | EUR/kWh |
| `sensor.ems_mode_selection_raw` | EMS mode selection raw | 0 |  |
| `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power` | Battery Power | 1000.0 | W |
| `sensor.energy_grid_import_power_export_power_net_power` | Grid Power | 0.0 | W |
| `sensor.entso_e_tagespreise` | ENTSO-e Tagespreise | 2026-03-18 |  |
| `sensor.ev_chargers_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | EV Chargers Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.ev_chargers_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | EV Chargers Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.export_power` | Export power | 0 | W |
| `sensor.export_power_limit` | Export power limit | 10000 | W |
| `sensor.export_power_limit_mode_raw` | Export power limit mode raw | 170 |  |
| `sensor.export_power_raw` | Export power raw | 0 | W |
| `sensor.grid_feed_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.00200943670290583 | kWh |
| `sensor.grid_feed_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.00389506382773361 | kWh |
| `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 5.477 | W |
| `sensor.grid_feed_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Grid Feed Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 5.477 | W |
| `sensor.grid_frequency` | Grid frequency | 49.98 | Hz |
| `sensor.heat_pumps_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Heat Pumps Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.heat_pumps_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Heat Pumps Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.highest_energy_price` | Highest energy price | 0.25511 | €/kWh |
| `sensor.hp_officejet_pro_8600` | sensor.hp_officejet_pro_8600 | unavailable |  |
| `sensor.hp_officejet_pro_8600_black_ink` | black ink | unavailable | % |
| `sensor.hp_officejet_pro_8600_cyan_ink` | cyan ink | unavailable | % |
| `sensor.hp_officejet_pro_8600_magenta_ink` | magenta ink | unavailable | % |
| `sensor.hp_officejet_pro_8600_yellow_ink` | yellow ink | unavailable | % |
| `sensor.import_power` | Import power | 0 | W |
| `sensor.inverter_firmware_version` | Inverter Firmware Version |                                |  |
| `sensor.inverter_rated_output` | Inverter rated output | 10000 | W |
| `sensor.inverter_temperature` | Inverter temperature | 41.6 | °C |
| `sensor.iphone_von_david_app_version` | iPhone von David App Version | 2026.2.1 |  |
| `sensor.iphone_von_david_audio_output` | iPhone von David Audio Output | unavailable |  |
| `sensor.iphone_von_david_battery_level` | iPhone von David Battery Level | 20 | % |
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
| `sensor.kg_flur_kuehlschrank_energie` | KG_Flur_Kuehlschrank Energie | 19.742668 | kWh |
| `sensor.kg_flur_kuehlschrank_energieeinspeisung` | KG_Flur_Kuehlschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_flur_kuehlschrank_leistung` | KG_Flur_Kuehlschrank Leistung | 0.0 | W |
| `sensor.kg_keller_licht_energie` | KG_Keller_Licht Energie | 2.188037 | kWh |
| `sensor.kg_keller_licht_energieeinspeisung` | KG_Keller_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_keller_licht_leistung` | KG_Keller_Licht Leistung | 0.0 | W |
| `sensor.kg_technik_serverschrank_energie` | KG_Technik_Serverschrank Energie | 66.06633 | kWh |
| `sensor.kg_technik_serverschrank_energieeinspeisung` | KG_Technik_Serverschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_serverschrank_leistung` | KG_Technik_Serverschrank Leistung | 83.7 | W |
| `sensor.kg_technik_trockner_energie` | KG_Technik_Trockner Energie | 16.610453 | kWh |
| `sensor.kg_technik_trockner_energieeinspeisung` | KG_Technik_Trockner Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_trockner_leistung` | KG_Technik_Trockner Leistung | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_energie` | KG_Technik_Waermepumpe_3EM Energie | 886.23118 | kWh |
| `sensor.kg_technik_waermepumpe_3em_energieeinspeisung` | KG_Technik_Waermepumpe_3EM Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_waermepumpe_3em_leistung` | KG_Technik_Waermepumpe_3EM Leistung | 553.665 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistung` | KG_Technik_Waermepumpe_3EM Phase A Leistung | 514.9 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase A Leistungsfaktor | 0.93 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_a_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase A Scheinleistung | 555.8 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistung` | KG_Technik_Waermepumpe_3EM Phase B Leistung | 38.7 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase B Leistungsfaktor | 0.56 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_b_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase B Scheinleistung | 68.7 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistung` | KG_Technik_Waermepumpe_3EM Phase C Leistung | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistungsfaktor` | KG_Technik_Waermepumpe_3EM Phase C Leistungsfaktor | 0.0 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_c_scheinleistung` | KG_Technik_Waermepumpe_3EM Phase C Scheinleistung | 6.5 | VA |
| `sensor.kg_technik_waermepumpe_3em_scheinleistung` | KG_Technik_Waermepumpe_3EM Scheinleistung | 630.999 | VA |
| `sensor.kg_technik_waermepumpe_3em_temperatur` | KG_Technik_Waermepumpe_3EM Temperatur | 49.6 | °C |
| `sensor.kg_technik_waschmaschine_energie` | KG_Technik_Waschmaschine Energie | 41.622718 | kWh |
| `sensor.kg_technik_waschmaschine_energieeinspeisung` | KG_Technik_Waschmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_waschmaschine_leistung` | KG_Technik_Waschmaschine Leistung | 0.0 | W |
| `sensor.licv_8_2r1_3_ao_1` | LICV 8.2R1/3 AO 1 | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | LICV 8.2R1/3 AO 2 | 10.0 | V |
| `sensor.licv_8_2r1_3_cooling_enabled` | LICV 8.2R1/3 Cooling enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_coverage_hp` | LICV 8.2R1/3 coverage HP | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw` | LICV 8.2R1/3 DHW | 44.6 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | LICV 8.2R1/3 DHW | 44.6 | °C |
| `sensor.licv_8_2r1_3_dhw_demand_border` | LICV 8.2R1/3 DHW Demand border | 330.0 |  |
| `sensor.licv_8_2r1_3_dhw_target` | LICV 8.2R1/3 DHW target | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | LICV 8.2R1/3 DHW temp. max. | 65.0 | °C |
| `sensor.licv_8_2r1_3_domestic_hot_water` | LICV 8.2R1/3 domestic hot water | 529.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | LICV 8.2R1/3 domestic hot water | 1607.3 | kWh |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | LICV 8.2R1/3 duration extra DHW | 7200.0 |  |
| `sensor.licv_8_2r1_3_error` | LICV 8.2R1/3 error | 51.0 |  |
| `sensor.licv_8_2r1_3_error_number` | LICV 8.2R1/3 error number | 0.0 |  |
| `sensor.licv_8_2r1_3_flow` | LICV 8.2R1/3 flow | 32.5 | °C |
| `sensor.licv_8_2r1_3_flow_rate` | LICV 8.2R1/3 flow rate | 587.0 | l/h |
| `sensor.licv_8_2r1_3_hd` | LICV 8.2R1/3 HD | 18.52 | bar |
| `sensor.licv_8_2r1_3_heat_generator_status` | LICV 8.2R1/3 Heat generator status | 1.0 |  |
| `sensor.licv_8_2r1_3_heat_source_inlet` | LICV 8.2R1/3 heat source inlet | 7.8 | °C |
| `sensor.licv_8_2r1_3_heating` | LICV 8.2R1/3 heating | 7140.0 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | LICV 8.2R1/3 heating | 18443.8 | kWh |
| `sensor.licv_8_2r1_3_heating_capacity` | LICV 8.2R1/3 Heating capacity | 2.84 | kW |
| `sensor.licv_8_2r1_3_heating_demand_border` | LICV 8.2R1/3 Heating demand border | 288.0 |  |
| `sensor.licv_8_2r1_3_impulse_vd1` | LICV 8.2R1/3 impulse VD1 | 1137.0 |  |
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
| `sensor.licv_8_2r1_3_mix_circ1_target` | LICV 8.2R1/3 mix circ1 target | 28.8 | °C |
| `sensor.licv_8_2r1_3_nd` | LICV 8.2R1/3 ND | 7.23 | bar |
| `sensor.licv_8_2r1_3_operat_hours_heat` | LICV 8.2R1/3 operat. hours heat. | 3141.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | LICV 8.2R1/3 operating hours DHW | 317.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | LICV 8.2R1/3 operating hours HP | 3460.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | LICV 8.2R1/3 operating hours VD1 | 3460.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | LICV 8.2R1/3 operating hours ZWE1 | 696.0 | h |
| `sensor.licv_8_2r1_3_operation_mode` | LICV 8.2R1/3 operation mode | 0.0 |  |
| `sensor.licv_8_2r1_3_outdoor_temp` | LICV 8.2R1/3 outdoor temp. | 5.9 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | LICV 8.2R1/3 outdoor temp. ø | 8.2 | °C |
| `sensor.licv_8_2r1_3_pc_limit` | LICV 8.2R1/3 PC limit | 30.0 | kW |
| `sensor.licv_8_2r1_3_pool_enabled` | LICV 8.2R1/3 Pool enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_power_consumption` | LICV 8.2R1/3 Power Consumption | 0.51 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | LICV 8.2R1/3 Power consumption min | 5.0 |  |
| `sensor.licv_8_2r1_3_return` | LICV 8.2R1/3 return | 29.1 | °C |
| `sensor.licv_8_2r1_3_return_target` | LICV 8.2R1/3 return target | 28.8 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | LICV 8.2R1/3 return temp. limit. | 50.0 | °C |
| `sensor.licv_8_2r1_3_status_dhw` | LICV 8.2R1/3 Status DHW | 1.0 |  |
| `sensor.licv_8_2r1_3_status_heating` | LICV 8.2R1/3 Status Heating | 3.0 |  |
| `sensor.licv_8_2r1_3_total` | LICV 8.2R1/3 total | 7669.6 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | LICV 8.2R1/3 total heat quant. HS | 20051.1 | kWh |
| `sensor.licv_8_2r1_3_tvl_calc_max` | LICV 8.2R1/3 TVL calc max | 32.2 | °C |
| `sensor.load_adjustment_mode_enable_raw` | Load adjustment mode enable raw | 85 |  |
| `sensor.load_adjustment_mode_selection_raw` | Load adjustment mode selection raw | 3 |  |
| `sensor.load_power` | Load power | 957 | W |
| `sensor.lowest_energy_price` | Lowest energy price | -0.00322 | €/kWh |
| `sensor.meter_active_power` | Meter active power | 32 | W |
| `sensor.meter_phase_a_active_power` | Meter phase A active power | 506 | W |
| `sensor.meter_phase_a_current` | Meter phase A current | unavailable | A |
| `sensor.meter_phase_a_voltage` | Meter phase A voltage | unavailable | V |
| `sensor.meter_phase_b_active_power` | Meter phase B active power | -195 | W |
| `sensor.meter_phase_b_current` | Meter phase B current | unavailable | A |
| `sensor.meter_phase_b_voltage` | Meter phase B voltage | unavailable | V |
| `sensor.meter_phase_c_active_power` | Meter phase C active power | -275 | W |
| `sensor.meter_phase_c_current` | Meter phase C current | unavailable | A |
| `sensor.meter_phase_c_voltage` | Meter phase C voltage | unavailable | V |
| `sensor.mppt1_current` | MPPT1 current | 0.0 | A |
| `sensor.mppt1_power` | MPPT1 power | 0 | W |
| `sensor.mppt1_voltage` | MPPT1 voltage | 0.0 | V |
| `sensor.mppt2_current` | MPPT2 current | 0.0 | A |
| `sensor.mppt2_power` | MPPT2 power | 0 | W |
| `sensor.mppt2_voltage` | MPPT2 voltage | 0.0 | V |
| `sensor.mppt3_current` | MPPT3 current | 0.0 | A |
| `sensor.mppt3_power` | MPPT3 power | 0 | W |
| `sensor.mppt3_voltage` | MPPT3 voltage | 0.0 | V |
| `sensor.mppt4_current` | MPPT4 current | 0.0 | A |
| `sensor.mppt4_power` | MPPT4 power | 0 | W |
| `sensor.mppt4_voltage` | MPPT4 voltage | 0.0 | V |
| `sensor.next_hour_electricity_market_price` | Next hour electricity market price | 0.13001 | €/kWh |
| `sensor.og_ankleide_jalousie_1_energie` | OG_Ankleide_Jalousie_1 Energie | 0.113823 | kWh |
| `sensor.og_ankleide_jalousie_1_leistung` | OG_Ankleide_Jalousie_1 Leistung | 0.0 | W |
| `sensor.og_ankleide_jalousie_2_energie` | OG_Ankleide_Jalousie_2 Energie | 0.110913 | kWh |
| `sensor.og_ankleide_jalousie_2_leistung` | OG_Ankleide_Jalousie_2 Leistung | 0.0 | W |
| `sensor.og_ankleide_licht_energie` | OG_Ankleide_Licht Energie | 0.885131 | kWh |
| `sensor.og_ankleide_licht_energieeinspeisung` | OG_Ankleide_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_ankleide_licht_leistung` | OG_Ankleide_Licht Leistung | 0.0 | W |
| `sensor.og_bad_jalousie_1_energie` | OG_Bad_Jalousie_1 Energie | 0.06091 | kWh |
| `sensor.og_bad_jalousie_1_leistung` | OG_Bad_Jalousie_1 Leistung | 0.0 | W |
| `sensor.og_bad_jalousie_2_energie` | OG_Bad_Jalousie_2 Energie | 0.077628 | kWh |
| `sensor.og_bad_jalousie_2_leistung` | OG_Bad_Jalousie_2 Leistung | 0.0 | W |
| `sensor.og_bad_licht_energie` | OG_Bad_Licht Energie | 2.157439 | kWh |
| `sensor.og_bad_licht_energieeinspeisung` | OG_Bad_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_bad_licht_leistung` | OG_Bad_Licht Leistung | 0.0 | W |
| `sensor.og_flur_jalousie_energie` | OG_Flur_Jalousie Energie | 0.243261 | kWh |
| `sensor.og_flur_jalousie_leistung` | OG_Flur_Jalousie Leistung | 0.0 | W |
| `sensor.og_zimmer1_jalousie_energie` | OG_Zimmer1_Jalousie Energie | 0.200381 | kWh |
| `sensor.og_zimmer1_jalousie_leistung` | OG_Zimmer1_Jalousie Leistung | 0.0 | W |
| `sensor.og_zimmer1_licht_energie` | OG_Zimmer1_Licht Energie | 2.411103 | kWh |
| `sensor.og_zimmer1_licht_energieeinspeisung` | OG_Zimmer1_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer1_licht_leistung` | OG_Zimmer1_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_jalousie_energie` | OG_Zimmer2_Jalousie Energie | 0.155262 | kWh |
| `sensor.og_zimmer2_jalousie_leistung` | OG_Zimmer2_Jalousie Leistung | 0.0 | W |
| `sensor.og_zimmer2_licht_energie` | OG_Zimmer2_Licht Energie | 0.043028 | kWh |
| `sensor.og_zimmer2_licht_energieeinspeisung` | OG_Zimmer2_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_licht_leistung` | OG_Zimmer2_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_lichtstreifen_energie` | OG_Zimmer2_Lichtstreifen Energie | 2.321968 | kWh |
| `sensor.og_zimmer2_lichtstreifen_energieeinspeisung` | OG_Zimmer2_Lichtstreifen Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_lichtstreifen_leistung` | OG_Zimmer2_Lichtstreifen Leistung | 0.0 | W |
| `sensor.optim_status` | EMHASS optimization status | Optimal |  |
| `sensor.p_batt_forecast` | Battery Power Forecast | 1519.29 | W |
| `sensor.p_grid_forecast` | Grid Power Forecast | 0.00 | W |
| `sensor.p_hybrid_inverter` | PV Hybrid Inverter | 1519.29 | W |
| `sensor.p_load_forecast` | Load Power Forecast | 1519.29 | W |
| `sensor.p_pv_forecast` | PV Power Forecast | 0.00 | W |
| `sensor.phase_a_current` | Phase A current | 1.2 | A |
| `sensor.phase_a_power` | Phase A power | 280 | W |
| `sensor.phase_a_voltage` | Phase A voltage | 234.0 | V |
| `sensor.phase_b_current` | Phase B current | 1.2 | A |
| `sensor.phase_b_power` | Phase B power | 280 | W |
| `sensor.phase_b_voltage` | Phase B voltage | 233.6 | V |
| `sensor.phase_c_current` | Phase C current | 1.2 | A |
| `sensor.phase_c_power` | Phase C power | 280 | W |
| `sensor.phase_c_voltage` | Phase C voltage | 233.8 | V |
| `sensor.power_factor` | Power factor | 1.000 | % |
| `sensor.power_flow_status` | Power Flow Status | 12 |  |
| `sensor.reactive_power` | Reactive power | -4 | W |
| `sensor.running_state_raw` | Running state raw | 0 |  |
| `sensor.soc_batt_forecast` | Battery SOC Forecast | 37.26 | % |
| `sensor.solar_energy_production_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Solar Energy Production 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0.0 | kWh |
| `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | Solar Production Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.solcast_pv_forecast_aktuelle_leistung` | Solcast PV Forecast Aktuelle Leistung | 0 | W |
| `sensor.solcast_pv_forecast_fester_grenzwert_eingestellt` | Solcast PV Forecast Fester Grenzwert eingestellt | False |  |
| `sensor.solcast_pv_forecast_leistung_in_1_stunde` | Solcast PV Forecast Leistung in 1 Stunde | 0 | W |
| `sensor.solcast_pv_forecast_leistung_in_30_minuten` | Solcast PV Forecast Leistung in 30 Minuten | 0 | W |
| `sensor.solcast_pv_forecast_max_api_abrufe` | Solcast PV Forecast max. API-Abrufe | 10 |  |
| `sensor.solcast_pv_forecast_prognose_aktuelle_stunde` | Solcast PV Forecast Prognose aktuelle Stunde | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_heute` | Solcast PV Forecast Prognose heute | 36.6324 | kWh |
| `sensor.solcast_pv_forecast_prognose_morgen` | Solcast PV Forecast Prognose morgen | 36.666 | kWh |
| `sensor.solcast_pv_forecast_prognose_nachste_stunde` | Solcast PV Forecast Prognose nächste Stunde | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute` | Solcast PV Forecast Prognose Spitzenleistung heute | 5240 | W |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen` | Solcast PV Forecast Prognose Spitzenleistung morgen | 5178 | W |
| `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute` | Solcast PV Forecast Prognose verbleibende Leistung heute | 0 | kWh |
| `sensor.solcast_pv_forecast_verwendete_api_abrufe` | Solcast PV Forecast Verwendete API-Abrufe | 6 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_letzter_api_abruf` | Solcast PV Forecast Zeitpunkt letzter API-Abruf | 2026-03-18T10:22:18+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_heute` | Solcast PV Forecast Zeitpunkt Spitzenleistung heute | 2026-03-18T10:30:00+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_morgen` | Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | 2026-03-19T10:30:00+00:00 |  |
| `sensor.sun_next_dawn` | Sun Nächste Morgendämmerung | 2026-03-19T04:59:26+00:00 |  |
| `sensor.sun_next_dusk` | Sun Nächste Abenddämmerung | 2026-03-19T18:09:02+00:00 |  |
| `sensor.sun_next_midnight` | Sun Nächste Mitternacht | 2026-03-18T23:33:45+00:00 |  |
| `sensor.sun_next_noon` | Sun Nächster Höchststand | 2026-03-19T11:33:52+00:00 |  |
| `sensor.sun_next_rising` | Sun Nächster Aufgang | 2026-03-19T05:31:29+00:00 |  |
| `sensor.sun_next_setting` | Sun Nächster Untergang | 2026-03-19T17:36:52+00:00 |  |
| `sensor.sungrow_arm_software` | Sungrow Arm Software | ARM_SAPPHIRE-H_V11_V01_B       |  |
| `sensor.sungrow_device_type` | Sungrow device type | SH10RT-20 |  |
| `sensor.sungrow_device_type_code` | Sungrow device type code | 3603 |  |
| `sensor.sungrow_dsp_software` | Sungrow DSP Software | MDSP_SAPPHIRE-H_V11_V01_B      |  |
| `sensor.sungrow_inverter_serial` | Sungrow inverter serial | A2352614033          |  |
| `sensor.sungrow_inverter_state` | Sungrow inverter state | Running |  |
| `sensor.sungrow_protocol_version` | Sungrow Protocol Version | 16781568 |  |
| `sensor.sungrow_version_1` | Sungrow Version 1 | SAPPHIRE-H_01011.95.07 |  |
| `sensor.sungrow_version_2` | Sungrow Version 2 | unavailable |  |
| `sensor.sungrow_version_3` | Sungrow Version 3 | unavailable |  |
| `sensor.sungrow_version_4_sungrow_battery` | Sungrow Version 4 (Sungrow Battery) | unavailable |  |
| `sensor.time_of_highest_price` | Time of highest price | 2026-03-19T18:00:00+00:00 |  |
| `sensor.time_of_lowest_price` | Time of lowest price | 2026-03-18T12:00:00+00:00 |  |
| `sensor.total_active_power` | Total active power | 969 | W |
| `sensor.total_backup_power` | Total backup power | 0 | W |
| `sensor.total_battery_charge` | Total battery charge | 933.7 | kWh |
| `sensor.total_battery_charge_from_pv` | Total battery charge from PV | 868.3 | kWh |
| `sensor.total_battery_discharge` | Total battery discharge | 854.5 | kWh |
| `sensor.total_consumed_energy` | Total consumed energy | 8653.2 | kWh |
| `sensor.total_cost_fun_value` | Total cost function value | 1.01 | € |
| `sensor.total_dc_power` | Total DC power | 0 | W |
| `sensor.total_direct_energy_consumption` | Total direct energy consumption | 1424.2 | kWh |
| `sensor.total_exported_energy` | Total exported energy | 102.6 | kWh |
| `sensor.total_exported_energy_from_pv` | Total exported energy from PV | 107.0 | kWh |
| `sensor.total_imported_energy` | Total imported energy | 6435.5 | kWh |
| `sensor.total_pv_generation` | Total PV generation | 2399.5 | kWh |
| `sensor.total_pv_generation_battery_discharge` | Total PV generation & battery discharge | 2244.2 | kWh |
| `sensor.unit_load_cost` | Unit Load Cost | 0.1473 | €/kWh |
| `sensor.unit_prod_price` | Unit Prod Price | 0.0820 | €/kWh |
| `sensor.vorderer_schaftrieb_10` | Vorderer Schaftrieb 10 | 15.7822 | kWh |
| `sensor.vorderer_schaftrieb_10_west` | Vorderer Schaftrieb 10 (West) | 20.8502 | kWh |
| `sensor.wp_cop_heizung_gesamt` | WP COP Heizung gesamt | 0 |  |
| `sensor.wp_cop_heizung_monatlich` | WP COP Heizung monatlich | 2.58 |  |
| `sensor.wp_cop_kombiniert_gesamt` | WP COP kombiniert gesamt | 0 |  |
| `sensor.wp_cop_kombiniert_monatlich` | WP COP kombiniert monatlich | 2.58 |  |
| `sensor.wp_cop_warmwasser_gesamt` | WP COP Warmwasser gesamt | 0 |  |
| `sensor.wp_cop_warmwasser_monatlich` | WP COP Warmwasser monatlich | 0.0 |  |
| `sensor.wp_heizung_thermisch_gesamt_seit_tracking` | WP Heizung thermisch gesamt (seit Tracking) | 170.7 | kWh |
| `sensor.wp_heizung_thermisch_monatlich` | WP Heizung thermisch monatlich | 170.7 | kWh |
| `sensor.wp_strom_gesamt_seit_tracking` | WP Strom gesamt (seit Tracking) | 66.16198 | kWh |
| `sensor.wp_strom_monatlich` | WP Strom monatlich | 66.16198 | kWh |
| `sensor.wp_warmwasser_thermisch_gesamt_seit_tracking` | WP Warmwasser thermisch gesamt (seit Tracking) | 32.9 | kWh |
| `sensor.wp_warmwasser_thermisch_monatlich` | WP Warmwasser thermisch monatlich | 32.9 | kWh |

## sun

**1 Entitäten** — Sonnen- und Astro-Daten (Auf-/Untergang)

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `sun.sun` | Sun | below_horizon |  |

## switch

**27 Entitäten** — Schalter zum Ein- und Ausschalten von Geräten

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `switch.backup_mode` | Backup Mode | off |  |
| `switch.box_crossfade` | Box Überblenden | off |  |
| `switch.box_loudness` | Box Loudness | on |  |
| `switch.dg_buero_workstation` | DG_Buero_Workstation | off |  |
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

**1 Entitäten** — To-Do Listen und Aufgaben

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `todo.einkaufsliste` | Einkaufsliste | 0 |  |

## tts

**1 Entitäten** — Text-to-Speech für Sprachausgabe

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `tts.google_translate_en_com` | Google Translate en com | unknown |  |

## update

**55 Entitäten** — Verfügbare Updates für Komponenten und Add-ons

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
| `update.licv_8_2r1_3_firmware` | LICV 8.2R1/3 Firmware | on |  |
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
| `update.terminal_ssh_update` | Terminal & SSH Update | off |  |

## weather

**1 Entitäten** — Wetterdaten und Vorhersagen

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `weather.forecast_home` | Forecast Home | clear-night |  |

## zone

**1 Entitäten** — Geografische Zonen für Ortsbestimmung

| Entity ID | Friendly Name | State | Unit |
|---|---|---|---|
| `zone.home` | Home | 0 |  |

