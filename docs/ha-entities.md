# Home Assistant Entities

> Automatisch generiert am **2026-03-19** — 794 Entitäten gesamt

## Inhaltsverzeichnis

- [1komma5° (Heartbeat)](#1komma5°-heartbeat) (25)
- [Apple](#apple) (15)
- [EMHASS](#emhass) (3)
- [ENTSO-e](#entso-e) (9)
- [Energiemanagement (HA Energy)](#energiemanagement-ha-energy) (7)
- [HACS](#hacs) (2)
- [HP Drucker](#hp-drucker) (5)
- [Home Assistant (System)](#home-assistant-system) (28)
- [LICV Wärmepumpe (Luxtronik)](#licv-wärmepumpe-luxtronik) (105)
- [Met.no (Wetter)](#metno-wetter) (1)
- [Shelly](#shelly) (342)
- [Solcast](#solcast) (23)
- [Sonos](#sonos) (12)
- [Sonstige](#sonstige) (38)
- [Sun (HA built-in)](#sun-ha-built-in) (1)
- [Sungrow (Modbus)](#sungrow-modbus) (148)
- [Synology NAS](#synology-nas) (28)
- [Template-Sensoren](#template-sensoren) (2)

## Zusammenfassung nach Integration

| Integration | Anzahl |
|---|---|
| 1komma5° (Heartbeat) | 25 |
| Apple | 15 |
| EMHASS | 3 |
| ENTSO-e | 9 |
| Energiemanagement (HA Energy) | 7 |
| HACS | 2 |
| HP Drucker | 5 |
| Home Assistant (System) | 28 |
| LICV Wärmepumpe (Luxtronik) | 105 |
| Met.no (Wetter) | 1 |
| Shelly | 342 |
| Solcast | 23 |
| Sonos | 12 |
| Sonstige | 38 |
| Sun (HA built-in) | 1 |
| Sungrow (Modbus) | 148 |
| Synology NAS | 28 |
| Template-Sensoren | 2 |

## 1komma5° (Heartbeat)

25 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.sungrow_self_consumption_mode_max_battery_discharge_scene_sets_rated_limit` | automation | sungrow self consumption mode max battery discharge scene sets rated limit | 1komma5° Szene: Selbstverbrauchsmodus | on |  |
| `scene.self_consumption_mode_max_battery_discharge` | scene | Self-Consumption Mode (max battery discharge) | 1komma5° Szene: Selbstverbrauchsmodus | unknown |  |
| `scene.self_consumption_mode_no_battery_discharge` | scene | Self-Consumption Mode (no battery discharge) | 1komma5° Szene: Selbstverbrauchsmodus | unknown |  |
| `scene.zero_export_power` | scene | Zero Export Power | 1komma5° Szene: Null-Einspeisungsmodus | unknown |  |
| `sensor.1komma5_tagesforecast` | sensor | 1komma5 Tagesforecast | UNBEKANNT: 1komma5 Tagesforecast | 2026-03-19 |  |
| `sensor.battery_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batterie-Ladeenergie seit Tagesbeginn (1komma5°) | 12.7565477932761 | kWh |
| `sensor.battery_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batterie-Entladeenergie seit Tagesbeginn (1komma5°) | 6.5183328692993 | kWh |
| `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktuelle Batterie-Ladeleistung (1komma5°) | 0 | W |
| `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktuelle Batterie-Entladeleistung (1komma5°) | 0 | W |
| `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery State of Charge 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batterie-Ladestand in Prozent (1komma5°) | 100.0 | % |
| `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Consumption Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller Gesamtstromverbrauch des Haushalts (1komma5°) | 478.299 | W |
| `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Electricity Price 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller dynamischer Stromtarif (1komma5° Heartbeat) | 0.1683 | EUR/kWh |
| `sensor.ev_chargers_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamtleistung aller E-Auto-Ladestationen (1komma5°) | 0 | W |
| `sensor.ev_chargers_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Energieverbrauch aller E-Auto-Ladestationen (1komma5°) | 0.0 | kWh |
| `sensor.grid_feed_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzbezugsenergie seit Tagesbeginn (1komma5°) | 2.74980002685968 | kWh |
| `sensor.grid_feed_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung seit Tagesbeginn (1komma5°) | 1.38659617257633 | kWh |
| `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktuelle Netzbezugsleistung (1komma5°) | 5140.301 | W |
| `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktuelle Netzeinspeisung (1komma5°) | 0 | W |
| `sensor.grid_feed_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netto-Leistung Netz (positiv=Bezug, negativ=Einspeisung) | -5140.301 | W |
| `sensor.heat_pumps_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamtleistung aller Wärmepumpen (1komma5°) | 0 | W |
| `sensor.heat_pumps_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Energieverbrauch aller Wärmepumpen (1komma5°) | 0.0 | kWh |
| `sensor.solar_energy_production_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Energy Production 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Solar-Erzeugungsenergie seit Tagesbeginn (1komma5°) | 18.9031358194009 | kWh |
| `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Production Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktuelle Solar-Erzeugungsleistung (1komma5°) | 5618.6 | W |
| `switch.heartbeat_automatic_mode_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | switch | Heartbeat Automatic Mode 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1komma5° Heartbeat Automatik-Modus ein/aus | on |  |
| `update.1komma5grad_update` | update | 1KOMMA5GRAD update | UNBEKANNT: 1KOMMA5GRAD update | off |  |

## Apple

15 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `device_tracker.iphone_von_david` | device_tracker | iPhone von David | iPhone Präsenz/Position | not_home |  |
| `media_player.eg` | media_player | HomePod-EG | UNBEKANNT: HomePod-EG | idle |  |
| `remote.eg` | remote | HomePod-EG | Sonos Fernbedienung / Controller | on |  |
| `sensor.iphone_von_david_app_version` | sensor | iPhone von David App Version | iPhone Sensor | 2026.2.1 |  |
| `sensor.iphone_von_david_audio_output` | sensor | iPhone von David Audio Output | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_battery_state` | sensor | iPhone von David Battery State | iPhone Akku-Ladestand | Not Charging |  |
| `sensor.iphone_von_david_bssid` | sensor | iPhone von David BSSID | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_connection_type` | sensor | iPhone von David Connection Type | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_geocoded_location` | sensor | iPhone von David Geocoded Location | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_last_update_trigger` | sensor | iPhone von David Last Update Trigger | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_location_permission` | sensor | iPhone von David Location permission | iPhone Sensor | Authorized when in use |  |
| `sensor.iphone_von_david_sim_1` | sensor | iPhone von David SIM 1 | iPhone SIM-Kartenstatus | unavailable |  |
| `sensor.iphone_von_david_sim_2` | sensor | iPhone von David SIM 2 | iPhone SIM-Kartenstatus | unavailable |  |
| `sensor.iphone_von_david_ssid` | sensor | iPhone von David SSID | iPhone Sensor | unavailable |  |
| `sensor.iphone_von_david_storage` | sensor | iPhone von David Storage | iPhone Speicher-Auslastung | unavailable |  |

## EMHASS

3 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.emhass_day_ahead_optimierung` | automation | EMHASS Day-Ahead Optimierung | UNBEKANNT: EMHASS Sensor EMHASS Day-Ahead Optimierung | on |  |
| `sensor.optim_status` | sensor | EMHASS optimization status | UNBEKANNT: EMHASS optimization status | Optimal |  |
| `update.emhass_update` | update | EMHASS Update | UNBEKANNT: EMHASS Sensor EMHASS Update | off |  |

## ENTSO-e

9 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.average_electricity_price` | sensor | Average electricity price | Durchschnittlicher ENTSO-e Strompreis heute | 0.12061 | €/kWh |
| `sensor.current_electricity_market_price` | sensor | Current electricity market price | ENTSO-e Day-Ahead Börsenstrompreis aktuelle Stunde | 0.00301 | €/kWh |
| `sensor.current_percentage_in_electricity_price_range` | sensor | Current percentage in electricity price range | ENTSO-e Strompreis in Prozent des Tagesbereichs | 2.4 | % |
| `sensor.current_percentage_of_highest_electricity_price` | sensor | Current percentage of highest electricity price | Höchster ENTSO-e Strompreis heute | 1.2 | % |
| `sensor.entso_e_tagespreise` | sensor | ENTSO-e Tagespreise | ENTSO-e Strommarktpreis | 2026-03-19 |  |
| `sensor.time_of_highest_price` | sensor | Time of highest price | UNBEKANNT: Time of highest price | 2026-03-19T18:00:00+00:00 |  |
| `sensor.time_of_lowest_price` | sensor | Time of lowest price | UNBEKANNT: Time of lowest price | 2026-03-18T12:00:00+00:00 |  |
| `sensor.unit_prod_price` | sensor | Unit Prod Price | UNBEKANNT: Unit Prod Price | 0.0820 | €/kWh |
| `update.entso_e_transparency_platform_update` | update | ENTSO-e Transparency Platform update | ENTSO-e Strommarktpreis | off |  |

## Energiemanagement (HA Energy)

7 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.daily_consumed_energy_filtered` | sensor | Daily consumed energy (filtered) | Energie-Daten für HA Energy Dashboard | 10.16 | kWh |
| `sensor.highest_energy_price` | sensor | Highest energy price | Energie-Daten für HA Energy Dashboard | 0.25511 | €/kWh |
| `sensor.lowest_energy_price` | sensor | Lowest energy price | Energie-Daten für HA Energy Dashboard | -0.00322 | €/kWh |
| `sensor.total_cost_fun_value` | sensor | Total cost function value | UNBEKANNT: Total cost function value | 1.11 | € |
| `sensor.total_direct_energy_consumption` | sensor | Total direct energy consumption | Stromverbrauch für HA Energy Dashboard | 1427.5 | kWh |
| `sensor.total_exported_energy_from_pv` | sensor | Total exported energy from PV | Netzrückspeisung für HA Energy Dashboard | 109.0 | kWh |
| `sensor.unit_load_cost` | sensor | Unit Load Cost | UNBEKANNT: Unit Load Cost | 0.1907 | €/kWh |

## HACS

2 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `update.get_hacs_update` | update | Get HACS Update | HACS Community Store Update-Status | off |  |
| `update.hacs_update` | update | HACS update | HACS Community Store Update-Status | off |  |

## HP Drucker

5 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.hp_officejet_pro_8600` | sensor | sensor.hp_officejet_pro_8600 | HP Drucker Sensor | unavailable |  |
| `sensor.hp_officejet_pro_8600_black_ink` | sensor | black ink | Tinten-/Tonerstand HP Drucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_cyan_ink` | sensor | cyan ink | Tinten-/Tonerstand HP Drucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_magenta_ink` | sensor | magenta ink | Tinten-/Tonerstand HP Drucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_yellow_ink` | sensor | yellow ink | Tinten-/Tonerstand HP Drucker | unavailable | % |

## Home Assistant (System)

28 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `conversation.home_assistant` | conversation | Home Assistant | UNBEKANNT: Home Assistant | 2026-03-08T20:43:20.952038+00:00 |  |
| `event.backup_automatic_backup` | event | Backup Automatisches Backup | UNBEKANNT: Backup Automatisches Backup | 2026-03-19T04:43:26.297+00:00 |  |
| `number.battery_reserved_soc_for_backup` | number | Battery Reserved SoC for Backup | Reservierter Ladestand für Notstromversorgung | 0.0 | % |
| `person.david` | person | David | UNBEKANNT: David | not_home |  |
| `scene.battery_bypass_mode` | scene | Battery Bypass Mode | UNBEKANNT: Battery Bypass Mode | unknown |  |
| `scene.battery_forced_discharge` | scene | Battery Forced Discharge | UNBEKANNT: Battery Forced Discharge | unknown |  |
| `script.batterie_zwangsladen` | script | Batterie Zwangsladen | UNBEKANNT: Batterie Zwangsladen | off |  |
| `sensor.backup_backup_manager_state` | sensor | Backup Backup-Manager-Zustand | UNBEKANNT: Backup Backup-Manager-Zustand | idle |  |
| `sensor.backup_last_attempted_automatic_backup` | sensor | Backup Letztes versuchtes automatisches Backup | UNBEKANNT: Backup Letztes versuchtes automatisches Backup | 2026-03-19T04:43:18+00:00 |  |
| `sensor.backup_last_successful_automatic_backup` | sensor | Backup Letztes erfolgreiches automatisches Backup | UNBEKANNT: Backup Letztes erfolgreiches automatisches Backup | 2026-03-19T04:43:26+00:00 |  |
| `sensor.backup_mode_raw` | sensor | Backup mode raw | UNBEKANNT: Backup mode raw | 85 |  |
| `sensor.backup_next_scheduled_automatic_backup` | sensor | Backup Nächstes geplantes automatisches Backup | UNBEKANNT: Backup Nächstes geplantes automatisches Backup | 2026-03-20T04:18:36+00:00 |  |
| `sensor.battery_reserved_soc_for_backup` | sensor | Battery reserved SoC for backup | Reservierter Ladestand für Notstromversorgung | 0 | % |
| `sensor.total_backup_power` | sensor | Total backup power | UNBEKANNT: Total backup power | 0 | W |
| `switch.backup_mode` | switch | Backup Mode | UNBEKANNT: Backup Mode | off |  |
| `todo.einkaufsliste` | todo | Einkaufsliste | UNBEKANNT: Einkaufsliste | 0 |  |
| `tts.google_translate_en_com` | tts | Google Translate en com | UNBEKANNT: Google Translate en com | unknown |  |
| `update.cloudflared_update` | update | Cloudflared Update | Cloudflared Tunnel Status und Update | off |  |
| `update.file_editor_update` | update | File editor Update | File Editor Add-on Update-Status | off |  |
| `update.grafana_update` | update | Grafana Update | Grafana Visualisierungs-Plattform Update-Status | off |  |
| `update.home_assistant_core_update` | update | Home Assistant Core Update | UNBEKANNT: Home Assistant Core Update | off |  |
| `update.home_assistant_operating_system_update` | update | Home Assistant Operating System Update | UNBEKANNT: Home Assistant Operating System Update | off |  |
| `update.home_assistant_supervisor_update` | update | Home Assistant Supervisor Update | UNBEKANNT: Home Assistant Supervisor Update | off |  |
| `update.influxdb_update` | update | InfluxDB Update | InfluxDB Datenbank Update-Status | off |  |
| `update.matter_server_update` | update | Matter Server Update | UNBEKANNT: Matter Server Update | off |  |
| `update.mosquitto_broker_update` | update | Mosquitto broker Update | Mosquitto MQTT Broker Update-Status | off |  |
| `update.terminal_ssh_update` | update | Terminal & SSH Update | Terminal SSH Add-on Update-Status | off |  |
| `zone.home` | zone | Home | UNBEKANNT: Home | 0 |  |

## LICV Wärmepumpe (Luxtronik)

105 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.licv_8_2r1_3_alarm` | binary_sensor | LICV 8.2R1/3 Alarm | Alarm-Status der Wärmepumpe (Störung aktiv) | off |  |
| `binary_sensor.licv_8_2r1_3_asd` | binary_sensor | LICV 8.2R1/3 ASD | Abtauendepressostat — Abtauzyklus aktiv/beendet | off |  |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | binary_sensor | LICV 8.2R1/3 BUP - DHW pump | Brauchwasser-Umwälzpumpe (BUP) — Warmwasserbereitung aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_el_heater` | binary_sensor | LICV 8.2R1/3 el. heater | UNBEKANNT: LICV Sensor LICV 8.2R1/3 el. heater | off |  |
| `binary_sensor.licv_8_2r1_3_evu` | binary_sensor | LICV 8.2R1/3 EVU | EVU-Sperre — Energieversorger-Abschaltung der Wärmepumpe | on |  |
| `binary_sensor.licv_8_2r1_3_evu_2` | binary_sensor | LICV 8.2R1/3 EVU 2 | EVU-Sperre — Energieversorger-Abschaltung der Wärmepumpe | off |  |
| `binary_sensor.licv_8_2r1_3_hd` | binary_sensor | LICV 8.2R1/3 HD | Hochdruckpressostat — Sicherheitsschalter im Kältekreis | off |  |
| `binary_sensor.licv_8_2r1_3_hup` | binary_sensor | LICV 8.2R1/3 HUP | Heizungs-Umwälzpumpe (HUP) — Heizkreisumwälzung aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | binary_sensor | LICV 8.2R1/3 Konnektivität | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Konnektivität | on |  |
| `binary_sensor.licv_8_2r1_3_mot` | binary_sensor | LICV 8.2R1/3 MOT | Motorventil (Mischventil) im Heizkreis aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_vbo` | binary_sensor | LICV 8.2R1/3 VBO | Ventilator/Wärmequellenpumpe — Luftwärmetausch aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_vd1` | binary_sensor | LICV 8.2R1/3 VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | off |  |
| `binary_sensor.licv_8_2r1_3_zip` | binary_sensor | LICV 8.2R1/3 ZIP | Warmwasser-Zirkulationspumpe aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_zup` | binary_sensor | LICV 8.2R1/3 ZUP | Zusatz-Umwälzpumpe aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_1` | binary_sensor | LICV 8.2R1/3 ZWE 1 | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_2_sst` | binary_sensor | LICV 8.2R1/3 ZWE 2 - SST | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | off |  |
| `number.licv_8_2r1_3_desired_value` | number | LICV 8.2R1/3 desired value | UNBEKANNT: LICV Sensor LICV 8.2R1/3 desired value | 48.0 |  |
| `number.licv_8_2r1_3_heating_limit` | number | LICV 8.2R1/3 heating limit | UNBEKANNT: LICV Sensor LICV 8.2R1/3 heating limit | 20.0 |  |
| `number.licv_8_2r1_3_offset_heizen` | number | LICV 8.2R1/3 Offset Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_mk1_heizen` | number | LICV 8.2R1/3 Offset MK1 Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset MK1 Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen` | number | LICV 8.2R1/3 Offset Overall Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen_2` | number | LICV 8.2R1/3 Offset Overall Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw` | number | LICV 8.2R1/3 Offset Warmw. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw_2` | number | LICV 8.2R1/3 Offset Warmw. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_sollwert_heizen` | number | LICV 8.2R1/3 Sollwert Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Sollwert Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_mk1_heizen` | number | LICV 8.2R1/3 Sollwert MK1 Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Sollwert MK1 Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_warmw` | number | LICV 8.2R1/3 Sollwert Warmw. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Sollwert Warmw. | 46.0 |  |
| `number.licv_8_2r1_3_targ_value` | number | LICV 8.2R1/3 targ.value | UNBEKANNT: LICV Sensor LICV 8.2R1/3 targ.value | 55.0 |  |
| `number.licv_8_2r1_3_temperature` | number | LICV 8.2R1/3 temperature + - | UNBEKANNT: LICV Sensor LICV 8.2R1/3 temperature + - | 0.0 |  |
| `select.licv_8_2r1_3_lpc_mode` | select | LICV 8.2R1/3 LPC mode | UNBEKANNT: LICV Sensor LICV 8.2R1/3 LPC mode | No limit |  |
| `select.licv_8_2r1_3_mode_of_operation` | select | LICV 8.2R1/3 mode of operation | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_2` | select | LICV 8.2R1/3 mode of operation | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_3` | select | LICV 8.2R1/3 mode of operation | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_4` | select | LICV 8.2R1/3 mode of operation | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_5` | select | LICV 8.2R1/3 mode of operation | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mode of operation | Off |  |
| `select.licv_8_2r1_3_modus_heizen` | select | LICV 8.2R1/3 Modus Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Modus Heizen | Off |  |
| `select.licv_8_2r1_3_modus_mk1_heizen` | select | LICV 8.2R1/3 Modus MK1 Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Modus MK1 Heizen | Off |  |
| `select.licv_8_2r1_3_modus_overall_heizen` | select | LICV 8.2R1/3 Modus Overall Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Modus Overall Heizen | Individual |  |
| `select.licv_8_2r1_3_modus_warmw` | select | LICV 8.2R1/3 Modus Warmw. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Modus Warmw. | Off |  |
| `select.licv_8_2r1_3_power_control_mode` | select | LICV 8.2R1/3 Power control mode | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Power control mode | Individually |  |
| `select.licv_8_2r1_3_smart_mode` | select | LICV 8.2R1/3 Smart mode | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Smart mode | Default |  |
| `sensor.licv_8_2r1_3_ao_1` | sensor | LICV 8.2R1/3 AO 1 | UNBEKANNT: LICV Sensor LICV 8.2R1/3 AO 1 | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | sensor | LICV 8.2R1/3 AO 2 | UNBEKANNT: LICV Sensor LICV 8.2R1/3 AO 2 | 10.0 | V |
| `sensor.licv_8_2r1_3_cooling_enabled` | sensor | LICV 8.2R1/3 Cooling enabled | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Cooling enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_coverage_hp` | sensor | LICV 8.2R1/3 coverage HP | UNBEKANNT: LICV Sensor LICV 8.2R1/3 coverage HP | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw` | sensor | LICV 8.2R1/3 DHW | Brauchwasser-Temperatur (Warmwasser) | 38.7 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | sensor | LICV 8.2R1/3 DHW | Brauchwasser-Temperatur (Warmwasser) | 38.7 | °C |
| `sensor.licv_8_2r1_3_dhw_demand_border` | sensor | LICV 8.2R1/3 DHW Demand border | Brauchwasser-Temperatur (Warmwasser) | 330.0 |  |
| `sensor.licv_8_2r1_3_dhw_target` | sensor | LICV 8.2R1/3 DHW target | Brauchwasser-Temperatur (Warmwasser) | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | sensor | LICV 8.2R1/3 DHW temp. max. | Brauchwasser-Temperatur (Warmwasser) | 65.0 | °C |
| `sensor.licv_8_2r1_3_domestic_hot_water` | sensor | LICV 8.2R1/3 domestic hot water | UNBEKANNT: LICV Sensor LICV 8.2R1/3 domestic hot water | 529.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | sensor | LICV 8.2R1/3 domestic hot water | UNBEKANNT: LICV Sensor LICV 8.2R1/3 domestic hot water | 1607.3 | kWh |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | sensor | LICV 8.2R1/3 duration extra DHW | Brauchwasser-Temperatur (Warmwasser) | 7200.0 |  |
| `sensor.licv_8_2r1_3_error` | sensor | LICV 8.2R1/3 error | Fehlerstatus der Wärmepumpe | 51.0 |  |
| `sensor.licv_8_2r1_3_error_number` | sensor | LICV 8.2R1/3 error number | Fehlerstatus der Wärmepumpe | 0.0 |  |
| `sensor.licv_8_2r1_3_flow` | sensor | LICV 8.2R1/3 flow | UNBEKANNT: LICV Sensor LICV 8.2R1/3 flow | 26.0 | °C |
| `sensor.licv_8_2r1_3_flow_rate` | sensor | LICV 8.2R1/3 flow rate | UNBEKANNT: LICV Sensor LICV 8.2R1/3 flow rate | 0.0 | l/h |
| `sensor.licv_8_2r1_3_hd` | sensor | LICV 8.2R1/3 HD | Hochdruckpressostat — Sicherheitsschalter im Kältekreis | 11.88 | bar |
| `sensor.licv_8_2r1_3_heat_generator_status` | sensor | LICV 8.2R1/3 Heat generator status | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Heat generator status | 0.0 |  |
| `sensor.licv_8_2r1_3_heat_source_inlet` | sensor | LICV 8.2R1/3 heat source inlet | UNBEKANNT: LICV Sensor LICV 8.2R1/3 heat source inlet | 16.7 | °C |
| `sensor.licv_8_2r1_3_heating` | sensor | LICV 8.2R1/3 heating | UNBEKANNT: LICV Sensor LICV 8.2R1/3 heating | 7144.5 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | sensor | LICV 8.2R1/3 heating | UNBEKANNT: LICV Sensor LICV 8.2R1/3 heating | 18468.1 | kWh |
| `sensor.licv_8_2r1_3_heating_capacity` | sensor | LICV 8.2R1/3 Heating capacity | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Heating capacity | 0.0 | kW |
| `sensor.licv_8_2r1_3_heating_demand_border` | sensor | LICV 8.2R1/3 Heating demand border | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Heating demand border | 236.0 |  |
| `sensor.licv_8_2r1_3_impulse_vd1` | sensor | LICV 8.2R1/3 impulse VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | 1138.0 |  |
| `sensor.licv_8_2r1_3_integration` | sensor | LICV 8.2R1/3 integration | UNBEKANNT: LICV Sensor LICV 8.2R1/3 integration | 1.0 |  |
| `sensor.licv_8_2r1_3_level_heizen` | sensor | LICV 8.2R1/3 Level Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Level Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_mk1_heizen` | sensor | LICV 8.2R1/3 Level MK1 Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Level MK1 Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_overall_heizen` | sensor | LICV 8.2R1/3 Level Overall Heizen | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Level Overall Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_warmw` | sensor | LICV 8.2R1/3 Level Warmw. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Level Warmw. | 0.0 |  |
| `sensor.licv_8_2r1_3_max_flow_temp` | sensor | LICV 8.2R1/3 max. flow temp. | Vorlauftemperatur Heizkreis (Sollwert/Istwert) | 60.0 | °C |
| `sensor.licv_8_2r1_3_maximaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Maximaler Vorlauf MK 1 | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Maximaler Vorlauf MK 1 | 45.0 | °C |
| `sensor.licv_8_2r1_3_min_return_targ_temp` | sensor | LICV 8.2R1/3 min return targ.temp | UNBEKANNT: LICV Sensor LICV 8.2R1/3 min return targ.temp | 15.0 | °C |
| `sensor.licv_8_2r1_3_minimaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Minimaler Vorlauf MK 1 | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Minimaler Vorlauf MK 1 | 20.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_flow` | sensor | LICV 8.2R1/3 mix circ1 flow | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mix circ1 flow | 75.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_target` | sensor | LICV 8.2R1/3 mix circ1 target | UNBEKANNT: LICV Sensor LICV 8.2R1/3 mix circ1 target | 25.6 | °C |
| `sensor.licv_8_2r1_3_nd` | sensor | LICV 8.2R1/3 ND | UNBEKANNT: LICV Sensor LICV 8.2R1/3 ND | 11.89 | bar |
| `sensor.licv_8_2r1_3_operat_hours_heat` | sensor | LICV 8.2R1/3 operat. hours heat. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 operat. hours heat. | 3148.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | sensor | LICV 8.2R1/3 operating hours DHW | Brauchwasser-Temperatur (Warmwasser) | 317.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | sensor | LICV 8.2R1/3 operating hours HP | UNBEKANNT: LICV Sensor LICV 8.2R1/3 operating hours HP | 3467.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | sensor | LICV 8.2R1/3 operating hours VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | 3467.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | sensor | LICV 8.2R1/3 operating hours ZWE1 | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | 696.0 | h |
| `sensor.licv_8_2r1_3_operation_mode` | sensor | LICV 8.2R1/3 operation mode | UNBEKANNT: LICV Sensor LICV 8.2R1/3 operation mode | 5.0 |  |
| `sensor.licv_8_2r1_3_outdoor_temp` | sensor | LICV 8.2R1/3 outdoor temp. | UNBEKANNT: LICV Sensor LICV 8.2R1/3 outdoor temp. | 14.8 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | sensor | LICV 8.2R1/3 outdoor temp. ø | UNBEKANNT: LICV Sensor LICV 8.2R1/3 outdoor temp. ø | 10.1 | °C |
| `sensor.licv_8_2r1_3_pc_limit` | sensor | LICV 8.2R1/3 PC limit | UNBEKANNT: LICV Sensor LICV 8.2R1/3 PC limit | 30.0 | kW |
| `sensor.licv_8_2r1_3_pool_enabled` | sensor | LICV 8.2R1/3 Pool enabled | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Pool enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_power_consumption` | sensor | LICV 8.2R1/3 Power Consumption | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Power Consumption | 0.0 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | sensor | LICV 8.2R1/3 Power consumption min | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Power consumption min | 5.0 |  |
| `sensor.licv_8_2r1_3_return` | sensor | LICV 8.2R1/3 return | UNBEKANNT: LICV Sensor LICV 8.2R1/3 return | 26.1 | °C |
| `sensor.licv_8_2r1_3_return_target` | sensor | LICV 8.2R1/3 return target | UNBEKANNT: LICV Sensor LICV 8.2R1/3 return target | 25.6 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | sensor | LICV 8.2R1/3 return temp. limit. | Rücklauftemperatur Heizkreis | 50.0 | °C |
| `sensor.licv_8_2r1_3_status_dhw` | sensor | LICV 8.2R1/3 Status DHW | Brauchwasser-Temperatur (Warmwasser) | 1.0 |  |
| `sensor.licv_8_2r1_3_status_heating` | sensor | LICV 8.2R1/3 Status Heating | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Status Heating | 1.0 |  |
| `sensor.licv_8_2r1_3_total` | sensor | LICV 8.2R1/3 total | UNBEKANNT: LICV Sensor LICV 8.2R1/3 total | 7674.2 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | sensor | LICV 8.2R1/3 total heat quant. HS | UNBEKANNT: LICV Sensor LICV 8.2R1/3 total heat quant. HS | 20075.4 | kWh |
| `sensor.licv_8_2r1_3_tvl_calc_max` | sensor | LICV 8.2R1/3 TVL calc max | UNBEKANNT: LICV Sensor LICV 8.2R1/3 TVL calc max | 28.5 | °C |
| `switch.licv_8_2r1_3_cooling_blocked` | switch | LICV 8.2R1/3 Cooling blocked | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Cooling blocked | off |  |
| `switch.licv_8_2r1_3_dhw_blocked` | switch | LICV 8.2R1/3 DHW blocked | Brauchwasser-Temperatur (Warmwasser) | off |  |
| `switch.licv_8_2r1_3_extra_dhw` | switch | LICV 8.2R1/3 Extra DHW | Brauchwasser-Temperatur (Warmwasser) | off |  |
| `switch.licv_8_2r1_3_heating_blocked` | switch | LICV 8.2R1/3 Heating blocked | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Heating blocked | off |  |
| `switch.licv_8_2r1_3_high_speed_charge` | switch | LICV 8.2R1/3 high-speed charge | UNBEKANNT: LICV Sensor LICV 8.2R1/3 high-speed charge | off |  |
| `switch.licv_8_2r1_3_pool_blocked` | switch | LICV 8.2R1/3 Pool blocked | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Pool blocked | off |  |
| `switch.licv_8_2r1_3_secondary_return` | switch | LICV 8.2R1/3 secondary return | UNBEKANNT: LICV Sensor LICV 8.2R1/3 secondary return | off |  |
| `update.licv_8_2r1_3_firmware` | update | LICV 8.2R1/3 Firmware | UNBEKANNT: LICV Sensor LICV 8.2R1/3 Firmware | on |  |

## Met.no (Wetter)

1 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `weather.forecast_home` | weather | Forecast Home | Wetter-Vorhersage mit Temperatur, Luftdruck, etc. | partlycloudy |  |

## Shelly

342 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.jalousien_abends_schliessen` | automation | Jalousien abends schließen | Jalousie im Esszimmer, Shelly-gesteuert | on |  |
| `binary_sensor.dg_bad_jalousie_uberhitzung` | binary_sensor | DG_Bad_Jalousie Überhitzung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_bad_jalousie_uberlast` | binary_sensor | DG_Bad_Jalousie Überlast | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_bad_jalousie_uberspannung` | binary_sensor | DG_Bad_Jalousie Überspannung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_bad_jalousie_uberstrom` | binary_sensor | DG_Bad_Jalousie Überstrom | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_buero_jalousie_uberhitzung` | binary_sensor | DG_Buero_Jalousie Überhitzung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_buero_jalousie_uberlast` | binary_sensor | DG_Buero_Jalousie Überlast | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_buero_jalousie_uberspannung` | binary_sensor | DG_Buero_Jalousie Überspannung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_buero_jalousie_uberstrom` | binary_sensor | DG_Buero_Jalousie Überstrom | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_buero_workstation_uberhitzung` | binary_sensor | DG_Buero_Workstation Überhitzung | Überhitzungsschutz des Shelly Dachgeschoss | off |  |
| `binary_sensor.dg_buero_workstation_uberlast` | binary_sensor | DG_Buero_Workstation Überlast | Überlastschutz des Shelly Dachgeschoss | off |  |
| `binary_sensor.dg_buero_workstation_uberspannung` | binary_sensor | DG_Buero_Workstation Überspannung | Überspannungsschutz des Shelly Dachgeschoss | off |  |
| `binary_sensor.dg_buero_workstation_uberstrom` | binary_sensor | DG_Buero_Workstation Überstrom | Überstromschutz des Shelly Dachgeschoss | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_1 Überhitzung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberlast` | binary_sensor | DG_Schlafen_Jalousie_1 Überlast | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_1 Überspannung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_1 Überstrom | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_2 Überhitzung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberlast` | binary_sensor | DG_Schlafen_Jalousie_2 Überlast | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_2 Überspannung | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_2 Überstrom | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberhitzung` | binary_sensor | EG_Diele_Jalousie-1 Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberlast` | binary_sensor | EG_Diele_Jalousie-1 Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberspannung` | binary_sensor | EG_Diele_Jalousie-1 Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberstrom` | binary_sensor | EG_Diele_Jalousie-1 Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberhitzung` | binary_sensor | EG_Diele_Jalousie-2 Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberlast` | binary_sensor | EG_Diele_Jalousie-2 Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberspannung` | binary_sensor | EG_Diele_Jalousie-2 Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberstrom` | binary_sensor | EG_Diele_Jalousie-2 Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_essen_jalousie_uberhitzung` | binary_sensor | EG_Essen_Jalousie Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_essen_jalousie_uberlast` | binary_sensor | EG_Essen_Jalousie Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_essen_jalousie_uberspannung` | binary_sensor | EG_Essen_Jalousie Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_essen_jalousie_uberstrom` | binary_sensor | EG_Essen_Jalousie Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_kueche_jalousie_uberhitzung` | binary_sensor | EG_Kueche_Jalousie Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_kueche_jalousie_uberlast` | binary_sensor | EG_Kueche_Jalousie Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_kueche_jalousie_uberspannung` | binary_sensor | EG_Kueche_Jalousie Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_kueche_jalousie_uberstrom` | binary_sensor | EG_Kueche_Jalousie Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberhitzung` | binary_sensor | EG_Kueche_Spuelmaschine Überhitzung | Überhitzungsschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberlast` | binary_sensor | EG_Kueche_Spuelmaschine Überlast | Überlastschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberspannung` | binary_sensor | EG_Kueche_Spuelmaschine Überspannung | Überspannungsschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberstrom` | binary_sensor | EG_Kueche_Spuelmaschine Überstrom | Überstromschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_wc_jalousie_uberhitzung` | binary_sensor | EG_WC_Jalousie Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wc_jalousie_uberlast` | binary_sensor | EG_WC_Jalousie Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wc_jalousie_uberspannung` | binary_sensor | EG_WC_Jalousie Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wc_jalousie_uberstrom` | binary_sensor | EG_WC_Jalousie Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wc_licht_eingang_0` | binary_sensor | EG_WC_Licht Eingang 0 | UNBEKANNT: Shelly Gerät EG_WC_Licht Eingang 0 | on |  |
| `binary_sensor.eg_wc_licht_uberhitzung` | binary_sensor | EG_WC_Licht Überhitzung | Überhitzungsschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_wc_licht_uberlast` | binary_sensor | EG_WC_Licht Überlast | Überlastschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_wc_licht_uberspannung` | binary_sensor | EG_WC_Licht Überspannung | Überspannungsschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_wc_licht_uberstrom` | binary_sensor | EG_WC_Licht Überstrom | Überstromschutz des Shelly Erdgeschoss | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_1 Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberlast` | binary_sensor | EG_Wohnen_Jalousie_1 Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_1 Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_1 Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_2 Überhitzung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberlast` | binary_sensor | EG_Wohnen_Jalousie_2 Überlast | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_2 Überspannung | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_2 Überstrom | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberhitzung` | binary_sensor | KG_Flur_Kuehlschrank Überhitzung | Überhitzungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberlast` | binary_sensor | KG_Flur_Kuehlschrank Überlast | Überlastschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberspannung` | binary_sensor | KG_Flur_Kuehlschrank Überspannung | Überspannungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberstrom` | binary_sensor | KG_Flur_Kuehlschrank Überstrom | Überstromschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_keller_licht_eingang_0` | binary_sensor | KG_Keller_Licht Eingang 0 | UNBEKANNT: Shelly Gerät KG_Keller_Licht Eingang 0 | on |  |
| `binary_sensor.kg_keller_licht_uberhitzung` | binary_sensor | KG_Keller_Licht Überhitzung | Überhitzungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_keller_licht_uberlast` | binary_sensor | KG_Keller_Licht Überlast | Überlastschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_keller_licht_uberspannung` | binary_sensor | KG_Keller_Licht Überspannung | Überspannungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_keller_licht_uberstrom` | binary_sensor | KG_Keller_Licht Überstrom | Überstromschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_serverschrank_uberhitzung` | binary_sensor | KG_Technik_Serverschrank Überhitzung | Überhitzungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_serverschrank_uberlast` | binary_sensor | KG_Technik_Serverschrank Überlast | Überlastschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_serverschrank_uberspannung` | binary_sensor | KG_Technik_Serverschrank Überspannung | Überspannungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_serverschrank_uberstrom` | binary_sensor | KG_Technik_Serverschrank Überstrom | Überstromschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_trockner_uberhitzung` | binary_sensor | KG_Technik_Trockner Überhitzung | Überhitzungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_trockner_uberlast` | binary_sensor | KG_Technik_Trockner Überlast | Überlastschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_trockner_uberspannung` | binary_sensor | KG_Technik_Trockner Überspannung | Überspannungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_trockner_uberstrom` | binary_sensor | KG_Technik_Trockner Überstrom | Überstromschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberhitzung` | binary_sensor | KG_Technik_Waschmaschine Überhitzung | Überhitzungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberlast` | binary_sensor | KG_Technik_Waschmaschine Überlast | Überlastschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberspannung` | binary_sensor | KG_Technik_Waschmaschine Überspannung | Überspannungsschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberstrom` | binary_sensor | KG_Technik_Waschmaschine Überstrom | Überstromschutz des Shelly Kellergeschoss | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_1 Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberlast` | binary_sensor | OG_Ankleide_Jalousie_1 Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_1 Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_1 Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_2 Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberlast` | binary_sensor | OG_Ankleide_Jalousie_2 Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_2 Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_2 Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_ankleide_licht_eingang_0` | binary_sensor | OG_Ankleide_Licht Eingang 0 | UNBEKANNT: Shelly Gerät OG_Ankleide_Licht Eingang 0 | off |  |
| `binary_sensor.og_ankleide_licht_uberhitzung` | binary_sensor | OG_Ankleide_Licht Überhitzung | Überhitzungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_ankleide_licht_uberlast` | binary_sensor | OG_Ankleide_Licht Überlast | Überlastschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_ankleide_licht_uberspannung` | binary_sensor | OG_Ankleide_Licht Überspannung | Überspannungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_ankleide_licht_uberstrom` | binary_sensor | OG_Ankleide_Licht Überstrom | Überstromschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_bad_jalousie_1_uberhitzung` | binary_sensor | OG_Bad_Jalousie_1 Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_1_uberlast` | binary_sensor | OG_Bad_Jalousie_1 Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_1_uberspannung` | binary_sensor | OG_Bad_Jalousie_1 Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_1_uberstrom` | binary_sensor | OG_Bad_Jalousie_1 Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_2_uberhitzung` | binary_sensor | OG_Bad_Jalousie_2 Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_2_uberlast` | binary_sensor | OG_Bad_Jalousie_2 Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_2_uberspannung` | binary_sensor | OG_Bad_Jalousie_2 Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_jalousie_2_uberstrom` | binary_sensor | OG_Bad_Jalousie_2 Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_bad_licht_eingang_0` | binary_sensor | OG_Bad_Licht Eingang 0 | UNBEKANNT: Shelly Gerät OG_Bad_Licht Eingang 0 | off |  |
| `binary_sensor.og_bad_licht_uberhitzung` | binary_sensor | OG_Bad_Licht Überhitzung | Überhitzungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_bad_licht_uberlast` | binary_sensor | OG_Bad_Licht Überlast | Überlastschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_bad_licht_uberspannung` | binary_sensor | OG_Bad_Licht Überspannung | Überspannungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_bad_licht_uberstrom` | binary_sensor | OG_Bad_Licht Überstrom | Überstromschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_flur_jalousie_uberhitzung` | binary_sensor | OG_Flur_Jalousie Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_flur_jalousie_uberlast` | binary_sensor | OG_Flur_Jalousie Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_flur_jalousie_uberspannung` | binary_sensor | OG_Flur_Jalousie Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_flur_jalousie_uberstrom` | binary_sensor | OG_Flur_Jalousie Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberhitzung` | binary_sensor | OG_Zimmer1_Jalousie Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberlast` | binary_sensor | OG_Zimmer1_Jalousie Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberspannung` | binary_sensor | OG_Zimmer1_Jalousie Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberstrom` | binary_sensor | OG_Zimmer1_Jalousie Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer1_licht_eingang_0` | binary_sensor | OG_Zimmer1_Licht Eingang 0 | UNBEKANNT: Shelly Gerät OG_Zimmer1_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer1_licht_uberhitzung` | binary_sensor | OG_Zimmer1_Licht Überhitzung | Überhitzungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer1_licht_uberlast` | binary_sensor | OG_Zimmer1_Licht Überlast | Überlastschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer1_licht_uberspannung` | binary_sensor | OG_Zimmer1_Licht Überspannung | Überspannungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer1_licht_uberstrom` | binary_sensor | OG_Zimmer1_Licht Überstrom | Überstromschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberhitzung` | binary_sensor | OG_Zimmer2_Jalousie Überhitzung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberlast` | binary_sensor | OG_Zimmer2_Jalousie Überlast | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberspannung` | binary_sensor | OG_Zimmer2_Jalousie Überspannung | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberstrom` | binary_sensor | OG_Zimmer2_Jalousie Überstrom | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `binary_sensor.og_zimmer2_licht_eingang_0` | binary_sensor | OG_Zimmer2_Licht Eingang 0 | UNBEKANNT: Shelly Gerät OG_Zimmer2_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer2_licht_uberhitzung` | binary_sensor | OG_Zimmer2_Licht Überhitzung | Überhitzungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_licht_uberlast` | binary_sensor | OG_Zimmer2_Licht Überlast | Überlastschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_licht_uberspannung` | binary_sensor | OG_Zimmer2_Licht Überspannung | Überspannungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_licht_uberstrom` | binary_sensor | OG_Zimmer2_Licht Überstrom | Überstromschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberhitzung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überhitzung | Überhitzungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberlast` | binary_sensor | OG_Zimmer2_Lichtstreifen Überlast | Überlastschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberspannung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überspannung | Überspannungsschutz des Shelly Obergeschoss | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberstrom` | binary_sensor | OG_Zimmer2_Lichtstreifen Überstrom | Überstromschutz des Shelly Obergeschoss | off |  |
| `button.dg_bad_jalousie_neu_starten` | button | DG_Bad_Jalousie Neu starten | Jalousie im Dachgeschoss, Shelly-gesteuert | unknown |  |
| `button.dg_buero_jalousie_neu_starten` | button | DG_Buero_Jalousie Neu starten | Jalousie im Dachgeschoss, Shelly-gesteuert | unknown |  |
| `button.dg_buero_workstation_neu_starten` | button | DG_Buero_Workstation Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.dg_schlafen_jalousie_1_neu_starten` | button | DG_Schlafen_Jalousie_1 Neu starten | Jalousie im Dachgeschoss, Shelly-gesteuert | unknown |  |
| `button.dg_schlafen_jalousie_2_neu_starten` | button | DG_Schlafen_Jalousie_2 Neu starten | Jalousie im Dachgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_diele_jalousie_1_neu_starten` | button | EG_Diele_Jalousie-1 Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_diele_jalousie_2_neu_starten` | button | EG_Diele_Jalousie-2 Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_essen_jalousie_neu_starten` | button | EG_Essen_Jalousie Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_kueche_jalousie_neu_starten` | button | EG_Kueche_Jalousie Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_kueche_spuelmaschine_neu_starten` | button | EG_Kueche_Spuelmaschine Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.eg_wc_jalousie_neu_starten` | button | EG_WC_Jalousie Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_wc_licht_neu_starten` | button | EG_WC_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.eg_wohnen_jalousie_1_neu_starten` | button | EG_Wohnen_Jalousie_1 Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.eg_wohnen_jalousie_2_neu_starten` | button | EG_Wohnen_Jalousie_2 Neu starten | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `button.kg_flur_kuehlschrank_neu_starten` | button | KG_Flur_Kuehlschrank Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.kg_keller_licht_neu_starten` | button | KG_Keller_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.kg_technik_serverschrank_neu_starten` | button | KG_Technik_Serverschrank Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.kg_technik_trockner_neu_starten` | button | KG_Technik_Trockner Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.kg_technik_waermepumpe_3em_neu_starten` | button | KG_Technik_Waermepumpe_3EM Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.kg_technik_waschmaschine_neu_starten` | button | KG_Technik_Waschmaschine Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.og_ankleide_jalousie_1_neu_starten` | button | OG_Ankleide_Jalousie_1 Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_ankleide_jalousie_2_neu_starten` | button | OG_Ankleide_Jalousie_2 Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_ankleide_licht_neu_starten` | button | OG_Ankleide_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.og_bad_jalousie_1_neu_starten` | button | OG_Bad_Jalousie_1 Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_bad_jalousie_2_neu_starten` | button | OG_Bad_Jalousie_2 Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_bad_licht_neu_starten` | button | OG_Bad_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.og_flur_jalousie_neu_starten` | button | OG_Flur_Jalousie Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_zimmer1_jalousie_neu_starten` | button | OG_Zimmer1_Jalousie Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_zimmer1_licht_neu_starten` | button | OG_Zimmer1_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.og_zimmer2_jalousie_neu_starten` | button | OG_Zimmer2_Jalousie Neu starten | Jalousie im Obergeschoss, Shelly-gesteuert | unknown |  |
| `button.og_zimmer2_licht_neu_starten` | button | OG_Zimmer2_Licht Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `button.og_zimmer2_lichtstreifen_neu_starten` | button | OG_Zimmer2_Lichtstreifen Neu starten | Knopf: Shelly-Gerät neu starten | unknown |  |
| `cover.dg_bad_jalousie` | cover | DG_Bad_Jalousie | Jalousie im Dachgeschoss, Shelly-gesteuert | open |  |
| `cover.dg_buero_jalousie` | cover | DG_Buero_Jalousie | Jalousie im Dachgeschoss, Shelly-gesteuert | open |  |
| `cover.dg_schlafen_jalousie_1` | cover | DG_Schlafen_Jalousie_1 | Jalousie im Dachgeschoss, Shelly-gesteuert | open |  |
| `cover.dg_schlafen_jalousie_2` | cover | DG_Schlafen_Jalousie_2 | Jalousie im Dachgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_diele_jalousie_1` | cover | EG_Diele_Jalousie-1 | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_diele_jalousie_2` | cover | EG_Diele_Jalousie-2 | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_essen_jalousie` | cover | EG_Essen_Jalousie | Jalousie im Erdgeschoss, Shelly-gesteuert | closed |  |
| `cover.eg_kueche_jalousie` | cover | EG_Kueche_Jalousie | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_wc_jalousie` | cover | EG_WC_Jalousie | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_wohnen_jalousie_1` | cover | EG_Wohnen_Jalousie_1 | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.eg_wohnen_jalousie_2` | cover | EG_Wohnen_Jalousie_2 | Jalousie im Erdgeschoss, Shelly-gesteuert | open |  |
| `cover.og_ankleide_jalousie_1` | cover | OG_Ankleide_Jalousie_1 | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_ankleide_jalousie_2` | cover | OG_Ankleide_Jalousie_2 | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_bad_jalousie_1` | cover | OG_Bad_Jalousie_1 | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_bad_jalousie_2` | cover | OG_Bad_Jalousie_2 | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_flur_jalousie` | cover | OG_Flur_Jalousie | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_zimmer1_jalousie` | cover | OG_Zimmer1_Jalousie | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `cover.og_zimmer2_jalousie` | cover | OG_Zimmer2_Jalousie | Jalousie im Obergeschoss, Shelly-gesteuert | open |  |
| `event.dg_bad_jalousie_eingang_0` | event | DG_Bad_Jalousie Eingang 0 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-14T10:00:14.144+00:00 |  |
| `event.dg_bad_jalousie_eingang_1` | event | DG_Bad_Jalousie Eingang 1 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-10T07:35:40.802+00:00 |  |
| `event.dg_buero_jalousie_eingang_0` | event | DG_Buero_Jalousie Eingang 0 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-16T21:42:30.406+00:00 |  |
| `event.dg_buero_jalousie_eingang_1` | event | DG_Buero_Jalousie Eingang 1 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-13T05:27:49.668+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_0` | event | DG_Schlafen_Jalousie_1 Eingang 0 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-14T07:15:32.091+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_1` | event | DG_Schlafen_Jalousie_1 Eingang 1 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-14T05:14:05.163+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_0` | event | DG_Schlafen_Jalousie_2 Eingang 0 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-14T07:15:32.536+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_1` | event | DG_Schlafen_Jalousie_2 Eingang 1 | Jalousie im Dachgeschoss, Shelly-gesteuert | 2026-03-14T05:02:56.031+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_0` | event | EG_Diele_Jalousie-1 Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-10T17:34:54.294+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_1` | event | EG_Diele_Jalousie-1 Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-17T18:13:59.736+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_0` | event | EG_Diele_Jalousie-2 Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T06:27:50.610+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_1` | event | EG_Diele_Jalousie-2 Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-17T18:13:58.517+00:00 |  |
| `event.eg_essen_jalousie_eingang_0` | event | EG_Essen_Jalousie Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T17:13:13.954+00:00 |  |
| `event.eg_essen_jalousie_eingang_1` | event | EG_Essen_Jalousie Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-19T09:11:34.779+00:00 |  |
| `event.eg_kueche_jalousie_eingang_0` | event | EG_Kueche_Jalousie Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T17:13:14.466+00:00 |  |
| `event.eg_kueche_jalousie_eingang_1` | event | EG_Kueche_Jalousie Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T11:35:33.935+00:00 |  |
| `event.eg_wc_jalousie_eingang_0` | event | EG_WC_Jalousie Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `event.eg_wc_jalousie_eingang_1` | event | EG_WC_Jalousie Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | unknown |  |
| `event.eg_wohnen_jalousie_1_eingang_0` | event | EG_Wohnen_Jalousie_1 Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-14T22:48:17.189+00:00 |  |
| `event.eg_wohnen_jalousie_1_eingang_1` | event | EG_Wohnen_Jalousie_1 Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T20:02:17.415+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_0` | event | EG_Wohnen_Jalousie_2 Eingang 0 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-14T22:48:20.666+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_1` | event | EG_Wohnen_Jalousie_2 Eingang 1 | Jalousie im Erdgeschoss, Shelly-gesteuert | 2026-03-18T20:02:17.803+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_0` | event | OG_Ankleide_Jalousie_1 Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-18T06:07:46.703+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_1` | event | OG_Ankleide_Jalousie_1 Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-18T18:21:11.696+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_0` | event | OG_Ankleide_Jalousie_2 Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-18T06:07:41.151+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_1` | event | OG_Ankleide_Jalousie_2 Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-18T18:21:12.295+00:00 |  |
| `event.og_bad_jalousie_1_eingang_0` | event | OG_Bad_Jalousie_1 Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-14T16:40:32.165+00:00 |  |
| `event.og_bad_jalousie_1_eingang_1` | event | OG_Bad_Jalousie_1 Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-09T18:51:07.920+00:00 |  |
| `event.og_bad_jalousie_2_eingang_0` | event | OG_Bad_Jalousie_2 Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-17T19:04:35.724+00:00 |  |
| `event.og_bad_jalousie_2_eingang_1` | event | OG_Bad_Jalousie_2 Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-17T19:04:33.597+00:00 |  |
| `event.og_flur_jalousie_eingang_0` | event | OG_Flur_Jalousie Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-10T05:48:37.411+00:00 |  |
| `event.og_flur_jalousie_eingang_1` | event | OG_Flur_Jalousie Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-18T18:20:57.193+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_0` | event | OG_Zimmer1_Jalousie Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-19T08:08:25.746+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_1` | event | OG_Zimmer1_Jalousie Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-19T06:43:48.527+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_0` | event | OG_Zimmer2_Jalousie Eingang 0 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-19T11:42:04.421+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_1` | event | OG_Zimmer2_Jalousie Eingang 1 | Jalousie im Obergeschoss, Shelly-gesteuert | 2026-03-19T11:41:39.091+00:00 |  |
| `sensor.dg_bad_jalousie_energie` | sensor | DG_Bad_Jalousie Energie | Jalousie im Dachgeschoss, Shelly-gesteuert | 0.160893 | kWh |
| `sensor.dg_bad_jalousie_leistung` | sensor | DG_Bad_Jalousie Leistung | Jalousie im Dachgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.dg_buero_jalousie_energie` | sensor | DG_Buero_Jalousie Energie | Jalousie im Dachgeschoss, Shelly-gesteuert | 0.184262 | kWh |
| `sensor.dg_buero_jalousie_leistung` | sensor | DG_Buero_Jalousie Leistung | Jalousie im Dachgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.dg_buero_workstation_energie` | sensor | DG_Buero_Workstation Energie | Leistung/Energie des Shelly-Geräts | 15.937189 | kWh |
| `sensor.dg_buero_workstation_energieeinspeisung` | sensor | DG_Buero_Workstation Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.dg_buero_workstation_leistung` | sensor | DG_Buero_Workstation Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.dg_schlafen_jalousie_1_energie` | sensor | DG_Schlafen_Jalousie_1 Energie | Jalousie im Dachgeschoss, Shelly-gesteuert | 0.085622 | kWh |
| `sensor.dg_schlafen_jalousie_1_leistung` | sensor | DG_Schlafen_Jalousie_1 Leistung | Jalousie im Dachgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.dg_schlafen_jalousie_2_energie` | sensor | DG_Schlafen_Jalousie_2 Energie | Jalousie im Dachgeschoss, Shelly-gesteuert | 0.225417 | kWh |
| `sensor.dg_schlafen_jalousie_2_leistung` | sensor | DG_Schlafen_Jalousie_2 Leistung | Jalousie im Dachgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.eg_diele_jalousie_1_energie` | sensor | EG_Diele_Jalousie-1 Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.116386 | kWh |
| `sensor.eg_diele_jalousie_1_leistung` | sensor | EG_Diele_Jalousie-1 Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.eg_diele_jalousie_2_energie` | sensor | EG_Diele_Jalousie-2 Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.12402 | kWh |
| `sensor.eg_diele_jalousie_2_leistung` | sensor | EG_Diele_Jalousie-2 Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.0 | W |
| `sensor.eg_essen_jalousie_energie` | sensor | EG_Essen_Jalousie Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.52408 | kWh |
| `sensor.eg_essen_jalousie_leistung` | sensor | EG_Essen_Jalousie Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.eg_kueche_jalousie_energie` | sensor | EG_Kueche_Jalousie Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.207717 | kWh |
| `sensor.eg_kueche_jalousie_leistung` | sensor | EG_Kueche_Jalousie Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.eg_kueche_spuelmaschine_energie` | sensor | EG_Kueche_Spuelmaschine Energie | Leistung/Energie des Shelly-Geräts | 72.278229 | kWh |
| `sensor.eg_kueche_spuelmaschine_energieeinspeisung` | sensor | EG_Kueche_Spuelmaschine Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.eg_kueche_spuelmaschine_leistung` | sensor | EG_Kueche_Spuelmaschine Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.eg_wc_jalousie_energie` | sensor | EG_WC_Jalousie Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.111948 | kWh |
| `sensor.eg_wc_jalousie_leistung` | sensor | EG_WC_Jalousie Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.0 | W |
| `sensor.eg_wc_licht_energie` | sensor | EG_WC_Licht Energie | Leistung/Energie des Shelly-Geräts | 0.063327 | kWh |
| `sensor.eg_wc_licht_energieeinspeisung` | sensor | EG_WC_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.eg_wc_licht_leistung` | sensor | EG_WC_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.eg_wohnen_jalousie_1_energie` | sensor | EG_Wohnen_Jalousie_1 Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.292892 | kWh |
| `sensor.eg_wohnen_jalousie_1_leistung` | sensor | EG_Wohnen_Jalousie_1 Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.eg_wohnen_jalousie_2_energie` | sensor | EG_Wohnen_Jalousie_2 Energie | Jalousie im Erdgeschoss, Shelly-gesteuert | 0.489606 | kWh |
| `sensor.eg_wohnen_jalousie_2_leistung` | sensor | EG_Wohnen_Jalousie_2 Leistung | Jalousie im Erdgeschoss, Shelly-gesteuert | 0 | W |
| `sensor.kg_flur_kuehlschrank_energie` | sensor | KG_Flur_Kuehlschrank Energie | Leistung/Energie des Shelly-Geräts | 19.986893 | kWh |
| `sensor.kg_flur_kuehlschrank_energieeinspeisung` | sensor | KG_Flur_Kuehlschrank Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_flur_kuehlschrank_leistung` | sensor | KG_Flur_Kuehlschrank Leistung | Leistung/Energie des Shelly-Geräts | 43.8 | W |
| `sensor.kg_keller_licht_energie` | sensor | KG_Keller_Licht Energie | Leistung/Energie des Shelly-Geräts | 2.188037 | kWh |
| `sensor.kg_keller_licht_energieeinspeisung` | sensor | KG_Keller_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_keller_licht_leistung` | sensor | KG_Keller_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.kg_technik_serverschrank_energie` | sensor | KG_Technik_Serverschrank Energie | Leistung/Energie des Shelly-Geräts | 67.233651 | kWh |
| `sensor.kg_technik_serverschrank_energieeinspeisung` | sensor | KG_Technik_Serverschrank Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_technik_serverschrank_leistung` | sensor | KG_Technik_Serverschrank Leistung | Leistung/Energie des Shelly-Geräts | 84.6 | W |
| `sensor.kg_technik_trockner_energie` | sensor | KG_Technik_Trockner Energie | Leistung/Energie des Shelly-Geräts | 16.610453 | kWh |
| `sensor.kg_technik_trockner_energieeinspeisung` | sensor | KG_Technik_Trockner Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_technik_trockner_leistung` | sensor | KG_Technik_Trockner Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_energie` | sensor | KG_Technik_Waermepumpe_3EM Energie | Leistung/Energie des Shelly-Geräts | 891.40914 | kWh |
| `sensor.kg_technik_waermepumpe_3em_energieeinspeisung` | sensor | KG_Technik_Waermepumpe_3EM Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_technik_waermepumpe_3em_leistung` | sensor | KG_Technik_Waermepumpe_3EM Leistung | Leistung/Energie des Shelly-Geräts | 36.219 | W |
| `sensor.kg_technik_waermepumpe_3em_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Scheinleistung | Leistung/Energie des Shelly-Geräts | 134.261 | VA |
| `sensor.kg_technik_waermepumpe_3em_temperatur` | sensor | KG_Technik_Waermepumpe_3EM Temperatur | UNBEKANNT: Shelly Gerät KG_Technik_Waermepumpe_3EM Temperatur | 49.6 | °C |
| `sensor.kg_technik_waschmaschine_energie` | sensor | KG_Technik_Waschmaschine Energie | Leistung/Energie des Shelly-Geräts | 41.622718 | kWh |
| `sensor.kg_technik_waschmaschine_energieeinspeisung` | sensor | KG_Technik_Waschmaschine Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.kg_technik_waschmaschine_leistung` | sensor | KG_Technik_Waschmaschine Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.og_ankleide_jalousie_1_energie` | sensor | OG_Ankleide_Jalousie_1 Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.115044 | kWh |
| `sensor.og_ankleide_jalousie_1_leistung` | sensor | OG_Ankleide_Jalousie_1 Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_ankleide_jalousie_2_energie` | sensor | OG_Ankleide_Jalousie_2 Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.112147 | kWh |
| `sensor.og_ankleide_jalousie_2_leistung` | sensor | OG_Ankleide_Jalousie_2 Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_ankleide_licht_energie` | sensor | OG_Ankleide_Licht Energie | Leistung/Energie des Shelly-Geräts | 0.885542 | kWh |
| `sensor.og_ankleide_licht_energieeinspeisung` | sensor | OG_Ankleide_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.og_ankleide_licht_leistung` | sensor | OG_Ankleide_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.og_bad_jalousie_1_energie` | sensor | OG_Bad_Jalousie_1 Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.061925 | kWh |
| `sensor.og_bad_jalousie_1_leistung` | sensor | OG_Bad_Jalousie_1 Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_bad_jalousie_2_energie` | sensor | OG_Bad_Jalousie_2 Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.078853 | kWh |
| `sensor.og_bad_jalousie_2_leistung` | sensor | OG_Bad_Jalousie_2 Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_bad_licht_energie` | sensor | OG_Bad_Licht Energie | Leistung/Energie des Shelly-Geräts | 2.17615 | kWh |
| `sensor.og_bad_licht_energieeinspeisung` | sensor | OG_Bad_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.og_bad_licht_leistung` | sensor | OG_Bad_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.og_flur_jalousie_energie` | sensor | OG_Flur_Jalousie Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.244832 | kWh |
| `sensor.og_flur_jalousie_leistung` | sensor | OG_Flur_Jalousie Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_zimmer1_jalousie_energie` | sensor | OG_Zimmer1_Jalousie Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.202547 | kWh |
| `sensor.og_zimmer1_jalousie_leistung` | sensor | OG_Zimmer1_Jalousie Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_zimmer1_licht_energie` | sensor | OG_Zimmer1_Licht Energie | Leistung/Energie des Shelly-Geräts | 2.452635 | kWh |
| `sensor.og_zimmer1_licht_energieeinspeisung` | sensor | OG_Zimmer1_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.og_zimmer1_licht_leistung` | sensor | OG_Zimmer1_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.og_zimmer2_jalousie_energie` | sensor | OG_Zimmer2_Jalousie Energie | Jalousie im Obergeschoss, Shelly-gesteuert | 0.157884 | kWh |
| `sensor.og_zimmer2_jalousie_leistung` | sensor | OG_Zimmer2_Jalousie Leistung | Jalousie im Obergeschoss, Shelly-gesteuert | 0 | W |
| `sensor.og_zimmer2_licht_energie` | sensor | OG_Zimmer2_Licht Energie | Leistung/Energie des Shelly-Geräts | 0.043028 | kWh |
| `sensor.og_zimmer2_licht_energieeinspeisung` | sensor | OG_Zimmer2_Licht Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.og_zimmer2_licht_leistung` | sensor | OG_Zimmer2_Licht Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `sensor.og_zimmer2_lichtstreifen_energie` | sensor | OG_Zimmer2_Lichtstreifen Energie | Leistung/Energie des Shelly-Geräts | 2.321968 | kWh |
| `sensor.og_zimmer2_lichtstreifen_energieeinspeisung` | sensor | OG_Zimmer2_Lichtstreifen Energieeinspeisung | Leistung/Energie des Shelly-Geräts | 0.0 | kWh |
| `sensor.og_zimmer2_lichtstreifen_leistung` | sensor | OG_Zimmer2_Lichtstreifen Leistung | Leistung/Energie des Shelly-Geräts | 0.0 | W |
| `switch.dg_buero_workstation` | switch | DG_Buero_Workstation | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.eg_kueche_spuelmaschine` | switch | EG_Kueche_Spuelmaschine | Schaltbare Steckdose/Schalter, Shelly-gesteuert | on |  |
| `switch.eg_wc_licht` | switch | EG_WC_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.kg_flur_kuehlschrank` | switch | KG_Flur_Kuehlschrank | Schaltbare Steckdose/Schalter, Shelly-gesteuert | on |  |
| `switch.kg_keller_licht` | switch | KG_Keller_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.kg_technik_serverschrank` | switch | KG_Technik_Serverschrank | Schaltbare Steckdose/Schalter, Shelly-gesteuert | on |  |
| `switch.kg_technik_trockner` | switch | KG_Technik_Trockner | Schaltbare Steckdose/Schalter, Shelly-gesteuert | on |  |
| `switch.kg_technik_waschmaschine` | switch | KG_Technik_Waschmaschine | Schaltbare Steckdose/Schalter, Shelly-gesteuert | on |  |
| `switch.og_ankleide_licht` | switch | OG_Ankleide_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.og_bad_licht` | switch | OG_Bad_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.og_zimmer1_licht` | switch | OG_Zimmer1_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.og_zimmer2_licht` | switch | OG_Zimmer2_Licht | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `switch.og_zimmer2_lichtstreifen` | switch | OG_Zimmer2_Lichtstreifen | Schaltbare Steckdose/Schalter, Shelly-gesteuert | off |  |
| `update.dg_bad_jalousie_firmware` | update | DG_Bad_Jalousie Firmware | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `update.dg_buero_jalousie_firmware` | update | DG_Buero_Jalousie Firmware | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `update.dg_buero_workstation_firmware` | update | DG_Buero_Workstation Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.dg_schlafen_jalousie_1_firmware` | update | DG_Schlafen_Jalousie_1 Firmware | Jalousie im Dachgeschoss, Shelly-gesteuert | off |  |
| `update.dg_schlafen_jalousie_2_firmware` | update | DG_Schlafen_Jalousie_2 Firmware | Jalousie im Dachgeschoss, Shelly-gesteuert | on |  |
| `update.eg_diele_jalousie_1_firmware` | update | EG_Diele_Jalousie-1 Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_diele_jalousie_2_firmware` | update | EG_Diele_Jalousie-2 Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_essen_jalousie_firmware` | update | EG_Essen_Jalousie Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_kueche_jalousie_firmware` | update | EG_Kueche_Jalousie Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_kueche_spuelmaschine_firmware` | update | EG_Kueche_Spuelmaschine Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.eg_wc_jalousie_firmware` | update | EG_WC_Jalousie Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_wc_licht_firmware` | update | EG_WC_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.eg_wohnen_jalousie_1_firmware` | update | EG_Wohnen_Jalousie_1 Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.eg_wohnen_jalousie_2_firmware` | update | EG_Wohnen_Jalousie_2 Firmware | Jalousie im Erdgeschoss, Shelly-gesteuert | off |  |
| `update.kg_flur_kuehlschrank_firmware` | update | KG_Flur_Kuehlschrank Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.kg_keller_licht_firmware` | update | KG_Keller_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.kg_technik_serverschrank_firmware` | update | KG_Technik_Serverschrank Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.kg_technik_trockner_firmware` | update | KG_Technik_Trockner Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.kg_technik_waermepumpe_3em_firmware` | update | KG_Technik_Waermepumpe_3EM Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.kg_technik_waschmaschine_firmware` | update | KG_Technik_Waschmaschine Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.og_ankleide_jalousie_1_firmware` | update | OG_Ankleide_Jalousie_1 Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_ankleide_jalousie_2_firmware` | update | OG_Ankleide_Jalousie_2 Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_ankleide_licht_firmware` | update | OG_Ankleide_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.og_bad_jalousie_1_firmware` | update | OG_Bad_Jalousie_1 Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_bad_jalousie_2_firmware` | update | OG_Bad_Jalousie_2 Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_bad_licht_firmware` | update | OG_Bad_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.og_flur_jalousie_firmware` | update | OG_Flur_Jalousie Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_zimmer1_jalousie_firmware` | update | OG_Zimmer1_Jalousie Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_zimmer1_licht_firmware` | update | OG_Zimmer1_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.og_zimmer2_jalousie_firmware` | update | OG_Zimmer2_Jalousie Firmware | Jalousie im Obergeschoss, Shelly-gesteuert | off |  |
| `update.og_zimmer2_licht_firmware` | update | OG_Zimmer2_Licht Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |
| `update.og_zimmer2_lichtstreifen_firmware` | update | OG_Zimmer2_Lichtstreifen Firmware | Firmware-Update-Status für Shelly-Gerät | off |  |

## Solcast

23 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.pv_generating` | binary_sensor | PV generating | PV erzeugt gerade Strom (binär) | on |  |
| `binary_sensor.pv_generating_delay` | binary_sensor | PV generating (delay) | PV erzeugt Strom (mit Verzögerung) | on |  |
| `select.solcast_pv_forecast_verwenden_sie_das_prognosefeld` | select | Solcast PV Forecast Verwenden Sie das Prognosefeld | Solcast PV-Erzeugungsprognose | estimate |  |
| `sensor.p_pv_forecast` | sensor | PV Power Forecast | UNBEKANNT: PV Power Forecast | 4818.00 | W |
| `sensor.solcast_pv_forecast_aktuelle_leistung` | sensor | Solcast PV Forecast Aktuelle Leistung | Solcast PV-Erzeugungsprognose | 4681 | W |
| `sensor.solcast_pv_forecast_fester_grenzwert_eingestellt` | sensor | Solcast PV Forecast Fester Grenzwert eingestellt | Solcast PV-Erzeugungsprognose | False |  |
| `sensor.solcast_pv_forecast_leistung_in_1_stunde` | sensor | Solcast PV Forecast Leistung in 1 Stunde | Solcast PV-Erzeugungsprognose | 3866 | W |
| `sensor.solcast_pv_forecast_leistung_in_30_minuten` | sensor | Solcast PV Forecast Leistung in 30 Minuten | Solcast PV-Erzeugungsprognose | 4318 | W |
| `sensor.solcast_pv_forecast_max_api_abrufe` | sensor | Solcast PV Forecast max. API-Abrufe | Solcast PV-Erzeugungsprognose | 10 |  |
| `sensor.solcast_pv_forecast_prognose_aktuelle_stunde` | sensor | Solcast PV Forecast Prognose aktuelle Stunde | Solcast PV-Erzeugungsprognose | 4665 | Wh |
| `sensor.solcast_pv_forecast_prognose_heute` | sensor | Solcast PV Forecast Prognose heute | Solcast PV-Erzeugungsprognose für den heutigen Tag | 36.2924 | kWh |
| `sensor.solcast_pv_forecast_prognose_morgen` | sensor | Solcast PV Forecast Prognose morgen | Solcast PV-Erzeugungsprognose für den morgigen Tag | 35.9139 | kWh |
| `sensor.solcast_pv_forecast_prognose_nachste_stunde` | sensor | Solcast PV Forecast Prognose nächste Stunde | Solcast PV-Erzeugungsprognose | 3848 | Wh |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute` | sensor | Solcast PV Forecast Prognose Spitzenleistung heute | Solcast PV-Erzeugungsprognose für den heutigen Tag | 5226 | W |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen` | sensor | Solcast PV Forecast Prognose Spitzenleistung morgen | Solcast PV-Erzeugungsprognose für den morgigen Tag | 5120 | W |
| `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute` | sensor | Solcast PV Forecast Prognose verbleibende Leistung heute | Solcast PV-Erzeugungsprognose für den heutigen Tag | 12.3865 | kWh |
| `sensor.solcast_pv_forecast_verwendete_api_abrufe` | sensor | Solcast PV Forecast Verwendete API-Abrufe | Solcast PV-Erzeugungsprognose | 6 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_letzter_api_abruf` | sensor | Solcast PV Forecast Zeitpunkt letzter API-Abruf | Solcast PV-Erzeugungsprognose | 2026-03-19T10:21:40+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_heute` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung heute | Solcast PV-Erzeugungsprognose für den heutigen Tag | 2026-03-19T10:30:00+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_morgen` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | Solcast PV-Erzeugungsprognose für den morgigen Tag | 2026-03-20T10:30:00+00:00 |  |
| `sensor.vorderer_schaftrieb_10` | sensor | Vorderer Schaftrieb 10 | UNBEKANNT: Solcast Sensor Vorderer Schaftrieb 10 | 16.2621 | kWh |
| `sensor.vorderer_schaftrieb_10_west` | sensor | Vorderer Schaftrieb 10 (West) | UNBEKANNT: Solcast Sensor Vorderer Schaftrieb 10 (West) | 20.0304 | kWh |
| `update.solcast_pv_forecast_update` | update | Solcast PV Forecast update | Solcast PV-Erzeugungsprognose | off |  |

## Sonos

12 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `media_player.box` | media_player | Box | Sonos Box Media Player (Wohnbereich) | idle |  |
| `media_player.dg` | media_player | DG | Sonos Dachgeschoss Media Player / Fernbedienung | idle |  |
| `media_player.lounge` | media_player | Lounge | Sonos Lounge Media Player | off |  |
| `media_player.og` | media_player | OG | Sonos Obergeschoss Media Player | idle |  |
| `number.box_balance` | number | Box Balance | Balance (L/R) Einstellung Sonos Speaker | 0 |  |
| `number.box_bass` | number | Box Bass | Bass-Einstellung Sonos Speaker | 0 |  |
| `number.box_treble` | number | Box Höhen | Höhen-Einstellung Sonos Speaker | 0 |  |
| `remote.dg` | remote | DG | Sonos Dachgeschoss Media Player / Fernbedienung | on |  |
| `remote.lounge` | remote | Lounge | Sonos Fernbedienung / Controller | on |  |
| `remote.og` | remote | OG | Sonos Fernbedienung / Controller | on |  |
| `switch.box_crossfade` | switch | Box Überblenden | Crossfade zwischen Musikstücken (Sonos) | off |  |
| `switch.box_loudness` | switch | Box Loudness | Loudness-Optimierung (Sonos) | on |  |

## Sonstige

38 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.battery_current` | sensor | Battery current | UNBEKANNT: Battery current | 0.0 | A |
| `sensor.battery_firmware_version` | sensor | Battery Firmware Version | UNBEKANNT: Battery Firmware Version |                                |  |
| `sensor.battery_state_of_health` | sensor | Battery state of health | UNBEKANNT: Battery state of health | 99 | % |
| `sensor.battery_voltage` | sensor | Battery voltage | UNBEKANNT: Battery voltage | 269.0 | V |
| `sensor.daily_consumed_energy` | sensor | Daily consumed energy | UNBEKANNT: Daily consumed energy | 10.1 | kWh |
| `sensor.inverter_firmware_version` | sensor | Inverter Firmware Version | UNBEKANNT: Inverter Firmware Version |                                |  |
| `sensor.next_hour_electricity_market_price` | sensor | Next hour electricity market price | ENTSO-e Strommarktpreis | 0.05203 | €/kWh |
| `sensor.p_batt_forecast` | sensor | Battery Power Forecast | UNBEKANNT: Battery Power Forecast | -2547.40 | W |
| `sensor.p_grid_forecast` | sensor | Grid Power Forecast | UNBEKANNT: Grid Power Forecast | 0.00 | W |
| `sensor.p_hybrid_inverter` | sensor | PV Hybrid Inverter | UNBEKANNT: PV Hybrid Inverter | 2270.60 | W |
| `sensor.p_load_forecast` | sensor | Load Power Forecast | UNBEKANNT: Load Power Forecast | 2270.60 | W |
| `sensor.soc_batt_forecast` | sensor | Battery SOC Forecast | UNBEKANNT: Battery SOC Forecast | 59.45 | % |
| `sensor.sun_next_dawn` | sensor | Sun Nächste Morgendämmerung | UNBEKANNT: Sun Nächste Morgendämmerung | 2026-03-20T04:57:18+00:00 |  |
| `sensor.sun_next_dusk` | sensor | Sun Nächste Abenddämmerung | UNBEKANNT: Sun Nächste Abenddämmerung | 2026-03-19T18:09:02+00:00 |  |
| `sensor.sun_next_midnight` | sensor | Sun Nächste Mitternacht | UNBEKANNT: Sun Nächste Mitternacht | 2026-03-19T23:33:27+00:00 |  |
| `sensor.sun_next_noon` | sensor | Sun Nächster Höchststand | UNBEKANNT: Sun Nächster Höchststand | 2026-03-20T11:33:34+00:00 |  |
| `sensor.sun_next_rising` | sensor | Sun Nächster Aufgang | UNBEKANNT: Sun Nächster Aufgang | 2026-03-20T05:29:23+00:00 |  |
| `sensor.sun_next_setting` | sensor | Sun Nächster Untergang | UNBEKANNT: Sun Nächster Untergang | 2026-03-19T17:36:52+00:00 |  |
| `sensor.total_consumed_energy` | sensor | Total consumed energy | UNBEKANNT: Total consumed energy | 8663.9 | kWh |
| `sensor.total_exported_energy` | sensor | Total exported energy | UNBEKANNT: Total exported energy | 104.6 | kWh |
| `sensor.total_imported_energy` | sensor | Total imported energy | UNBEKANNT: Total imported energy | 6436.8 | kWh |
| `sensor.wp_cop_heizung_gesamt` | sensor | WP COP Heizung gesamt | UNBEKANNT: WP COP Heizung gesamt | 0 |  |
| `sensor.wp_cop_heizung_monatlich` | sensor | WP COP Heizung monatlich | UNBEKANNT: WP COP Heizung monatlich | 2.73 |  |
| `sensor.wp_cop_kombiniert_gesamt` | sensor | WP COP kombiniert gesamt | UNBEKANNT: WP COP kombiniert gesamt | 0 |  |
| `sensor.wp_cop_kombiniert_monatlich` | sensor | WP COP kombiniert monatlich | UNBEKANNT: WP COP kombiniert monatlich | 2.73 |  |
| `sensor.wp_cop_warmwasser_gesamt` | sensor | WP COP Warmwasser gesamt | UNBEKANNT: WP COP Warmwasser gesamt | 0 |  |
| `sensor.wp_cop_warmwasser_monatlich` | sensor | WP COP Warmwasser monatlich | UNBEKANNT: WP COP Warmwasser monatlich | 0.0 |  |
| `sensor.wp_heizung_thermisch_gesamt_seit_tracking` | sensor | WP Heizung thermisch gesamt (seit Tracking) | UNBEKANNT: WP Heizung thermisch gesamt (seit Tracking) | 195.0 | kWh |
| `sensor.wp_heizung_thermisch_monatlich` | sensor | WP Heizung thermisch monatlich | UNBEKANNT: WP Heizung thermisch monatlich | 195.0 | kWh |
| `sensor.wp_strom_gesamt_seit_tracking` | sensor | WP Strom gesamt (seit Tracking) | UNBEKANNT: WP Strom gesamt (seit Tracking) | 71.33994 | kWh |
| `sensor.wp_strom_monatlich` | sensor | WP Strom monatlich | UNBEKANNT: WP Strom monatlich | 71.33994 | kWh |
| `sensor.wp_warmwasser_thermisch_gesamt_seit_tracking` | sensor | WP Warmwasser thermisch gesamt (seit Tracking) | UNBEKANNT: WP Warmwasser thermisch gesamt (seit Tracking) | 32.9 | kWh |
| `sensor.wp_warmwasser_thermisch_monatlich` | sensor | WP Warmwasser thermisch monatlich | UNBEKANNT: WP Warmwasser thermisch monatlich | 32.9 | kWh |
| `update.apexcharts_card_update` | update | apexcharts-card update | UNBEKANNT: apexcharts-card update | off |  |
| `update.mini_graph_card_update` | update | mini-graph-card update | UNBEKANNT: mini-graph-card update | off |  |
| `update.mushroom_update` | update | Mushroom update | UNBEKANNT: Mushroom update | off |  |
| `update.plotly_graph_card_update` | update | Plotly Graph Card update | UNBEKANNT: Plotly Graph Card update | off |  |
| `update.power_flow_card_plus_update` | update | Power Flow Card Plus update | UNBEKANNT: Power Flow Card Plus update | off |  |

## Sun (HA built-in)

1 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sun.sun` | sun | Sun | Sonnenauf-/untergang und Position (Azimuth, Elevation) | above_horizon |  |

## Sungrow (Modbus)

148 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.sungrow_dashboard_enable_danger_mode_auto_reset` | automation | sungrow dashboard enable danger mode auto reset | UNBEKANNT: sungrow dashboard enable danger mode auto reset | on |  |
| `automation.sungrow_max_export_scene_sets_rated_limit` | automation | sungrow max export scene sets rated limit | UNBEKANNT: sungrow max export scene sets rated limit | on |  |
| `binary_sensor.battery_charging` | binary_sensor | Battery charging | UNBEKANNT: Battery charging | off |  |
| `binary_sensor.battery_charging_delay` | binary_sensor | Battery charging (delay) | UNBEKANNT: Battery charging (delay) | off |  |
| `binary_sensor.battery_discharging` | binary_sensor | Battery discharging | UNBEKANNT: Battery discharging | off |  |
| `binary_sensor.battery_discharging_delay` | binary_sensor | Battery discharging (delay) | UNBEKANNT: Battery discharging (delay) | off |  |
| `binary_sensor.exporting_power` | binary_sensor | Exporting Power | Binär: Netzeinspeisung aktiv (Power wird ins Netz eingespeist) | on |  |
| `binary_sensor.exporting_power_delay` | binary_sensor | Exporting Power (delay) | Binär: Netzeinspeisung aktiv (Power wird ins Netz eingespeist) | on |  |
| `binary_sensor.importing_power` | binary_sensor | Importing Power | Binär: Netzbezug aktiv (Power wird vom Netz bezogen) | off |  |
| `binary_sensor.importing_power_delay` | binary_sensor | Importing Power (delay) | Binär: Netzbezug aktiv (Power wird vom Netz bezogen) | off |  |
| `binary_sensor.negative_load_power` | binary_sensor | Negative Load Power | Aktueller Stromverbrauch des gesamten Haushalts | off |  |
| `binary_sensor.negative_load_power_delay` | binary_sensor | Negative Load Power (delay) | Aktueller Stromverbrauch des gesamten Haushalts | off |  |
| `binary_sensor.positive_load_power` | binary_sensor | Positive Load Power | Aktueller Stromverbrauch des gesamten Haushalts | on |  |
| `binary_sensor.positive_load_power_delay` | binary_sensor | Positive Load Power (delay) | Aktueller Stromverbrauch des gesamten Haushalts | on |  |
| `button.start_inverter` | button | Start inverter | Knopf: Wechselrichter starten | unknown |  |
| `button.stop_inverter` | button | Stop inverter | Knopf: Wechselrichter stoppen | unknown |  |
| `number.battery_charging_start_power` | number | Battery charging start power | UNBEKANNT: Battery charging start power | 0.0 | W |
| `number.battery_discharging_start_power` | number | Battery discharging start power | UNBEKANNT: Battery discharging start power | 0.0 | W |
| `number.battery_forced_charge_discharge_power` | number | Battery forced charge discharge power | Erzwungene Batterieladung ein/aus | 0.0 | W |
| `number.battery_max_charge_power` | number | Battery max charge power | Maximal zulässige Lade-Leistung der Batterie | 10.0 | W |
| `number.battery_max_discharge_power` | number | Battery max discharge power | Maximal zulässige Entlade-Leistung der Batterie | 8000.0 | W |
| `number.battery_max_soc` | number | Battery Max Soc | Maximaler Ladestand (State of Charge) der Batterie | 100.0 | % |
| `number.battery_min_soc` | number | Battery Min Soc | Minimaler Ladestand (State of Charge) der Batterie | 5.0 | % |
| `number.export_power_limit` | number | Export power limit | Nummer/Schalter: Netzeinspeisung begrenzen | 10000.0 | W |
| `scene.battery_forced_charge` | scene | Battery Forced Charge | Erzwungene Batterieladung ein/aus | unknown |  |
| `scene.max_export_power` | scene | Max Export Power | Aktuelle Netzeinspeisung ins Stromnetz | unknown |  |
| `select.battery_forced_charge_discharge` | select | Battery forced charge discharge | Erzwungene Batterieladung ein/aus | Forced charge |  |
| `select.ems_mode` | select | EMS mode | Energy Management System Betriebsmodus | Self-consumption mode (default) |  |
| `select.load_adjustment_mode` | select | Load adjustment mode | Nummer/Schalter: Lastregelung aktivieren/deaktivieren | Disabled |  |
| `sensor.active_power_limitation_ratio_raw` | sensor | Active power limitation ratio raw | Verhältnis der Leistungsbegrenzung (in Prozent) | 6554 | % |
| `sensor.active_power_limitation_raw` | sensor | Active power limitation raw | UNBEKANNT: Active power limitation raw | 65535 |  |
| `sensor.apl_shutdown_at_zero_raw` | sensor | APL shutdown at zero raw | UNBEKANNT: APL shutdown at zero raw | 85 |  |
| `sensor.backup_phase_a_power` | sensor | Backup phase A power | Leistung Phase A des Drehstromnetzes | 0 | W |
| `sensor.backup_phase_b_power` | sensor | Backup phase B power | Leistung Phase B des Drehstromnetzes | 0 | W |
| `sensor.backup_phase_c_power` | sensor | Backup phase C power | Leistung Phase C des Drehstromnetzes | 0 | W |
| `sensor.battery_capacity_high_precision` | sensor | Battery capacity high precision | Gesamtkapazität der SBR128 Batterie (12.8 kWh) | 12.80 | kWh |
| `sensor.battery_charge` | sensor | Battery charge | UNBEKANNT: Battery charge | 12.16 | kWh |
| `sensor.battery_charge_health_rated` | sensor | Battery charge (health-rated) | UNBEKANNT: Battery charge (health-rated) | 12.04 | kWh |
| `sensor.battery_charge_nominal` | sensor | Battery charge (nominal) | UNBEKANNT: Battery charge (nominal) | 12.8 | kWh |
| `sensor.battery_charging_power` | sensor | Battery charging power | UNBEKANNT: Battery charging power | 0 | W |
| `sensor.battery_charging_power_signed` | sensor | Battery charging power signed | UNBEKANNT: Battery charging power signed | 0 | W |
| `sensor.battery_charging_start_power` | sensor | Battery charging start power | UNBEKANNT: Battery charging start power | 0 | W |
| `sensor.battery_discharging_power` | sensor | Battery discharging power | UNBEKANNT: Battery discharging power | 0 | W |
| `sensor.battery_discharging_power_signed` | sensor | Battery discharging power signed | UNBEKANNT: Battery discharging power signed | 0 | W |
| `sensor.battery_discharging_start_power` | sensor | Battery discharging start power | UNBEKANNT: Battery discharging start power | 0 | W |
| `sensor.battery_forced_charge_discharge_cmd_raw` | sensor | Battery forced charge discharge cmd raw | UNBEKANNT: Battery forced charge discharge cmd raw | 170 |  |
| `sensor.battery_forced_charge_discharge_power` | sensor | Battery forced charge discharge power | Erzwungene Batterieladung ein/aus | 0 | W |
| `sensor.battery_level` | sensor | Battery level | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 100.0 | % |
| `sensor.battery_level_nominal` | sensor | Battery level (nominal) | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 100.0 | % |
| `sensor.battery_max_charge_power` | sensor | Battery max charge power | Maximal zulässige Lade-Leistung der Batterie | 10 | W |
| `sensor.battery_max_discharge_power` | sensor | Battery max discharge power | Maximal zulässige Entlade-Leistung der Batterie | 8000 | W |
| `sensor.battery_max_soc` | sensor | Battery max SoC | Maximaler Ladestand (State of Charge) der Batterie | 100.0 | % |
| `sensor.battery_min_soc` | sensor | Battery min SoC | Minimaler Ladestand (State of Charge) der Batterie | 5.0 | % |
| `sensor.battery_power` | sensor | Battery power | UNBEKANNT: Battery power | 0 | W |
| `sensor.battery_temperature` | sensor | Battery temperature | Temperatur der Batterie | 29.0 | °C |
| `sensor.bdc_rated_power` | sensor | BDC rated power | Nennleistung des DC/DC-Konverters | 10000 | W |
| `sensor.bms_max_charging_current` | sensor | BMS max. charging current | Maximaler Ladestrom des Batterie-Management-Systems | 0 | A |
| `sensor.bms_max_discharging_current` | sensor | BMS max. discharging current | Maximaler Entladestrom des Batterie-Management-Systems | 30 | A |
| `sensor.communication_module_firmware_version` | sensor | Communication Module Firmware Version | Firmware-Version des Kommunikationsmoduls |                                |  |
| `sensor.daily_battery_charge` | sensor | Daily battery charge | Batterie-Ladung seit Tagesbeginn | 12.7 | kWh |
| `sensor.daily_battery_charge_from_pv` | sensor | Daily battery charge from PV | Batterie-Ladung seit Tagesbeginn | 12.7 | kWh |
| `sensor.daily_battery_discharge` | sensor | Daily battery discharge | Batterie-Entladung seit Tagesbeginn | 5.5 | kWh |
| `sensor.daily_direct_energy_consumption` | sensor | Daily direct energy consumption | Stromverbrauch für HA Energy Dashboard | 3.3 | kWh |
| `sensor.daily_exported_energy` | sensor | Daily exported energy | Netzeinspeisung seit Tagesbeginn (Sungrow) | 2.0 | kWh |
| `sensor.daily_exported_energy_from_pv` | sensor | Daily exported energy from PV | Netzeinspeisung seit Tagesbeginn (Sungrow) | 2.0 | kWh |
| `sensor.daily_imported_energy` | sensor | Daily imported energy | Netzbezug seit Tagesbeginn (Sungrow) | 1.3 | kWh |
| `sensor.daily_pv_generation` | sensor | Daily PV generation | Solar-Erzeugung seit Tagesbeginn (Sungrow) | 18.0 | kWh |
| `sensor.daily_pv_generation_battery_discharge` | sensor | Daily PV generation & battery discharge | Solar-Erzeugung seit Tagesbeginn (Sungrow) | 10.1 | kWh |
| `sensor.ems_mode_selection_raw` | sensor | EMS mode selection raw | UNBEKANNT: EMS mode selection raw | 0 |  |
| `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power` | sensor | Battery Power | Energie-Daten für HA Energy Dashboard | 0.0 | W |
| `sensor.energy_grid_import_power_export_power_net_power` | sensor | Grid Power | Aktuelle Netzbezugsleistung vom Stromnetz | -5034.0 | W |
| `sensor.export_power` | sensor | Export power | Aktuelle Netzeinspeisung ins Stromnetz | 5034 | W |
| `sensor.export_power_limit` | sensor | Export power limit | Nummer/Schalter: Netzeinspeisung begrenzen | 10000 | W |
| `sensor.export_power_limit_mode_raw` | sensor | Export power limit mode raw | Nummer/Schalter: Netzeinspeisung begrenzen | 170 |  |
| `sensor.export_power_raw` | sensor | Export power raw | Aktuelle Netzeinspeisung ins Stromnetz | 5034 | W |
| `sensor.grid_frequency` | sensor | Grid frequency | Stromfrequenz im Stromnetz (50 Hz Basis) | 49.98 | Hz |
| `sensor.import_power` | sensor | Import power | Aktuelle Netzbezugsleistung vom Stromnetz | 0 | W |
| `sensor.inverter_rated_output` | sensor | Inverter rated output | Nennleistung des Wechselrichters (maximale Ausgangsleistung) | 10000 | W |
| `sensor.inverter_temperature` | sensor | Inverter temperature | Innentemperatur des Wechselrichters SH10RT-20 | 50.2 | °C |
| `sensor.iphone_von_david_battery_level` | sensor | iPhone von David Battery Level | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 80 | % |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistung | Leistung Phase A des Drehstromnetzes | 4.1 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistungsfaktor | Leistung Phase A des Drehstromnetzes | 0.05 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_a_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Scheinleistung | Leistung Phase A des Drehstromnetzes | 78.3 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistung | Leistung Phase B des Drehstromnetzes | 32.1 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistungsfaktor | Leistung Phase B des Drehstromnetzes | 0.65 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_b_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Scheinleistung | Leistung Phase B des Drehstromnetzes | 49.3 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistung | Leistung Phase C des Drehstromnetzes | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistungsfaktor | Leistung Phase C des Drehstromnetzes | 0.0 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_c_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Scheinleistung | Leistung Phase C des Drehstromnetzes | 6.6 | VA |
| `sensor.load_adjustment_mode_enable_raw` | sensor | Load adjustment mode enable raw | Nummer/Schalter: Lastregelung aktivieren/deaktivieren | 85 |  |
| `sensor.load_adjustment_mode_selection_raw` | sensor | Load adjustment mode selection raw | Nummer/Schalter: Lastregelung aktivieren/deaktivieren | 3 |  |
| `sensor.load_power` | sensor | Load power | Aktueller Stromverbrauch des gesamten Haushalts | 414 | W |
| `sensor.meter_active_power` | sensor | Meter active power | Leistung vom Stromzähler (Netzanbindung) | -5037 | W |
| `sensor.meter_phase_a_active_power` | sensor | Meter phase A active power | Leistung Phase A des Drehstromnetzes | -1632 | W |
| `sensor.meter_phase_a_current` | sensor | Meter phase A current | Leistung Phase A des Drehstromnetzes | unavailable | A |
| `sensor.meter_phase_a_voltage` | sensor | Meter phase A voltage | Leistung Phase A des Drehstromnetzes | unavailable | V |
| `sensor.meter_phase_b_active_power` | sensor | Meter phase B active power | Leistung Phase B des Drehstromnetzes | -1633 | W |
| `sensor.meter_phase_b_current` | sensor | Meter phase B current | Leistung Phase B des Drehstromnetzes | unavailable | A |
| `sensor.meter_phase_b_voltage` | sensor | Meter phase B voltage | Leistung Phase B des Drehstromnetzes | unavailable | V |
| `sensor.meter_phase_c_active_power` | sensor | Meter phase C active power | Leistung Phase C des Drehstromnetzes | -1724 | W |
| `sensor.meter_phase_c_current` | sensor | Meter phase C current | Leistung Phase C des Drehstromnetzes | unavailable | A |
| `sensor.meter_phase_c_voltage` | sensor | Meter phase C voltage | Leistung Phase C des Drehstromnetzes | unavailable | V |
| `sensor.mppt1_current` | sensor | MPPT1 current | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 8.8 | A |
| `sensor.mppt1_power` | sensor | MPPT1 power | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 3442 | W |
| `sensor.mppt1_voltage` | sensor | MPPT1 voltage | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 391.2 | V |
| `sensor.mppt2_current` | sensor | MPPT2 current | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 7.7 | A |
| `sensor.mppt2_power` | sensor | MPPT2 power | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 2141 | W |
| `sensor.mppt2_voltage` | sensor | MPPT2 voltage | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 278.1 | V |
| `sensor.mppt3_current` | sensor | MPPT3 current | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0.0 | A |
| `sensor.mppt3_power` | sensor | MPPT3 power | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0 | W |
| `sensor.mppt3_voltage` | sensor | MPPT3 voltage | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0.0 | V |
| `sensor.mppt4_current` | sensor | MPPT4 current | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0.0 | A |
| `sensor.mppt4_power` | sensor | MPPT4 power | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0 | W |
| `sensor.mppt4_voltage` | sensor | MPPT4 voltage | MPPT-Leistung (Maximum Power Point Tracking) für PV-Strings | 0.0 | V |
| `sensor.phase_a_current` | sensor | Phase A current | Leistung Phase A des Drehstromnetzes | 7.6 | A |
| `sensor.phase_a_power` | sensor | Phase A power | Leistung Phase A des Drehstromnetzes | 1786 | W |
| `sensor.phase_a_voltage` | sensor | Phase A voltage | Leistung Phase A des Drehstromnetzes | 235.0 | V |
| `sensor.phase_b_current` | sensor | Phase B current | Leistung Phase B des Drehstromnetzes | 7.6 | A |
| `sensor.phase_b_power` | sensor | Phase B power | Leistung Phase B des Drehstromnetzes | 1789 | W |
| `sensor.phase_b_voltage` | sensor | Phase B voltage | Leistung Phase B des Drehstromnetzes | 235.5 | V |
| `sensor.phase_c_current` | sensor | Phase C current | Leistung Phase C des Drehstromnetzes | 7.6 | A |
| `sensor.phase_c_power` | sensor | Phase C power | Leistung Phase C des Drehstromnetzes | 1791 | W |
| `sensor.phase_c_voltage` | sensor | Phase C voltage | Leistung Phase C des Drehstromnetzes | 235.7 | V |
| `sensor.power_factor` | sensor | Power factor | Leistungsfaktor (Phasenwinkel) des Wechselrichters | 1.000 | % |
| `sensor.power_flow_status` | sensor | Power Flow Status | Status des Energieflusses (Load/Export/Import/etc) | 25 |  |
| `sensor.reactive_power` | sensor | Reactive power | Blindleistung (reactive power) im Stromnetz | -3 | W |
| `sensor.running_state_raw` | sensor | Running state raw | Betriebszustand des Wechselrichters (laufend/standby/etc) | 0 |  |
| `sensor.sungrow_arm_software` | sensor | Sungrow Arm Software | UNBEKANNT: Sungrow Arm Software | ARM_SAPPHIRE-H_V11_V01_B       |  |
| `sensor.sungrow_device_type` | sensor | Sungrow device type | UNBEKANNT: Sungrow device type | SH10RT-20 |  |
| `sensor.sungrow_device_type_code` | sensor | Sungrow device type code | UNBEKANNT: Sungrow device type code | 3603 |  |
| `sensor.sungrow_dsp_software` | sensor | Sungrow DSP Software | UNBEKANNT: Sungrow DSP Software | MDSP_SAPPHIRE-H_V11_V01_B      |  |
| `sensor.sungrow_inverter_serial` | sensor | Sungrow inverter serial | UNBEKANNT: Sungrow inverter serial | A2352614033          |  |
| `sensor.sungrow_inverter_state` | sensor | Sungrow inverter state | UNBEKANNT: Sungrow inverter state | Running |  |
| `sensor.sungrow_protocol_version` | sensor | Sungrow Protocol Version | UNBEKANNT: Sungrow Protocol Version | 16781568 |  |
| `sensor.sungrow_version_1` | sensor | Sungrow Version 1 | UNBEKANNT: Sungrow Version 1 | SAPPHIRE-H_01011.95.07 |  |
| `sensor.sungrow_version_2` | sensor | Sungrow Version 2 | UNBEKANNT: Sungrow Version 2 | unavailable |  |
| `sensor.sungrow_version_3` | sensor | Sungrow Version 3 | UNBEKANNT: Sungrow Version 3 | unavailable |  |
| `sensor.sungrow_version_4_sungrow_battery` | sensor | Sungrow Version 4 (Sungrow Battery) | UNBEKANNT: Sungrow Version 4 (Sungrow Battery) | unavailable |  |
| `sensor.total_active_power` | sensor | Total active power | Gesamt-Wirkleistung des Systems | 5479 | W |
| `sensor.total_battery_charge` | sensor | Total battery charge | UNBEKANNT: Total battery charge | 946.5 | kWh |
| `sensor.total_battery_charge_from_pv` | sensor | Total battery charge from PV | UNBEKANNT: Total battery charge from PV | 881.0 | kWh |
| `sensor.total_battery_discharge` | sensor | Total battery discharge | UNBEKANNT: Total battery discharge | 860.7 | kWh |
| `sensor.total_dc_power` | sensor | Total DC power | DC-Gesamtleistung aller PV-Strings am SH10RT-20 | 5541 | W |
| `sensor.total_pv_generation` | sensor | Total PV generation | UNBEKANNT: Total PV generation | 2417.5 | kWh |
| `sensor.total_pv_generation_battery_discharge` | sensor | Total PV generation & battery discharge | UNBEKANNT: Total PV generation & battery discharge | 2254.8 | kWh |
| `switch.export_power_limit` | switch | Export power limit | Nummer/Schalter: Netzeinspeisung begrenzen | on |  |
| `switch.load_adjustment_mode` | switch | Load adjustment mode | Nummer/Schalter: Lastregelung aktivieren/deaktivieren | off |  |
| `switch.sungrow_dashboard_enable_danger_mode` | switch | Sungrow dashboard enable danger mode | UNBEKANNT: Sungrow dashboard enable danger mode | off |  |

## Synology NAS

28 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.ds218_drive_1_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 1) Max. fehlerhafte Sektoren überschritten | Festplattenstatus der Synology NAS | off |  |
| `binary_sensor.ds218_drive_1_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 1) Unterhalb der Mindestrestlebensdauer | Festplattenstatus der Synology NAS | off |  |
| `binary_sensor.ds218_drive_2_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 2) Max. fehlerhafte Sektoren überschritten | Festplattenstatus der Synology NAS | off |  |
| `binary_sensor.ds218_drive_2_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 2) Unterhalb der Mindestrestlebensdauer | Festplattenstatus der Synology NAS | off |  |
| `binary_sensor.ds218_sicherheitsstatus` | binary_sensor | DS218 Sicherheitsstatus | Systemstatus/Gesundheit der Synology NAS | off |  |
| `button.ds218_reboot` | button | DS218 Reboot | UNBEKANNT: Synology Sensor DS218 Reboot | unknown |  |
| `button.ds218_shutdown` | button | DS218 Shutdown | UNBEKANNT: Synology Sensor DS218 Shutdown | unknown |  |
| `sensor.ds218_cpu_auslastung_benutzer` | sensor | DS218 CPU-Auslastung (Benutzer) | CPU-Auslastung der Synology NAS | 47 | % |
| `sensor.ds218_cpu_auslastung_gesamt` | sensor | DS218 CPU-Auslastung (gesamt) | CPU-Auslastung der Synology NAS | 49 | % |
| `sensor.ds218_download_durchsatz` | sensor | DS218 Download-Durchsatz | Speicherplatz/Durchsatz der Synology NAS | 2.488 | kB/s |
| `sensor.ds218_drive_1_status` | sensor | DS218 (Drive 1) Status | Systemstatus/Gesundheit der Synology NAS | normal |  |
| `sensor.ds218_drive_1_temperatur` | sensor | DS218 (Drive 1) Temperatur | Festplatten-Temperatur der Synology NAS | 36 | °C |
| `sensor.ds218_drive_2_status` | sensor | DS218 (Drive 2) Status | Systemstatus/Gesundheit der Synology NAS | normal |  |
| `sensor.ds218_drive_2_temperatur` | sensor | DS218 (Drive 2) Temperatur | Festplatten-Temperatur der Synology NAS | 35 | °C |
| `sensor.ds218_durchschnittliche_cpu_last_15_min` | sensor | DS218 Durchschnittliche CPU-Last (15 min) | CPU-Auslastung der Synology NAS | 1.06 | load |
| `sensor.ds218_durchschnittliche_cpu_last_5_min` | sensor | DS218 Durchschnittliche CPU-Last (5 min) | CPU-Auslastung der Synology NAS | 1.06 | load |
| `sensor.ds218_speicher_gesamt_real` | sensor | DS218 Speicher gesamt (real) | RAM-Auslastung der Synology NAS | 10282.41408 | MB |
| `sensor.ds218_speicher_gesamt_swap` | sensor | DS218 Speicher gesamt (Swap) | RAM-Auslastung der Synology NAS | 8317.227008 | MB |
| `sensor.ds218_speicher_verfugbar_real` | sensor | DS218 Speicher verfügbar (real) | RAM-Auslastung der Synology NAS | 337.211392 | MB |
| `sensor.ds218_speicher_verfugbar_swap` | sensor | DS218 Speicher verfügbar (Swap) | RAM-Auslastung der Synology NAS | 7979.999232 | MB |
| `sensor.ds218_speichernutzung_real` | sensor | DS218 Speichernutzung (real) | RAM-Auslastung der Synology NAS | 22 | % |
| `sensor.ds218_temperatur` | sensor | DS218 Temperatur | Festplatten-Temperatur der Synology NAS | 43 | °C |
| `sensor.ds218_upload_durchsatz` | sensor | DS218 Upload-Durchsatz | Speicherplatz/Durchsatz der Synology NAS | 1.053 | kB/s |
| `sensor.ds218_volume_1_belegter_speicherplatz` | sensor | DS218 (Volume 1) Belegter Speicherplatz | RAM-Auslastung der Synology NAS | 3.668829577216 | TB |
| `sensor.ds218_volume_1_durchschnittliche_festplattentemperatur` | sensor | DS218 (Volume 1) Durchschnittliche Festplattentemperatur | Festplatten-Temperatur der Synology NAS | 36.0 | °C |
| `sensor.ds218_volume_1_status` | sensor | DS218 (Volume 1) Status | Speicherplatz/Durchsatz der Synology NAS | normal |  |
| `sensor.ds218_volume_1_volume_nutzung` | sensor | DS218 (Volume 1) Volume-Nutzung | Speicherplatz/Durchsatz der Synology NAS | 63.7 | % |
| `update.ds218_dsm_update` | update | DS218 DSM-Update | UNBEKANNT: Synology Sensor DS218 DSM-Update | off |  |

## Template-Sensoren

2 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.autarkiegrad` | sensor | Autarkiegrad | Autarkiegrad: Eigenverbrauch von Solarstrom in Prozent | 92.5 | % |
| `sensor.eigenverbrauchsquote` | sensor | Eigenverbrauchsquote | Eigenverbrauchsquote: Anteil Eigenverbrauch am Gesamtverbrauch | 88.9 | % |
