# Home Assistant Entities

> Automatisch generiert am **2026-03-18** — 794 Entitäten gesamt

## Inhaltsverzeichnis

- [1komma5° (Heartbeat)](#1komma5-(heartbeat)) (24)
- [Apple](#apple) (15)
- [Battery Management (SBR128)](#battery-management-(sbr128)) (30)
- [EMHASS](#emhass) (3)
- [ENTSO-e](#entso-e) (4)
- [Energiemanagement](#energiemanagement) (11)
- [HACS](#hacs) (2)
- [Heat Pump / Thermal](#heat-pump-/-thermal) (129)
- [Heating Controls / HVAC](#heating-controls-/-hvac) (14)
- [Home Assistant System / Updates](#home-assistant-system-/-updates) (35)
- [Met.no (Wetter)](#met.no-(wetter)) (1)
- [Music/Audio](#music/audio) (9)
- [Other](#other) (4)
- [Printer / Office](#printer-/-office) (5)
- [Shelly](#shelly) (333)
- [Smart Home Automation](#smart-home-automation) (9)
- [Solcast](#solcast) (18)
- [Sonstige](#sonstige) (3)
- [Sun (HA built-in)](#sun-(ha-built-in)) (7)
- [Sungrow (Modbus)](#sungrow-(modbus)) (108)
- [Synology NAS](#synology-nas) (28)
- [Template-Sensoren](#template-sensoren) (2)

## Zusammenfassung nach Integration

| Integration | Anzahl |
|---|---|
| 1komma5° (Heartbeat) | 24 |
| Apple | 15 |
| Battery Management (SBR128) | 30 |
| EMHASS | 3 |
| ENTSO-e | 4 |
| Energiemanagement | 11 |
| HACS | 2 |
| Heat Pump / Thermal | 129 |
| Heating Controls / HVAC | 14 |
| Home Assistant System / Updates | 35 |
| Met.no (Wetter) | 1 |
| Music/Audio | 9 |
| Other | 4 |
| Printer / Office | 5 |
| Shelly | 333 |
| Smart Home Automation | 9 |
| Solcast | 18 |
| Sonstige | 3 |
| Sun (HA built-in) | 7 |
| Sungrow (Modbus) | 108 |
| Synology NAS | 28 |
| Template-Sensoren | 2 |

## 1komma5° (Heartbeat)

24 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.1komma5_tagesforecast` | sensor | 1komma5 Tagesforecast | Sensor: 1komma5 Tagesforecast | 2026-03-18 |  |
| `sensor.average_electricity_price` | sensor | Average electricity price | Aktueller dynamischer Stromtarif via 1komma5° Heartbeat | 0.12061 | €/kWh |
| `sensor.battery_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.0 | kWh |
| `sensor.battery_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.701580130475589 | kWh |
| `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Consumption Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller Stromverbrauch via 1komma5° Smart-Meter | 1020.495 | W |
| `sensor.current_percentage_in_electricity_price_range` | sensor | Current percentage in electricity price range | Aktueller dynamischer Stromtarif via 1komma5° Heartbeat | 53.5 | % |
| `sensor.current_percentage_of_highest_electricity_price` | sensor | Current percentage of highest electricity price | Aktueller dynamischer Stromtarif via 1komma5° Heartbeat | 52.9 | % |
| `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Electricity Price 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller dynamischer Stromtarif via 1komma5° Heartbeat | 0.3002 | EUR/kWh |
| `sensor.ev_chargers_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamtleistung aller E-Auto-Ladegeräte | 0 | W |
| `sensor.ev_chargers_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.0 | kWh |
| `sensor.grid_feed_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.00200943670290583 | kWh |
| `sensor.grid_feed_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.00472014803262417 | kWh |
| `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Sensor: Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Sensor: Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1.897 | W |
| `sensor.grid_feed_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netto-Stromfluss ins/aus Stromnetz (1komma5°) | 1.897 | W |
| `sensor.heat_pumps_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamtleistung aller Wärmepumpen im Haus | 0 | W |
| `sensor.heat_pumps_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.0 | kWh |
| `sensor.solar_energy_production_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Energy Production 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Home Assistant Energy Management Daten | 0.0 | kWh |
| `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Production Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamte Solarstromproduktion des Hauses | 0 | W |
| `sensor.time_of_highest_price` | sensor | Time of highest price | Sensor: Time of highest price | 2026-03-19T18:00:00+00:00 |  |
| `sensor.time_of_lowest_price` | sensor | Time of lowest price | Sensor: Time of lowest price | 2026-03-18T12:00:00+00:00 |  |
| `sensor.unit_prod_price` | sensor | Unit Prod Price | Sensor: Unit Prod Price | 0.0820 | €/kWh |
| `switch.heartbeat_automatic_mode_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | switch | Heartbeat Automatic Mode 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `update.1komma5grad_update` | update | 1KOMMA5GRAD update | Software-Update verfügbar für Gerät/Integration | off |  |

## Apple

15 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `device_tracker.iphone_von_david` | device_tracker | iPhone von David | iPhone-Informationen und Position via Home Assistant Companion | not_home |  |
| `media_player.eg` | media_player | HomePod-EG | Mediaplayer (Musikwiedergabe, Radio etc.) | idle |  |
| `remote.eg` | remote | HomePod-EG | HomePod Smart Speaker | on |  |
| `sensor.iphone_von_david_app_version` | sensor | iPhone von David App Version | iPhone-Informationen und Position via Home Assistant Companion | 2026.2.1 |  |
| `sensor.iphone_von_david_audio_output` | sensor | iPhone von David Audio Output | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_battery_state` | sensor | iPhone von David Battery State | iPhone-Informationen und Position via Home Assistant Companion | Not Charging |  |
| `sensor.iphone_von_david_bssid` | sensor | iPhone von David BSSID | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_connection_type` | sensor | iPhone von David Connection Type | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_geocoded_location` | sensor | iPhone von David Geocoded Location | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_last_update_trigger` | sensor | iPhone von David Last Update Trigger | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_location_permission` | sensor | iPhone von David Location permission | iPhone-Informationen und Position via Home Assistant Companion | Authorized when in use |  |
| `sensor.iphone_von_david_sim_1` | sensor | iPhone von David SIM 1 | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_sim_2` | sensor | iPhone von David SIM 2 | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_ssid` | sensor | iPhone von David SSID | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |
| `sensor.iphone_von_david_storage` | sensor | iPhone von David Storage | iPhone-Informationen und Position via Home Assistant Companion | unavailable |  |

## Battery Management (SBR128)

30 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.battery_charging` | binary_sensor | Battery charging | Status: Batterie wird gerade geladen | off |  |
| `binary_sensor.battery_charging_delay` | binary_sensor | Battery charging (delay) | Status: Batterie wird gerade geladen | off |  |
| `binary_sensor.battery_discharging` | binary_sensor | Battery discharging | Status: Batterie wird gerade entladen | on |  |
| `binary_sensor.battery_discharging_delay` | binary_sensor | Battery discharging (delay) | Status: Batterie wird gerade entladen | on |  |
| `number.battery_charging_start_power` | number | Battery charging start power | Status: Batterie wird gerade geladen | 0.0 | W |
| `number.battery_discharging_start_power` | number | Battery discharging start power | Status: Batterie wird gerade entladen | 0.0 | W |
| `number.battery_max_charge_power` | number | Battery max charge power | Maximale Ladeleistung der Batterie | 10600.0 | W |
| `number.battery_max_discharge_power` | number | Battery max discharge power | Maximale Entladeleistung der Batterie | 10600.0 | W |
| `number.battery_max_soc` | number | Battery Max Soc | Maximale Ladezustand (State of Charge) für die Batterie | 100.0 | % |
| `number.battery_min_soc` | number | Battery Min Soc | Minimale Ladezustand (State of Charge) für die Batterie | 5.0 | % |
| `sensor.battery_capacity_high_precision` | sensor | Battery capacity high precision | Genaue Batteriekapazität in kWh | 12.80 | kWh |
| `sensor.battery_charging_power` | sensor | Battery charging power | Status: Batterie wird gerade geladen | 0 | W |
| `sensor.battery_charging_power_signed` | sensor | Battery charging power signed | Status: Batterie wird gerade geladen | -954 | W |
| `sensor.battery_charging_start_power` | sensor | Battery charging start power | Status: Batterie wird gerade geladen | 0 | W |
| `sensor.battery_current` | sensor | Battery current | Lade-/Entladestrom der Batterie | 3.7 | A |
| `sensor.battery_discharging_power` | sensor | Battery discharging power | Status: Batterie wird gerade entladen | 954 | W |
| `sensor.battery_discharging_power_signed` | sensor | Battery discharging power signed | Status: Batterie wird gerade entladen | 954 | W |
| `sensor.battery_discharging_start_power` | sensor | Battery discharging start power | Status: Batterie wird gerade entladen | 0 | W |
| `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Sensor: Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 0 | W |
| `sensor.battery_max_charge_power` | sensor | Battery max charge power | Maximale Ladeleistung der Batterie | 10600 | W |
| `sensor.battery_max_discharge_power` | sensor | Battery max discharge power | Maximale Entladeleistung der Batterie | 10600 | W |
| `sensor.battery_max_soc` | sensor | Battery max SoC | Maximale Ladezustand (State of Charge) für die Batterie | 100.0 | % |
| `sensor.battery_min_soc` | sensor | Battery min SoC | Minimale Ladezustand (State of Charge) für die Batterie | 5.0 | % |
| `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Sensor: Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1018.597 | W |
| `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery State of Charge 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller Ladestand der Batterie in Prozent | 49.699842303058 | % |
| `sensor.battery_state_of_health` | sensor | Battery state of health | Gesundheitszustand der Batterie (Verschleiß-Indikator) | 99 | % |
| `sensor.battery_temperature` | sensor | Battery temperature | Interne Temperatur des Batteriepacks | 25.0 | °C |
| `sensor.battery_voltage` | sensor | Battery voltage | Spannung der Batterie | 261.3 | V |
| `sensor.bdc_rated_power` | sensor | BDC rated power | Nennleistung des Batterie-DC-Konverters | 10000 | W |
| `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power` | sensor | Battery Power | Status: Batterie wird gerade geladen | 954.0 | W |

## EMHASS

3 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.emhass_day_ahead_optimierung` | automation | EMHASS Day-Ahead Optimierung | EMHASS Energieoptimierungsdaten | on |  |
| `sensor.optim_status` | sensor | EMHASS optimization status | EMHASS Energieoptimierungsdaten | Optimal |  |
| `update.emhass_update` | update | EMHASS Update | EMHASS Energieoptimierungsdaten | off |  |

## ENTSO-e

4 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.current_electricity_market_price` | sensor | Current electricity market price | ENTSO-e Day-Ahead Börsenstrompreis für aktuelle Stunde | 0.13492 | €/kWh |
| `sensor.entso_e_tagespreise` | sensor | ENTSO-e Tagespreise | Sensor: ENTSO-e Tagespreise | 2026-03-18 |  |
| `sensor.next_hour_electricity_market_price` | sensor | Next hour electricity market price | ENTSO-e Strommarktpreis für die nächste Stunde | 0.13001 | €/kWh |
| `update.entso_e_transparency_platform_update` | update | ENTSO-e Transparency Platform update | Software-Update verfügbar für Gerät/Integration | off |  |

## Energiemanagement

11 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.daily_consumed_energy` | sensor | Daily consumed energy | Gesamter Stromverbrauch heute | 23.0 | kWh |
| `sensor.daily_consumed_energy_filtered` | sensor | Daily consumed energy (filtered) | Home Assistant Energy Management Daten | 22.9 | kWh |
| `sensor.highest_energy_price` | sensor | Highest energy price | Home Assistant Energy Management Daten | 0.25511 | €/kWh |
| `sensor.lowest_energy_price` | sensor | Lowest energy price | Home Assistant Energy Management Daten | -0.00322 | €/kWh |
| `sensor.total_consumed_energy` | sensor | Total consumed energy | Gesamter Stromverbrauch seit Inbetriebnahme | 8653.4 | kWh |
| `sensor.total_cost_fun_value` | sensor | Total cost function value | Sensor: Total cost function value | 1.01 | € |
| `sensor.total_direct_energy_consumption` | sensor | Total direct energy consumption | Home Assistant Energy Management Daten | 1424.2 | kWh |
| `sensor.total_exported_energy` | sensor | Total exported energy | Gesamte ins Netz eingespeiste Energie seit Start | 102.6 | kWh |
| `sensor.total_exported_energy_from_pv` | sensor | Total exported energy from PV | Home Assistant Energy Management Daten | 107.0 | kWh |
| `sensor.total_imported_energy` | sensor | Total imported energy | Gesamte vom Netz bezogene Energie seit Start | 6435.5 | kWh |
| `sensor.unit_load_cost` | sensor | Unit Load Cost | Sensor: Unit Load Cost | 0.1473 | €/kWh |

## HACS

2 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `update.get_hacs_update` | update | Get HACS Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.hacs_update` | update | HACS update | Software-Update verfügbar für Gerät/Integration | off |  |

## Heat Pump / Thermal

129 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.licv_8_2r1_3_alarm` | binary_sensor | LICV 8.2R1/3 Alarm | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_asd` | binary_sensor | LICV 8.2R1/3 ASD | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | binary_sensor | LICV 8.2R1/3 BUP - DHW pump | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_el_heater` | binary_sensor | LICV 8.2R1/3 el. heater | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_evu` | binary_sensor | LICV 8.2R1/3 EVU | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_evu_2` | binary_sensor | LICV 8.2R1/3 EVU 2 | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_hd` | binary_sensor | LICV 8.2R1/3 HD | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_hup` | binary_sensor | LICV 8.2R1/3 HUP | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | binary_sensor | LICV 8.2R1/3 Konnektivität | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_mot` | binary_sensor | LICV 8.2R1/3 MOT | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_vbo` | binary_sensor | LICV 8.2R1/3 VBO | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_vd1` | binary_sensor | LICV 8.2R1/3 VD1 | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_zip` | binary_sensor | LICV 8.2R1/3 ZIP | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_zup` | binary_sensor | LICV 8.2R1/3 ZUP | LiCv Heizsystem-Steuerung und Sensorik | on |  |
| `binary_sensor.licv_8_2r1_3_zwe_1` | binary_sensor | LICV 8.2R1/3 ZWE 1 | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_2_sst` | binary_sensor | LICV 8.2R1/3 ZWE 2 - SST | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `button.kg_technik_waermepumpe_3em_neu_starten` | button | KG_Technik_Waermepumpe_3EM Neu starten | Wärmepumpen-Daten und Status | unknown |  |
| `number.licv_8_2r1_3_desired_value` | number | LICV 8.2R1/3 desired value | LiCv Heizsystem-Steuerung und Sensorik | 48.0 |  |
| `number.licv_8_2r1_3_heating_limit` | number | LICV 8.2R1/3 heating limit | LiCv Heizsystem-Steuerung und Sensorik | 20.0 |  |
| `number.licv_8_2r1_3_offset_heizen` | number | LICV 8.2R1/3 Offset Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_offset_mk1_heizen` | number | LICV 8.2R1/3 Offset MK1 Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen` | number | LICV 8.2R1/3 Offset Overall Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen_2` | number | LICV 8.2R1/3 Offset Overall Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw` | number | LICV 8.2R1/3 Offset Warmw. | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw_2` | number | LICV 8.2R1/3 Offset Warmw. | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `number.licv_8_2r1_3_sollwert_heizen` | number | LICV 8.2R1/3 Sollwert Heizen | LiCv Heizsystem-Steuerung und Sensorik | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_mk1_heizen` | number | LICV 8.2R1/3 Sollwert MK1 Heizen | LiCv Heizsystem-Steuerung und Sensorik | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_warmw` | number | LICV 8.2R1/3 Sollwert Warmw. | LiCv Heizsystem-Steuerung und Sensorik | 46.0 |  |
| `number.licv_8_2r1_3_targ_value` | number | LICV 8.2R1/3 targ.value | LiCv Heizsystem-Steuerung und Sensorik | 55.0 |  |
| `number.licv_8_2r1_3_temperature` | number | LICV 8.2R1/3 temperature + - | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `remote.dg` | remote | DG | Remote: DG | on |  |
| `remote.lounge` | remote | Lounge | Remote: Lounge | on |  |
| `remote.og` | remote | OG | Remote: OG | on |  |
| `select.licv_8_2r1_3_lpc_mode` | select | LICV 8.2R1/3 LPC mode | LiCv Heizsystem-Steuerung und Sensorik | No limit |  |
| `select.licv_8_2r1_3_mode_of_operation` | select | LICV 8.2R1/3 mode of operation | LiCv Heizsystem-Steuerung und Sensorik | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_2` | select | LICV 8.2R1/3 mode of operation | LiCv Heizsystem-Steuerung und Sensorik | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_3` | select | LICV 8.2R1/3 mode of operation | LiCv Heizsystem-Steuerung und Sensorik | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_4` | select | LICV 8.2R1/3 mode of operation | LiCv Heizsystem-Steuerung und Sensorik | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_5` | select | LICV 8.2R1/3 mode of operation | LiCv Heizsystem-Steuerung und Sensorik | Off |  |
| `select.licv_8_2r1_3_modus_heizen` | select | LICV 8.2R1/3 Modus Heizen | LiCv Heizsystem-Steuerung und Sensorik | Off |  |
| `select.licv_8_2r1_3_modus_mk1_heizen` | select | LICV 8.2R1/3 Modus MK1 Heizen | LiCv Heizsystem-Steuerung und Sensorik | Off |  |
| `select.licv_8_2r1_3_modus_overall_heizen` | select | LICV 8.2R1/3 Modus Overall Heizen | LiCv Heizsystem-Steuerung und Sensorik | Individual |  |
| `select.licv_8_2r1_3_modus_warmw` | select | LICV 8.2R1/3 Modus Warmw. | LiCv Heizsystem-Steuerung und Sensorik | Off |  |
| `select.licv_8_2r1_3_power_control_mode` | select | LICV 8.2R1/3 Power control mode | LiCv Heizsystem-Steuerung und Sensorik | Individually |  |
| `select.licv_8_2r1_3_smart_mode` | select | LICV 8.2R1/3 Smart mode | LiCv Heizsystem-Steuerung und Sensorik | Default |  |
| `sensor.kg_technik_waermepumpe_3em_energie` | sensor | KG_Technik_Waermepumpe_3EM Energie | Wärmepumpen-Daten und Status | 886.28691 | kWh |
| `sensor.kg_technik_waermepumpe_3em_energieeinspeisung` | sensor | KG_Technik_Waermepumpe_3EM Energieeinspeisung | Wärmepumpen-Daten und Status | 0.0 | kWh |
| `sensor.kg_technik_waermepumpe_3em_leistung` | sensor | KG_Technik_Waermepumpe_3EM Leistung | Wärmepumpen-Daten und Status | 546.331 | W |
| `sensor.kg_technik_waermepumpe_3em_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Scheinleistung | Wärmepumpen-Daten und Status | 621.696 | VA |
| `sensor.kg_technik_waermepumpe_3em_temperatur` | sensor | KG_Technik_Waermepumpe_3EM Temperatur | Wärmepumpen-Daten und Status | 49.6 | °C |
| `sensor.licv_8_2r1_3_ao_1` | sensor | LICV 8.2R1/3 AO 1 | LiCv Heizsystem-Steuerung und Sensorik | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | sensor | LICV 8.2R1/3 AO 2 | LiCv Heizsystem-Steuerung und Sensorik | 10.0 | V |
| `sensor.licv_8_2r1_3_cooling_enabled` | sensor | LICV 8.2R1/3 Cooling enabled | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_coverage_hp` | sensor | LICV 8.2R1/3 coverage HP | LiCv Heizsystem-Steuerung und Sensorik | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw` | sensor | LICV 8.2R1/3 DHW | LiCv Heizsystem-Steuerung und Sensorik | 44.5 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | sensor | LICV 8.2R1/3 DHW | LiCv Heizsystem-Steuerung und Sensorik | 44.5 | °C |
| `sensor.licv_8_2r1_3_dhw_demand_border` | sensor | LICV 8.2R1/3 DHW Demand border | LiCv Heizsystem-Steuerung und Sensorik | 330.0 |  |
| `sensor.licv_8_2r1_3_dhw_target` | sensor | LICV 8.2R1/3 DHW target | LiCv Heizsystem-Steuerung und Sensorik | 35.0 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | sensor | LICV 8.2R1/3 DHW temp. max. | LiCv Heizsystem-Steuerung und Sensorik | 65.0 | °C |
| `sensor.licv_8_2r1_3_domestic_hot_water` | sensor | LICV 8.2R1/3 domestic hot water | LiCv Heizsystem-Steuerung und Sensorik | 529.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | sensor | LICV 8.2R1/3 domestic hot water | LiCv Heizsystem-Steuerung und Sensorik | 1607.3 | kWh |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | sensor | LICV 8.2R1/3 duration extra DHW | LiCv Heizsystem-Steuerung und Sensorik | 7200.0 |  |
| `sensor.licv_8_2r1_3_error` | sensor | LICV 8.2R1/3 error | LiCv Heizsystem-Steuerung und Sensorik | 51.0 |  |
| `sensor.licv_8_2r1_3_error_number` | sensor | LICV 8.2R1/3 error number | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_flow` | sensor | LICV 8.2R1/3 flow | LiCv Heizsystem-Steuerung und Sensorik | 32.4 | °C |
| `sensor.licv_8_2r1_3_flow_rate` | sensor | LICV 8.2R1/3 flow rate | LiCv Heizsystem-Steuerung und Sensorik | 607.0 | l/h |
| `sensor.licv_8_2r1_3_hd` | sensor | LICV 8.2R1/3 HD | LiCv Heizsystem-Steuerung und Sensorik | 18.52 | bar |
| `sensor.licv_8_2r1_3_heat_generator_status` | sensor | LICV 8.2R1/3 Heat generator status | LiCv Heizsystem-Steuerung und Sensorik | 1.0 |  |
| `sensor.licv_8_2r1_3_heat_source_inlet` | sensor | LICV 8.2R1/3 heat source inlet | LiCv Heizsystem-Steuerung und Sensorik | 8.2 | °C |
| `sensor.licv_8_2r1_3_heating` | sensor | LICV 8.2R1/3 heating | LiCv Heizsystem-Steuerung und Sensorik | 7140.0 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | sensor | LICV 8.2R1/3 heating | LiCv Heizsystem-Steuerung und Sensorik | 18444.0 | kWh |
| `sensor.licv_8_2r1_3_heating_capacity` | sensor | LICV 8.2R1/3 Heating capacity | LiCv Heizsystem-Steuerung und Sensorik | 2.87 | kW |
| `sensor.licv_8_2r1_3_heating_demand_border` | sensor | LICV 8.2R1/3 Heating demand border | LiCv Heizsystem-Steuerung und Sensorik | 288.0 |  |
| `sensor.licv_8_2r1_3_impulse_vd1` | sensor | LICV 8.2R1/3 impulse VD1 | LiCv Heizsystem-Steuerung und Sensorik | 1137.0 |  |
| `sensor.licv_8_2r1_3_integration` | sensor | LICV 8.2R1/3 integration | LiCv Heizsystem-Steuerung und Sensorik | 1.0 |  |
| `sensor.licv_8_2r1_3_level_heizen` | sensor | LICV 8.2R1/3 Level Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_level_mk1_heizen` | sensor | LICV 8.2R1/3 Level MK1 Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_level_overall_heizen` | sensor | LICV 8.2R1/3 Level Overall Heizen | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_level_warmw` | sensor | LICV 8.2R1/3 Level Warmw. | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_max_flow_temp` | sensor | LICV 8.2R1/3 max. flow temp. | LiCv Heizsystem-Steuerung und Sensorik | 60.0 | °C |
| `sensor.licv_8_2r1_3_maximaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Maximaler Vorlauf MK 1 | LiCv Heizsystem-Steuerung und Sensorik | 45.0 | °C |
| `sensor.licv_8_2r1_3_min_return_targ_temp` | sensor | LICV 8.2R1/3 min return targ.temp | LiCv Heizsystem-Steuerung und Sensorik | 15.0 | °C |
| `sensor.licv_8_2r1_3_minimaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Minimaler Vorlauf MK 1 | LiCv Heizsystem-Steuerung und Sensorik | 20.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_flow` | sensor | LICV 8.2R1/3 mix circ1 flow | LiCv Heizsystem-Steuerung und Sensorik | 75.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_target` | sensor | LICV 8.2R1/3 mix circ1 target | LiCv Heizsystem-Steuerung und Sensorik | 28.8 | °C |
| `sensor.licv_8_2r1_3_nd` | sensor | LICV 8.2R1/3 ND | LiCv Heizsystem-Steuerung und Sensorik | 7.23 | bar |
| `sensor.licv_8_2r1_3_operat_hours_heat` | sensor | LICV 8.2R1/3 operat. hours heat. | LiCv Heizsystem-Steuerung und Sensorik | 3141.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | sensor | LICV 8.2R1/3 operating hours DHW | LiCv Heizsystem-Steuerung und Sensorik | 317.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | sensor | LICV 8.2R1/3 operating hours HP | LiCv Heizsystem-Steuerung und Sensorik | 3460.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | sensor | LICV 8.2R1/3 operating hours VD1 | LiCv Heizsystem-Steuerung und Sensorik | 3460.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | sensor | LICV 8.2R1/3 operating hours ZWE1 | LiCv Heizsystem-Steuerung und Sensorik | 696.0 | h |
| `sensor.licv_8_2r1_3_operation_mode` | sensor | LICV 8.2R1/3 operation mode | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_outdoor_temp` | sensor | LICV 8.2R1/3 outdoor temp. | LiCv Heizsystem-Steuerung und Sensorik | 6.0 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | sensor | LICV 8.2R1/3 outdoor temp. ø | LiCv Heizsystem-Steuerung und Sensorik | 8.2 | °C |
| `sensor.licv_8_2r1_3_pc_limit` | sensor | LICV 8.2R1/3 PC limit | LiCv Heizsystem-Steuerung und Sensorik | 30.0 | kW |
| `sensor.licv_8_2r1_3_pool_enabled` | sensor | LICV 8.2R1/3 Pool enabled | LiCv Heizsystem-Steuerung und Sensorik | 0.0 |  |
| `sensor.licv_8_2r1_3_power_consumption` | sensor | LICV 8.2R1/3 Power Consumption | LiCv Heizsystem-Steuerung und Sensorik | 0.51 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | sensor | LICV 8.2R1/3 Power consumption min | LiCv Heizsystem-Steuerung und Sensorik | 5.0 |  |
| `sensor.licv_8_2r1_3_return` | sensor | LICV 8.2R1/3 return | LiCv Heizsystem-Steuerung und Sensorik | 29.1 | °C |
| `sensor.licv_8_2r1_3_return_target` | sensor | LICV 8.2R1/3 return target | LiCv Heizsystem-Steuerung und Sensorik | 28.8 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | sensor | LICV 8.2R1/3 return temp. limit. | LiCv Heizsystem-Steuerung und Sensorik | 50.0 | °C |
| `sensor.licv_8_2r1_3_status_dhw` | sensor | LICV 8.2R1/3 Status DHW | LiCv Heizsystem-Steuerung und Sensorik | 1.0 |  |
| `sensor.licv_8_2r1_3_status_heating` | sensor | LICV 8.2R1/3 Status Heating | LiCv Heizsystem-Steuerung und Sensorik | 3.0 |  |
| `sensor.licv_8_2r1_3_total` | sensor | LICV 8.2R1/3 total | LiCv Heizsystem-Steuerung und Sensorik | 7669.7 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | sensor | LICV 8.2R1/3 total heat quant. HS | LiCv Heizsystem-Steuerung und Sensorik | 20051.4 | kWh |
| `sensor.licv_8_2r1_3_tvl_calc_max` | sensor | LICV 8.2R1/3 TVL calc max | LiCv Heizsystem-Steuerung und Sensorik | 32.2 | °C |
| `sensor.p_batt_forecast` | sensor | Battery Power Forecast | Prognose der Batterieleistung (EMHASS) | 1519.29 | W |
| `sensor.p_grid_forecast` | sensor | Grid Power Forecast | Prognose der Netzleistung (EMHASS) | 0.00 | W |
| `sensor.p_hybrid_inverter` | sensor | PV Hybrid Inverter | Hybrid-Wechselrichter Leistung | 1519.29 | W |
| `sensor.p_load_forecast` | sensor | Load Power Forecast | Prognose der Lastleistung (EMHASS) | 1519.29 | W |
| `sensor.p_pv_forecast` | sensor | PV Power Forecast | Prognose der PV-Leistung (EMHASS) | 0.00 | W |
| `sensor.soc_batt_forecast` | sensor | Battery SOC Forecast | Prognose des Batteriestands (EMHASS) | 37.26 | % |
| `sensor.wp_cop_kombiniert_gesamt` | sensor | WP COP kombiniert gesamt | Leistungszahl (COP) der Wärmepumpe | 0 |  |
| `sensor.wp_cop_kombiniert_monatlich` | sensor | WP COP kombiniert monatlich | Leistungszahl (COP) der Wärmepumpe | 2.58 |  |
| `sensor.wp_cop_warmwasser_gesamt` | sensor | WP COP Warmwasser gesamt | Leistungszahl (COP) der Wärmepumpe | 0 |  |
| `sensor.wp_cop_warmwasser_monatlich` | sensor | WP COP Warmwasser monatlich | Leistungszahl (COP) der Wärmepumpe | 0.0 |  |
| `sensor.wp_strom_gesamt_seit_tracking` | sensor | WP Strom gesamt (seit Tracking) | Sensor: WP Strom gesamt (seit Tracking) | 66.21771 | kWh |
| `sensor.wp_strom_monatlich` | sensor | WP Strom monatlich | Sensor: WP Strom monatlich | 66.21771 | kWh |
| `sensor.wp_warmwasser_thermisch_gesamt_seit_tracking` | sensor | WP Warmwasser thermisch gesamt (seit Tracking) | Sensor: WP Warmwasser thermisch gesamt (seit Tracking) | 32.9 | kWh |
| `sensor.wp_warmwasser_thermisch_monatlich` | sensor | WP Warmwasser thermisch monatlich | Sensor: WP Warmwasser thermisch monatlich | 32.9 | kWh |
| `switch.licv_8_2r1_3_cooling_blocked` | switch | LICV 8.2R1/3 Cooling blocked | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_dhw_blocked` | switch | LICV 8.2R1/3 DHW blocked | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_extra_dhw` | switch | LICV 8.2R1/3 Extra DHW | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_heating_blocked` | switch | LICV 8.2R1/3 Heating blocked | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_high_speed_charge` | switch | LICV 8.2R1/3 high-speed charge | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_pool_blocked` | switch | LICV 8.2R1/3 Pool blocked | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `switch.licv_8_2r1_3_secondary_return` | switch | LICV 8.2R1/3 secondary return | LiCv Heizsystem-Steuerung und Sensorik | off |  |
| `update.kg_technik_waermepumpe_3em_firmware` | update | KG_Technik_Waermepumpe_3EM Firmware | Wärmepumpen-Daten und Status | off |  |
| `update.licv_8_2r1_3_firmware` | update | LICV 8.2R1/3 Firmware | LiCv Heizsystem-Steuerung und Sensorik | on |  |

## Heating Controls / HVAC

14 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `number.battery_forced_charge_discharge_power` | number | Battery forced charge discharge power | Numerischer Wert zum Einstellen | 0.0 | W |
| `scene.battery_forced_charge` | scene | Battery Forced Charge | Home Assistant Szene (Gruppe von Einstellungen) | unknown |  |
| `select.battery_forced_charge_discharge` | select | Battery forced charge discharge | Auswahl zwischen verschiedenen Optionen | Forced charge |  |
| `select.ems_mode` | select | EMS mode | Auswahl zwischen verschiedenen Optionen | Self-consumption mode (default) |  |
| `select.load_adjustment_mode` | select | Load adjustment mode | Auswahl zwischen verschiedenen Optionen | Disabled |  |
| `sensor.active_power_limitation_ratio_raw` | sensor | Active power limitation ratio raw | Aktive Leistungsbegrenzung | 6554 | % |
| `sensor.active_power_limitation_raw` | sensor | Active power limitation raw | Aktive Leistungsbegrenzung | 65535 |  |
| `sensor.apl_shutdown_at_zero_raw` | sensor | APL shutdown at zero raw | APL-Sicherheitsabschaltung bei Null-Leistung | 85 |  |
| `sensor.battery_forced_charge_discharge_cmd_raw` | sensor | Battery forced charge discharge cmd raw | Sensor: Battery forced charge discharge cmd raw | 170 |  |
| `sensor.battery_forced_charge_discharge_power` | sensor | Battery forced charge discharge power | Sensor: Battery forced charge discharge power | 0 | W |
| `sensor.ems_mode_selection_raw` | sensor | EMS mode selection raw | Auswahl zwischen verschiedenen Optionen | 0 |  |
| `sensor.load_adjustment_mode_enable_raw` | sensor | Load adjustment mode enable raw | Lastanpassungsmodus des Energiesystems | 85 |  |
| `sensor.load_adjustment_mode_selection_raw` | sensor | Load adjustment mode selection raw | Auswahl zwischen verschiedenen Optionen | 3 |  |
| `switch.load_adjustment_mode` | switch | Load adjustment mode | Schaltbarer Ausgang (Ein/Aus) | off |  |

## Home Assistant System / Updates

35 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.jalousien_abends_schliessen` | automation | Jalousien abends schließen | Motorisierte Jalousie mit Shelly-Steuerung | on |  |
| `conversation.home_assistant` | conversation | Home Assistant | Conversation: Home Assistant | 2026-03-08T20:43:20.952038+00:00 |  |
| `event.backup_automatic_backup` | event | Backup Automatisches Backup | Event: Backup Automatisches Backup | 2026-03-18T04:15:03.823+00:00 |  |
| `number.battery_reserved_soc_for_backup` | number | Battery Reserved SoC for Backup | Numerischer Wert zum Einstellen | 0.0 | % |
| `person.david` | person | David | Person: David | not_home |  |
| `scene.battery_bypass_mode` | scene | Battery Bypass Mode | Home Assistant Szene (Gruppe von Einstellungen) | unknown |  |
| `scene.battery_forced_discharge` | scene | Battery Forced Discharge | Home Assistant Szene (Gruppe von Einstellungen) | unknown |  |
| `script.batterie_zwangsladen` | script | Batterie Zwangsladen | Home Assistant Skript | off |  |
| `sensor.backup_backup_manager_state` | sensor | Backup Backup-Manager-Zustand | Sensor: Backup Backup-Manager-Zustand | idle |  |
| `sensor.backup_last_attempted_automatic_backup` | sensor | Backup Letztes versuchtes automatisches Backup | Sensor: Backup Letztes versuchtes automatisches Backup | 2026-03-18T04:14:56+00:00 |  |
| `sensor.backup_last_successful_automatic_backup` | sensor | Backup Letztes erfolgreiches automatisches Backup | Sensor: Backup Letztes erfolgreiches automatisches Backup | 2026-03-18T04:15:03+00:00 |  |
| `sensor.backup_mode_raw` | sensor | Backup mode raw | Sensor: Backup mode raw | 85 |  |
| `sensor.backup_next_scheduled_automatic_backup` | sensor | Backup Nächstes geplantes automatisches Backup | Sensor: Backup Nächstes geplantes automatisches Backup | 2026-03-19T04:43:18+00:00 |  |
| `sensor.battery_reserved_soc_for_backup` | sensor | Battery reserved SoC for backup | Sensor: Battery reserved SoC for backup | 0 | % |
| `sensor.total_backup_power` | sensor | Total backup power | Sensor: Total backup power | 0 | W |
| `switch.backup_mode` | switch | Backup Mode | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `todo.einkaufsliste` | todo | Einkaufsliste | Todo: Einkaufsliste | 0 |  |
| `tts.google_translate_en_com` | tts | Google Translate en com | Tts: Google Translate en com | unknown |  |
| `update.apexcharts_card_update` | update | apexcharts-card update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.cloudflared_update` | update | Cloudflared Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.file_editor_update` | update | File editor Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.grafana_update` | update | Grafana Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.home_assistant_core_update` | update | Home Assistant Core Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.home_assistant_operating_system_update` | update | Home Assistant Operating System Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.home_assistant_supervisor_update` | update | Home Assistant Supervisor Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.influxdb_update` | update | InfluxDB Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.kg_technik_serverschrank_firmware` | update | KG_Technik_Serverschrank Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.matter_server_update` | update | Matter Server Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.mini_graph_card_update` | update | mini-graph-card update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.mosquitto_broker_update` | update | Mosquitto broker Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.mushroom_update` | update | Mushroom update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.plotly_graph_card_update` | update | Plotly Graph Card update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.power_flow_card_plus_update` | update | Power Flow Card Plus update | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.terminal_ssh_update` | update | Terminal & SSH Update | Software-Update verfügbar für Gerät/Integration | off |  |
| `zone.home` | zone | Home | Zone: Home | 0 |  |

## Met.no (Wetter)

1 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `weather.forecast_home` | weather | Forecast Home | Wetterdaten von Met.no Wetterdienst | clear-night |  |

## Music/Audio

9 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `media_player.box` | media_player | Box | Mediaplayer (Musikwiedergabe, Radio etc.) | idle |  |
| `media_player.dg` | media_player | DG | Mediaplayer (Musikwiedergabe, Radio etc.) | playing |  |
| `media_player.lounge` | media_player | Lounge | Mediaplayer (Musikwiedergabe, Radio etc.) | playing |  |
| `media_player.og` | media_player | OG | Mediaplayer (Musikwiedergabe, Radio etc.) | idle |  |
| `number.box_balance` | number | Box Balance | Numerischer Wert zum Einstellen | 0 |  |
| `number.box_bass` | number | Box Bass | Bass-Einstellung des Audiogeräts | 0 |  |
| `number.box_treble` | number | Box Höhen | Höhen-Einstellung des Audiogeräts | 0 |  |
| `switch.box_crossfade` | switch | Box Überblenden | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.box_loudness` | switch | Box Loudness | Schaltbarer Ausgang (Ein/Aus) | on |  |

## Other

4 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.meter_active_power` | sensor | Meter active power | Sensor: Meter active power | -24 | W |
| `sensor.power_flow_status` | sensor | Power Flow Status | Sensor: Power Flow Status | 28 |  |
| `sensor.vorderer_schaftrieb_10` | sensor | Vorderer Schaftrieb 10 | Sensor: Vorderer Schaftrieb 10 | 15.7822 | kWh |
| `sensor.vorderer_schaftrieb_10_west` | sensor | Vorderer Schaftrieb 10 (West) | Sensor: Vorderer Schaftrieb 10 (West) | 20.8502 | kWh |

## Printer / Office

5 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.hp_officejet_pro_8600` | sensor | sensor.hp_officejet_pro_8600 | HP OfficeJet Pro Multifunktionsdrucker | unavailable |  |
| `sensor.hp_officejet_pro_8600_black_ink` | sensor | black ink | HP OfficeJet Pro Multifunktionsdrucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_cyan_ink` | sensor | cyan ink | HP OfficeJet Pro Multifunktionsdrucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_magenta_ink` | sensor | magenta ink | HP OfficeJet Pro Multifunktionsdrucker | unavailable | % |
| `sensor.hp_officejet_pro_8600_yellow_ink` | sensor | yellow ink | HP OfficeJet Pro Multifunktionsdrucker | unavailable | % |

## Shelly

333 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.dg_bad_jalousie_uberhitzung` | binary_sensor | DG_Bad_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_bad_jalousie_uberlast` | binary_sensor | DG_Bad_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_bad_jalousie_uberspannung` | binary_sensor | DG_Bad_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_bad_jalousie_uberstrom` | binary_sensor | DG_Bad_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_buero_jalousie_uberhitzung` | binary_sensor | DG_Buero_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_buero_jalousie_uberlast` | binary_sensor | DG_Buero_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_buero_jalousie_uberspannung` | binary_sensor | DG_Buero_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_buero_jalousie_uberstrom` | binary_sensor | DG_Buero_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_buero_workstation_uberhitzung` | binary_sensor | DG_Buero_Workstation Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.dg_buero_workstation_uberlast` | binary_sensor | DG_Buero_Workstation Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.dg_buero_workstation_uberspannung` | binary_sensor | DG_Buero_Workstation Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.dg_buero_workstation_uberstrom` | binary_sensor | DG_Buero_Workstation Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_1 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberlast` | binary_sensor | DG_Schlafen_Jalousie_1 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_1 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_1 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_2 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberlast` | binary_sensor | DG_Schlafen_Jalousie_2 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_2 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_2 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberhitzung` | binary_sensor | EG_Diele_Jalousie-1 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberlast` | binary_sensor | EG_Diele_Jalousie-1 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberspannung` | binary_sensor | EG_Diele_Jalousie-1 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberstrom` | binary_sensor | EG_Diele_Jalousie-1 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberhitzung` | binary_sensor | EG_Diele_Jalousie-2 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberlast` | binary_sensor | EG_Diele_Jalousie-2 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberspannung` | binary_sensor | EG_Diele_Jalousie-2 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberstrom` | binary_sensor | EG_Diele_Jalousie-2 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_essen_jalousie_uberhitzung` | binary_sensor | EG_Essen_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_essen_jalousie_uberlast` | binary_sensor | EG_Essen_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_essen_jalousie_uberspannung` | binary_sensor | EG_Essen_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_essen_jalousie_uberstrom` | binary_sensor | EG_Essen_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberhitzung` | binary_sensor | EG_Kueche_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberlast` | binary_sensor | EG_Kueche_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberspannung` | binary_sensor | EG_Kueche_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_kueche_jalousie_uberstrom` | binary_sensor | EG_Kueche_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberhitzung` | binary_sensor | EG_Kueche_Spuelmaschine Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberlast` | binary_sensor | EG_Kueche_Spuelmaschine Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberspannung` | binary_sensor | EG_Kueche_Spuelmaschine Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberstrom` | binary_sensor | EG_Kueche_Spuelmaschine Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_wc_jalousie_uberhitzung` | binary_sensor | EG_WC_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wc_jalousie_uberlast` | binary_sensor | EG_WC_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wc_jalousie_uberspannung` | binary_sensor | EG_WC_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wc_jalousie_uberstrom` | binary_sensor | EG_WC_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wc_licht_eingang_0` | binary_sensor | EG_WC_Licht Eingang 0 | Binärer Sensor (Status): EG_WC_Licht Eingang 0 | on |  |
| `binary_sensor.eg_wc_licht_uberhitzung` | binary_sensor | EG_WC_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_wc_licht_uberlast` | binary_sensor | EG_WC_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_wc_licht_uberspannung` | binary_sensor | EG_WC_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_wc_licht_uberstrom` | binary_sensor | EG_WC_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_1 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberlast` | binary_sensor | EG_Wohnen_Jalousie_1 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_1 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_1 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_2 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberlast` | binary_sensor | EG_Wohnen_Jalousie_2 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_2 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_2 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberhitzung` | binary_sensor | KG_Flur_Kuehlschrank Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberlast` | binary_sensor | KG_Flur_Kuehlschrank Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberspannung` | binary_sensor | KG_Flur_Kuehlschrank Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberstrom` | binary_sensor | KG_Flur_Kuehlschrank Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_keller_licht_eingang_0` | binary_sensor | KG_Keller_Licht Eingang 0 | Binärer Sensor (Status): KG_Keller_Licht Eingang 0 | on |  |
| `binary_sensor.kg_keller_licht_uberhitzung` | binary_sensor | KG_Keller_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_keller_licht_uberlast` | binary_sensor | KG_Keller_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_keller_licht_uberspannung` | binary_sensor | KG_Keller_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_keller_licht_uberstrom` | binary_sensor | KG_Keller_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_serverschrank_uberhitzung` | binary_sensor | KG_Technik_Serverschrank Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_serverschrank_uberlast` | binary_sensor | KG_Technik_Serverschrank Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_serverschrank_uberspannung` | binary_sensor | KG_Technik_Serverschrank Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_serverschrank_uberstrom` | binary_sensor | KG_Technik_Serverschrank Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_trockner_uberhitzung` | binary_sensor | KG_Technik_Trockner Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_trockner_uberlast` | binary_sensor | KG_Technik_Trockner Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_trockner_uberspannung` | binary_sensor | KG_Technik_Trockner Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_trockner_uberstrom` | binary_sensor | KG_Technik_Trockner Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberhitzung` | binary_sensor | KG_Technik_Waschmaschine Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberlast` | binary_sensor | KG_Technik_Waschmaschine Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberspannung` | binary_sensor | KG_Technik_Waschmaschine Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberstrom` | binary_sensor | KG_Technik_Waschmaschine Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_1 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberlast` | binary_sensor | OG_Ankleide_Jalousie_1 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_1 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_1 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_2 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberlast` | binary_sensor | OG_Ankleide_Jalousie_2 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_2 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_2 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_ankleide_licht_eingang_0` | binary_sensor | OG_Ankleide_Licht Eingang 0 | Binärer Sensor (Status): OG_Ankleide_Licht Eingang 0 | off |  |
| `binary_sensor.og_ankleide_licht_uberhitzung` | binary_sensor | OG_Ankleide_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_ankleide_licht_uberlast` | binary_sensor | OG_Ankleide_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_ankleide_licht_uberspannung` | binary_sensor | OG_Ankleide_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_ankleide_licht_uberstrom` | binary_sensor | OG_Ankleide_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_bad_jalousie_1_uberhitzung` | binary_sensor | OG_Bad_Jalousie_1 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_1_uberlast` | binary_sensor | OG_Bad_Jalousie_1 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_1_uberspannung` | binary_sensor | OG_Bad_Jalousie_1 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_1_uberstrom` | binary_sensor | OG_Bad_Jalousie_1 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberhitzung` | binary_sensor | OG_Bad_Jalousie_2 Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberlast` | binary_sensor | OG_Bad_Jalousie_2 Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberspannung` | binary_sensor | OG_Bad_Jalousie_2 Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_jalousie_2_uberstrom` | binary_sensor | OG_Bad_Jalousie_2 Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_bad_licht_eingang_0` | binary_sensor | OG_Bad_Licht Eingang 0 | Binärer Sensor (Status): OG_Bad_Licht Eingang 0 | off |  |
| `binary_sensor.og_bad_licht_uberhitzung` | binary_sensor | OG_Bad_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_bad_licht_uberlast` | binary_sensor | OG_Bad_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_bad_licht_uberspannung` | binary_sensor | OG_Bad_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_bad_licht_uberstrom` | binary_sensor | OG_Bad_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_flur_jalousie_uberhitzung` | binary_sensor | OG_Flur_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_flur_jalousie_uberlast` | binary_sensor | OG_Flur_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_flur_jalousie_uberspannung` | binary_sensor | OG_Flur_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_flur_jalousie_uberstrom` | binary_sensor | OG_Flur_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberhitzung` | binary_sensor | OG_Zimmer1_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberlast` | binary_sensor | OG_Zimmer1_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberspannung` | binary_sensor | OG_Zimmer1_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberstrom` | binary_sensor | OG_Zimmer1_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer1_licht_eingang_0` | binary_sensor | OG_Zimmer1_Licht Eingang 0 | Binärer Sensor (Status): OG_Zimmer1_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer1_licht_uberhitzung` | binary_sensor | OG_Zimmer1_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer1_licht_uberlast` | binary_sensor | OG_Zimmer1_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer1_licht_uberspannung` | binary_sensor | OG_Zimmer1_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer1_licht_uberstrom` | binary_sensor | OG_Zimmer1_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberhitzung` | binary_sensor | OG_Zimmer2_Jalousie Überhitzung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberlast` | binary_sensor | OG_Zimmer2_Jalousie Überlast | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberspannung` | binary_sensor | OG_Zimmer2_Jalousie Überspannung | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberstrom` | binary_sensor | OG_Zimmer2_Jalousie Überstrom | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `binary_sensor.og_zimmer2_licht_eingang_0` | binary_sensor | OG_Zimmer2_Licht Eingang 0 | Binärer Sensor (Status): OG_Zimmer2_Licht Eingang 0 | off |  |
| `binary_sensor.og_zimmer2_licht_uberhitzung` | binary_sensor | OG_Zimmer2_Licht Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_licht_uberlast` | binary_sensor | OG_Zimmer2_Licht Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_licht_uberspannung` | binary_sensor | OG_Zimmer2_Licht Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_licht_uberstrom` | binary_sensor | OG_Zimmer2_Licht Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberhitzung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überhitzung | Überhitzungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberlast` | binary_sensor | OG_Zimmer2_Lichtstreifen Überlast | Überlastschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberspannung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überspannung | Überspannungsschutz des Shelly-Geräts | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberstrom` | binary_sensor | OG_Zimmer2_Lichtstreifen Überstrom | Überstromschutz des Shelly-Geräts | off |  |
| `button.dg_bad_jalousie_neu_starten` | button | DG_Bad_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.dg_buero_jalousie_neu_starten` | button | DG_Buero_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.dg_buero_workstation_neu_starten` | button | DG_Buero_Workstation Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.dg_schlafen_jalousie_1_neu_starten` | button | DG_Schlafen_Jalousie_1 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.dg_schlafen_jalousie_2_neu_starten` | button | DG_Schlafen_Jalousie_2 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_diele_jalousie_1_neu_starten` | button | EG_Diele_Jalousie-1 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_diele_jalousie_2_neu_starten` | button | EG_Diele_Jalousie-2 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_essen_jalousie_neu_starten` | button | EG_Essen_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_kueche_jalousie_neu_starten` | button | EG_Kueche_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_kueche_spuelmaschine_neu_starten` | button | EG_Kueche_Spuelmaschine Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.eg_wc_jalousie_neu_starten` | button | EG_WC_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_wc_licht_neu_starten` | button | EG_WC_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.eg_wohnen_jalousie_1_neu_starten` | button | EG_Wohnen_Jalousie_1 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.eg_wohnen_jalousie_2_neu_starten` | button | EG_Wohnen_Jalousie_2 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.kg_flur_kuehlschrank_neu_starten` | button | KG_Flur_Kuehlschrank Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.kg_keller_licht_neu_starten` | button | KG_Keller_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.kg_technik_trockner_neu_starten` | button | KG_Technik_Trockner Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.kg_technik_waschmaschine_neu_starten` | button | KG_Technik_Waschmaschine Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.og_ankleide_jalousie_1_neu_starten` | button | OG_Ankleide_Jalousie_1 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_ankleide_jalousie_2_neu_starten` | button | OG_Ankleide_Jalousie_2 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_ankleide_licht_neu_starten` | button | OG_Ankleide_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.og_bad_jalousie_1_neu_starten` | button | OG_Bad_Jalousie_1 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_bad_jalousie_2_neu_starten` | button | OG_Bad_Jalousie_2 Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_bad_licht_neu_starten` | button | OG_Bad_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.og_flur_jalousie_neu_starten` | button | OG_Flur_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_zimmer1_jalousie_neu_starten` | button | OG_Zimmer1_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_zimmer1_licht_neu_starten` | button | OG_Zimmer1_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.og_zimmer2_jalousie_neu_starten` | button | OG_Zimmer2_Jalousie Neu starten | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `button.og_zimmer2_licht_neu_starten` | button | OG_Zimmer2_Licht Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.og_zimmer2_lichtstreifen_neu_starten` | button | OG_Zimmer2_Lichtstreifen Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `cover.dg_bad_jalousie` | cover | DG_Bad_Jalousie | Dachgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.dg_buero_jalousie` | cover | DG_Buero_Jalousie | Dachgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.dg_schlafen_jalousie_1` | cover | DG_Schlafen_Jalousie_1 | Dachgeschoss-Jalousie, Shelly-gesteuert | open |  |
| `cover.dg_schlafen_jalousie_2` | cover | DG_Schlafen_Jalousie_2 | Dachgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.eg_diele_jalousie_1` | cover | EG_Diele_Jalousie-1 | Erdgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.eg_diele_jalousie_2` | cover | EG_Diele_Jalousie-2 | Erdgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.eg_essen_jalousie` | cover | EG_Essen_Jalousie | Erdgeschoss-Jalousie, Shelly-gesteuert | open |  |
| `cover.eg_kueche_jalousie` | cover | EG_Kueche_Jalousie | Erdgeschoss-Jalousie, Shelly-gesteuert | open |  |
| `cover.eg_wc_jalousie` | cover | EG_WC_Jalousie | Erdgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.eg_wohnen_jalousie_1` | cover | EG_Wohnen_Jalousie_1 | Erdgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.eg_wohnen_jalousie_2` | cover | EG_Wohnen_Jalousie_2 | Erdgeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_ankleide_jalousie_1` | cover | OG_Ankleide_Jalousie_1 | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_ankleide_jalousie_2` | cover | OG_Ankleide_Jalousie_2 | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_bad_jalousie_1` | cover | OG_Bad_Jalousie_1 | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_bad_jalousie_2` | cover | OG_Bad_Jalousie_2 | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_flur_jalousie` | cover | OG_Flur_Jalousie | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_zimmer1_jalousie` | cover | OG_Zimmer1_Jalousie | Obergeschoss-Jalousie, Shelly-gesteuert | closed |  |
| `cover.og_zimmer2_jalousie` | cover | OG_Zimmer2_Jalousie | Obergeschoss-Jalousie, Shelly-gesteuert | open |  |
| `event.dg_bad_jalousie_eingang_0` | event | DG_Bad_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T10:00:14.144+00:00 |  |
| `event.dg_bad_jalousie_eingang_1` | event | DG_Bad_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-10T07:35:40.802+00:00 |  |
| `event.dg_buero_jalousie_eingang_0` | event | DG_Buero_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-16T21:42:30.406+00:00 |  |
| `event.dg_buero_jalousie_eingang_1` | event | DG_Buero_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-13T05:27:49.668+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_0` | event | DG_Schlafen_Jalousie_1 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T07:15:32.091+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_1` | event | DG_Schlafen_Jalousie_1 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T05:14:05.163+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_0` | event | DG_Schlafen_Jalousie_2 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T07:15:32.536+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_1` | event | DG_Schlafen_Jalousie_2 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T05:02:56.031+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_0` | event | EG_Diele_Jalousie-1 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-10T17:34:54.294+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_1` | event | EG_Diele_Jalousie-1 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-17T18:13:59.736+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_0` | event | EG_Diele_Jalousie-2 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T06:27:50.610+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_1` | event | EG_Diele_Jalousie-2 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-17T18:13:58.517+00:00 |  |
| `event.eg_essen_jalousie_eingang_0` | event | EG_Essen_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T17:13:13.954+00:00 |  |
| `event.eg_essen_jalousie_eingang_1` | event | EG_Essen_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T11:35:12.171+00:00 |  |
| `event.eg_kueche_jalousie_eingang_0` | event | EG_Kueche_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T17:13:14.466+00:00 |  |
| `event.eg_kueche_jalousie_eingang_1` | event | EG_Kueche_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T11:35:33.935+00:00 |  |
| `event.eg_wc_jalousie_eingang_0` | event | EG_WC_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `event.eg_wc_jalousie_eingang_1` | event | EG_WC_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | unknown |  |
| `event.eg_wohnen_jalousie_1_eingang_0` | event | EG_Wohnen_Jalousie_1 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T22:48:17.189+00:00 |  |
| `event.eg_wohnen_jalousie_1_eingang_1` | event | EG_Wohnen_Jalousie_1 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T20:02:17.415+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_0` | event | EG_Wohnen_Jalousie_2 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T22:48:20.666+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_1` | event | EG_Wohnen_Jalousie_2 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T20:02:17.803+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_0` | event | OG_Ankleide_Jalousie_1 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T06:07:46.703+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_1` | event | OG_Ankleide_Jalousie_1 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T18:21:11.696+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_0` | event | OG_Ankleide_Jalousie_2 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T06:07:41.151+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_1` | event | OG_Ankleide_Jalousie_2 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T18:21:12.295+00:00 |  |
| `event.og_bad_jalousie_1_eingang_0` | event | OG_Bad_Jalousie_1 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-14T16:40:32.165+00:00 |  |
| `event.og_bad_jalousie_1_eingang_1` | event | OG_Bad_Jalousie_1 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-09T18:51:07.920+00:00 |  |
| `event.og_bad_jalousie_2_eingang_0` | event | OG_Bad_Jalousie_2 Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-17T19:04:35.724+00:00 |  |
| `event.og_bad_jalousie_2_eingang_1` | event | OG_Bad_Jalousie_2 Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-17T19:04:33.597+00:00 |  |
| `event.og_flur_jalousie_eingang_0` | event | OG_Flur_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-10T05:48:37.411+00:00 |  |
| `event.og_flur_jalousie_eingang_1` | event | OG_Flur_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T18:20:57.193+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_0` | event | OG_Zimmer1_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T05:53:07.059+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_1` | event | OG_Zimmer1_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T19:24:10.311+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_0` | event | OG_Zimmer2_Jalousie Eingang 0 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T12:47:42.810+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_1` | event | OG_Zimmer2_Jalousie Eingang 1 | Motorisierte Jalousie mit Shelly-Steuerung | 2026-03-18T19:03:19.877+00:00 |  |
| `sensor.dg_bad_jalousie_energie` | sensor | DG_Bad_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.159528 | kWh |
| `sensor.dg_bad_jalousie_leistung` | sensor | DG_Bad_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.dg_buero_jalousie_energie` | sensor | DG_Buero_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.182944 | kWh |
| `sensor.dg_buero_jalousie_leistung` | sensor | DG_Buero_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.dg_buero_workstation_energie` | sensor | DG_Buero_Workstation Energie | Sensor: DG_Buero_Workstation Energie | 15.937189 | kWh |
| `sensor.dg_buero_workstation_energieeinspeisung` | sensor | DG_Buero_Workstation Energieeinspeisung | Sensor: DG_Buero_Workstation Energieeinspeisung | 0.0 | kWh |
| `sensor.dg_buero_workstation_leistung` | sensor | DG_Buero_Workstation Leistung | Sensor: DG_Buero_Workstation Leistung | 0.0 | W |
| `sensor.dg_schlafen_jalousie_1_energie` | sensor | DG_Schlafen_Jalousie_1 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.085622 | kWh |
| `sensor.dg_schlafen_jalousie_1_leistung` | sensor | DG_Schlafen_Jalousie_1 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.dg_schlafen_jalousie_2_energie` | sensor | DG_Schlafen_Jalousie_2 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.224368 | kWh |
| `sensor.dg_schlafen_jalousie_2_leistung` | sensor | DG_Schlafen_Jalousie_2 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_diele_jalousie_1_energie` | sensor | EG_Diele_Jalousie-1 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.115131 | kWh |
| `sensor.eg_diele_jalousie_1_leistung` | sensor | EG_Diele_Jalousie-1 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_diele_jalousie_2_energie` | sensor | EG_Diele_Jalousie-2 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.122768 | kWh |
| `sensor.eg_diele_jalousie_2_leistung` | sensor | EG_Diele_Jalousie-2 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_essen_jalousie_energie` | sensor | EG_Essen_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.521538 | kWh |
| `sensor.eg_essen_jalousie_leistung` | sensor | EG_Essen_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_kueche_jalousie_energie` | sensor | EG_Kueche_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.207716 | kWh |
| `sensor.eg_kueche_jalousie_leistung` | sensor | EG_Kueche_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_kueche_spuelmaschine_energie` | sensor | EG_Kueche_Spuelmaschine Energie | Sensor: EG_Kueche_Spuelmaschine Energie | 71.361417 | kWh |
| `sensor.eg_kueche_spuelmaschine_energieeinspeisung` | sensor | EG_Kueche_Spuelmaschine Energieeinspeisung | Sensor: EG_Kueche_Spuelmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_kueche_spuelmaschine_leistung` | sensor | EG_Kueche_Spuelmaschine Leistung | Sensor: EG_Kueche_Spuelmaschine Leistung | 0.0 | W |
| `sensor.eg_wc_jalousie_energie` | sensor | EG_WC_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.110668 | kWh |
| `sensor.eg_wc_jalousie_leistung` | sensor | EG_WC_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_wc_licht_energie` | sensor | EG_WC_Licht Energie | Sensor: EG_WC_Licht Energie | 0.063327 | kWh |
| `sensor.eg_wc_licht_energieeinspeisung` | sensor | EG_WC_Licht Energieeinspeisung | Sensor: EG_WC_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.eg_wc_licht_leistung` | sensor | EG_WC_Licht Leistung | Sensor: EG_WC_Licht Leistung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_1_energie` | sensor | EG_Wohnen_Jalousie_1 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.291347 | kWh |
| `sensor.eg_wohnen_jalousie_1_leistung` | sensor | EG_Wohnen_Jalousie_1 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.eg_wohnen_jalousie_2_energie` | sensor | EG_Wohnen_Jalousie_2 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.48805 | kWh |
| `sensor.eg_wohnen_jalousie_2_leistung` | sensor | EG_Wohnen_Jalousie_2 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.kg_flur_kuehlschrank_energie` | sensor | KG_Flur_Kuehlschrank Energie | Sensor: KG_Flur_Kuehlschrank Energie | 19.742668 | kWh |
| `sensor.kg_flur_kuehlschrank_energieeinspeisung` | sensor | KG_Flur_Kuehlschrank Energieeinspeisung | Sensor: KG_Flur_Kuehlschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_flur_kuehlschrank_leistung` | sensor | KG_Flur_Kuehlschrank Leistung | Sensor: KG_Flur_Kuehlschrank Leistung | 0.0 | W |
| `sensor.kg_keller_licht_energie` | sensor | KG_Keller_Licht Energie | Sensor: KG_Keller_Licht Energie | 2.188037 | kWh |
| `sensor.kg_keller_licht_energieeinspeisung` | sensor | KG_Keller_Licht Energieeinspeisung | Sensor: KG_Keller_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_keller_licht_leistung` | sensor | KG_Keller_Licht Leistung | Sensor: KG_Keller_Licht Leistung | 0.0 | W |
| `sensor.kg_technik_trockner_energie` | sensor | KG_Technik_Trockner Energie | Sensor: KG_Technik_Trockner Energie | 16.610453 | kWh |
| `sensor.kg_technik_trockner_energieeinspeisung` | sensor | KG_Technik_Trockner Energieeinspeisung | Sensor: KG_Technik_Trockner Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_trockner_leistung` | sensor | KG_Technik_Trockner Leistung | Sensor: KG_Technik_Trockner Leistung | 0.0 | W |
| `sensor.kg_technik_waschmaschine_energie` | sensor | KG_Technik_Waschmaschine Energie | Sensor: KG_Technik_Waschmaschine Energie | 41.622718 | kWh |
| `sensor.kg_technik_waschmaschine_energieeinspeisung` | sensor | KG_Technik_Waschmaschine Energieeinspeisung | Sensor: KG_Technik_Waschmaschine Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_waschmaschine_leistung` | sensor | KG_Technik_Waschmaschine Leistung | Sensor: KG_Technik_Waschmaschine Leistung | 0.0 | W |
| `sensor.og_ankleide_jalousie_1_energie` | sensor | OG_Ankleide_Jalousie_1 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.113823 | kWh |
| `sensor.og_ankleide_jalousie_1_leistung` | sensor | OG_Ankleide_Jalousie_1 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_ankleide_jalousie_2_energie` | sensor | OG_Ankleide_Jalousie_2 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.110913 | kWh |
| `sensor.og_ankleide_jalousie_2_leistung` | sensor | OG_Ankleide_Jalousie_2 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_ankleide_licht_energie` | sensor | OG_Ankleide_Licht Energie | Sensor: OG_Ankleide_Licht Energie | 0.885131 | kWh |
| `sensor.og_ankleide_licht_energieeinspeisung` | sensor | OG_Ankleide_Licht Energieeinspeisung | Sensor: OG_Ankleide_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_ankleide_licht_leistung` | sensor | OG_Ankleide_Licht Leistung | Sensor: OG_Ankleide_Licht Leistung | 0.0 | W |
| `sensor.og_bad_jalousie_1_energie` | sensor | OG_Bad_Jalousie_1 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.06091 | kWh |
| `sensor.og_bad_jalousie_1_leistung` | sensor | OG_Bad_Jalousie_1 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_bad_jalousie_2_energie` | sensor | OG_Bad_Jalousie_2 Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.077628 | kWh |
| `sensor.og_bad_jalousie_2_leistung` | sensor | OG_Bad_Jalousie_2 Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_bad_licht_energie` | sensor | OG_Bad_Licht Energie | Sensor: OG_Bad_Licht Energie | 2.157439 | kWh |
| `sensor.og_bad_licht_energieeinspeisung` | sensor | OG_Bad_Licht Energieeinspeisung | Sensor: OG_Bad_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_bad_licht_leistung` | sensor | OG_Bad_Licht Leistung | Sensor: OG_Bad_Licht Leistung | 0.0 | W |
| `sensor.og_flur_jalousie_energie` | sensor | OG_Flur_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.243261 | kWh |
| `sensor.og_flur_jalousie_leistung` | sensor | OG_Flur_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_zimmer1_jalousie_energie` | sensor | OG_Zimmer1_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.200381 | kWh |
| `sensor.og_zimmer1_jalousie_leistung` | sensor | OG_Zimmer1_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_zimmer1_licht_energie` | sensor | OG_Zimmer1_Licht Energie | Sensor: OG_Zimmer1_Licht Energie | 2.411103 | kWh |
| `sensor.og_zimmer1_licht_energieeinspeisung` | sensor | OG_Zimmer1_Licht Energieeinspeisung | Sensor: OG_Zimmer1_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer1_licht_leistung` | sensor | OG_Zimmer1_Licht Leistung | Sensor: OG_Zimmer1_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_jalousie_energie` | sensor | OG_Zimmer2_Jalousie Energie | Motorisierte Jalousie mit Shelly-Steuerung | 0.155262 | kWh |
| `sensor.og_zimmer2_jalousie_leistung` | sensor | OG_Zimmer2_Jalousie Leistung | Motorisierte Jalousie mit Shelly-Steuerung | 0.0 | W |
| `sensor.og_zimmer2_licht_energie` | sensor | OG_Zimmer2_Licht Energie | Sensor: OG_Zimmer2_Licht Energie | 0.043028 | kWh |
| `sensor.og_zimmer2_licht_energieeinspeisung` | sensor | OG_Zimmer2_Licht Energieeinspeisung | Sensor: OG_Zimmer2_Licht Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_licht_leistung` | sensor | OG_Zimmer2_Licht Leistung | Sensor: OG_Zimmer2_Licht Leistung | 0.0 | W |
| `sensor.og_zimmer2_lichtstreifen_energie` | sensor | OG_Zimmer2_Lichtstreifen Energie | Sensor: OG_Zimmer2_Lichtstreifen Energie | 2.321968 | kWh |
| `sensor.og_zimmer2_lichtstreifen_energieeinspeisung` | sensor | OG_Zimmer2_Lichtstreifen Energieeinspeisung | Sensor: OG_Zimmer2_Lichtstreifen Energieeinspeisung | 0.0 | kWh |
| `sensor.og_zimmer2_lichtstreifen_leistung` | sensor | OG_Zimmer2_Lichtstreifen Leistung | Sensor: OG_Zimmer2_Lichtstreifen Leistung | 0.0 | W |
| `sensor.wp_cop_heizung_gesamt` | sensor | WP COP Heizung gesamt | Leistungszahl (COP) der Wärmepumpe | 0 |  |
| `sensor.wp_cop_heizung_monatlich` | sensor | WP COP Heizung monatlich | Leistungszahl (COP) der Wärmepumpe | 2.58 |  |
| `sensor.wp_heizung_thermisch_gesamt_seit_tracking` | sensor | WP Heizung thermisch gesamt (seit Tracking) | Sensor: WP Heizung thermisch gesamt (seit Tracking) | 170.9 | kWh |
| `sensor.wp_heizung_thermisch_monatlich` | sensor | WP Heizung thermisch monatlich | Sensor: WP Heizung thermisch monatlich | 170.9 | kWh |
| `switch.dg_buero_workstation` | switch | DG_Buero_Workstation | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.eg_kueche_spuelmaschine` | switch | EG_Kueche_Spuelmaschine | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `switch.eg_wc_licht` | switch | EG_WC_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.kg_flur_kuehlschrank` | switch | KG_Flur_Kuehlschrank | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `switch.kg_keller_licht` | switch | KG_Keller_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.kg_technik_serverschrank` | switch | KG_Technik_Serverschrank | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `switch.kg_technik_trockner` | switch | KG_Technik_Trockner | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `switch.kg_technik_waschmaschine` | switch | KG_Technik_Waschmaschine | Schaltbarer Ausgang (Ein/Aus) | on |  |
| `switch.og_ankleide_licht` | switch | OG_Ankleide_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.og_bad_licht` | switch | OG_Bad_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.og_zimmer1_licht` | switch | OG_Zimmer1_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.og_zimmer2_licht` | switch | OG_Zimmer2_Licht | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `switch.og_zimmer2_lichtstreifen` | switch | OG_Zimmer2_Lichtstreifen | Schaltbarer Ausgang (Ein/Aus) | off |  |
| `update.dg_bad_jalousie_firmware` | update | DG_Bad_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.dg_buero_jalousie_firmware` | update | DG_Buero_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.dg_buero_workstation_firmware` | update | DG_Buero_Workstation Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.dg_schlafen_jalousie_1_firmware` | update | DG_Schlafen_Jalousie_1 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.dg_schlafen_jalousie_2_firmware` | update | DG_Schlafen_Jalousie_2 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_diele_jalousie_1_firmware` | update | EG_Diele_Jalousie-1 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_diele_jalousie_2_firmware` | update | EG_Diele_Jalousie-2 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_essen_jalousie_firmware` | update | EG_Essen_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_kueche_jalousie_firmware` | update | EG_Kueche_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_kueche_spuelmaschine_firmware` | update | EG_Kueche_Spuelmaschine Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.eg_wc_jalousie_firmware` | update | EG_WC_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_wc_licht_firmware` | update | EG_WC_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.eg_wohnen_jalousie_1_firmware` | update | EG_Wohnen_Jalousie_1 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.eg_wohnen_jalousie_2_firmware` | update | EG_Wohnen_Jalousie_2 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.kg_flur_kuehlschrank_firmware` | update | KG_Flur_Kuehlschrank Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.kg_keller_licht_firmware` | update | KG_Keller_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.kg_technik_trockner_firmware` | update | KG_Technik_Trockner Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.kg_technik_waschmaschine_firmware` | update | KG_Technik_Waschmaschine Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.og_ankleide_jalousie_1_firmware` | update | OG_Ankleide_Jalousie_1 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_ankleide_jalousie_2_firmware` | update | OG_Ankleide_Jalousie_2 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_ankleide_licht_firmware` | update | OG_Ankleide_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.og_bad_jalousie_1_firmware` | update | OG_Bad_Jalousie_1 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_bad_jalousie_2_firmware` | update | OG_Bad_Jalousie_2 Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_bad_licht_firmware` | update | OG_Bad_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.og_flur_jalousie_firmware` | update | OG_Flur_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_zimmer1_jalousie_firmware` | update | OG_Zimmer1_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_zimmer1_licht_firmware` | update | OG_Zimmer1_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.og_zimmer2_jalousie_firmware` | update | OG_Zimmer2_Jalousie Firmware | Motorisierte Jalousie mit Shelly-Steuerung | off |  |
| `update.og_zimmer2_licht_firmware` | update | OG_Zimmer2_Licht Firmware | Software-Update verfügbar für Gerät/Integration | off |  |
| `update.og_zimmer2_lichtstreifen_firmware` | update | OG_Zimmer2_Lichtstreifen Firmware | Software-Update verfügbar für Gerät/Integration | off |  |

## Smart Home Automation

9 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.exporting_power` | binary_sensor | Exporting Power | Status: Strom wird ins Netz eingespeist | on |  |
| `binary_sensor.exporting_power_delay` | binary_sensor | Exporting Power (delay) | Status: Strom wird ins Netz eingespeist | off |  |
| `binary_sensor.importing_power` | binary_sensor | Importing Power | Status: Strom wird vom Netz bezogen | off |  |
| `binary_sensor.importing_power_delay` | binary_sensor | Importing Power (delay) | Status: Strom wird vom Netz bezogen | off |  |
| `binary_sensor.pv_generating` | binary_sensor | PV generating | Status: PV erzeugt gerade Strom | off |  |
| `binary_sensor.pv_generating_delay` | binary_sensor | PV generating (delay) | Status: PV erzeugt gerade Strom | off |  |
| `button.kg_technik_serverschrank_neu_starten` | button | KG_Technik_Serverschrank Neu starten | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.start_inverter` | button | Start inverter | Schaltfläche zum Ausführen einer Aktion | unknown |  |
| `button.stop_inverter` | button | Stop inverter | Schaltfläche zum Ausführen einer Aktion | unknown |  |

## Solcast

18 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `select.solcast_pv_forecast_verwenden_sie_das_prognosefeld` | select | Solcast PV Forecast Verwenden Sie das Prognosefeld | Solcast PV-Erzeugungsprognose | estimate |  |
| `sensor.solcast_pv_forecast_aktuelle_leistung` | sensor | Solcast PV Forecast Aktuelle Leistung | Solcast PV-Erzeugungsprognose | 0 | W |
| `sensor.solcast_pv_forecast_fester_grenzwert_eingestellt` | sensor | Solcast PV Forecast Fester Grenzwert eingestellt | Solcast PV-Erzeugungsprognose | False |  |
| `sensor.solcast_pv_forecast_leistung_in_1_stunde` | sensor | Solcast PV Forecast Leistung in 1 Stunde | Solcast PV-Erzeugungsprognose | 0 | W |
| `sensor.solcast_pv_forecast_leistung_in_30_minuten` | sensor | Solcast PV Forecast Leistung in 30 Minuten | Solcast PV-Erzeugungsprognose | 0 | W |
| `sensor.solcast_pv_forecast_max_api_abrufe` | sensor | Solcast PV Forecast max. API-Abrufe | Solcast PV-Erzeugungsprognose | 10 |  |
| `sensor.solcast_pv_forecast_prognose_aktuelle_stunde` | sensor | Solcast PV Forecast Prognose aktuelle Stunde | Solcast PV-Erzeugungsprognose | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_heute` | sensor | Solcast PV Forecast Prognose heute | Solcast PV-Erzeugungsprognose | 36.6324 | kWh |
| `sensor.solcast_pv_forecast_prognose_morgen` | sensor | Solcast PV Forecast Prognose morgen | Solcast PV-Erzeugungsprognose | 36.666 | kWh |
| `sensor.solcast_pv_forecast_prognose_nachste_stunde` | sensor | Solcast PV Forecast Prognose nächste Stunde | Solcast PV-Erzeugungsprognose | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute` | sensor | Solcast PV Forecast Prognose Spitzenleistung heute | Solcast PV-Erzeugungsprognose | 5240 | W |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen` | sensor | Solcast PV Forecast Prognose Spitzenleistung morgen | Solcast PV-Erzeugungsprognose | 5178 | W |
| `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute` | sensor | Solcast PV Forecast Prognose verbleibende Leistung heute | Solcast PV-Erzeugungsprognose | 0 | kWh |
| `sensor.solcast_pv_forecast_verwendete_api_abrufe` | sensor | Solcast PV Forecast Verwendete API-Abrufe | Solcast PV-Erzeugungsprognose | 6 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_letzter_api_abruf` | sensor | Solcast PV Forecast Zeitpunkt letzter API-Abruf | Solcast PV-Erzeugungsprognose | 2026-03-18T10:22:18+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_heute` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung heute | Solcast PV-Erzeugungsprognose | 2026-03-18T10:30:00+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_morgen` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | Solcast PV-Erzeugungsprognose | 2026-03-19T10:30:00+00:00 |  |
| `update.solcast_pv_forecast_update` | update | Solcast PV Forecast update | Solcast PV-Erzeugungsprognose | off |  |

## Sonstige

3 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.kg_technik_serverschrank_energie` | sensor | KG_Technik_Serverschrank Energie | Sensor: KG_Technik_Serverschrank Energie | 66.07477 | kWh |
| `sensor.kg_technik_serverschrank_energieeinspeisung` | sensor | KG_Technik_Serverschrank Energieeinspeisung | Sensor: KG_Technik_Serverschrank Energieeinspeisung | 0.0 | kWh |
| `sensor.kg_technik_serverschrank_leistung` | sensor | KG_Technik_Serverschrank Leistung | Sensor: KG_Technik_Serverschrank Leistung | 84.4 | W |

## Sun (HA built-in)

7 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.sun_next_dawn` | sensor | Sun Nächste Morgendämmerung | Zeitpunkt der nächsten Morgendämmerung | 2026-03-19T04:59:26+00:00 |  |
| `sensor.sun_next_dusk` | sensor | Sun Nächste Abenddämmerung | Zeitpunkt der nächsten Abenddämmerung | 2026-03-19T18:09:02+00:00 |  |
| `sensor.sun_next_midnight` | sensor | Sun Nächste Mitternacht | Sensor: Sun Nächste Mitternacht | 2026-03-18T23:33:45+00:00 |  |
| `sensor.sun_next_noon` | sensor | Sun Nächster Höchststand | Sensor: Sun Nächster Höchststand | 2026-03-19T11:33:52+00:00 |  |
| `sensor.sun_next_rising` | sensor | Sun Nächster Aufgang | Zeitpunkt des nächsten Sonnenaufgangs | 2026-03-19T05:31:29+00:00 |  |
| `sensor.sun_next_setting` | sensor | Sun Nächster Untergang | Zeitpunkt des nächsten Sonnenuntergangs | 2026-03-19T17:36:52+00:00 |  |
| `sun.sun` | sun | Sun | Sun: Sun | below_horizon |  |

## Sungrow (Modbus)

108 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.sungrow_dashboard_enable_danger_mode_auto_reset` | automation | sungrow dashboard enable danger mode auto reset | Home Assistant Automatisierung und Szenen | on |  |
| `automation.sungrow_max_export_scene_sets_rated_limit` | automation | sungrow max export scene sets rated limit | Home Assistant Automatisierung und Szenen | on |  |
| `automation.sungrow_self_consumption_mode_max_battery_discharge_scene_sets_rated_limit` | automation | sungrow self consumption mode max battery discharge scene sets rated limit | Home Assistant Automatisierung und Szenen | on |  |
| `binary_sensor.negative_load_power` | binary_sensor | Negative Load Power | Aktueller Stromverbrauch des gesamten Haushalts | off |  |
| `binary_sensor.negative_load_power_delay` | binary_sensor | Negative Load Power (delay) | Aktueller Stromverbrauch des gesamten Haushalts | off |  |
| `binary_sensor.positive_load_power` | binary_sensor | Positive Load Power | Aktueller Stromverbrauch des gesamten Haushalts | on |  |
| `binary_sensor.positive_load_power_delay` | binary_sensor | Positive Load Power (delay) | Aktueller Stromverbrauch des gesamten Haushalts | on |  |
| `number.export_power_limit` | number | Export power limit | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | 10000.0 | W |
| `scene.max_export_power` | scene | Max Export Power | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | unknown |  |
| `scene.self_consumption_mode_max_battery_discharge` | scene | Self-Consumption Mode (max battery discharge) | Home Assistant Szene (Gruppe von Einstellungen) | unknown |  |
| `scene.self_consumption_mode_no_battery_discharge` | scene | Self-Consumption Mode (no battery discharge) | Home Assistant Szene (Gruppe von Einstellungen) | unknown |  |
| `scene.zero_export_power` | scene | Zero Export Power | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | unknown |  |
| `sensor.backup_phase_a_power` | sensor | Backup phase A power | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 0 | W |
| `sensor.backup_phase_b_power` | sensor | Backup phase B power | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 0 | W |
| `sensor.backup_phase_c_power` | sensor | Backup phase C power | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 0 | W |
| `sensor.battery_charge` | sensor | Battery charge | Sensor: Battery charge | 6.12 | kWh |
| `sensor.battery_charge_health_rated` | sensor | Battery charge (health-rated) | Sensor: Battery charge (health-rated) | 6.06 | kWh |
| `sensor.battery_charge_nominal` | sensor | Battery charge (nominal) | Sensor: Battery charge (nominal) | 6.8 | kWh |
| `sensor.battery_firmware_version` | sensor | Battery Firmware Version | Sensor: Battery Firmware Version |                                |  |
| `sensor.battery_level` | sensor | Battery level | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 50.3 | % |
| `sensor.battery_level_nominal` | sensor | Battery level (nominal) | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 52.8 | % |
| `sensor.battery_power` | sensor | Battery power | Aktuelle Lade-/Entladeleistung der Batterie (positiv=laden, negativ=entladen) | 954 | W |
| `sensor.bms_max_charging_current` | sensor | BMS max. charging current | Max. Ladestrom laut Batteriemanagementsystem | 30 | A |
| `sensor.bms_max_discharging_current` | sensor | BMS max. discharging current | Max. Entladestrom laut Batteriemanagementsystem | 30 | A |
| `sensor.communication_module_firmware_version` | sensor | Communication Module Firmware Version | Sensor: Communication Module Firmware Version |                                |  |
| `sensor.daily_battery_charge` | sensor | Daily battery charge | Heute in die Batterie geladene Energie | 12.8 | kWh |
| `sensor.daily_battery_charge_from_pv` | sensor | Daily battery charge from PV | Heute in die Batterie geladene Energie | 12.8 | kWh |
| `sensor.daily_battery_discharge` | sensor | Daily battery discharge | Heute aus der Batterie entnommene Energie | 9.0 | kWh |
| `sensor.daily_direct_energy_consumption` | sensor | Daily direct energy consumption | Direkt verbrauchte PV-Energie (ohne Batterie) heute | 7.6 | kWh |
| `sensor.daily_exported_energy` | sensor | Daily exported energy | Insgesamt ins Netz eingespeiste Energie heute | 14.4 | kWh |
| `sensor.daily_exported_energy_from_pv` | sensor | Daily exported energy from PV | Insgesamt ins Netz eingespeiste Energie heute | 14.5 | kWh |
| `sensor.daily_imported_energy` | sensor | Daily imported energy | Insgesamt vom Netz bezogene Energie heute | 6.3 | kWh |
| `sensor.daily_pv_generation` | sensor | Daily PV generation | PV-Stromerzeugung des aktuellen Tages | 34.9 | kWh |
| `sensor.daily_pv_generation_battery_discharge` | sensor | Daily PV generation & battery discharge | PV-Stromerzeugung des aktuellen Tages | 30.1 | kWh |
| `sensor.energy_grid_import_power_export_power_net_power` | sensor | Grid Power | Stromleistung vom Netz ins Haus (Bezug vom Stromversorger) | 0.0 | W |
| `sensor.export_power` | sensor | Export power | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | 0 | W |
| `sensor.export_power_limit` | sensor | Export power limit | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | 10000 | W |
| `sensor.export_power_limit_mode_raw` | sensor | Export power limit mode raw | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | 170 |  |
| `sensor.export_power_raw` | sensor | Export power raw | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | 0 | W |
| `sensor.grid_frequency` | sensor | Grid frequency | Netzfrequenz (sollte ca. 50 Hz sein) | 49.98 | Hz |
| `sensor.import_power` | sensor | Import power | Stromleistung vom Netz ins Haus (Bezug vom Stromversorger) | 0 | W |
| `sensor.inverter_firmware_version` | sensor | Inverter Firmware Version | Sensor: Inverter Firmware Version |                                |  |
| `sensor.inverter_rated_output` | sensor | Inverter rated output | Sensor: Inverter rated output | 10000 | W |
| `sensor.inverter_temperature` | sensor | Inverter temperature | Interne Temperatur des SH10RT-20 Wechselrichters | 41.6 | °C |
| `sensor.iphone_von_david_battery_level` | sensor | iPhone von David Battery Level | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 20 | % |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistung | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 507.8 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistungsfaktor | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 0.93 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_a_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Scheinleistung | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 547.9 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistung | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 38.6 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistungsfaktor | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 0.58 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_b_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Scheinleistung | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 67.4 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistung | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistungsfaktor | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 0.0 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_c_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Scheinleistung | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 6.5 | VA |
| `sensor.load_power` | sensor | Load power | Aktueller Stromverbrauch des gesamten Haushalts | 935 | W |
| `sensor.meter_phase_a_active_power` | sensor | Meter phase A active power | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 512 | W |
| `sensor.meter_phase_a_current` | sensor | Meter phase A current | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | unavailable | A |
| `sensor.meter_phase_a_voltage` | sensor | Meter phase A voltage | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | unavailable | V |
| `sensor.meter_phase_b_active_power` | sensor | Meter phase B active power | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | -180 | W |
| `sensor.meter_phase_b_current` | sensor | Meter phase B current | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | unavailable | A |
| `sensor.meter_phase_b_voltage` | sensor | Meter phase B voltage | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | unavailable | V |
| `sensor.meter_phase_c_active_power` | sensor | Meter phase C active power | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | -326 | W |
| `sensor.meter_phase_c_current` | sensor | Meter phase C current | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | unavailable | A |
| `sensor.meter_phase_c_voltage` | sensor | Meter phase C voltage | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | unavailable | V |
| `sensor.mppt1_current` | sensor | MPPT1 current | MPPT-Leistung und Status des Wechselrichters | 0.0 | A |
| `sensor.mppt1_power` | sensor | MPPT1 power | MPPT-Leistung und Status des Wechselrichters | 0 | W |
| `sensor.mppt1_voltage` | sensor | MPPT1 voltage | MPPT-Leistung und Status des Wechselrichters | 0.0 | V |
| `sensor.mppt2_current` | sensor | MPPT2 current | MPPT-Leistung und Status des Wechselrichters | 0.0 | A |
| `sensor.mppt2_power` | sensor | MPPT2 power | MPPT-Leistung und Status des Wechselrichters | 0 | W |
| `sensor.mppt2_voltage` | sensor | MPPT2 voltage | MPPT-Leistung und Status des Wechselrichters | 0.0 | V |
| `sensor.mppt3_current` | sensor | MPPT3 current | MPPT-Leistung und Status des Wechselrichters | 0.0 | A |
| `sensor.mppt3_power` | sensor | MPPT3 power | MPPT-Leistung und Status des Wechselrichters | 0 | W |
| `sensor.mppt3_voltage` | sensor | MPPT3 voltage | MPPT-Leistung und Status des Wechselrichters | 0.0 | V |
| `sensor.mppt4_current` | sensor | MPPT4 current | MPPT-Leistung und Status des Wechselrichters | 0.0 | A |
| `sensor.mppt4_power` | sensor | MPPT4 power | MPPT-Leistung und Status des Wechselrichters | 0 | W |
| `sensor.mppt4_voltage` | sensor | MPPT4 voltage | MPPT-Leistung und Status des Wechselrichters | 0.0 | V |
| `sensor.phase_a_current` | sensor | Phase A current | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 1.2 | A |
| `sensor.phase_a_power` | sensor | Phase A power | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 280 | W |
| `sensor.phase_a_voltage` | sensor | Phase A voltage | AC-Spannung und Leistung auf Phase A (Wechselrichter Ausgang) | 234.0 | V |
| `sensor.phase_b_current` | sensor | Phase B current | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 1.2 | A |
| `sensor.phase_b_power` | sensor | Phase B power | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 281 | W |
| `sensor.phase_b_voltage` | sensor | Phase B voltage | AC-Spannung und Leistung auf Phase B (Wechselrichter Ausgang) | 234.7 | V |
| `sensor.phase_c_current` | sensor | Phase C current | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 1.2 | A |
| `sensor.phase_c_power` | sensor | Phase C power | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 280 | W |
| `sensor.phase_c_voltage` | sensor | Phase C voltage | AC-Spannung und Leistung auf Phase C (Wechselrichter Ausgang) | 233.8 | V |
| `sensor.power_factor` | sensor | Power factor | Leistungsfaktor (cos φ) der AC-Seite | 1.000 | % |
| `sensor.reactive_power` | sensor | Reactive power | Blindleistung der AC-Seite des Wechselrichters | -2 | W |
| `sensor.running_state_raw` | sensor | Running state raw | Betriebsstatus des Wechselrichters | 0 |  |
| `sensor.sungrow_arm_software` | sensor | Sungrow Arm Software | Sensor: Sungrow Arm Software | ARM_SAPPHIRE-H_V11_V01_B       |  |
| `sensor.sungrow_device_type` | sensor | Sungrow device type | Sensor: Sungrow device type | SH10RT-20 |  |
| `sensor.sungrow_device_type_code` | sensor | Sungrow device type code | Sensor: Sungrow device type code | 3603 |  |
| `sensor.sungrow_dsp_software` | sensor | Sungrow DSP Software | Sensor: Sungrow DSP Software | MDSP_SAPPHIRE-H_V11_V01_B      |  |
| `sensor.sungrow_inverter_serial` | sensor | Sungrow inverter serial | Sensor: Sungrow inverter serial | A2352614033          |  |
| `sensor.sungrow_inverter_state` | sensor | Sungrow inverter state | Sensor: Sungrow inverter state | Running |  |
| `sensor.sungrow_protocol_version` | sensor | Sungrow Protocol Version | Sensor: Sungrow Protocol Version | 16781568 |  |
| `sensor.sungrow_version_1` | sensor | Sungrow Version 1 | Sensor: Sungrow Version 1 | SAPPHIRE-H_01011.95.07 |  |
| `sensor.sungrow_version_2` | sensor | Sungrow Version 2 | Sensor: Sungrow Version 2 | unavailable |  |
| `sensor.sungrow_version_3` | sensor | Sungrow Version 3 | Sensor: Sungrow Version 3 | unavailable |  |
| `sensor.sungrow_version_4_sungrow_battery` | sensor | Sungrow Version 4 (Sungrow Battery) | Sensor: Sungrow Version 4 (Sungrow Battery) | unavailable |  |
| `sensor.total_active_power` | sensor | Total active power | Gesamtaktivleistung des Wechselrichters | 935 | W |
| `sensor.total_battery_charge` | sensor | Total battery charge | Sensor: Total battery charge | 933.7 | kWh |
| `sensor.total_battery_charge_from_pv` | sensor | Total battery charge from PV | Sensor: Total battery charge from PV | 868.3 | kWh |
| `sensor.total_battery_discharge` | sensor | Total battery discharge | Sensor: Total battery discharge | 854.7 | kWh |
| `sensor.total_dc_power` | sensor | Total DC power | DC-Gesamtleistung aller PV-Strings am SH10RT-20 Wechselrichter | 0 | W |
| `sensor.total_pv_generation` | sensor | Total PV generation | Gesamte PV-Stromerzeugung seit Inbetriebnahme | 2399.5 | kWh |
| `sensor.total_pv_generation_battery_discharge` | sensor | Total PV generation & battery discharge | Gesamte PV-Stromerzeugung seit Inbetriebnahme | 2244.4 | kWh |
| `switch.export_power_limit` | switch | Export power limit | Stromleistung vom Haus ins Netz (Einspeisung ins Stromnetz) | on |  |
| `switch.sungrow_dashboard_enable_danger_mode` | switch | Sungrow dashboard enable danger mode | Schaltbarer Ausgang (Ein/Aus) | off |  |

## Synology NAS

28 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.ds218_drive_1_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 1) Max. fehlerhafte Sektoren überschritten | Synology DiskStation DS218 NAS | off |  |
| `binary_sensor.ds218_drive_1_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 1) Unterhalb der Mindestrestlebensdauer | Synology DiskStation DS218 NAS | off |  |
| `binary_sensor.ds218_drive_2_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 2) Max. fehlerhafte Sektoren überschritten | Synology DiskStation DS218 NAS | off |  |
| `binary_sensor.ds218_drive_2_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 2) Unterhalb der Mindestrestlebensdauer | Synology DiskStation DS218 NAS | off |  |
| `binary_sensor.ds218_sicherheitsstatus` | binary_sensor | DS218 Sicherheitsstatus | Synology DiskStation DS218 NAS | off |  |
| `button.ds218_reboot` | button | DS218 Reboot | Synology DiskStation DS218 NAS | unknown |  |
| `button.ds218_shutdown` | button | DS218 Shutdown | Synology DiskStation DS218 NAS | unknown |  |
| `sensor.ds218_cpu_auslastung_benutzer` | sensor | DS218 CPU-Auslastung (Benutzer) | Synology DiskStation DS218 NAS | 51 | % |
| `sensor.ds218_cpu_auslastung_gesamt` | sensor | DS218 CPU-Auslastung (gesamt) | Synology DiskStation DS218 NAS | 54 | % |
| `sensor.ds218_download_durchsatz` | sensor | DS218 Download-Durchsatz | Synology DiskStation DS218 NAS | 2.907 | kB/s |
| `sensor.ds218_drive_1_status` | sensor | DS218 (Drive 1) Status | Synology DiskStation DS218 NAS | normal |  |
| `sensor.ds218_drive_1_temperatur` | sensor | DS218 (Drive 1) Temperatur | Synology DiskStation DS218 NAS | 36 | °C |
| `sensor.ds218_drive_2_status` | sensor | DS218 (Drive 2) Status | Synology DiskStation DS218 NAS | normal |  |
| `sensor.ds218_drive_2_temperatur` | sensor | DS218 (Drive 2) Temperatur | Synology DiskStation DS218 NAS | 35 | °C |
| `sensor.ds218_durchschnittliche_cpu_last_15_min` | sensor | DS218 Durchschnittliche CPU-Last (15 min) | Synology DiskStation DS218 NAS | 1.06 | load |
| `sensor.ds218_durchschnittliche_cpu_last_5_min` | sensor | DS218 Durchschnittliche CPU-Last (5 min) | Synology DiskStation DS218 NAS | 1.15 | load |
| `sensor.ds218_speicher_gesamt_real` | sensor | DS218 Speicher gesamt (real) | Synology DiskStation DS218 NAS | 10282.41408 | MB |
| `sensor.ds218_speicher_gesamt_swap` | sensor | DS218 Speicher gesamt (Swap) | Synology DiskStation DS218 NAS | 8317.227008 | MB |
| `sensor.ds218_speicher_verfugbar_real` | sensor | DS218 Speicher verfügbar (real) | Synology DiskStation DS218 NAS | 559.886336 | MB |
| `sensor.ds218_speicher_verfugbar_swap` | sensor | DS218 Speicher verfügbar (Swap) | Synology DiskStation DS218 NAS | 7979.90912 | MB |
| `sensor.ds218_speichernutzung_real` | sensor | DS218 Speichernutzung (real) | Synology DiskStation DS218 NAS | 21 | % |
| `sensor.ds218_temperatur` | sensor | DS218 Temperatur | Synology DiskStation DS218 NAS | 43 | °C |
| `sensor.ds218_upload_durchsatz` | sensor | DS218 Upload-Durchsatz | Synology DiskStation DS218 NAS | 1.1 | kB/s |
| `sensor.ds218_volume_1_belegter_speicherplatz` | sensor | DS218 (Volume 1) Belegter Speicherplatz | Synology DiskStation DS218 NAS | 3.668687065088 | TB |
| `sensor.ds218_volume_1_durchschnittliche_festplattentemperatur` | sensor | DS218 (Volume 1) Durchschnittliche Festplattentemperatur | Synology DiskStation DS218 NAS | 36.0 | °C |
| `sensor.ds218_volume_1_status` | sensor | DS218 (Volume 1) Status | Synology DiskStation DS218 NAS | normal |  |
| `sensor.ds218_volume_1_volume_nutzung` | sensor | DS218 (Volume 1) Volume-Nutzung | Synology DiskStation DS218 NAS | 63.7 | % |
| `update.ds218_dsm_update` | update | DS218 DSM-Update | Synology DiskStation DS218 NAS | off |  |

## Template-Sensoren

2 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.autarkiegrad` | sensor | Autarkiegrad | Prozentualer Anteil des Eigenverbrauchs von der Gesamterzeugung | 76.5 | % |
| `sensor.eigenverbrauchsquote` | sensor | Eigenverbrauchsquote | Prozentualer Anteil der Eigennutzung von der Gesamterzeugung | 58.7 | % |
