# Home Assistant Entities

> Automatisch generiert am **2026-04-05** — 936 Entitäten gesamt

## Inhaltsverzeichnis

- [1komma5° (Heartbeat)](#1komma5-heartbeat) (27)
- [Apple](#apple) (20)
- [EMHASS](#emhass) (23)
- [ENTSO-e](#entso-e) (12)
- [Energiemanagement (HA Energy)](#energiemanagement-ha-energy) (1)
- [HACS](#hacs) (2)
- [HP Drucker](#hp-drucker) (5)
- [Home Assistant (System)](#home-assistant-system) (37)
- [LICV Wärmepumpe (Luxtronik)](#licv-waermepumpe-luxtronik) (235)
- [Met.no (Wetter)](#metno-wetter) (1)
- [Shelly](#shelly) (350)
- [Solcast](#solcast) (20)
- [Sonos](#sonos) (7)
- [Sun (HA built-in)](#sun-ha-built-in) (7)
- [Sungrow (Modbus)](#sungrow-modbus) (151)
- [Synology NAS](#synology-nas) (28)
- [Template-Sensoren](#template-sensoren) (10)

## Zusammenfassung nach Integration

| Integration | Anzahl |
|---|---|
| 1komma5° (Heartbeat) | 27 |
| Apple | 20 |
| EMHASS | 23 |
| ENTSO-e | 12 |
| Energiemanagement (HA Energy) | 1 |
| HACS | 2 |
| HP Drucker | 5 |
| Home Assistant (System) | 37 |
| LICV Wärmepumpe (Luxtronik) | 235 |
| Met.no (Wetter) | 1 |
| Shelly | 350 |
| Solcast | 20 |
| Sonos | 7 |
| Sun (HA built-in) | 7 |
| Sungrow (Modbus) | 151 |
| Synology NAS | 28 |
| Template-Sensoren | 10 |

## 1komma5° (Heartbeat)

27 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.1k5_netzbezugskosten_kumuliert` | sensor | 1k5 Netzbezugskosten kumuliert | Kumulierte Netzbezugskosten (1komma5° Tarif) | 0.0 | EUR |
| `sensor.1k5_netzbezugskosten_laufend` | sensor | 1k5 Netzbezugskosten laufend | Laufende Netzbezugskosten (1komma5° Tarif) | -0.0006 | EUR/h |
| `sensor.1k5_real_kosten_monat` | sensor | 1k5 Real Kosten Monat | Reale Stromkosten aktueller Monat (1komma5°) | 0 | EUR |
| `sensor.1k5_real_kosten_tag` | sensor | 1k5 Real Kosten Tag | Reale Stromkosten heute (1komma5°) | 0 | EUR |
| `sensor.1k5_real_kosten_woche` | sensor | 1k5 Real Kosten Woche | Reale Stromkosten aktuelle Woche (1komma5°) | 0 | EUR |
| `sensor.1komma5_tagesforecast` | sensor | 1komma5 Tagesforecast | 1komma5° Heartbeat-Messwert: 1komma5 Tagesforecast | 2026-04-04 |  |
| `sensor.battery_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batteriestatus via 1komma5° Heartbeat | 0.0 | kWh |
| `sensor.battery_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batteriestatus via 1komma5° Heartbeat | 0.0450120875733533 | kWh |
| `sensor.battery_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batteriestatus via 1komma5° Heartbeat | 0 | W |
| `sensor.battery_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batteriestatus via 1komma5° Heartbeat | 1317.686 | W |
| `sensor.battery_state_of_charge_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Battery State of Charge 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Batteriestatus via 1komma5° Heartbeat | 80.0 | % |
| `sensor.consumption_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Consumption Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Gesamtverbrauch via 1komma5° Heartbeat | 1324.989 | W |
| `sensor.electricity_price_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Electricity Price 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Aktueller dynamischer Stromtarif via 1komma5° Heartbeat | 0.1652 | EUR/kWh |
| `sensor.ev_chargers_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Wallbox-Verbrauch via 1komma5° Heartbeat | 0 | W |
| `sensor.ev_chargers_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | EV Chargers Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Wallbox-Verbrauch via 1komma5° Heartbeat | 0.0 | kWh |
| `sensor.grid_feed_energy_in_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy In 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung gemessen durch 1komma5° Heartbeat | 0.000146393120273889 | kWh |
| `sensor.grid_feed_energy_out_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Energy Out 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung gemessen durch 1komma5° Heartbeat | 0.000123919922936944 | kWh |
| `sensor.grid_feed_in_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed In Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung gemessen durch 1komma5° Heartbeat | 0 | W |
| `sensor.grid_feed_out_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Out Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung gemessen durch 1komma5° Heartbeat | 7.303 | W |
| `sensor.grid_feed_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Grid Feed Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Netzeinspeisung gemessen durch 1komma5° Heartbeat | 7.303 | W |
| `sensor.heartbeat_modus` | sensor | Heartbeat Modus | 1komma5° Heartbeat-Messwert: Heartbeat Modus | entladen |  |
| `sensor.heat_pumps_aggregated_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Aggregated Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Wärmepumpen-Verbrauch via 1komma5° Heartbeat | 0 | W |
| `sensor.heat_pumps_energy_consumption_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Heat Pumps Energy Consumption 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | Wärmepumpen-Verbrauch via 1komma5° Heartbeat | 0.0 | kWh |
| `sensor.solar_energy_production_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Energy Production 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | PV-Erzeugung gemessen durch 1komma5° Heartbeat | 0.0 | kWh |
| `sensor.solar_production_power_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | sensor | Solar Production Power 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | PV-Erzeugung gemessen durch 1komma5° Heartbeat | 0 | W |
| `switch.heartbeat_automatic_mode_7fee2e61_1ff6_4eaf_8a8e_7509522abb45` | switch | Heartbeat Automatic Mode 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | 1komma5° Heartbeat-Messwert: Heartbeat Automatic Mode 7fee2e61-1ff6-4eaf-8a8e-7509522abb45 | on |  |
| `update.1komma5grad_update` | update | 1KOMMA5GRAD Update | 1komma5° Heartbeat-Messwert: 1KOMMA5GRAD Update | off |  |

## Apple

20 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `device_tracker.iphone_von_david` | device_tracker | iPhone von David | iPhone Standort-Tracking via HA Companion App | not_home |  |
| `media_player.dg` | media_player | DG | Apple TV DG Medienwiedergabe-Steuerung | idle |  |
| `media_player.eg` | media_player | HomePod-EG | Apple HomePod Medienwiedergabe-Steuerung | paused |  |
| `media_player.og` | media_player | OG | Apple TV OG Medienwiedergabe-Steuerung | idle |  |
| `remote.dg` | remote | DG | Apple TV DG Fernbedienungs-Steuerung | on |  |
| `remote.eg` | remote | HomePod-EG | Apple HomePod Fernbedienungs-Steuerung | on |  |
| `remote.lounge` | remote | Lounge | Apple TV Lounge Fernbedienungs-Steuerung | on |  |
| `remote.og` | remote | OG | Apple TV OG Fernbedienungs-Steuerung | on |  |
| `sensor.iphone_von_david_app_version` | sensor | iPhone von David App Version | iPhone-Sensor: iPhone von David App Version | 2026.2.1 |  |
| `sensor.iphone_von_david_audio_output` | sensor | iPhone von David Audio Output | iPhone-Sensor: iPhone von David Audio Output | unavailable |  |
| `sensor.iphone_von_david_battery_state` | sensor | iPhone von David Battery State | iPhone Akkustand via HA Companion App | Not Charging |  |
| `sensor.iphone_von_david_bssid` | sensor | iPhone von David BSSID | iPhone WLAN-Netzwerk via Companion App | unavailable |  |
| `sensor.iphone_von_david_connection_type` | sensor | iPhone von David Connection Type | iPhone Verbindungstyp via Companion App | unavailable |  |
| `sensor.iphone_von_david_geocoded_location` | sensor | iPhone von David Geocoded Location | iPhone geocodierter Standort via Companion App | unavailable |  |
| `sensor.iphone_von_david_last_update_trigger` | sensor | iPhone von David Last Update Trigger | Letzte Companion-App-Aktualisierung | unavailable |  |
| `sensor.iphone_von_david_location_permission` | sensor | iPhone von David Location permission | iPhone-Sensor: iPhone von David Location permission | Authorized when in use |  |
| `sensor.iphone_von_david_sim_1` | sensor | iPhone von David SIM 1 | iPhone SIM-Info via Companion App | unavailable |  |
| `sensor.iphone_von_david_sim_2` | sensor | iPhone von David SIM 2 | iPhone SIM-Info via Companion App | unavailable |  |
| `sensor.iphone_von_david_ssid` | sensor | iPhone von David SSID | iPhone WLAN-Netzwerk via Companion App | unavailable |  |
| `sensor.iphone_von_david_storage` | sensor | iPhone von David Storage | iPhone Speicherplatz via Companion App | unavailable |  |

## EMHASS

23 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.emhass_add_on_restart_nach_ha_start` | automation | EMHASS Add-on Restart nach HA-Start | EMHASS-Optimierungswert: EMHASS Add-on Restart nach HA-Start | on |  |
| `automation.emhass_day_ahead_optimierung` | automation | EMHASS Day-Ahead (täglich) | EMHASS-Optimierungswert: EMHASS Day-Ahead (täglich) | on |  |
| `automation.emhass_ml_forecaster_training_wochentlich` | automation | EMHASS ML Forecaster Training (wöchentlich) | EMHASS-Optimierungswert: EMHASS ML Forecaster Training (wöchentlich) | on |  |
| `automation.emhass_mpc_alle_5_min` | automation | EMHASS MPC (alle 5 Min) | EMHASS-Optimierungswert: EMHASS MPC (alle 5 Min) | on |  |
| `automation.emhass_theo_soc_midnight_reset` | automation | EMHASS Theo SOC Midnight Reset | EMHASS-Optimierungswert: EMHASS Theo SOC Midnight Reset | on |  |
| `automation.emhass_theo_soc_update_jede_minute` | automation | EMHASS Theo SOC Update (jede Minute) | EMHASS-Optimierungswert: EMHASS Theo SOC Update (jede Minute) | on |  |
| `input_number.emhass_theo_soc` | input_number | EMHASS Theo SOC | EMHASS-Optimierungswert: EMHASS Theo SOC | 80.8 | % |
| `sensor.emhass_modus` | sensor | EMHASS Modus | EMHASS-Optimierungswert: EMHASS Modus | entladen |  |
| `sensor.emhass_theo_kosten_kumuliert` | sensor | EMHASS Theo Kosten kumuliert | EMHASS-Optimierungswert: EMHASS Theo Kosten kumuliert | 0.0544 | EUR |
| `sensor.emhass_theo_kosten_laufend` | sensor | EMHASS Theo Kosten laufend | EMHASS-Optimierungswert: EMHASS Theo Kosten laufend | 0.0355 | EUR/h |
| `sensor.emhass_theo_kosten_monat` | sensor | EMHASS Theo Kosten Monat | EMHASS-Optimierungswert: EMHASS Theo Kosten Monat | 0.0544 | EUR |
| `sensor.emhass_theo_kosten_tag` | sensor | EMHASS Theo Kosten Tag | EMHASS-Optimierungswert: EMHASS Theo Kosten Tag | 0.0544 | EUR |
| `sensor.emhass_theo_kosten_woche` | sensor | EMHASS Theo Kosten Woche | EMHASS-Optimierungswert: EMHASS Theo Kosten Woche | 0.0544 | EUR |
| `sensor.emhass_theo_soc_2` | sensor | EMHASS Theo SOC | EMHASS-Optimierungswert: EMHASS Theo SOC | unavailable | % |
| `sensor.optim_status` | sensor | EMHASS optimization status | EMHASS Optimierungsstatus (Optimal/Infeasible) | Optimal |  |
| `sensor.p_batt_forecast` | sensor | Battery Power Forecast | EMHASS optimale Batterie-Lade/Entladeleistung | 1110.00 | W |
| `sensor.p_grid_forecast` | sensor | Grid Power Forecast | EMHASS prognostizierter Netzaustausch in Watt | 0.00 | W |
| `sensor.p_load_forecast` | sensor | Load Power Forecast | EMHASS Verbrauchsprognose des Haushalts in Watt | 1110.00 | W |
| `sensor.p_pv_forecast` | sensor | PV Power Forecast | EMHASS PV-Erzeugungsprognose in Watt | 0.00 | W |
| `sensor.soc_batt_forecast` | sensor | Battery SOC Forecast | EMHASS prognostizierter Batterie-Ladestand in % | 77.34 | % |
| `sensor.total_cost_fun_value` | sensor | Total cost function value | EMHASS prognostizierte Gesamtkosten/-erlöse | 0.00 | € |
| `sensor.unit_load_cost` | sensor | Unit Load Cost | EMHASS Stromkosten pro kWh (Netzbezug) | 0.1653 | €/kWh |
| `update.emhass_update` | update | EMHASS Update | EMHASS-Optimierungswert: EMHASS Update | off |  |

## ENTSO-e

12 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.average_electricity_price` | sensor | entso-e Average electricity price | Durchschnittlicher ENTSO-e Strompreis heute | 0.00996 | €/kWh |
| `sensor.current_electricity_market_price` | sensor | entso-e Current electricity market price | ENTSO-e Day-Ahead Börsenstrompreis aktuelle Stunde | 0.04978 | €/kWh |
| `sensor.current_percentage_in_electricity_price_range` | sensor | entso-e Current percentage in electricity price range | Relativer ENTSO-e Preis im Tagesbereich (%) | 57.6 | % |
| `sensor.current_percentage_of_highest_electricity_price` | sensor | entso-e Current percentage of highest electricity price | Höchster ENTSO-e Strompreis heute | 27.9 | % |
| `sensor.entso_e_tagespreise` | sensor | ENTSO-e Tagespreise | ENTSO-e Strommarkt: ENTSO-e Tagespreise | 2026-04-04 |  |
| `sensor.highest_energy_price` | sensor | entso-e Highest energy price | ENTSO-e Strommarkt: entso-e Highest energy price | 0.17835 | €/kWh |
| `sensor.lowest_energy_price` | sensor | entso-e Lowest energy price | ENTSO-e Strommarkt: entso-e Lowest energy price | -0.12515 | €/kWh |
| `sensor.next_hour_electricity_market_price` | sensor | entso-e Next hour electricity market price | ENTSO-e Strommarkt: entso-e Next hour electricity market price | 0.00126 | €/kWh |
| `sensor.time_of_highest_price` | sensor | entso-e Time of highest price | Uhrzeit des höchsten ENTSO-e Strompreises heute | 2026-04-04T17:00:00+00:00 |  |
| `sensor.time_of_lowest_price` | sensor | entso-e Time of lowest price | Uhrzeit des niedrigsten ENTSO-e Strompreises heute | 2026-04-05T11:00:00+00:00 |  |
| `sensor.unit_prod_price` | sensor | Unit Prod Price | ENTSO-e Einspeisevergütung/Produktionspreis | 0.0820 | €/kWh |
| `update.entso_e_transparency_platform_update` | update | ENTSO-e Transparency Platform Update | ENTSO-e Strommarkt: ENTSO-e Transparency Platform Update | off |  |

## Energiemanagement (HA Energy)

1 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.total_direct_energy_consumption` | sensor | Total direct energy consumption | HA Energy Dashboard: Total direct energy consumption | 1558.9 | kWh |

## HACS

2 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `update.get_hacs_update` | update | Get HACS Update | HACS Community Store — ausstehende Updates | off |  |
| `update.hacs_update` | update | HACS Update | HACS Community Store — ausstehende Updates | off |  |

## HP Drucker

5 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.hp_officejet_pro_8600` | sensor | sensor.hp_officejet_pro_8600 | HP Drucker: sensor.hp_officejet_pro_8600 | unavailable |  |
| `sensor.hp_officejet_pro_8600_black_ink` | sensor | black ink | HP Drucker Tintenstand Schwarz | unavailable | % |
| `sensor.hp_officejet_pro_8600_cyan_ink` | sensor | cyan ink | HP Drucker Tintenstand Cyan | unavailable | % |
| `sensor.hp_officejet_pro_8600_magenta_ink` | sensor | magenta ink | HP Drucker Tintenstand Magenta | unavailable | % |
| `sensor.hp_officejet_pro_8600_yellow_ink` | sensor | yellow ink | HP Drucker Tintenstand Gelb | unavailable | % |

## Home Assistant (System)

37 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.jalousien_abends_schliessen` | automation | Jalousien abends schließen | Home Assistant Automatisierung | on |  |
| `automation.wp_strom_tarif_nach_betriebsmodus` | automation | WP Strom-Tarif nach Betriebsmodus | Home Assistant Automatisierung | on |  |
| `conversation.home_assistant` | conversation | Home Assistant | Home Assistant Sprachassistent-Entity | 2026-03-08T20:43:20.952038+00:00 |  |
| `event.backup_automatic_backup` | event | Backup Automatisches Backup | Home Assistant Backup-Status | 2026-04-04T03:25:49.925+00:00 |  |
| `input_number.einspeiseverguetung` | input_number | Einspeisevergütung | Numerischer Eingabewert (Helfer) | 0.082 | EUR/kWh |
| `input_select.dashboard_zeitraum` | input_select | Dashboard Zeitraum | Dropdown-Auswahl (Helfer) | Heute |  |
| `number.battery_reserved_soc_for_backup` | number | Battery Reserved SoC for Backup | Home Assistant Backup-Status | 0.0 | % |
| `person.david` | person | David | Personen-Tracking für Anwesenheitserkennung | not_home |  |
| `scene.battery_bypass_mode` | scene | Battery Bypass Mode | Home Assistant Szene (vordefinierter Zustand) | unknown |  |
| `scene.battery_forced_discharge` | scene | Battery Forced Discharge | Home Assistant Szene (vordefinierter Zustand) | unknown |  |
| `script.batterie_zwangsladen` | script | Batterie Zwangsladen | Home Assistant Skript (Aktionssequenz) | off |  |
| `sensor.backup_backup_manager_state` | sensor | Backup Backup-Manager-Zustand | Home Assistant Backup-Status | idle |  |
| `sensor.backup_last_attempted_automatic_backup` | sensor | Backup Letztes versuchtes automatisches Backup | Home Assistant Backup-Status | 2026-04-04T03:25:31+00:00 |  |
| `sensor.backup_last_successful_automatic_backup` | sensor | Backup Letztes erfolgreiches automatisches Backup | Home Assistant Backup-Status | 2026-04-04T03:25:49+00:00 |  |
| `sensor.backup_mode_raw` | sensor | Backup mode raw | Home Assistant Backup-Status | 85 |  |
| `sensor.backup_next_scheduled_automatic_backup` | sensor | Backup Nächstes geplantes automatisches Backup | Home Assistant Backup-Status | 2026-04-05T03:16:06+00:00 |  |
| `sensor.battery_reserved_soc_for_backup` | sensor | Battery reserved SoC for backup | Home Assistant Backup-Status | 0 | % |
| `sensor.total_backup_power` | sensor | Total backup power | Home Assistant Backup-Status | 0 | W |
| `switch.backup_mode` | switch | Backup Mode | Home Assistant Backup-Status | off |  |
| `todo.einkaufsliste` | todo | Einkaufsliste | Home Assistant Aufgabenliste | 0 |  |
| `tts.google_translate_en_com` | tts | Google Übersetzer en com Google Translate en com | Text-to-Speech Sprachausgabe-Dienst | unknown |  |
| `update.apexcharts_card_update` | update | apexcharts-card Update | ApexCharts Card (HACS) Update-Status | off |  |
| `update.cloudflared_update` | update | Cloudflared Update | Cloudflared Add-on Update-Status | off |  |
| `update.file_editor_update` | update | File editor Update | File Editor Add-on Update-Status | off |  |
| `update.grafana_update` | update | Grafana Update | Grafana Add-on Update-Status | off |  |
| `update.home_assistant_core_update` | update | Home Assistant Core Update | HA Core Update-Status | off |  |
| `update.home_assistant_operating_system_update` | update | Home Assistant Operating System Update | HA OS Update-Status | off |  |
| `update.home_assistant_supervisor_update` | update | Home Assistant Supervisor Update | HA Supervisor Update-Status | off |  |
| `update.influxdb_update` | update | InfluxDB Update | InfluxDB Add-on Update-Status | off |  |
| `update.matter_server_update` | update | Matter Server Update | Matter Server Add-on Update-Status | off |  |
| `update.mini_graph_card_update` | update | mini-graph-card Update | Mini Graph Card (HACS) Update-Status | off |  |
| `update.mosquitto_broker_update` | update | Mosquitto broker Update | HA OS Update-Status | off |  |
| `update.mushroom_update` | update | Mushroom Update | Mushroom Cards (HACS) Update-Status | off |  |
| `update.plotly_graph_card_update` | update | Plotly Graph Card Update | Plotly Graph Card (HACS) Update-Status | off |  |
| `update.power_flow_card_plus_update` | update | Power Flow Card Plus Update | Power Flow Card Plus (HACS) Update-Status | off |  |
| `update.terminal_ssh_update` | update | Terminal & SSH Update | Terminal & SSH Add-on Update-Status | off |  |
| `zone.home` | zone | Home | Definierte Zone für Standort-Automatisierungen | 0 |  |

## LICV Wärmepumpe (Luxtronik)

235 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.licv_8_2r1_3_alarm` | binary_sensor | LICV 8.2R1/3 Alarm | WP-Betriebsstatus: LICV 8.2R1/3 Alarm | off |  |
| `binary_sensor.licv_8_2r1_3_asd` | binary_sensor | LICV 8.2R1/3 ASD | Abtauende / Durchfluss OK — Abtauzyklus beendet | on |  |
| `binary_sensor.licv_8_2r1_3_bup_dhw_pump` | binary_sensor | LICV 8.2R1/3 BUP - DHW pump | Brauchwasser-Umwälzpumpe (BUP) aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_el_heater` | binary_sensor | LICV 8.2R1/3 el. heater | WP-Betriebsstatus: LICV 8.2R1/3 el. heater | off |  |
| `binary_sensor.licv_8_2r1_3_evu` | binary_sensor | LICV 8.2R1/3 EVU | EVU-Sperre — Energieversorger-Abschaltung der WP | on |  |
| `binary_sensor.licv_8_2r1_3_evu_2` | binary_sensor | LICV 8.2R1/3 EVU 2 | EVU-Sperre — Energieversorger-Abschaltung der WP | off |  |
| `binary_sensor.licv_8_2r1_3_hd` | binary_sensor | LICV 8.2R1/3 HD | WP-Betriebsstatus: LICV 8.2R1/3 HD | off |  |
| `binary_sensor.licv_8_2r1_3_hup` | binary_sensor | LICV 8.2R1/3 HUP | Heizungs-Umwälzpumpe (HUP) — Heizkreislauf aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_konnektivitat` | binary_sensor | LICV 8.2R1/3 Konnektivität | WP-Betriebsstatus: LICV 8.2R1/3 Konnektivität | on |  |
| `binary_sensor.licv_8_2r1_3_mot` | binary_sensor | LICV 8.2R1/3 MOT | Motorventil (Mischventil) im Heizkreis aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_vbo` | binary_sensor | LICV 8.2R1/3 VBO | Sole-/Wärmequellenpumpe (VBO) aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_vd1` | binary_sensor | LICV 8.2R1/3 VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | on |  |
| `binary_sensor.licv_8_2r1_3_zip` | binary_sensor | LICV 8.2R1/3 ZIP | Warmwasser-Zirkulationspumpe (ZIP) aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_zup` | binary_sensor | LICV 8.2R1/3 ZUP | Zusatz-Umwälzpumpe (ZUP) aktiv | on |  |
| `binary_sensor.licv_8_2r1_3_zwe_1` | binary_sensor | LICV 8.2R1/3 ZWE 1 | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | off |  |
| `binary_sensor.licv_8_2r1_3_zwe_2_sst` | binary_sensor | LICV 8.2R1/3 ZWE 2 - SST | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | off |  |
| `binary_sensor.luxtronik_341205_065_additional_circulation_pump` | binary_sensor | Heizkreis Zusatzumwälzpumpe | Zusatz-Umwälzpumpe (ZUP) aktiv | on |  |
| `binary_sensor.luxtronik_341205_065_circulation_pump_heating` | binary_sensor | Heizkreis Umwälzpumpe | Heizungs-Umwälzpumpe (HUP) — Heizkreislauf aktiv | on |  |
| `binary_sensor.luxtronik_341205_065_compressor` | binary_sensor | Wärmepumpe Verdichter | Verdichter 1 (Kompressor) der Wärmepumpe läuft | on |  |
| `binary_sensor.luxtronik_341205_065_compressor2` | binary_sensor | Wärmepumpe Verdichter 2 | Verdichter 2 der Wärmepumpe läuft | off |  |
| `binary_sensor.luxtronik_341205_065_compressor_heater` | binary_sensor | Wärmepumpe Verdichterheizung | Verdichterheizung der Wärmepumpe aktiv | off |  |
| `binary_sensor.luxtronik_341205_065_defrost_end_flow_okay` | binary_sensor | Wärmepumpe Abtauung wird beendet / Durchfluss in Ordnung | Abtauende / Durchfluss OK — Abtauzyklus beendet | on |  |
| `binary_sensor.luxtronik_341205_065_dhw_circulation_pump` | binary_sensor | Warmwasser Zirkulationspumpe | Warmwasser-Zirkulationspumpe (ZIP) aktiv | off |  |
| `binary_sensor.luxtronik_341205_065_dhw_recirculation_pump` | binary_sensor | Warmwasser Umwälzpumpe | Brauchwasser-Umwälzpumpe (BUP) aktiv | off |  |
| `binary_sensor.luxtronik_341205_065_disturbance_output` | binary_sensor | Wärmepumpe Systemzustand | Störungsausgang der Wärmepumpe (Systemzustand) | off |  |
| `binary_sensor.luxtronik_341205_065_evu2` | binary_sensor | Wärmepumpe EVU2 | EVU-Sperre 2 — Energieversorger-Signal | off |  |
| `binary_sensor.luxtronik_341205_065_evu_unlocked` | binary_sensor | Wärmepumpe Sperrzeit Freigabe | EVU-Sperre aufgehoben — WP freigegeben | on |  |
| `binary_sensor.luxtronik_341205_065_pump_flow` | binary_sensor | Wärmepumpe Soleumwälzpumpe | Sole-/Wärmequellenpumpe (VBO) aktiv | on |  |
| `binary_sensor.luxtronik_341205_065_solar_pump` | binary_sensor | Warmwasser Solar Pumpe | Solar-Pumpe der Wärmepumpe aktiv | off |  |
| `climate.luxtronik_341205_065_heating` | climate | Heizkreis Heizung | Klimaregelung Heizkreis der LICV Wärmepumpe | heat |  |
| `date.luxtronik_341205_065_away_dhw_enddate` | date | Warmwasser Abwesenheitsmodus Warmwasser Enddatum | Enddatum Abwesenheitsmodus Warmwasser | 2024-12-11T17:27:04 |  |
| `date.luxtronik_341205_065_away_dhw_startdate` | date | Warmwasser Abwesenheitsmodus Warmwasser Startdatum | Startdatum Abwesenheitsmodus Warmwasser | 2024-12-11T17:27:04 |  |
| `date.luxtronik_341205_065_away_heating_enddate` | date | Heizkreis Abwesenheitsmodus Heizung Enddatum | Enddatum Abwesenheitsmodus Heizung | 2024-12-11T17:27:04 |  |
| `date.luxtronik_341205_065_away_heating_startdate` | date | Heizkreis Abwesenheitsmodus Heizung Startdatum | Startdatum Abwesenheitsmodus Heizung | 2024-12-11T17:27:04 |  |
| `number.licv_8_2r1_3_desired_value` | number | LICV 8.2R1/3 desired value | WP-Einstellwert: LICV 8.2R1/3 desired value | 48.0 |  |
| `number.licv_8_2r1_3_heating_limit` | number | LICV 8.2R1/3 heating limit | WP-Einstellwert: LICV 8.2R1/3 heating limit | 20.0 |  |
| `number.licv_8_2r1_3_offset_heizen` | number | LICV 8.2R1/3 Offset Heizen | WP-Einstellwert: LICV 8.2R1/3 Offset Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_mk1_heizen` | number | LICV 8.2R1/3 Offset MK1 Heizen | WP-Einstellwert: LICV 8.2R1/3 Offset MK1 Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen` | number | LICV 8.2R1/3 Offset Overall Heizen | WP-Einstellwert: LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_overall_heizen_2` | number | LICV 8.2R1/3 Offset Overall Heizen | WP-Einstellwert: LICV 8.2R1/3 Offset Overall Heizen | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw` | number | LICV 8.2R1/3 Offset Warmw. | WP-Einstellwert: LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_offset_warmw_2` | number | LICV 8.2R1/3 Offset Warmw. | WP-Einstellwert: LICV 8.2R1/3 Offset Warmw. | 0.0 |  |
| `number.licv_8_2r1_3_sollwert_heizen` | number | LICV 8.2R1/3 Sollwert Heizen | WP-Einstellwert: LICV 8.2R1/3 Sollwert Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_mk1_heizen` | number | LICV 8.2R1/3 Sollwert MK1 Heizen | WP-Einstellwert: LICV 8.2R1/3 Sollwert MK1 Heizen | 35.0 |  |
| `number.licv_8_2r1_3_sollwert_warmw` | number | LICV 8.2R1/3 Sollwert Warmw. | WP-Einstellwert: LICV 8.2R1/3 Sollwert Warmw. | 46.0 |  |
| `number.licv_8_2r1_3_targ_value` | number | LICV 8.2R1/3 targ.value | WP-Einstellwert: LICV 8.2R1/3 targ.value | 55.0 |  |
| `number.licv_8_2r1_3_temperature` | number | LICV 8.2R1/3 temperature + - | WP-Einstellwert: LICV 8.2R1/3 temperature + - | 0.0 |  |
| `number.luxtronik_341205_065_dhw_hysteresis` | number | Warmwasser Hysterese | Hysterese-Einstellung Warmwasser (Ein-/Ausschaltdiff.) | 2.0 | K |
| `number.luxtronik_341205_065_dhw_target_temperature` | number | Warmwasser Soll | Soll-Temperatur Warmwasserspeicher | 48.0 | °C |
| `number.luxtronik_341205_065_dhw_thermal_desinfection_target` | number | Warmwasser Thermische Desinfektion Soll Temperatur | Soll-Temperatur thermische Desinfektion Warmwasser | 65.0 | °C |
| `number.luxtronik_341205_065_electrical_power_limitation_value` | number | Wärmepumpe Leistungslimit | Elektrisches Leistungslimit der Wärmepumpe | 4.2 | kW |
| `number.luxtronik_341205_065_heating_curve_circuit1_end_temperature` | number | Heizkreis MK1 Heizkurve Endpunkt | Heizkurve MK1: Endpunkt bei -20°C Außentemp. | 32.0 | °C |
| `number.luxtronik_341205_065_heating_curve_circuit1_night_temperature` | number | Heizkreis MK1 Heizkurve Nachtabsenkung | Heizkurve MK1: Nachtabsenkung in °C | 0.0 | °C |
| `number.luxtronik_341205_065_heating_curve_circuit1_parallel_shift_temperature` | number | Heizkreis MK1 Heizkurve Parallelverschiebung | Heizkurve MK1: Parallelverschiebung | 20.0 | °C |
| `number.luxtronik_341205_065_heating_curve_circuit2_end_temperature` | number | Heizkreis MK2 Heizkurve Endpunkt | Heizkurve MK2: Endpunkt bei -20°C Außentemp. | 35.0 | °C |
| `number.luxtronik_341205_065_heating_curve_circuit2_night_temperature` | number | Heizkreis MK2 Heizkurve Nachtabsenkung | Heizkurve MK2: Nachtabsenkung in °C | 0.0 | °C |
| `number.luxtronik_341205_065_heating_curve_circuit2_parallel_shift_temperature` | number | Heizkreis MK2 Heizkurve Parallelverschiebung | Heizkurve MK2: Parallelverschiebung | 20.0 | °C |
| `number.luxtronik_341205_065_heating_curve_end_temperature` | number | Heizkreis Heizkurve Endpunkt | Heizkurve: Endpunkt bei -20°C Außentemperatur | 32.0 | °C |
| `number.luxtronik_341205_065_heating_curve_night_temperature` | number | Heizkreis Heizkurve Nachtabsenkung | Heizkurve: Nachtabsenkung in °C | 0.0 | °C |
| `number.luxtronik_341205_065_heating_curve_parallel_shift_temperature` | number | Heizkreis Heizkurve Parallelverschiebung | Heizkurve: Parallelverschiebung | 20.0 | °C |
| `number.luxtronik_341205_065_heating_hysteresis` | number | Heizkreis Hysterese Heizungsregler | Hysterese Heizungsregler (Ein-/Ausschaltdifferenz) | 2.0 | K |
| `number.luxtronik_341205_065_heating_max_flow_out_increase_temperature` | number | Heizkreis Max. Soll Rücklauferhöhung | Max. Soll-Rücklauferhöhung Heizkreis | 7.0 | K |
| `number.luxtronik_341205_065_heating_min_flow_out_temperature` | number | Heizkreis Min. Soll Rücklauf | Rücklauftemperatur Heizkreis | 15.0 | °C |
| `number.luxtronik_341205_065_heating_night_lowering_to_temperature` | number | Heizkreis Absenkung bis Aussentemperatur | Nachtabsenkung bis Außentemperatur (Grenze) | -20.0 | °C |
| `number.luxtronik_341205_065_heating_target_correction` | number | Heizkreis Ziel Korrektur | Zieltemperatur-Korrektur Heizkreis | 0.0 | °C |
| `number.luxtronik_341205_065_heating_threshold_temperature` | number | Heizkreis Heizgrenze | Heizgrenztemperatur — ab hier wird nicht geheizt | 20.0 | °C |
| `number.luxtronik_341205_065_pump_optimization_time` | number | Heizkreis Pumpenoptimierung | Pumpenoptimierungszeit (Pumpe nach Bedarf abschalten) | 180.0 | min |
| `number.luxtronik_341205_065_solar_pump_max_temperature_collector` | number | Warmwasser Max. Temperatur Solar Kollektor | Max. Temperatur Solar-Kollektor (Einstellung) | 110.0 | °C |
| `number.luxtronik_341205_065_solar_pump_off_difference_temperature` | number | Warmwasser Ausschalt Differenz Kollektor/Speicher (Solar Pumpe) | Ausschalt-Differenz Solar-Pumpe Kollektor/Speicher | 2.0 | K |
| `number.luxtronik_341205_065_solar_pump_off_max_difference_temperature_boiler` | number | Warmwasser Ausschalt max. Differenz Kollektor/Speicher (Solar Pumpe) | Max. Ausschalt-Differenz Solar-Pumpe | 70.0 | °C |
| `number.luxtronik_341205_065_solar_pump_on_difference_temperature` | number | Warmwasser Einschalt Differenz Kollektor/Speicher (Solar Pumpe) | Einschalt-Differenz Solar-Pumpe Kollektor/Speicher | 4.0 | K |
| `number.luxtronik_341205_065_thermal_power_limitation_cooling` | number | Wärmepumpe Therm. Leistung max: Kühlung | Max. thermische Leistung: Kühlung | 0.0 | kW |
| `number.luxtronik_341205_065_thermal_power_limitation_heating` | number | Wärmepumpe Therm. Leistung max: Heizung | Max. thermische Leistung: Heizung | 0.0 | kW |
| `number.luxtronik_341205_065_thermal_power_limitation_water` | number | Wärmepumpe Therm. Leistung max: Warmwasser | Max. thermische Leistung: Warmwasser | 0.0 | kW |
| `select.licv_8_2r1_3_lpc_mode` | select | LICV 8.2R1/3 LPC mode | WP-Auswahlparameter: LICV 8.2R1/3 LPC mode | No limit |  |
| `select.licv_8_2r1_3_mode_of_operation` | select | LICV 8.2R1/3 mode of operation | WP-Auswahlparameter: LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_2` | select | LICV 8.2R1/3 mode of operation | WP-Auswahlparameter: LICV 8.2R1/3 mode of operation | Automatic |  |
| `select.licv_8_2r1_3_mode_of_operation_3` | select | LICV 8.2R1/3 mode of operation | WP-Auswahlparameter: LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_4` | select | LICV 8.2R1/3 mode of operation | WP-Auswahlparameter: LICV 8.2R1/3 mode of operation | Heat |  |
| `select.licv_8_2r1_3_mode_of_operation_5` | select | LICV 8.2R1/3 mode of operation | WP-Auswahlparameter: LICV 8.2R1/3 mode of operation | Off |  |
| `select.licv_8_2r1_3_modus_heizen` | select | LICV 8.2R1/3 Modus Heizen | WP-Auswahlparameter: LICV 8.2R1/3 Modus Heizen | Off |  |
| `select.licv_8_2r1_3_modus_mk1_heizen` | select | LICV 8.2R1/3 Modus MK1 Heizen | WP-Auswahlparameter: LICV 8.2R1/3 Modus MK1 Heizen | Off |  |
| `select.licv_8_2r1_3_modus_overall_heizen` | select | LICV 8.2R1/3 Modus Overall Heizen | WP-Auswahlparameter: LICV 8.2R1/3 Modus Overall Heizen | Individual |  |
| `select.licv_8_2r1_3_modus_warmw` | select | LICV 8.2R1/3 Modus Warmw. | WP-Auswahlparameter: LICV 8.2R1/3 Modus Warmw. | Off |  |
| `select.licv_8_2r1_3_power_control_mode` | select | LICV 8.2R1/3 Power control mode | WP-Auswahlparameter: LICV 8.2R1/3 Power control mode | Individually |  |
| `select.licv_8_2r1_3_smart_mode` | select | LICV 8.2R1/3 Smart mode | WP-Auswahlparameter: LICV 8.2R1/3 Smart mode | Default |  |
| `select.luxtronik_341205_065_dhw_mode` | select | Warmwasser DHW mode | Betriebsmodus Warmwasser (Aus/Auto/Party/Urlaub) | Automatic |  |
| `select.luxtronik_341205_065_heating_mode` | select | Heizkreis Heating mode | Betriebsmodus Heizung (Aus/Auto/Absenkung) | Automatic |  |
| `select.luxtronik_341205_065_thermal_desinfection_day` | select | Warmwasser Tag der thermischen Desinfektion | WP-Auswahlparameter: Warmwasser Tag der thermischen Desinfektion | None |  |
| `select.wp_strom_modus_gesamt` | select | WP Strom nach Modus gesamt | Auswahl: WP-Stromanzeige nach Modus (Gesamtansicht) | heizen |  |
| `select.wp_strom_modus_monatlich` | select | WP Strom nach Modus monatlich | Auswahl: WP-Stromanzeige nach Modus (Monatsansicht) | heizen |  |
| `sensor.licv_8_2r1_3_ao_1` | sensor | LICV 8.2R1/3 AO 1 | WP-Messwert: LICV 8.2R1/3 AO 1 | 10.0 | V |
| `sensor.licv_8_2r1_3_ao_2` | sensor | LICV 8.2R1/3 AO 2 | WP-Messwert: LICV 8.2R1/3 AO 2 | 10.0 | V |
| `sensor.licv_8_2r1_3_cooling_enabled` | sensor | LICV 8.2R1/3 Cooling enabled | WP-Messwert: LICV 8.2R1/3 Cooling enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_coverage_hp` | sensor | LICV 8.2R1/3 coverage HP | WP-Messwert: LICV 8.2R1/3 coverage HP | 42.2 | °C |
| `sensor.licv_8_2r1_3_dhw` | sensor | LICV 8.2R1/3 DHW | WP-Messwert: LICV 8.2R1/3 DHW | 45.9 | °C |
| `sensor.licv_8_2r1_3_dhw_2` | sensor | LICV 8.2R1/3 DHW | WP-Messwert: LICV 8.2R1/3 DHW | 45.9 | °C |
| `sensor.licv_8_2r1_3_dhw_demand_border` | sensor | LICV 8.2R1/3 DHW Demand border | WP-Messwert: LICV 8.2R1/3 DHW Demand border | 402.0 |  |
| `sensor.licv_8_2r1_3_dhw_target` | sensor | LICV 8.2R1/3 DHW target | WP-Messwert: LICV 8.2R1/3 DHW target | 42.2 | °C |
| `sensor.licv_8_2r1_3_dhw_temp_max` | sensor | LICV 8.2R1/3 DHW temp. max. | WP-Messwert: LICV 8.2R1/3 DHW temp. max. | 65.0 | °C |
| `sensor.licv_8_2r1_3_domestic_hot_water` | sensor | LICV 8.2R1/3 domestic hot water | WP-Messwert: LICV 8.2R1/3 domestic hot water | 570.7 | kWh |
| `sensor.licv_8_2r1_3_domestic_hot_water_2` | sensor | LICV 8.2R1/3 domestic hot water | WP-Messwert: LICV 8.2R1/3 domestic hot water | 1742.2 | kWh |
| `sensor.licv_8_2r1_3_duration_extra_dhw` | sensor | LICV 8.2R1/3 duration extra DHW | WP-Messwert: LICV 8.2R1/3 duration extra DHW | 7200.0 |  |
| `sensor.licv_8_2r1_3_error` | sensor | LICV 8.2R1/3 error | WP-Messwert: LICV 8.2R1/3 error | 51.0 |  |
| `sensor.licv_8_2r1_3_error_number` | sensor | LICV 8.2R1/3 error number | WP-Messwert: LICV 8.2R1/3 error number | 0.0 |  |
| `sensor.licv_8_2r1_3_flow` | sensor | LICV 8.2R1/3 flow | WP-Messwert: LICV 8.2R1/3 flow | 30.3 | °C |
| `sensor.licv_8_2r1_3_flow_rate` | sensor | LICV 8.2R1/3 flow rate | WP-Messwert: LICV 8.2R1/3 flow rate | 1035.0 | l/h |
| `sensor.licv_8_2r1_3_hd` | sensor | LICV 8.2R1/3 HD | WP-Messwert: LICV 8.2R1/3 HD | 17.63 | bar |
| `sensor.licv_8_2r1_3_heat_generator_status` | sensor | LICV 8.2R1/3 Heat generator status | Aktueller Betriebsstatus der Wärmepumpe | 1.0 |  |
| `sensor.licv_8_2r1_3_heat_source_inlet` | sensor | LICV 8.2R1/3 heat source inlet | WP-Messwert: LICV 8.2R1/3 heat source inlet | 8.1 | °C |
| `sensor.licv_8_2r1_3_heating` | sensor | LICV 8.2R1/3 heating | WP-Messwert: LICV 8.2R1/3 heating | 7283.5 | kWh |
| `sensor.licv_8_2r1_3_heating_2` | sensor | LICV 8.2R1/3 heating | WP-Messwert: LICV 8.2R1/3 heating | 19149.9 | kWh |
| `sensor.licv_8_2r1_3_heating_capacity` | sensor | LICV 8.2R1/3 Heating capacity | WP-Messwert: LICV 8.2R1/3 Heating capacity | 6.05 | kW |
| `sensor.licv_8_2r1_3_heating_demand_border` | sensor | LICV 8.2R1/3 Heating demand border | WP-Messwert: LICV 8.2R1/3 Heating demand border | 258.0 |  |
| `sensor.licv_8_2r1_3_impulse_vd1` | sensor | LICV 8.2R1/3 impulse VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | 1208.0 |  |
| `sensor.licv_8_2r1_3_integration` | sensor | LICV 8.2R1/3 integration | WP-Messwert: LICV 8.2R1/3 integration | 1.0 |  |
| `sensor.licv_8_2r1_3_level_heizen` | sensor | LICV 8.2R1/3 Level Heizen | WP-Messwert: LICV 8.2R1/3 Level Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_mk1_heizen` | sensor | LICV 8.2R1/3 Level MK1 Heizen | WP-Messwert: LICV 8.2R1/3 Level MK1 Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_overall_heizen` | sensor | LICV 8.2R1/3 Level Overall Heizen | WP-Messwert: LICV 8.2R1/3 Level Overall Heizen | 0.0 |  |
| `sensor.licv_8_2r1_3_level_warmw` | sensor | LICV 8.2R1/3 Level Warmw. | WP-Messwert: LICV 8.2R1/3 Level Warmw. | 0.0 |  |
| `sensor.licv_8_2r1_3_max_flow_temp` | sensor | LICV 8.2R1/3 max. flow temp. | WP-Messwert: LICV 8.2R1/3 max. flow temp. | 60.0 | °C |
| `sensor.licv_8_2r1_3_maximaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Maximaler Vorlauf MK 1 | WP-Messwert: LICV 8.2R1/3 Maximaler Vorlauf MK 1 | 45.0 | °C |
| `sensor.licv_8_2r1_3_min_return_targ_temp` | sensor | LICV 8.2R1/3 min return targ.temp | WP-Messwert: LICV 8.2R1/3 min return targ.temp | 15.0 | °C |
| `sensor.licv_8_2r1_3_minimaler_vorlauf_mk_1` | sensor | LICV 8.2R1/3 Minimaler Vorlauf MK 1 | WP-Messwert: LICV 8.2R1/3 Minimaler Vorlauf MK 1 | 20.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_flow` | sensor | LICV 8.2R1/3 mix circ1 flow | WP-Messwert: LICV 8.2R1/3 mix circ1 flow | 75.0 | °C |
| `sensor.licv_8_2r1_3_mix_circ1_target` | sensor | LICV 8.2R1/3 mix circ1 target | WP-Messwert: LICV 8.2R1/3 mix circ1 target | 25.8 | °C |
| `sensor.licv_8_2r1_3_nd` | sensor | LICV 8.2R1/3 ND | WP-Messwert: LICV 8.2R1/3 ND | 7.12 | bar |
| `sensor.licv_8_2r1_3_operat_hours_heat` | sensor | LICV 8.2R1/3 operat. hours heat. | WP-Messwert: LICV 8.2R1/3 operat. hours heat. | 3330.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_dhw` | sensor | LICV 8.2R1/3 operating hours DHW | WP-Messwert: LICV 8.2R1/3 operating hours DHW | 343.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_hp` | sensor | LICV 8.2R1/3 operating hours HP | WP-Messwert: LICV 8.2R1/3 operating hours HP | 3675.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_vd1` | sensor | LICV 8.2R1/3 operating hours VD1 | Verdichter 1 (Kompressor) der Wärmepumpe läuft | 3675.0 | h |
| `sensor.licv_8_2r1_3_operating_hours_zwe1` | sensor | LICV 8.2R1/3 operating hours ZWE1 | Zusätzlicher Wärmeerzeuger (Heizstab) aktiv | 696.0 | h |
| `sensor.licv_8_2r1_3_operation_mode` | sensor | LICV 8.2R1/3 operation mode | WP-Messwert: LICV 8.2R1/3 operation mode | 0.0 |  |
| `sensor.licv_8_2r1_3_outdoor_temp` | sensor | LICV 8.2R1/3 outdoor temp. | WP-Messwert: LICV 8.2R1/3 outdoor temp. | 7.2 | °C |
| `sensor.licv_8_2r1_3_outdoor_temp_o` | sensor | LICV 8.2R1/3 outdoor temp. ø | WP-Messwert: LICV 8.2R1/3 outdoor temp. ø | 12.1 | °C |
| `sensor.licv_8_2r1_3_pc_limit` | sensor | LICV 8.2R1/3 PC limit | WP-Messwert: LICV 8.2R1/3 PC limit | 30.0 | kW |
| `sensor.licv_8_2r1_3_pool_enabled` | sensor | LICV 8.2R1/3 Pool enabled | WP-Messwert: LICV 8.2R1/3 Pool enabled | 0.0 |  |
| `sensor.licv_8_2r1_3_power_consumption` | sensor | LICV 8.2R1/3 Power Consumption | WP-Messwert: LICV 8.2R1/3 Power Consumption | 0.96 | kW |
| `sensor.licv_8_2r1_3_power_consumption_min` | sensor | LICV 8.2R1/3 Power consumption min | WP-Messwert: LICV 8.2R1/3 Power consumption min | 7.0 |  |
| `sensor.licv_8_2r1_3_return` | sensor | LICV 8.2R1/3 return | WP-Messwert: LICV 8.2R1/3 return | 25.9 | °C |
| `sensor.licv_8_2r1_3_return_target` | sensor | LICV 8.2R1/3 return target | WP-Messwert: LICV 8.2R1/3 return target | 25.8 | °C |
| `sensor.licv_8_2r1_3_return_temp_limit` | sensor | LICV 8.2R1/3 return temp. limit. | WP-Messwert: LICV 8.2R1/3 return temp. limit. | 50.0 | °C |
| `sensor.licv_8_2r1_3_status_dhw` | sensor | LICV 8.2R1/3 Status DHW | Aktueller Betriebsstatus der Wärmepumpe | 1.0 |  |
| `sensor.licv_8_2r1_3_status_heating` | sensor | LICV 8.2R1/3 Status Heating | Aktueller Betriebsstatus der Wärmepumpe | 3.0 |  |
| `sensor.licv_8_2r1_3_total` | sensor | LICV 8.2R1/3 total | WP-Messwert: LICV 8.2R1/3 total | 7854.1 | kWh |
| `sensor.licv_8_2r1_3_total_heat_quant_hs` | sensor | LICV 8.2R1/3 total heat quant. HS | WP-Messwert: LICV 8.2R1/3 total heat quant. HS | 20892.1 | kWh |
| `sensor.licv_8_2r1_3_tvl_calc_max` | sensor | LICV 8.2R1/3 TVL calc max | WP-Messwert: LICV 8.2R1/3 TVL calc max | 30.2 | °C |
| `sensor.luxtronik_341205_065_additional_heat_generator2_operation_hours` | sensor | Wärmepumpe Zusätzlicher Wärmeerzeuger2 Betriebsstunden | Betriebsstunden Zusatz-Wärmeerzeuger (Heizstab) | 0.19 | h |
| `sensor.luxtronik_341205_065_compressor1_operation_hours` | sensor | Wärmepumpe Betriebsstunden Verdichter 1 | Betriebsstunden Verdichter 1 der Wärmepumpe | 3675.39 | h |
| `sensor.luxtronik_341205_065_compressor_heating_temperature` | sensor | Wärmepumpe Verdichter | Verdichter-Temperatur der Wärmepumpe | 50.0 | °C |
| `sensor.luxtronik_341205_065_dhw_energy_input` | sensor | Warmwasser Eingesetzte Energie | WP-Messwert: Warmwasser Eingesetzte Energie | 570.67 | kWh |
| `sensor.luxtronik_341205_065_dhw_heat_amount` | sensor | Warmwasser Wärmemenge | Erzeugte Wärmemenge für Warmwasser in kWh | 1742.1 | kWh |
| `sensor.luxtronik_341205_065_dhw_operation_hours` | sensor | Warmwasser Betriebsstunden | Betriebsstunden Warmwasserbereitung | 343.13 | h |
| `sensor.luxtronik_341205_065_dhw_temperature` | sensor | Warmwasser Brauchwasser | Aktuelle Brauchwassertemperatur im Speicher | 45.8 | °C |
| `sensor.luxtronik_341205_065_error_reason` | sensor | Wärmepumpe Letzter Fehler | Letzter Fehler / Störung der Wärmepumpe | 791 |  |
| `sensor.luxtronik_341205_065_flow_in_circuit1_target_temperature` | sensor | Heizkreis Vorlauf Soll Temperatur MK1 | Vorlauf-Solltemperatur Heizkreis MK1 | 25.8 | °C |
| `sensor.luxtronik_341205_065_flow_in_circuit1_temperature` | sensor | Heizkreis Vorlauf Temperatur MK1 | Vorlauftemperatur Heizkreis MK1 | 75.0 | °C |
| `sensor.luxtronik_341205_065_flow_in_circuit2_target_temperature` | sensor | Heizkreis Vorlauf Soll Temperatur MK2 | Vorlauf-Solltemperatur Heizkreis MK2 | 0.0 | °C |
| `sensor.luxtronik_341205_065_flow_in_circuit2_temperature` | sensor | Heizkreis Vorlauf Temperatur MK2 | Vorlauftemperatur Heizkreis MK2 | 0.0 | °C |
| `sensor.luxtronik_341205_065_flow_in_circuit3_target_temperature` | sensor | Heizkreis Vorlauf Soll Temperatur MK3 | Vorlauf-Solltemperatur Heizkreis MK3 | 0.0 | °C |
| `sensor.luxtronik_341205_065_flow_in_circuit3_temperature` | sensor | Heizkreis Vorlauf Temperatur MK3 | Vorlauftemperatur Heizkreis MK3 | 0.0 | °C |
| `sensor.luxtronik_341205_065_flow_in_temperature` | sensor | Heizkreis Vorlauf Temperatur | Vorlauftemperatur Heizkreis | 30.2 | °C |
| `sensor.luxtronik_341205_065_flow_out_temperature` | sensor | Heizkreis Rücklauf Temperatur | Rücklauftemperatur Heizkreis | 25.8 | °C |
| `sensor.luxtronik_341205_065_flow_out_temperature_target` | sensor | Heizkreis Rücklauf Soll Temperatur | Rücklauf-Solltemperatur Heizkreis | 25.8 | °C |
| `sensor.luxtronik_341205_065_heat_amount_counter` | sensor | Wärmepumpe Zähler Wärmemenge | Gesamte erzeugte Wärmemenge der WP in kWh | 0.0 | kWh |
| `sensor.luxtronik_341205_065_heat_amount_flow_rate` | sensor | Wärmepumpe Zähler Wärmemenge Durchfluss | Durchflussrate am Wärmemengenzähler | 1015.0 | L/h |
| `sensor.luxtronik_341205_065_heat_amount_heating` | sensor | Heizkreis Zähler Wärmemenge Heizung | Erzeugte Wärmemenge Heizung in kWh | 14985.0 | kWh |
| `sensor.luxtronik_341205_065_heat_energy_input` | sensor | Heizkreis Eingesetzte Energie Heizung | WP-Messwert: Heizkreis Eingesetzte Energie Heizung | 3118.49 | kWh |
| `sensor.luxtronik_341205_065_heat_source_flow_rate` | sensor | Wärmepumpe Zähler Wärmequelle Durchfluss | Durchflussrate der Wärmequelle (Luft) | 1010.0 | L/h |
| `sensor.luxtronik_341205_065_hot_gas_temperature` | sensor | Wärmepumpe Heissgas Temperatur | Heißgastemperatur im Kältekreis der WP | 57.1 | °C |
| `sensor.luxtronik_341205_065_operation_hours` | sensor | Wärmepumpe Gesamt Betriebsstunden | Gesamt-Betriebsstunden der Wärmepumpe | 3675.39 | h |
| `sensor.luxtronik_341205_065_operation_hours_heating` | sensor | Heizkreis Betriebsstunden | Betriebsstunden Heizkreis der Wärmepumpe | 3330.44 | h |
| `sensor.luxtronik_341205_065_operation_hours_solar` | sensor | Warmwasser Solar Betriebsstunden | Betriebsstunden Solar-Unterstützung | 0.0 | h |
| `sensor.luxtronik_341205_065_outdoor_temperature` | sensor | Wärmepumpe Aussen Temperatur | Außentemperatur am Standort der Wärmepumpe | 7.1 | °C |
| `sensor.luxtronik_341205_065_room_thermostat_temperature` | sensor | Heizkreis Raum Thermostat | Aktuelle Raumtemperatur am Thermostat | 0.0 | °C |
| `sensor.luxtronik_341205_065_room_thermostat_temperature_target` | sensor | Heizkreis Raum Thermostat Soll | Soll-Raumtemperatur am Thermostat | 0.0 | °C |
| `sensor.luxtronik_341205_065_smart_grid_status` | sensor | Wärmepumpe SmartGrid Status | Smart-Grid-Status der Wärmepumpe (SG-Ready) | unknown |  |
| `sensor.luxtronik_341205_065_solar_buffer_temperature` | sensor | Warmwasser Solar Puffer | Temperatur Solar-Pufferspeicher | 0.0 | °C |
| `sensor.luxtronik_341205_065_solar_collector_temperature` | sensor | Warmwasser Solar Kollektor | Temperatur Solar-Kollektor | 0.0 | °C |
| `sensor.luxtronik_341205_065_status` | sensor | Wärmepumpe Status | Aktueller Betriebsstatus der Wärmepumpe | heating |  |
| `sensor.luxtronik_341205_065_status_line_1` | sensor | Wärmepumpe Status 1 | WP-Statuszeile 1 (Display-Anzeige) | heatpump_running |  |
| `sensor.luxtronik_341205_065_status_line_2` | sensor | Wärmepumpe Status 2 | WP-Statuszeile 2 (Display-Anzeige) | since |  |
| `sensor.luxtronik_341205_065_status_line_3` | sensor | Wärmepumpe Status 3 | WP-Statuszeile 3 (Display-Anzeige) | heating |  |
| `sensor.luxtronik_341205_065_status_time` | sensor | Wärmepumpe Status Zeit | Zeitstempel der letzten WP-Statusmeldung | 0.0 | s |
| `sensor.luxtronik_341205_065_suction_compressor_temperature` | sensor | Wärmepumpe Ansaug Verdichter Temperatur | Verdichter-Temperatur der Wärmepumpe | 8.3 | °C |
| `sensor.luxtronik_341205_065_switchoff_reason` | sensor | Wärmepumpe Abschaltung | Grund der letzten Abschaltung der Wärmepumpe | 9 |  |
| `sensor.wp_betriebsmodus` | sensor | WP Betriebsmodus | Aktueller Betriebsmodus der Wärmepumpe | Heizen |  |
| `sensor.wp_cop_heizung_gesamt` | sensor | WP COP Heizung gesamt | COP Heizung gesamt seit Tracking-Beginn | 3.81 |  |
| `sensor.wp_cop_heizung_monatlich` | sensor | WP COP Heizung monatlich | COP Heizung im aktuellen Monat | 4.94 |  |
| `sensor.wp_cop_kombiniert_gesamt` | sensor | WP COP kombiniert gesamt | COP kombiniert (Heizung+WW) seit Tracking | 3.81 |  |
| `sensor.wp_cop_kombiniert_monatlich` | sensor | WP COP kombiniert monatlich | COP kombiniert (Heizung+WW) im aktuellen Monat | 4.25 |  |
| `sensor.wp_cop_warmwasser_gesamt` | sensor | WP COP Warmwasser gesamt | COP Warmwasser gesamt seit Tracking-Beginn | 3.81 |  |
| `sensor.wp_cop_warmwasser_monatlich` | sensor | WP COP Warmwasser monatlich | COP Warmwasser im aktuellen Monat | 3.14 |  |
| `sensor.wp_einsparpotenzial_kumuliert` | sensor | WP Einsparpotenzial kumuliert | Kumuliertes Einsparpotenzial der WP-Optimierung | 0.1007 | EUR |
| `sensor.wp_einsparpotenzial_laufend` | sensor | WP Einsparpotenzial laufend | Laufendes Einsparpotenzial der WP-Optimierung | 0.1388 | EUR/h |
| `sensor.wp_einsparpotenzial_monat` | sensor | WP Einsparpotenzial Monat | Einsparpotenzial der WP im aktuellen Monat | 0.1007 | EUR |
| `sensor.wp_einsparpotenzial_tag` | sensor | WP Einsparpotenzial Tag | Einsparpotenzial der WP am heutigen Tag | 0.1007 | EUR |
| `sensor.wp_einsparpotenzial_woche` | sensor | WP Einsparpotenzial Woche | Einsparpotenzial der WP in der aktuellen Woche | 0.1007 | EUR |
| `sensor.wp_heizung_thermisch_gesamt_seit_tracking` | sensor | WP Heizung thermisch gesamt (seit Tracking) | Thermische Heizenergie gesamt seit Tracking | 879.6 | kWh |
| `sensor.wp_heizung_thermisch_monatlich` | sensor | WP Heizung thermisch monatlich | Thermische Heizenergie im aktuellen Monat | 143.8 | kWh |
| `sensor.wp_strom_gesamt_seit_tracking` | sensor | WP Strom gesamt (seit Tracking) | WP-Stromverbrauch gesamt seit Tracking-Beginn | 274.98313 | kWh |
| `sensor.wp_strom_modus_gesamt_heizen` | sensor | WP Strom nach Modus gesamt heizen | WP-Stromverbrauch Heizmodus gesamt | 29.12265 | kWh |
| `sensor.wp_strom_modus_gesamt_sonstig` | sensor | WP Strom nach Modus gesamt sonstig | WP-Stromverbrauch sonstige Modi gesamt | 2.94943 | kWh |
| `sensor.wp_strom_modus_gesamt_warmwasser` | sensor | WP Strom nach Modus gesamt warmwasser | WP-Stromverbrauch Warmwasser-Modus gesamt | 4.78346 | kWh |
| `sensor.wp_strom_modus_monatlich_heizen` | sensor | WP Strom nach Modus monatlich heizen | WP-Stromverbrauch Heizmodus aktueller Monat | 29.12265 | kWh |
| `sensor.wp_strom_modus_monatlich_sonstig` | sensor | WP Strom nach Modus monatlich sonstig | WP-Stromverbrauch sonstige Modi aktueller Monat | 2.94943 | kWh |
| `sensor.wp_strom_modus_monatlich_warmwasser` | sensor | WP Strom nach Modus monatlich warmwasser | WP-Stromverbrauch WW-Modus aktueller Monat | 4.78346 | kWh |
| `sensor.wp_strom_monatlich` | sensor | WP Strom monatlich | WP-Stromverbrauch im aktuellen Monat | 37.33548 | kWh |
| `sensor.wp_stromkosten_kumuliert` | sensor | WP Stromkosten kumuliert | Kumulierte WP-Stromkosten seit Tracking | 0.1216 | EUR |
| `sensor.wp_stromkosten_laufend` | sensor | WP Stromkosten laufend | Laufende WP-Stromkosten (aktuell) | 0.1684 | EUR/h |
| `sensor.wp_stromkosten_monat` | sensor | WP Stromkosten Monat | WP-Stromkosten im aktuellen Monat | 0.1216 | EUR |
| `sensor.wp_stromkosten_tag` | sensor | WP Stromkosten Tag | WP-Stromkosten am heutigen Tag | 0.1216 | EUR |
| `sensor.wp_stromkosten_woche` | sensor | WP Stromkosten Woche | WP-Stromkosten in der aktuellen Woche | 0.1216 | EUR |
| `sensor.wp_warmwasser_thermisch_gesamt_seit_tracking` | sensor | WP Warmwasser thermisch gesamt (seit Tracking) | Thermische WW-Energie gesamt seit Tracking | 167.8 | kWh |
| `sensor.wp_warmwasser_thermisch_monatlich` | sensor | WP Warmwasser thermisch monatlich | Thermische WW-Energie im aktuellen Monat | 15.0 | kWh |
| `switch.licv_8_2r1_3_cooling_blocked` | switch | LICV 8.2R1/3 Cooling blocked | WP-Schaltfunktion: LICV 8.2R1/3 Cooling blocked | off |  |
| `switch.licv_8_2r1_3_dhw_blocked` | switch | LICV 8.2R1/3 DHW blocked | WP-Schaltfunktion: LICV 8.2R1/3 DHW blocked | off |  |
| `switch.licv_8_2r1_3_extra_dhw` | switch | LICV 8.2R1/3 Extra DHW | WP-Schaltfunktion: LICV 8.2R1/3 Extra DHW | off |  |
| `switch.licv_8_2r1_3_heating_blocked` | switch | LICV 8.2R1/3 Heating blocked | Heizungs-Schalter: LICV 8.2R1/3 Heating blocked | off |  |
| `switch.licv_8_2r1_3_high_speed_charge` | switch | LICV 8.2R1/3 high-speed charge | WP-Schaltfunktion: LICV 8.2R1/3 high-speed charge | off |  |
| `switch.licv_8_2r1_3_pool_blocked` | switch | LICV 8.2R1/3 Pool blocked | WP-Schaltfunktion: LICV 8.2R1/3 Pool blocked | off |  |
| `switch.licv_8_2r1_3_secondary_return` | switch | LICV 8.2R1/3 secondary return | WP-Schaltfunktion: LICV 8.2R1/3 secondary return | off |  |
| `switch.luxtronik_341205_065_domestic_water` | switch | Warmwasser Modus Automatik | Warmwasser-Automatik ein/ausschalten | on |  |
| `switch.luxtronik_341205_065_heating` | switch | Heizkreis Heizungsmodus Automatik | Heizungs-Automatik ein/ausschalten | on |  |
| `switch.luxtronik_341205_065_heating_threshold` | switch | Heizkreis Heizgrenze | Heizgrenztemperatur — ab hier wird nicht geheizt | on |  |
| `switch.luxtronik_341205_065_pump_optimization` | switch | Heizkreis Pumpenoptimierung | Pumpenoptimierung Heizkreis ein/ausschalten | on |  |
| `switch.luxtronik_341205_065_pump_vent_active` | switch | Heizkreis Entlüften aktiv | Entlüftungsmodus der Heizungspumpe | off |  |
| `switch.luxtronik_341205_065_pump_vent_hup` | switch | Heizkreis Entlüften HUP | Heizungs-Umwälzpumpe (HUP) — Heizkreislauf aktiv | off |  |
| `switch.luxtronik_341205_065_remote_maintenance` | switch | Wärmepumpe Fernwartung | Fernwartungszugang zur Luxtronik-Steuerung | on |  |
| `switch.luxtronik_341205_065_smartgrid` | switch | Wärmepumpe Smart Grid | Smart-Grid-Steuerung der WP ein/ausschalten | off |  |
| `switch.luxtronik_341205_065_thermal_power_limitation_switch` | switch | Wärmepumpe Therm. Leistung max | Thermische Leistungsbegrenzung ein/aus | off |  |
| `update.licv_8_2r1_3_firmware` | update | LICV 8.2R1/3 Firmware | Firmware-Update-Status der Luxtronik-Steuerung | off |  |
| `update.luxtronik_341205_065_firmware` | update | Wärmepumpe Firmware | Firmware-Update-Status der Luxtronik-Steuerung | off |  |
| `update.luxtronik_update` | update | Luxtronik Update | UNBEKANNT: Luxtronik-WP-Parameter — Luxtronik Update | off |  |
| `water_heater.luxtronik_341205_065_domestic_water` | water_heater | Warmwasser Brauchwasser | Warmwassersteuerung der LICV Wärmepumpe | heat_pump |  |

## Met.no (Wetter)

1 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `weather.forecast_home` | weather | Forecast Home | Met.no Wettervorhersage mit Temperatur, Wind, Niederschlag | clear-night |  |

## Shelly

350 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.dg_bad_jalousie_uberhitzung` | binary_sensor | DG_Bad_Jalousie Überhitzung | Überhitzungsschutz Shelly DG Bad Jalousie | off |  |
| `binary_sensor.dg_bad_jalousie_uberlast` | binary_sensor | DG_Bad_Jalousie Überlast | Überlastschutz Shelly DG Bad Jalousie | off |  |
| `binary_sensor.dg_bad_jalousie_uberspannung` | binary_sensor | DG_Bad_Jalousie Überspannung | Überspannungsschutz Shelly DG Bad Jalousie | off |  |
| `binary_sensor.dg_bad_jalousie_uberstrom` | binary_sensor | DG_Bad_Jalousie Überstrom | Überstromschutz Shelly DG Bad Jalousie | off |  |
| `binary_sensor.dg_buero_jalousie_uberhitzung` | binary_sensor | DG_Buero_Jalousie Überhitzung | Überhitzungsschutz Shelly DG Büro Jalousie | off |  |
| `binary_sensor.dg_buero_jalousie_uberlast` | binary_sensor | DG_Buero_Jalousie Überlast | Überlastschutz Shelly DG Büro Jalousie | off |  |
| `binary_sensor.dg_buero_jalousie_uberspannung` | binary_sensor | DG_Buero_Jalousie Überspannung | Überspannungsschutz Shelly DG Büro Jalousie | off |  |
| `binary_sensor.dg_buero_jalousie_uberstrom` | binary_sensor | DG_Buero_Jalousie Überstrom | Überstromschutz Shelly DG Büro Jalousie | off |  |
| `binary_sensor.dg_buero_workstation_uberhitzung` | binary_sensor | DG_Buero_Workstation Überhitzung | Überhitzungsschutz Shelly DG Büro Workstation-Steckdose | off |  |
| `binary_sensor.dg_buero_workstation_uberlast` | binary_sensor | DG_Buero_Workstation Überlast | Überlastschutz Shelly DG Büro Workstation-Steckdose | off |  |
| `binary_sensor.dg_buero_workstation_uberspannung` | binary_sensor | DG_Buero_Workstation Überspannung | Überspannungsschutz Shelly DG Büro Workstation-Steckdose | off |  |
| `binary_sensor.dg_buero_workstation_uberstrom` | binary_sensor | DG_Buero_Workstation Überstrom | Überstromschutz Shelly DG Büro Workstation-Steckdose | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_1 Überhitzung | Überhitzungsschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberlast` | binary_sensor | DG_Schlafen_Jalousie_1 Überlast | Überlastschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_1 Überspannung | Überspannungsschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_1_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_1 Überstrom | Überstromschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberhitzung` | binary_sensor | DG_Schlafen_Jalousie_2 Überhitzung | Überhitzungsschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberlast` | binary_sensor | DG_Schlafen_Jalousie_2 Überlast | Überlastschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberspannung` | binary_sensor | DG_Schlafen_Jalousie_2 Überspannung | Überspannungsschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.dg_schlafen_jalousie_2_uberstrom` | binary_sensor | DG_Schlafen_Jalousie_2 Überstrom | Überstromschutz Shelly DG Schlafzimmer Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberhitzung` | binary_sensor | EG_Diele_Jalousie-1 Überhitzung | Überhitzungsschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberlast` | binary_sensor | EG_Diele_Jalousie-1 Überlast | Überlastschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberspannung` | binary_sensor | EG_Diele_Jalousie-1 Überspannung | Überspannungsschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_1_uberstrom` | binary_sensor | EG_Diele_Jalousie-1 Überstrom | Überstromschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberhitzung` | binary_sensor | EG_Diele_Jalousie-2 Überhitzung | Überhitzungsschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberlast` | binary_sensor | EG_Diele_Jalousie-2 Überlast | Überlastschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberspannung` | binary_sensor | EG_Diele_Jalousie-2 Überspannung | Überspannungsschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_diele_jalousie_2_uberstrom` | binary_sensor | EG_Diele_Jalousie-2 Überstrom | Überstromschutz Shelly EG Diele Jalousie | off |  |
| `binary_sensor.eg_essen_jalousie_uberhitzung` | binary_sensor | EG_Essen_Jalousie Überhitzung | Überhitzungsschutz Shelly EG Esszimmer Jalousie | off |  |
| `binary_sensor.eg_essen_jalousie_uberlast` | binary_sensor | EG_Essen_Jalousie Überlast | Überlastschutz Shelly EG Esszimmer Jalousie | off |  |
| `binary_sensor.eg_essen_jalousie_uberspannung` | binary_sensor | EG_Essen_Jalousie Überspannung | Überspannungsschutz Shelly EG Esszimmer Jalousie | off |  |
| `binary_sensor.eg_essen_jalousie_uberstrom` | binary_sensor | EG_Essen_Jalousie Überstrom | Überstromschutz Shelly EG Esszimmer Jalousie | off |  |
| `binary_sensor.eg_kueche_jalousie_uberhitzung` | binary_sensor | EG_Kueche_Jalousie Überhitzung | Überhitzungsschutz Shelly EG Küche Jalousie | off |  |
| `binary_sensor.eg_kueche_jalousie_uberlast` | binary_sensor | EG_Kueche_Jalousie Überlast | Überlastschutz Shelly EG Küche Jalousie | off |  |
| `binary_sensor.eg_kueche_jalousie_uberspannung` | binary_sensor | EG_Kueche_Jalousie Überspannung | Überspannungsschutz Shelly EG Küche Jalousie | off |  |
| `binary_sensor.eg_kueche_jalousie_uberstrom` | binary_sensor | EG_Kueche_Jalousie Überstrom | Überstromschutz Shelly EG Küche Jalousie | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberhitzung` | binary_sensor | EG_Kueche_Spuelmaschine Überhitzung | Überhitzungsschutz Shelly EG Küche Spülmaschine-Steckdose | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberlast` | binary_sensor | EG_Kueche_Spuelmaschine Überlast | Überlastschutz Shelly EG Küche Spülmaschine-Steckdose | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberspannung` | binary_sensor | EG_Kueche_Spuelmaschine Überspannung | Überspannungsschutz Shelly EG Küche Spülmaschine-Steckdose | off |  |
| `binary_sensor.eg_kueche_spuelmaschine_uberstrom` | binary_sensor | EG_Kueche_Spuelmaschine Überstrom | Überstromschutz Shelly EG Küche Spülmaschine-Steckdose | off |  |
| `binary_sensor.eg_wc_jalousie_uberhitzung` | binary_sensor | EG_WC_Jalousie Überhitzung | Überhitzungsschutz Shelly EG WC Jalousie | off |  |
| `binary_sensor.eg_wc_jalousie_uberlast` | binary_sensor | EG_WC_Jalousie Überlast | Überlastschutz Shelly EG WC Jalousie | off |  |
| `binary_sensor.eg_wc_jalousie_uberspannung` | binary_sensor | EG_WC_Jalousie Überspannung | Überspannungsschutz Shelly EG WC Jalousie | off |  |
| `binary_sensor.eg_wc_jalousie_uberstrom` | binary_sensor | EG_WC_Jalousie Überstrom | Überstromschutz Shelly EG WC Jalousie | off |  |
| `binary_sensor.eg_wc_licht_eingang_0` | binary_sensor | EG_WC_Licht Eingang 0 | Eingangssignal Shelly EG WC Licht | on |  |
| `binary_sensor.eg_wc_licht_uberhitzung` | binary_sensor | EG_WC_Licht Überhitzung | Überhitzungsschutz Shelly EG WC Licht | off |  |
| `binary_sensor.eg_wc_licht_uberlast` | binary_sensor | EG_WC_Licht Überlast | Überlastschutz Shelly EG WC Licht | off |  |
| `binary_sensor.eg_wc_licht_uberspannung` | binary_sensor | EG_WC_Licht Überspannung | Überspannungsschutz Shelly EG WC Licht | off |  |
| `binary_sensor.eg_wc_licht_uberstrom` | binary_sensor | EG_WC_Licht Überstrom | Überstromschutz Shelly EG WC Licht | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_1 Überhitzung | Überhitzungsschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberlast` | binary_sensor | EG_Wohnen_Jalousie_1 Überlast | Überlastschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_1 Überspannung | Überspannungsschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_1_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_1 Überstrom | Überstromschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberhitzung` | binary_sensor | EG_Wohnen_Jalousie_2 Überhitzung | Überhitzungsschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberlast` | binary_sensor | EG_Wohnen_Jalousie_2 Überlast | Überlastschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberspannung` | binary_sensor | EG_Wohnen_Jalousie_2 Überspannung | Überspannungsschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.eg_wohnen_jalousie_2_uberstrom` | binary_sensor | EG_Wohnen_Jalousie_2 Überstrom | Überstromschutz Shelly EG Wohnzimmer Jalousie | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberhitzung` | binary_sensor | KG_Flur_Kuehlschrank Überhitzung | Überhitzungsschutz Shelly KG Flur Kühlschrank-Steckdose | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberlast` | binary_sensor | KG_Flur_Kuehlschrank Überlast | Überlastschutz Shelly KG Flur Kühlschrank-Steckdose | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberspannung` | binary_sensor | KG_Flur_Kuehlschrank Überspannung | Überspannungsschutz Shelly KG Flur Kühlschrank-Steckdose | off |  |
| `binary_sensor.kg_flur_kuehlschrank_uberstrom` | binary_sensor | KG_Flur_Kuehlschrank Überstrom | Überstromschutz Shelly KG Flur Kühlschrank-Steckdose | off |  |
| `binary_sensor.kg_keller_licht_eingang_0` | binary_sensor | KG_Keller_Licht Eingang 0 | Eingangssignal Shelly KG Keller Licht | on |  |
| `binary_sensor.kg_keller_licht_uberhitzung` | binary_sensor | KG_Keller_Licht Überhitzung | Überhitzungsschutz Shelly KG Keller Licht | off |  |
| `binary_sensor.kg_keller_licht_uberlast` | binary_sensor | KG_Keller_Licht Überlast | Überlastschutz Shelly KG Keller Licht | off |  |
| `binary_sensor.kg_keller_licht_uberspannung` | binary_sensor | KG_Keller_Licht Überspannung | Überspannungsschutz Shelly KG Keller Licht | off |  |
| `binary_sensor.kg_keller_licht_uberstrom` | binary_sensor | KG_Keller_Licht Überstrom | Überstromschutz Shelly KG Keller Licht | off |  |
| `binary_sensor.kg_technik_serverschrank_uberhitzung` | binary_sensor | KG_Technik_Serverschrank Überhitzung | Überhitzungsschutz Shelly KG Technik Serverschrank-Steckdose | off |  |
| `binary_sensor.kg_technik_serverschrank_uberlast` | binary_sensor | KG_Technik_Serverschrank Überlast | Überlastschutz Shelly KG Technik Serverschrank-Steckdose | off |  |
| `binary_sensor.kg_technik_serverschrank_uberspannung` | binary_sensor | KG_Technik_Serverschrank Überspannung | Überspannungsschutz Shelly KG Technik Serverschrank-Steckdose | off |  |
| `binary_sensor.kg_technik_serverschrank_uberstrom` | binary_sensor | KG_Technik_Serverschrank Überstrom | Überstromschutz Shelly KG Technik Serverschrank-Steckdose | off |  |
| `binary_sensor.kg_technik_trockner_uberhitzung` | binary_sensor | KG_Technik_Trockner Überhitzung | Überhitzungsschutz Shelly KG Technik Trockner-Steckdose | off |  |
| `binary_sensor.kg_technik_trockner_uberlast` | binary_sensor | KG_Technik_Trockner Überlast | Überlastschutz Shelly KG Technik Trockner-Steckdose | off |  |
| `binary_sensor.kg_technik_trockner_uberspannung` | binary_sensor | KG_Technik_Trockner Überspannung | Überspannungsschutz Shelly KG Technik Trockner-Steckdose | off |  |
| `binary_sensor.kg_technik_trockner_uberstrom` | binary_sensor | KG_Technik_Trockner Überstrom | Überstromschutz Shelly KG Technik Trockner-Steckdose | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberhitzung` | binary_sensor | KG_Technik_Waschmaschine Überhitzung | Überhitzungsschutz Shelly KG Technik Waschmaschine-Steckdose | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberlast` | binary_sensor | KG_Technik_Waschmaschine Überlast | Überlastschutz Shelly KG Technik Waschmaschine-Steckdose | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberspannung` | binary_sensor | KG_Technik_Waschmaschine Überspannung | Überspannungsschutz Shelly KG Technik Waschmaschine-Steckdose | off |  |
| `binary_sensor.kg_technik_waschmaschine_uberstrom` | binary_sensor | KG_Technik_Waschmaschine Überstrom | Überstromschutz Shelly KG Technik Waschmaschine-Steckdose | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_1 Überhitzung | Überhitzungsschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberlast` | binary_sensor | OG_Ankleide_Jalousie_1 Überlast | Überlastschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_1 Überspannung | Überspannungsschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_1_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_1 Überstrom | Überstromschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberhitzung` | binary_sensor | OG_Ankleide_Jalousie_2 Überhitzung | Überhitzungsschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberlast` | binary_sensor | OG_Ankleide_Jalousie_2 Überlast | Überlastschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberspannung` | binary_sensor | OG_Ankleide_Jalousie_2 Überspannung | Überspannungsschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_jalousie_2_uberstrom` | binary_sensor | OG_Ankleide_Jalousie_2 Überstrom | Überstromschutz Shelly OG Ankleide Jalousie | off |  |
| `binary_sensor.og_ankleide_licht_eingang_0` | binary_sensor | OG_Ankleide_Licht Eingang 0 | Eingangssignal Shelly OG Ankleide Licht | off |  |
| `binary_sensor.og_ankleide_licht_uberhitzung` | binary_sensor | OG_Ankleide_Licht Überhitzung | Überhitzungsschutz Shelly OG Ankleide Licht | off |  |
| `binary_sensor.og_ankleide_licht_uberlast` | binary_sensor | OG_Ankleide_Licht Überlast | Überlastschutz Shelly OG Ankleide Licht | off |  |
| `binary_sensor.og_ankleide_licht_uberspannung` | binary_sensor | OG_Ankleide_Licht Überspannung | Überspannungsschutz Shelly OG Ankleide Licht | off |  |
| `binary_sensor.og_ankleide_licht_uberstrom` | binary_sensor | OG_Ankleide_Licht Überstrom | Überstromschutz Shelly OG Ankleide Licht | off |  |
| `binary_sensor.og_bad_jalousie_1_uberhitzung` | binary_sensor | OG_Bad_Jalousie_1 Überhitzung | Überhitzungsschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_1_uberlast` | binary_sensor | OG_Bad_Jalousie_1 Überlast | Überlastschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_1_uberspannung` | binary_sensor | OG_Bad_Jalousie_1 Überspannung | Überspannungsschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_1_uberstrom` | binary_sensor | OG_Bad_Jalousie_1 Überstrom | Überstromschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_2_uberhitzung` | binary_sensor | OG_Bad_Jalousie_2 Überhitzung | Überhitzungsschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_2_uberlast` | binary_sensor | OG_Bad_Jalousie_2 Überlast | Überlastschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_2_uberspannung` | binary_sensor | OG_Bad_Jalousie_2 Überspannung | Überspannungsschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_jalousie_2_uberstrom` | binary_sensor | OG_Bad_Jalousie_2 Überstrom | Überstromschutz Shelly OG Bad Jalousie | off |  |
| `binary_sensor.og_bad_licht_eingang_0` | binary_sensor | OG_Bad_Licht Eingang 0 | Eingangssignal Shelly OG Bad Licht | on |  |
| `binary_sensor.og_bad_licht_uberhitzung` | binary_sensor | OG_Bad_Licht Überhitzung | Überhitzungsschutz Shelly OG Bad Licht | off |  |
| `binary_sensor.og_bad_licht_uberlast` | binary_sensor | OG_Bad_Licht Überlast | Überlastschutz Shelly OG Bad Licht | off |  |
| `binary_sensor.og_bad_licht_uberspannung` | binary_sensor | OG_Bad_Licht Überspannung | Überspannungsschutz Shelly OG Bad Licht | off |  |
| `binary_sensor.og_bad_licht_uberstrom` | binary_sensor | OG_Bad_Licht Überstrom | Überstromschutz Shelly OG Bad Licht | off |  |
| `binary_sensor.og_flur_jalousie_uberhitzung` | binary_sensor | OG_Flur_Jalousie Überhitzung | Überhitzungsschutz Shelly OG Flur Jalousie | off |  |
| `binary_sensor.og_flur_jalousie_uberlast` | binary_sensor | OG_Flur_Jalousie Überlast | Überlastschutz Shelly OG Flur Jalousie | off |  |
| `binary_sensor.og_flur_jalousie_uberspannung` | binary_sensor | OG_Flur_Jalousie Überspannung | Überspannungsschutz Shelly OG Flur Jalousie | off |  |
| `binary_sensor.og_flur_jalousie_uberstrom` | binary_sensor | OG_Flur_Jalousie Überstrom | Überstromschutz Shelly OG Flur Jalousie | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberhitzung` | binary_sensor | OG_Zimmer1_Jalousie Überhitzung | Überhitzungsschutz Shelly OG Zimmer 1 Jalousie | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberlast` | binary_sensor | OG_Zimmer1_Jalousie Überlast | Überlastschutz Shelly OG Zimmer 1 Jalousie | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberspannung` | binary_sensor | OG_Zimmer1_Jalousie Überspannung | Überspannungsschutz Shelly OG Zimmer 1 Jalousie | off |  |
| `binary_sensor.og_zimmer1_jalousie_uberstrom` | binary_sensor | OG_Zimmer1_Jalousie Überstrom | Überstromschutz Shelly OG Zimmer 1 Jalousie | off |  |
| `binary_sensor.og_zimmer1_licht_eingang_0` | binary_sensor | OG_Zimmer1_Licht Eingang 0 | Eingangssignal Shelly OG Zimmer 1 Licht | off |  |
| `binary_sensor.og_zimmer1_licht_uberhitzung` | binary_sensor | OG_Zimmer1_Licht Überhitzung | Überhitzungsschutz Shelly OG Zimmer 1 Licht | off |  |
| `binary_sensor.og_zimmer1_licht_uberlast` | binary_sensor | OG_Zimmer1_Licht Überlast | Überlastschutz Shelly OG Zimmer 1 Licht | off |  |
| `binary_sensor.og_zimmer1_licht_uberspannung` | binary_sensor | OG_Zimmer1_Licht Überspannung | Überspannungsschutz Shelly OG Zimmer 1 Licht | off |  |
| `binary_sensor.og_zimmer1_licht_uberstrom` | binary_sensor | OG_Zimmer1_Licht Überstrom | Überstromschutz Shelly OG Zimmer 1 Licht | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberhitzung` | binary_sensor | OG_Zimmer2_Jalousie Überhitzung | Überhitzungsschutz Shelly OG Zimmer 2 Jalousie | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberlast` | binary_sensor | OG_Zimmer2_Jalousie Überlast | Überlastschutz Shelly OG Zimmer 2 Jalousie | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberspannung` | binary_sensor | OG_Zimmer2_Jalousie Überspannung | Überspannungsschutz Shelly OG Zimmer 2 Jalousie | off |  |
| `binary_sensor.og_zimmer2_jalousie_uberstrom` | binary_sensor | OG_Zimmer2_Jalousie Überstrom | Überstromschutz Shelly OG Zimmer 2 Jalousie | off |  |
| `binary_sensor.og_zimmer2_licht_eingang_0` | binary_sensor | OG_Zimmer2_Licht Eingang 0 | Eingangssignal Shelly OG Zimmer 2 Licht | off |  |
| `binary_sensor.og_zimmer2_licht_uberhitzung` | binary_sensor | OG_Zimmer2_Licht Überhitzung | Überhitzungsschutz Shelly OG Zimmer 2 Licht | off |  |
| `binary_sensor.og_zimmer2_licht_uberlast` | binary_sensor | OG_Zimmer2_Licht Überlast | Überlastschutz Shelly OG Zimmer 2 Licht | off |  |
| `binary_sensor.og_zimmer2_licht_uberspannung` | binary_sensor | OG_Zimmer2_Licht Überspannung | Überspannungsschutz Shelly OG Zimmer 2 Licht | off |  |
| `binary_sensor.og_zimmer2_licht_uberstrom` | binary_sensor | OG_Zimmer2_Licht Überstrom | Überstromschutz Shelly OG Zimmer 2 Licht | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberhitzung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überhitzung | Überhitzungsschutz Shelly OG Zimmer 2 LED-Lichtstreifen | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberlast` | binary_sensor | OG_Zimmer2_Lichtstreifen Überlast | Überlastschutz Shelly OG Zimmer 2 LED-Lichtstreifen | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberspannung` | binary_sensor | OG_Zimmer2_Lichtstreifen Überspannung | Überspannungsschutz Shelly OG Zimmer 2 LED-Lichtstreifen | off |  |
| `binary_sensor.og_zimmer2_lichtstreifen_uberstrom` | binary_sensor | OG_Zimmer2_Lichtstreifen Überstrom | Überstromschutz Shelly OG Zimmer 2 LED-Lichtstreifen | off |  |
| `button.dg_bad_jalousie_neu_starten` | button | DG_Bad_Jalousie Neu starten | Neustart Shelly DG Bad Jalousie | unknown |  |
| `button.dg_buero_jalousie_neu_starten` | button | DG_Buero_Jalousie Neu starten | Neustart Shelly DG Büro Jalousie | unknown |  |
| `button.dg_buero_workstation_neu_starten` | button | DG_Buero_Workstation Neu starten | Neustart Shelly DG Büro Workstation-Steckdose | unknown |  |
| `button.dg_schlafen_jalousie_1_neu_starten` | button | DG_Schlafen_Jalousie_1 Neu starten | Neustart Shelly DG Schlafzimmer Jalousie | unknown |  |
| `button.dg_schlafen_jalousie_2_neu_starten` | button | DG_Schlafen_Jalousie_2 Neu starten | Neustart Shelly DG Schlafzimmer Jalousie | unknown |  |
| `button.eg_diele_jalousie_1_neu_starten` | button | EG_Diele_Jalousie-1 Neu starten | Neustart Shelly EG Diele Jalousie | unknown |  |
| `button.eg_diele_jalousie_2_neu_starten` | button | EG_Diele_Jalousie-2 Neu starten | Neustart Shelly EG Diele Jalousie | unknown |  |
| `button.eg_essen_jalousie_neu_starten` | button | EG_Essen_Jalousie Neu starten | Neustart Shelly EG Esszimmer Jalousie | unknown |  |
| `button.eg_kueche_jalousie_neu_starten` | button | EG_Kueche_Jalousie Neu starten | Neustart Shelly EG Küche Jalousie | unknown |  |
| `button.eg_kueche_spuelmaschine_neu_starten` | button | EG_Kueche_Spuelmaschine Neu starten | Neustart Shelly EG Küche Spülmaschine-Steckdose | unknown |  |
| `button.eg_wc_jalousie_neu_starten` | button | EG_WC_Jalousie Neu starten | Neustart Shelly EG WC Jalousie | unknown |  |
| `button.eg_wc_licht_neu_starten` | button | EG_WC_Licht Neu starten | Neustart Shelly EG WC Licht | unknown |  |
| `button.eg_wohnen_jalousie_1_neu_starten` | button | EG_Wohnen_Jalousie_1 Neu starten | Neustart Shelly EG Wohnzimmer Jalousie | unknown |  |
| `button.eg_wohnen_jalousie_2_neu_starten` | button | EG_Wohnen_Jalousie_2 Neu starten | Neustart Shelly EG Wohnzimmer Jalousie | unknown |  |
| `button.kg_flur_kuehlschrank_neu_starten` | button | KG_Flur_Kuehlschrank Neu starten | Neustart Shelly KG Flur Kühlschrank-Steckdose | unknown |  |
| `button.kg_keller_licht_neu_starten` | button | KG_Keller_Licht Neu starten | Neustart Shelly KG Keller Licht | unknown |  |
| `button.kg_technik_serverschrank_neu_starten` | button | KG_Technik_Serverschrank Neu starten | Neustart Shelly KG Technik Serverschrank-Steckdose | unknown |  |
| `button.kg_technik_trockner_neu_starten` | button | KG_Technik_Trockner Neu starten | Neustart Shelly KG Technik Trockner-Steckdose | unknown |  |
| `button.kg_technik_waermepumpe_3em_neu_starten` | button | KG_Technik_Waermepumpe_3EM Neu starten | Neustart Shelly KG Technik Wärmepumpe-3EM Energiemesser | unknown |  |
| `button.kg_technik_waschmaschine_neu_starten` | button | KG_Technik_Waschmaschine Neu starten | Neustart Shelly KG Technik Waschmaschine-Steckdose | unknown |  |
| `button.og_ankleide_jalousie_1_neu_starten` | button | OG_Ankleide_Jalousie_1 Neu starten | Neustart Shelly OG Ankleide Jalousie | unknown |  |
| `button.og_ankleide_jalousie_2_neu_starten` | button | OG_Ankleide_Jalousie_2 Neu starten | Neustart Shelly OG Ankleide Jalousie | unknown |  |
| `button.og_ankleide_licht_neu_starten` | button | OG_Ankleide_Licht Neu starten | Neustart Shelly OG Ankleide Licht | unknown |  |
| `button.og_bad_jalousie_1_neu_starten` | button | OG_Bad_Jalousie_1 Neu starten | Neustart Shelly OG Bad Jalousie | unknown |  |
| `button.og_bad_jalousie_2_neu_starten` | button | OG_Bad_Jalousie_2 Neu starten | Neustart Shelly OG Bad Jalousie | unknown |  |
| `button.og_bad_licht_neu_starten` | button | OG_Bad_Licht Neu starten | Neustart Shelly OG Bad Licht | unknown |  |
| `button.og_flur_jalousie_neu_starten` | button | OG_Flur_Jalousie Neu starten | Neustart Shelly OG Flur Jalousie | unknown |  |
| `button.og_zimmer1_jalousie_neu_starten` | button | OG_Zimmer1_Jalousie Neu starten | Neustart Shelly OG Zimmer 1 Jalousie | unknown |  |
| `button.og_zimmer1_licht_neu_starten` | button | OG_Zimmer1_Licht Neu starten | Neustart Shelly OG Zimmer 1 Licht | unknown |  |
| `button.og_zimmer2_jalousie_neu_starten` | button | OG_Zimmer2_Jalousie Neu starten | Neustart Shelly OG Zimmer 2 Jalousie | unknown |  |
| `button.og_zimmer2_licht_neu_starten` | button | OG_Zimmer2_Licht Neu starten | Neustart Shelly OG Zimmer 2 Licht | unknown |  |
| `button.og_zimmer2_lichtstreifen_neu_starten` | button | OG_Zimmer2_Lichtstreifen Neu starten | Neustart Shelly OG Zimmer 2 LED-Lichtstreifen | unknown |  |
| `cover.dg_bad_jalousie` | cover | DG_Bad_Jalousie | Jalousie DG Bad, Shelly-gesteuert | closed |  |
| `cover.dg_buero_jalousie` | cover | DG_Buero_Jalousie | Jalousie DG Büro, Shelly-gesteuert | closed |  |
| `cover.dg_schlafen_jalousie_1` | cover | DG_Schlafen_Jalousie_1 | Jalousie DG Schlafzimmer, Shelly-gesteuert | open |  |
| `cover.dg_schlafen_jalousie_2` | cover | DG_Schlafen_Jalousie_2 | Jalousie DG Schlafzimmer, Shelly-gesteuert | closed |  |
| `cover.eg_diele_jalousie_1` | cover | EG_Diele_Jalousie-1 | Jalousie EG Diele, Shelly-gesteuert | closed |  |
| `cover.eg_diele_jalousie_2` | cover | EG_Diele_Jalousie-2 | Jalousie EG Diele, Shelly-gesteuert | closed |  |
| `cover.eg_essen_jalousie` | cover | EG_Essen_Jalousie | Jalousie EG Esszimmer, Shelly-gesteuert | open |  |
| `cover.eg_kueche_jalousie` | cover | EG_Kueche_Jalousie | Jalousie EG Küche, Shelly-gesteuert | open |  |
| `cover.eg_wc_jalousie` | cover | EG_WC_Jalousie | Jalousie EG WC, Shelly-gesteuert | closed |  |
| `cover.eg_wohnen_jalousie_1` | cover | EG_Wohnen_Jalousie_1 | Jalousie EG Wohnzimmer, Shelly-gesteuert | open |  |
| `cover.eg_wohnen_jalousie_2` | cover | EG_Wohnen_Jalousie_2 | Jalousie EG Wohnzimmer, Shelly-gesteuert | open |  |
| `cover.og_ankleide_jalousie_1` | cover | OG_Ankleide_Jalousie_1 | Jalousie OG Ankleide, Shelly-gesteuert | closed |  |
| `cover.og_ankleide_jalousie_2` | cover | OG_Ankleide_Jalousie_2 | Jalousie OG Ankleide, Shelly-gesteuert | closed |  |
| `cover.og_bad_jalousie_1` | cover | OG_Bad_Jalousie_1 | Jalousie OG Bad, Shelly-gesteuert | closed |  |
| `cover.og_bad_jalousie_2` | cover | OG_Bad_Jalousie_2 | Jalousie OG Bad, Shelly-gesteuert | closed |  |
| `cover.og_flur_jalousie` | cover | OG_Flur_Jalousie | Jalousie OG Flur, Shelly-gesteuert | closed |  |
| `cover.og_zimmer1_jalousie` | cover | OG_Zimmer1_Jalousie | Jalousie OG Zimmer 1, Shelly-gesteuert | open |  |
| `cover.og_zimmer2_jalousie` | cover | OG_Zimmer2_Jalousie | Jalousie OG Zimmer 2, Shelly-gesteuert | open |  |
| `event.dg_bad_jalousie_eingang_0` | event | DG_Bad_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly DG Bad Jalousie | 2026-03-27T18:52:18.302+00:00 |  |
| `event.dg_bad_jalousie_eingang_1` | event | DG_Bad_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly DG Bad Jalousie | 2026-03-27T18:52:19.248+00:00 |  |
| `event.dg_buero_jalousie_eingang_0` | event | DG_Buero_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly DG Büro Jalousie | 2026-03-27T22:21:40.940+00:00 |  |
| `event.dg_buero_jalousie_eingang_1` | event | DG_Buero_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly DG Büro Jalousie | 2026-03-20T08:09:06.189+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_0` | event | DG_Schlafen_Jalousie_1 Eingang 0 | Tastenereignis Eingang 0 Shelly DG Schlafzimmer Jalousie | 2026-03-29T13:07:21.529+00:00 |  |
| `event.dg_schlafen_jalousie_1_eingang_1` | event | DG_Schlafen_Jalousie_1 Eingang 1 | Tastenereignis Eingang 1 Shelly DG Schlafzimmer Jalousie | 2026-03-25T06:29:27.990+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_0` | event | DG_Schlafen_Jalousie_2 Eingang 0 | Tastenereignis Eingang 0 Shelly DG Schlafzimmer Jalousie | 2026-03-29T13:07:21.122+00:00 |  |
| `event.dg_schlafen_jalousie_2_eingang_1` | event | DG_Schlafen_Jalousie_2 Eingang 1 | Tastenereignis Eingang 1 Shelly DG Schlafzimmer Jalousie | 2026-03-25T06:29:27.622+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_0` | event | EG_Diele_Jalousie-1 Eingang 0 | Tastenereignis Eingang 0 Shelly EG Diele Jalousie | 2026-03-26T19:00:51.110+00:00 |  |
| `event.eg_diele_jalousie_1_eingang_1` | event | EG_Diele_Jalousie-1 Eingang 1 | Tastenereignis Eingang 1 Shelly EG Diele Jalousie | 2026-03-26T19:00:53.409+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_0` | event | EG_Diele_Jalousie-2 Eingang 0 | Tastenereignis Eingang 0 Shelly EG Diele Jalousie | 2026-03-25T16:15:21.126+00:00 |  |
| `event.eg_diele_jalousie_2_eingang_1` | event | EG_Diele_Jalousie-2 Eingang 1 | Tastenereignis Eingang 1 Shelly EG Diele Jalousie | 2026-03-25T18:25:45.774+00:00 |  |
| `event.eg_essen_jalousie_eingang_0` | event | EG_Essen_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly EG Esszimmer Jalousie | 2026-03-29T11:16:41.154+00:00 |  |
| `event.eg_essen_jalousie_eingang_1` | event | EG_Essen_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly EG Esszimmer Jalousie | 2026-03-29T10:23:35.142+00:00 |  |
| `event.eg_kueche_jalousie_eingang_0` | event | EG_Kueche_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly EG Küche Jalousie | 2026-03-23T22:23:56.163+00:00 |  |
| `event.eg_kueche_jalousie_eingang_1` | event | EG_Kueche_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly EG Küche Jalousie | 2026-03-28T23:03:43.403+00:00 |  |
| `event.eg_wc_jalousie_eingang_0` | event | EG_WC_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly EG WC Jalousie | unknown |  |
| `event.eg_wc_jalousie_eingang_1` | event | EG_WC_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly EG WC Jalousie | unknown |  |
| `event.eg_wohnen_jalousie_1_eingang_0` | event | EG_Wohnen_Jalousie_1 Eingang 0 | Tastenereignis Eingang 0 Shelly EG Wohnzimmer Jalousie | 2026-03-27T20:39:23.299+00:00 |  |
| `event.eg_wohnen_jalousie_1_eingang_1` | event | EG_Wohnen_Jalousie_1 Eingang 1 | Tastenereignis Eingang 1 Shelly EG Wohnzimmer Jalousie | 2026-03-28T00:01:01.639+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_0` | event | EG_Wohnen_Jalousie_2 Eingang 0 | Tastenereignis Eingang 0 Shelly EG Wohnzimmer Jalousie | 2026-03-27T20:39:27.231+00:00 |  |
| `event.eg_wohnen_jalousie_2_eingang_1` | event | EG_Wohnen_Jalousie_2 Eingang 1 | Tastenereignis Eingang 1 Shelly EG Wohnzimmer Jalousie | 2026-03-28T23:05:42.869+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_0` | event | OG_Ankleide_Jalousie_1 Eingang 0 | Tastenereignis Eingang 0 Shelly OG Ankleide Jalousie | 2026-03-28T19:10:48.129+00:00 |  |
| `event.og_ankleide_jalousie_1_eingang_1` | event | OG_Ankleide_Jalousie_1 Eingang 1 | Tastenereignis Eingang 1 Shelly OG Ankleide Jalousie | 2026-03-28T19:10:45.553+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_0` | event | OG_Ankleide_Jalousie_2 Eingang 0 | Tastenereignis Eingang 0 Shelly OG Ankleide Jalousie | 2026-03-20T10:00:59.154+00:00 |  |
| `event.og_ankleide_jalousie_2_eingang_1` | event | OG_Ankleide_Jalousie_2 Eingang 1 | Tastenereignis Eingang 1 Shelly OG Ankleide Jalousie | 2026-03-20T06:16:27.687+00:00 |  |
| `event.og_bad_jalousie_1_eingang_0` | event | OG_Bad_Jalousie_1 Eingang 0 | Tastenereignis Eingang 0 Shelly OG Bad Jalousie | 2026-03-21T20:13:00.115+00:00 |  |
| `event.og_bad_jalousie_1_eingang_1` | event | OG_Bad_Jalousie_1 Eingang 1 | Tastenereignis Eingang 1 Shelly OG Bad Jalousie | 2026-03-21T20:12:58.456+00:00 |  |
| `event.og_bad_jalousie_2_eingang_0` | event | OG_Bad_Jalousie_2 Eingang 0 | Tastenereignis Eingang 0 Shelly OG Bad Jalousie | 2026-03-27T19:19:41.504+00:00 |  |
| `event.og_bad_jalousie_2_eingang_1` | event | OG_Bad_Jalousie_2 Eingang 1 | Tastenereignis Eingang 1 Shelly OG Bad Jalousie | 2026-03-27T19:22:06.894+00:00 |  |
| `event.og_flur_jalousie_eingang_0` | event | OG_Flur_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly OG Flur Jalousie | 2026-03-10T05:48:37.411+00:00 |  |
| `event.og_flur_jalousie_eingang_1` | event | OG_Flur_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly OG Flur Jalousie | 2026-03-21T18:32:14.683+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_0` | event | OG_Zimmer1_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly OG Zimmer 1 Jalousie | 2026-03-29T09:50:49.622+00:00 |  |
| `event.og_zimmer1_jalousie_eingang_1` | event | OG_Zimmer1_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly OG Zimmer 1 Jalousie | 2026-03-29T09:50:13.368+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_0` | event | OG_Zimmer2_Jalousie Eingang 0 | Tastenereignis Eingang 0 Shelly OG Zimmer 2 Jalousie | 2026-03-29T13:21:38.894+00:00 |  |
| `event.og_zimmer2_jalousie_eingang_1` | event | OG_Zimmer2_Jalousie Eingang 1 | Tastenereignis Eingang 1 Shelly OG Zimmer 2 Jalousie | 2026-03-29T11:52:52.509+00:00 |  |
| `sensor.dg_bad_jalousie_energie` | sensor | DG_Bad_Jalousie Energie | Energieverbrauch Shelly DG Bad Jalousie | 0.205154 | kWh |
| `sensor.dg_bad_jalousie_leistung` | sensor | DG_Bad_Jalousie Leistung | Aktuelle Leistung Shelly DG Bad Jalousie | 0.0 | W |
| `sensor.dg_buero_jalousie_energie` | sensor | DG_Buero_Jalousie Energie | Energieverbrauch Shelly DG Büro Jalousie | 0.226998 | kWh |
| `sensor.dg_buero_jalousie_leistung` | sensor | DG_Buero_Jalousie Leistung | Aktuelle Leistung Shelly DG Büro Jalousie | 0.0 | W |
| `sensor.dg_buero_workstation_energie` | sensor | DG_Buero_Workstation Energie | Energieverbrauch Shelly DG Büro Workstation-Steckdose | 19.380895 | kWh |
| `sensor.dg_buero_workstation_energieeinspeisung` | sensor | DG_Buero_Workstation Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly DG Büro Workstation-Steckdose | 0.0 | kWh |
| `sensor.dg_buero_workstation_leistung` | sensor | DG_Buero_Workstation Leistung | Aktuelle Leistung Shelly DG Büro Workstation-Steckdose | 0.0 | W |
| `sensor.dg_schlafen_jalousie_1_energie` | sensor | DG_Schlafen_Jalousie_1 Energie | Energieverbrauch Shelly DG Schlafzimmer Jalousie | 0.091196 | kWh |
| `sensor.dg_schlafen_jalousie_1_leistung` | sensor | DG_Schlafen_Jalousie_1 Leistung | Aktuelle Leistung Shelly DG Schlafzimmer Jalousie | 0.0 | W |
| `sensor.dg_schlafen_jalousie_2_energie` | sensor | DG_Schlafen_Jalousie_2 Energie | Energieverbrauch Shelly DG Schlafzimmer Jalousie | 0.254953 | kWh |
| `sensor.dg_schlafen_jalousie_2_leistung` | sensor | DG_Schlafen_Jalousie_2 Leistung | Aktuelle Leistung Shelly DG Schlafzimmer Jalousie | 0.0 | W |
| `sensor.eg_diele_jalousie_1_energie` | sensor | EG_Diele_Jalousie-1 Energie | Energieverbrauch Shelly EG Diele Jalousie | 0.157366 | kWh |
| `sensor.eg_diele_jalousie_1_leistung` | sensor | EG_Diele_Jalousie-1 Leistung | Aktuelle Leistung Shelly EG Diele Jalousie | 0.0 | W |
| `sensor.eg_diele_jalousie_2_energie` | sensor | EG_Diele_Jalousie-2 Energie | Energieverbrauch Shelly EG Diele Jalousie | 0.166871 | kWh |
| `sensor.eg_diele_jalousie_2_leistung` | sensor | EG_Diele_Jalousie-2 Leistung | Aktuelle Leistung Shelly EG Diele Jalousie | 0.0 | W |
| `sensor.eg_essen_jalousie_energie` | sensor | EG_Essen_Jalousie Energie | Energieverbrauch Shelly EG Esszimmer Jalousie | 0.578592 | kWh |
| `sensor.eg_essen_jalousie_leistung` | sensor | EG_Essen_Jalousie Leistung | Aktuelle Leistung Shelly EG Esszimmer Jalousie | 0.0 | W |
| `sensor.eg_kueche_jalousie_energie` | sensor | EG_Kueche_Jalousie Energie | Energieverbrauch Shelly EG Küche Jalousie | 0.219664 | kWh |
| `sensor.eg_kueche_jalousie_leistung` | sensor | EG_Kueche_Jalousie Leistung | Aktuelle Leistung Shelly EG Küche Jalousie | 0.0 | W |
| `sensor.eg_kueche_spuelmaschine_energie` | sensor | EG_Kueche_Spuelmaschine Energie | Energieverbrauch Shelly EG Küche Spülmaschine-Steckdose | 92.369809 | kWh |
| `sensor.eg_kueche_spuelmaschine_energieeinspeisung` | sensor | EG_Kueche_Spuelmaschine Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly EG Küche Spülmaschine-Steckdose | 0.0 | kWh |
| `sensor.eg_kueche_spuelmaschine_leistung` | sensor | EG_Kueche_Spuelmaschine Leistung | Aktuelle Leistung Shelly EG Küche Spülmaschine-Steckdose | 0.0 | W |
| `sensor.eg_wc_jalousie_energie` | sensor | EG_WC_Jalousie Energie | Energieverbrauch Shelly EG WC Jalousie | 0.153752 | kWh |
| `sensor.eg_wc_jalousie_leistung` | sensor | EG_WC_Jalousie Leistung | Aktuelle Leistung Shelly EG WC Jalousie | 0.0 | W |
| `sensor.eg_wc_licht_energie` | sensor | EG_WC_Licht Energie | Energieverbrauch Shelly EG WC Licht | 0.075458 | kWh |
| `sensor.eg_wc_licht_energieeinspeisung` | sensor | EG_WC_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly EG WC Licht | 0.0 | kWh |
| `sensor.eg_wc_licht_leistung` | sensor | EG_WC_Licht Leistung | Aktuelle Leistung Shelly EG WC Licht | 0.0 | W |
| `sensor.eg_wohnen_jalousie_1_energie` | sensor | EG_Wohnen_Jalousie_1 Energie | Energieverbrauch Shelly EG Wohnzimmer Jalousie | 0.344178 | kWh |
| `sensor.eg_wohnen_jalousie_1_leistung` | sensor | EG_Wohnen_Jalousie_1 Leistung | Aktuelle Leistung Shelly EG Wohnzimmer Jalousie | 0.0 | W |
| `sensor.eg_wohnen_jalousie_2_energie` | sensor | EG_Wohnen_Jalousie_2 Energie | Energieverbrauch Shelly EG Wohnzimmer Jalousie | 0.555838 | kWh |
| `sensor.eg_wohnen_jalousie_2_leistung` | sensor | EG_Wohnen_Jalousie_2 Leistung | Aktuelle Leistung Shelly EG Wohnzimmer Jalousie | 0.0 | W |
| `sensor.kg_flur_kuehlschrank_energie` | sensor | KG_Flur_Kuehlschrank Energie | Energieverbrauch Shelly KG Flur Kühlschrank-Steckdose | 27.112251 | kWh |
| `sensor.kg_flur_kuehlschrank_energieeinspeisung` | sensor | KG_Flur_Kuehlschrank Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Flur Kühlschrank-Steckdose | 0.0 | kWh |
| `sensor.kg_flur_kuehlschrank_leistung` | sensor | KG_Flur_Kuehlschrank Leistung | Aktuelle Leistung Shelly KG Flur Kühlschrank-Steckdose | 42.7 | W |
| `sensor.kg_keller_licht_energie` | sensor | KG_Keller_Licht Energie | Energieverbrauch Shelly KG Keller Licht | 2.482879 | kWh |
| `sensor.kg_keller_licht_energieeinspeisung` | sensor | KG_Keller_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Keller Licht | 0.0 | kWh |
| `sensor.kg_keller_licht_leistung` | sensor | KG_Keller_Licht Leistung | Aktuelle Leistung Shelly KG Keller Licht | 0.0 | W |
| `sensor.kg_technik_serverschrank_energie` | sensor | KG_Technik_Serverschrank Energie | Energieverbrauch Shelly KG Technik Serverschrank-Steckdose | 100.308807 | kWh |
| `sensor.kg_technik_serverschrank_energieeinspeisung` | sensor | KG_Technik_Serverschrank Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Technik Serverschrank-Steckdose | 0.0 | kWh |
| `sensor.kg_technik_serverschrank_leistung` | sensor | KG_Technik_Serverschrank Leistung | Aktuelle Leistung Shelly KG Technik Serverschrank-Steckdose | 84.3 | W |
| `sensor.kg_technik_trockner_energie` | sensor | KG_Technik_Trockner Energie | Energieverbrauch Shelly KG Technik Trockner-Steckdose | 22.120708 | kWh |
| `sensor.kg_technik_trockner_energieeinspeisung` | sensor | KG_Technik_Trockner Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Technik Trockner-Steckdose | 0.0 | kWh |
| `sensor.kg_technik_trockner_leistung` | sensor | KG_Technik_Trockner Leistung | Aktuelle Leistung Shelly KG Technik Trockner-Steckdose | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_energie` | sensor | KG_Technik_Waermepumpe_3EM Energie | Energieverbrauch Shelly KG Technik Wärmepumpe-3EM Energiemesser | 1095.1253 | kWh |
| `sensor.kg_technik_waermepumpe_3em_energieeinspeisung` | sensor | KG_Technik_Waermepumpe_3EM Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Technik Wärmepumpe-3EM Energiemesser | 0.0 | kWh |
| `sensor.kg_technik_waermepumpe_3em_leistung` | sensor | KG_Technik_Waermepumpe_3EM Leistung | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 1019.079 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistung | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 969.5 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_a_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase A Leistungsfaktor | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 0.95 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_a_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase A Scheinleistung | Scheinleistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 1024.3 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistung | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 49.6 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_b_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase B Leistungsfaktor | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 0.52 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_b_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase B Scheinleistung | Scheinleistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 94.7 | VA |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistung | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 0.0 | W |
| `sensor.kg_technik_waermepumpe_3em_phase_c_leistungsfaktor` | sensor | KG_Technik_Waermepumpe_3EM Phase C Leistungsfaktor | Aktuelle Leistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 0.0 |  |
| `sensor.kg_technik_waermepumpe_3em_phase_c_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Phase C Scheinleistung | Scheinleistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 6.5 | VA |
| `sensor.kg_technik_waermepumpe_3em_scheinleistung` | sensor | KG_Technik_Waermepumpe_3EM Scheinleistung | Scheinleistung Shelly KG Technik Wärmepumpe-3EM Energiemesser | 1125.449 | VA |
| `sensor.kg_technik_waermepumpe_3em_temperatur` | sensor | KG_Technik_Waermepumpe_3EM Temperatur | Gerätetemperatur Shelly KG Technik Wärmepumpe-3EM Energiemesser | 48.7 | °C |
| `sensor.kg_technik_waschmaschine_energie` | sensor | KG_Technik_Waschmaschine Energie | Energieverbrauch Shelly KG Technik Waschmaschine-Steckdose | 52.064359 | kWh |
| `sensor.kg_technik_waschmaschine_energieeinspeisung` | sensor | KG_Technik_Waschmaschine Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly KG Technik Waschmaschine-Steckdose | 0.0 | kWh |
| `sensor.kg_technik_waschmaschine_leistung` | sensor | KG_Technik_Waschmaschine Leistung | Aktuelle Leistung Shelly KG Technik Waschmaschine-Steckdose | 0.0 | W |
| `sensor.og_ankleide_jalousie_1_energie` | sensor | OG_Ankleide_Jalousie_1 Energie | Energieverbrauch Shelly OG Ankleide Jalousie | 0.154835 | kWh |
| `sensor.og_ankleide_jalousie_1_leistung` | sensor | OG_Ankleide_Jalousie_1 Leistung | Aktuelle Leistung Shelly OG Ankleide Jalousie | 0.0 | W |
| `sensor.og_ankleide_jalousie_2_energie` | sensor | OG_Ankleide_Jalousie_2 Energie | Energieverbrauch Shelly OG Ankleide Jalousie | 0.154695 | kWh |
| `sensor.og_ankleide_jalousie_2_leistung` | sensor | OG_Ankleide_Jalousie_2 Leistung | Aktuelle Leistung Shelly OG Ankleide Jalousie | 0.0 | W |
| `sensor.og_ankleide_licht_energie` | sensor | OG_Ankleide_Licht Energie | Energieverbrauch Shelly OG Ankleide Licht | 0.997598 | kWh |
| `sensor.og_ankleide_licht_energieeinspeisung` | sensor | OG_Ankleide_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly OG Ankleide Licht | 0.0 | kWh |
| `sensor.og_ankleide_licht_leistung` | sensor | OG_Ankleide_Licht Leistung | Aktuelle Leistung Shelly OG Ankleide Licht | 0.0 | W |
| `sensor.og_bad_jalousie_1_energie` | sensor | OG_Bad_Jalousie_1 Energie | Energieverbrauch Shelly OG Bad Jalousie | 0.094603 | kWh |
| `sensor.og_bad_jalousie_1_leistung` | sensor | OG_Bad_Jalousie_1 Leistung | Aktuelle Leistung Shelly OG Bad Jalousie | 0.0 | W |
| `sensor.og_bad_jalousie_2_energie` | sensor | OG_Bad_Jalousie_2 Energie | Energieverbrauch Shelly OG Bad Jalousie | 0.119552 | kWh |
| `sensor.og_bad_jalousie_2_leistung` | sensor | OG_Bad_Jalousie_2 Leistung | Aktuelle Leistung Shelly OG Bad Jalousie | 0.0 | W |
| `sensor.og_bad_licht_energie` | sensor | OG_Bad_Licht Energie | Energieverbrauch Shelly OG Bad Licht | 4.050056 | kWh |
| `sensor.og_bad_licht_energieeinspeisung` | sensor | OG_Bad_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly OG Bad Licht | 0.0 | kWh |
| `sensor.og_bad_licht_leistung` | sensor | OG_Bad_Licht Leistung | Aktuelle Leistung Shelly OG Bad Licht | 0.0 | W |
| `sensor.og_flur_jalousie_energie` | sensor | OG_Flur_Jalousie Energie | Energieverbrauch Shelly OG Flur Jalousie | 0.295532 | kWh |
| `sensor.og_flur_jalousie_leistung` | sensor | OG_Flur_Jalousie Leistung | Aktuelle Leistung Shelly OG Flur Jalousie | 0.0 | W |
| `sensor.og_zimmer1_jalousie_energie` | sensor | OG_Zimmer1_Jalousie Energie | Energieverbrauch Shelly OG Zimmer 1 Jalousie | 0.222359 | kWh |
| `sensor.og_zimmer1_jalousie_leistung` | sensor | OG_Zimmer1_Jalousie Leistung | Aktuelle Leistung Shelly OG Zimmer 1 Jalousie | 0.0 | W |
| `sensor.og_zimmer1_licht_energie` | sensor | OG_Zimmer1_Licht Energie | Energieverbrauch Shelly OG Zimmer 1 Licht | 2.896542 | kWh |
| `sensor.og_zimmer1_licht_energieeinspeisung` | sensor | OG_Zimmer1_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly OG Zimmer 1 Licht | 0.0 | kWh |
| `sensor.og_zimmer1_licht_leistung` | sensor | OG_Zimmer1_Licht Leistung | Aktuelle Leistung Shelly OG Zimmer 1 Licht | 0.0 | W |
| `sensor.og_zimmer2_jalousie_energie` | sensor | OG_Zimmer2_Jalousie Energie | Energieverbrauch Shelly OG Zimmer 2 Jalousie | 0.193698 | kWh |
| `sensor.og_zimmer2_jalousie_leistung` | sensor | OG_Zimmer2_Jalousie Leistung | Aktuelle Leistung Shelly OG Zimmer 2 Jalousie | 0.0 | W |
| `sensor.og_zimmer2_licht_energie` | sensor | OG_Zimmer2_Licht Energie | Energieverbrauch Shelly OG Zimmer 2 Licht | 0.043028 | kWh |
| `sensor.og_zimmer2_licht_energieeinspeisung` | sensor | OG_Zimmer2_Licht Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly OG Zimmer 2 Licht | 0.0 | kWh |
| `sensor.og_zimmer2_licht_leistung` | sensor | OG_Zimmer2_Licht Leistung | Aktuelle Leistung Shelly OG Zimmer 2 Licht | 0.0 | W |
| `sensor.og_zimmer2_lichtstreifen_energie` | sensor | OG_Zimmer2_Lichtstreifen Energie | Energieverbrauch Shelly OG Zimmer 2 LED-Lichtstreifen | 2.523 | kWh |
| `sensor.og_zimmer2_lichtstreifen_energieeinspeisung` | sensor | OG_Zimmer2_Lichtstreifen Energieeinspeisung | Energieeinspeisung (Rückleistung) Shelly OG Zimmer 2 LED-Lichtstreifen | 0.0 | kWh |
| `sensor.og_zimmer2_lichtstreifen_leistung` | sensor | OG_Zimmer2_Lichtstreifen Leistung | Aktuelle Leistung Shelly OG Zimmer 2 LED-Lichtstreifen | 0.0 | W |
| `switch.dg_buero_workstation` | switch | DG_Buero_Workstation | Shelly-Schalter DG Büro Workstation-Steckdose | off |  |
| `switch.eg_kueche_spuelmaschine` | switch | EG_Kueche_Spuelmaschine | Shelly-Schalter EG Küche Spülmaschine-Steckdose | on |  |
| `switch.eg_wc_licht` | switch | EG_WC_Licht | Shelly-Schalter EG WC Licht | off |  |
| `switch.kg_flur_kuehlschrank` | switch | KG_Flur_Kuehlschrank | Shelly-Schalter KG Flur Kühlschrank-Steckdose | on |  |
| `switch.kg_keller_licht` | switch | KG_Keller_Licht | Shelly-Schalter KG Keller Licht | off |  |
| `switch.kg_technik_serverschrank` | switch | KG_Technik_Serverschrank | Shelly-Schalter KG Technik Serverschrank-Steckdose | on |  |
| `switch.kg_technik_trockner` | switch | KG_Technik_Trockner | Shelly-Schalter KG Technik Trockner-Steckdose | on |  |
| `switch.kg_technik_waschmaschine` | switch | KG_Technik_Waschmaschine | Shelly-Schalter KG Technik Waschmaschine-Steckdose | on |  |
| `switch.og_ankleide_licht` | switch | OG_Ankleide_Licht | Shelly-Schalter OG Ankleide Licht | off |  |
| `switch.og_bad_licht` | switch | OG_Bad_Licht | Shelly-Schalter OG Bad Licht | off |  |
| `switch.og_zimmer1_licht` | switch | OG_Zimmer1_Licht | Shelly-Schalter OG Zimmer 1 Licht | off |  |
| `switch.og_zimmer2_licht` | switch | OG_Zimmer2_Licht | Shelly-Schalter OG Zimmer 2 Licht | off |  |
| `switch.og_zimmer2_lichtstreifen` | switch | OG_Zimmer2_Lichtstreifen | Shelly-Schalter OG Zimmer 2 LED-Lichtstreifen | off |  |
| `update.dg_bad_jalousie_firmware` | update | DG_Bad_Jalousie Firmware | Firmware-Update Shelly DG Bad Jalousie | off |  |
| `update.dg_buero_jalousie_firmware` | update | DG_Buero_Jalousie Firmware | Firmware-Update Shelly DG Büro Jalousie | off |  |
| `update.dg_buero_workstation_firmware` | update | DG_Buero_Workstation Firmware | Firmware-Update Shelly DG Büro Workstation-Steckdose | off |  |
| `update.dg_schlafen_jalousie_1_firmware` | update | DG_Schlafen_Jalousie_1 Firmware | Firmware-Update Shelly DG Schlafzimmer Jalousie | off |  |
| `update.dg_schlafen_jalousie_2_firmware` | update | DG_Schlafen_Jalousie_2 Firmware | Firmware-Update Shelly DG Schlafzimmer Jalousie | off |  |
| `update.eg_diele_jalousie_1_firmware` | update | EG_Diele_Jalousie-1 Firmware | Firmware-Update Shelly EG Diele Jalousie | off |  |
| `update.eg_diele_jalousie_2_firmware` | update | EG_Diele_Jalousie-2 Firmware | Firmware-Update Shelly EG Diele Jalousie | off |  |
| `update.eg_essen_jalousie_firmware` | update | EG_Essen_Jalousie Firmware | Firmware-Update Shelly EG Esszimmer Jalousie | off |  |
| `update.eg_kueche_jalousie_firmware` | update | EG_Kueche_Jalousie Firmware | Firmware-Update Shelly EG Küche Jalousie | off |  |
| `update.eg_kueche_spuelmaschine_firmware` | update | EG_Kueche_Spuelmaschine Firmware | Firmware-Update Shelly EG Küche Spülmaschine-Steckdose | off |  |
| `update.eg_wc_jalousie_firmware` | update | EG_WC_Jalousie Firmware | Firmware-Update Shelly EG WC Jalousie | off |  |
| `update.eg_wc_licht_firmware` | update | EG_WC_Licht Firmware | Firmware-Update Shelly EG WC Licht | off |  |
| `update.eg_wohnen_jalousie_1_firmware` | update | EG_Wohnen_Jalousie_1 Firmware | Firmware-Update Shelly EG Wohnzimmer Jalousie | off |  |
| `update.eg_wohnen_jalousie_2_firmware` | update | EG_Wohnen_Jalousie_2 Firmware | Firmware-Update Shelly EG Wohnzimmer Jalousie | off |  |
| `update.kg_flur_kuehlschrank_firmware` | update | KG_Flur_Kuehlschrank Firmware | Firmware-Update Shelly KG Flur Kühlschrank-Steckdose | off |  |
| `update.kg_keller_licht_firmware` | update | KG_Keller_Licht Firmware | Firmware-Update Shelly KG Keller Licht | off |  |
| `update.kg_technik_serverschrank_firmware` | update | KG_Technik_Serverschrank Firmware | Firmware-Update Shelly KG Technik Serverschrank-Steckdose | off |  |
| `update.kg_technik_trockner_firmware` | update | KG_Technik_Trockner Firmware | Firmware-Update Shelly KG Technik Trockner-Steckdose | off |  |
| `update.kg_technik_waermepumpe_3em_firmware` | update | KG_Technik_Waermepumpe_3EM Firmware | Firmware-Update Shelly KG Technik Wärmepumpe-3EM Energiemesser | off |  |
| `update.kg_technik_waschmaschine_firmware` | update | KG_Technik_Waschmaschine Firmware | Firmware-Update Shelly KG Technik Waschmaschine-Steckdose | off |  |
| `update.og_ankleide_jalousie_1_firmware` | update | OG_Ankleide_Jalousie_1 Firmware | Firmware-Update Shelly OG Ankleide Jalousie | off |  |
| `update.og_ankleide_jalousie_2_firmware` | update | OG_Ankleide_Jalousie_2 Firmware | Firmware-Update Shelly OG Ankleide Jalousie | off |  |
| `update.og_ankleide_licht_firmware` | update | OG_Ankleide_Licht Firmware | Firmware-Update Shelly OG Ankleide Licht | off |  |
| `update.og_bad_jalousie_1_firmware` | update | OG_Bad_Jalousie_1 Firmware | Firmware-Update Shelly OG Bad Jalousie | off |  |
| `update.og_bad_jalousie_2_firmware` | update | OG_Bad_Jalousie_2 Firmware | Firmware-Update Shelly OG Bad Jalousie | off |  |
| `update.og_bad_licht_firmware` | update | OG_Bad_Licht Firmware | Firmware-Update Shelly OG Bad Licht | off |  |
| `update.og_flur_jalousie_firmware` | update | OG_Flur_Jalousie Firmware | Firmware-Update Shelly OG Flur Jalousie | off |  |
| `update.og_zimmer1_jalousie_firmware` | update | OG_Zimmer1_Jalousie Firmware | Firmware-Update Shelly OG Zimmer 1 Jalousie | off |  |
| `update.og_zimmer1_licht_firmware` | update | OG_Zimmer1_Licht Firmware | Firmware-Update Shelly OG Zimmer 1 Licht | off |  |
| `update.og_zimmer2_jalousie_firmware` | update | OG_Zimmer2_Jalousie Firmware | Firmware-Update Shelly OG Zimmer 2 Jalousie | off |  |
| `update.og_zimmer2_licht_firmware` | update | OG_Zimmer2_Licht Firmware | Firmware-Update Shelly OG Zimmer 2 Licht | off |  |
| `update.og_zimmer2_lichtstreifen_firmware` | update | OG_Zimmer2_Lichtstreifen Firmware | Firmware-Update Shelly OG Zimmer 2 LED-Lichtstreifen | off |  |

## Solcast

20 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `select.solcast_pv_forecast_verwenden_sie_das_prognosefeld` | select | Solcast PV Forecast Verwenden Sie das Prognosefeld | Solcast PV-Prognose: Solcast PV Forecast Verwenden Sie das Prognosefeld | estimate |  |
| `sensor.solcast_pv_forecast_aktuelle_leistung` | sensor | Solcast PV Forecast Aktuelle Leistung | Solcast PV-Prognose: Solcast PV Forecast Aktuelle Leistung | 0 | W |
| `sensor.solcast_pv_forecast_fester_grenzwert_eingestellt` | sensor | Solcast PV Forecast Fester Grenzwert eingestellt | Solcast PV-Prognose: Solcast PV Forecast Fester Grenzwert eingestellt | False |  |
| `sensor.solcast_pv_forecast_leistung_in_1_stunde` | sensor | Solcast PV Forecast Leistung in 1 Stunde | Solcast PV-Prognose: Solcast PV Forecast Leistung in 1 Stunde | 0 | W |
| `sensor.solcast_pv_forecast_leistung_in_30_minuten` | sensor | Solcast PV Forecast Leistung in 30 Minuten | Solcast PV-Prognose: Solcast PV Forecast Leistung in 30 Minuten | 0 | W |
| `sensor.solcast_pv_forecast_max_api_abrufe` | sensor | Solcast PV Forecast max. API-Abrufe | Verbleibende Solcast API-Abfragen heute | 10 |  |
| `sensor.solcast_pv_forecast_prognose_aktuelle_stunde` | sensor | Solcast PV Forecast Prognose aktuelle Stunde | Solcast PV-Prognose: Solcast PV Forecast Prognose aktuelle Stunde | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_heute` | sensor | Solcast PV Forecast Prognose heute | Solcast PV-Erzeugungsprognose für heute | 15.9095 | kWh |
| `sensor.solcast_pv_forecast_prognose_morgen` | sensor | Solcast PV Forecast Prognose morgen | Solcast PV-Erzeugungsprognose für morgen | 37.7692 | kWh |
| `sensor.solcast_pv_forecast_prognose_nachste_stunde` | sensor | Solcast PV Forecast Prognose nächste Stunde | Solcast PV-Prognose: Solcast PV Forecast Prognose nächste Stunde | 0 | Wh |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_heute` | sensor | Solcast PV Forecast Prognose Spitzenleistung heute | Solcast PV-Prognose: Solcast PV Forecast Prognose Spitzenleistung heute | 2471 | W |
| `sensor.solcast_pv_forecast_prognose_spitzenleistung_morgen` | sensor | Solcast PV Forecast Prognose Spitzenleistung morgen | Solcast PV-Prognose: Solcast PV Forecast Prognose Spitzenleistung morgen | 5282 | W |
| `sensor.solcast_pv_forecast_prognose_verbleibende_leistung_heute` | sensor | Solcast PV Forecast Prognose verbleibende Leistung heute | Solcast PV-Prognose: Solcast PV Forecast Prognose verbleibende Leistung heute | 0 | kWh |
| `sensor.solcast_pv_forecast_verwendete_api_abrufe` | sensor | Solcast PV Forecast Verwendete API-Abrufe | Verbleibende Solcast API-Abfragen heute | 10 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_letzter_api_abruf` | sensor | Solcast PV Forecast Zeitpunkt letzter API-Abruf | Verbleibende Solcast API-Abfragen heute | 2026-04-04T15:24:22+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_heute` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung heute | Solcast PV-Prognose: Solcast PV Forecast Zeitpunkt Spitzenleistung heute | 2026-04-04T12:00:00+00:00 |  |
| `sensor.solcast_pv_forecast_zeitpunkt_spitzenleistung_morgen` | sensor | Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | Solcast PV-Prognose: Solcast PV Forecast Zeitpunkt Spitzenleistung morgen | 2026-04-05T10:00:00+00:00 |  |
| `sensor.vorderer_schaftrieb_10` | sensor | Solcast PV Forecast Vorderer Schaftrieb 10 | Solcast PV-Prognose: Solcast PV Forecast Vorderer Schaftrieb 10 | 6.943 | kWh |
| `sensor.vorderer_schaftrieb_10_west` | sensor | Solcast PV Forecast Vorderer Schaftrieb 10 (West) | Solcast PV-Prognose: Solcast PV Forecast Vorderer Schaftrieb 10 (West) | 8.9665 | kWh |
| `update.solcast_pv_forecast_update` | update | Solcast PV Forecast Update | Solcast PV-Prognose: Solcast PV Forecast Update | off |  |

## Sonos

7 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `media_player.box` | media_player | Box | Sonos Lautsprecher Box — Medienwiedergabe | idle |  |
| `media_player.lounge` | media_player | Lounge | Sonos Lautsprecher Lounge — Medienwiedergabe | off |  |
| `number.box_balance` | number | Box Balance | Sonos Box Balance-Einstellung | 0 |  |
| `number.box_bass` | number | Box Bass | Sonos Box Bass-Einstellung | 0 |  |
| `number.box_treble` | number | Box Höhen | Sonos Box Höhen-Einstellung | 0 |  |
| `switch.box_crossfade` | switch | Box Überblenden | Sonos Box Crossfade ein/aus | off |  |
| `switch.box_loudness` | switch | Box Loudness | Sonos Box Loudness ein/aus | on |  |

## Sun (HA built-in)

7 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `sensor.sun_next_dawn` | sensor | Sun Nächste Morgendämmerung | Nächste Morgendämmerung (Sonnenaufgang) | 2026-04-05T04:22:55+00:00 |  |
| `sensor.sun_next_dusk` | sensor | Sun Nächste Abenddämmerung | Nächste Abenddämmerung (Sonnenuntergang) | 2026-04-05T18:35:31+00:00 |  |
| `sensor.sun_next_midnight` | sensor | Sun Nächste Mitternacht | Nächste Mitternacht (Sonnentiefstand) | 2026-04-04T23:28:41+00:00 |  |
| `sensor.sun_next_noon` | sensor | Sun Nächster Höchststand | Nächster Sonnenhöchststand (Mittag) | 2026-04-05T11:28:48+00:00 |  |
| `sensor.sun_next_rising` | sensor | Sun Nächster Aufgang | Nächster Sonnenaufgang | 2026-04-05T04:55:49+00:00 |  |
| `sensor.sun_next_setting` | sensor | Sun Nächster Untergang | Nächster Sonnenuntergang | 2026-04-05T18:02:29+00:00 |  |
| `sun.sun` | sun | Sun | Sonnenstand (über/unter Horizont) mit Azimut/Elevation | below_horizon |  |

## Sungrow (Modbus)

151 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `automation.sungrow_dashboard_enable_danger_mode_auto_reset` | automation | sungrow dashboard enable danger mode auto reset | UNBEKANNT: Sungrow-Modbus-Register — sungrow dashboard enable danger mode auto reset | on |  |
| `automation.sungrow_max_export_scene_sets_rated_limit` | automation | sungrow max export scene sets rated limit | UNBEKANNT: Sungrow-Modbus-Register — sungrow max export scene sets rated limit | on |  |
| `automation.sungrow_self_consumption_mode_max_battery_discharge_scene_sets_rated_limit` | automation | sungrow self consumption mode max battery discharge scene sets rated limit | UNBEKANNT: Sungrow-Modbus-Register — sungrow self consumption mode max battery discharge scene sets rated limit | on |  |
| `binary_sensor.battery_charging` | binary_sensor | Battery charging | Aktuelle Ladeleistung der SBR128 Batterie | off |  |
| `binary_sensor.battery_charging_delay` | binary_sensor | Battery charging (delay) | Aktuelle Ladeleistung der SBR128 Batterie | off |  |
| `binary_sensor.battery_discharging` | binary_sensor | Battery discharging | Aktuelle Entladeleistung der SBR128 Batterie | on |  |
| `binary_sensor.battery_discharging_delay` | binary_sensor | Battery discharging (delay) | Aktuelle Entladeleistung der SBR128 Batterie | on |  |
| `binary_sensor.negative_load_power` | binary_sensor | Negative Load Power | UNBEKANNT: Sungrow-Modbus-Register — Negative Load Power | off |  |
| `binary_sensor.negative_load_power_delay` | binary_sensor | Negative Load Power (delay) | UNBEKANNT: Sungrow-Modbus-Register — Negative Load Power (delay) | off |  |
| `binary_sensor.positive_load_power` | binary_sensor | Positive Load Power | UNBEKANNT: Sungrow-Modbus-Register — Positive Load Power | on |  |
| `binary_sensor.positive_load_power_delay` | binary_sensor | Positive Load Power (delay) | UNBEKANNT: Sungrow-Modbus-Register — Positive Load Power (delay) | on |  |
| `button.start_inverter` | button | Start inverter | Wechselrichter starten (Modbus-Befehl) | unknown |  |
| `button.stop_inverter` | button | Stop inverter | Wechselrichter stoppen (Modbus-Befehl) | unknown |  |
| `number.battery_charging_start_power` | number | Battery charging start power | Aktuelle Ladeleistung der SBR128 Batterie | 0.0 | W |
| `number.battery_discharging_start_power` | number | Battery discharging start power | Aktuelle Entladeleistung der SBR128 Batterie | 0.0 | W |
| `number.battery_forced_charge_discharge_power` | number | Battery forced charge discharge power | Erzwungene Ladung der SBR128 Batterie aktiv/inaktiv | 4630.0 | W |
| `number.battery_max_charge_power` | number | Battery max charge power | Maximale Ladeleistung der SBR128 Batterie | 10600.0 | W |
| `number.battery_max_discharge_power` | number | Battery max discharge power | Maximale Entladeleistung der SBR128 Batterie | 10600.0 | W |
| `number.battery_max_soc` | number | Battery Max Soc | Maximaler Ladestand (SOC) der SBR128 Batterie | 100.0 | % |
| `number.battery_min_soc` | number | Battery Min Soc | Minimaler Ladestand (SOC) der SBR128 Batterie | 5.0 | % |
| `number.export_power_limit` | number | Export power limit | Aktuelle Netzeinspeisung (Stromexport ins Netz) | 10000.0 | W |
| `scene.battery_forced_charge` | scene | Battery Forced Charge | Erzwungene Ladung der SBR128 Batterie aktiv/inaktiv | unknown |  |
| `scene.max_export_power` | scene | Max Export Power | Aktuelle Netzeinspeisung (Stromexport ins Netz) | unknown |  |
| `scene.self_consumption_mode_max_battery_discharge` | scene | Self-Consumption Mode (max battery discharge) | UNBEKANNT: Sungrow-Modbus-Register — Self-Consumption Mode (max battery discharge) | unknown |  |
| `scene.self_consumption_mode_no_battery_discharge` | scene | Self-Consumption Mode (no battery discharge) | UNBEKANNT: Sungrow-Modbus-Register — Self-Consumption Mode (no battery discharge) | unknown |  |
| `scene.zero_export_power` | scene | Zero Export Power | Aktuelle Netzeinspeisung (Stromexport ins Netz) | unknown |  |
| `select.battery_forced_charge_discharge` | select | Battery forced charge discharge | Erzwungene Ladung der SBR128 Batterie aktiv/inaktiv | Forced charge |  |
| `select.ems_mode` | select | EMS mode | EMS-Betriebsmodus des Sungrow-Energiemanagers | Self-consumption mode (default) |  |
| `select.load_adjustment_mode` | select | Load adjustment mode | Lastanpassung des Sungrow-Energiemanagers | Disabled |  |
| `sensor.active_power_limitation_ratio_raw` | sensor | Active power limitation ratio raw | Modbus-Rohwert: Aktive Leistungsbegrenzung (APL) | 6554 | % |
| `sensor.active_power_limitation_raw` | sensor | Active power limitation raw | Modbus-Rohwert: Aktive Leistungsbegrenzung (APL) | 65535 |  |
| `sensor.apl_shutdown_at_zero_raw` | sensor | APL shutdown at zero raw | Modbus-Rohwert: APL-Abschaltung bei Null-Leistung | 85 |  |
| `sensor.backup_phase_a_power` | sensor | Backup phase A power | Leistung/Messwert Phase A (L1) | 0 | W |
| `sensor.backup_phase_b_power` | sensor | Backup phase B power | Leistung/Messwert Phase B (L2) | 0 | W |
| `sensor.backup_phase_c_power` | sensor | Backup phase C power | Leistung/Messwert Phase C (L3) | 0 | W |
| `sensor.battery_capacity_high_precision` | sensor | Battery capacity high precision | Nennkapazität der SBR128 Batterie in kWh | 12.80 | kWh |
| `sensor.battery_charge` | sensor | Battery charge | UNBEKANNT: Sungrow-Modbus-Register — Battery charge | 9.83 | kWh |
| `sensor.battery_charge_health_rated` | sensor | Battery charge (health-rated) | UNBEKANNT: Sungrow-Modbus-Register — Battery charge (health-rated) | 9.73 | kWh |
| `sensor.battery_charge_nominal` | sensor | Battery charge (nominal) | UNBEKANNT: Sungrow-Modbus-Register — Battery charge (nominal) | 10.5 | kWh |
| `sensor.battery_charging_power` | sensor | Battery charging power | Aktuelle Ladeleistung der SBR128 Batterie | 0 | W |
| `sensor.battery_charging_power_signed` | sensor | Battery charging power signed | Aktuelle Ladeleistung der SBR128 Batterie | -1297 | W |
| `sensor.battery_charging_start_power` | sensor | Battery charging start power | Aktuelle Ladeleistung der SBR128 Batterie | 0 | W |
| `sensor.battery_current` | sensor | Battery current | Aktueller Lade-/Entladestrom der SBR128 Batterie | 5.1 | A |
| `sensor.battery_discharging_power` | sensor | Battery discharging power | Aktuelle Entladeleistung der SBR128 Batterie | 1297 | W |
| `sensor.battery_discharging_power_signed` | sensor | Battery discharging power signed | Aktuelle Entladeleistung der SBR128 Batterie | 1297 | W |
| `sensor.battery_discharging_start_power` | sensor | Battery discharging start power | Aktuelle Entladeleistung der SBR128 Batterie | 0 | W |
| `sensor.battery_firmware_version` | sensor | Battery Firmware Version | Firmware-Version des SBR128 Batterie-BMS |                                |  |
| `sensor.battery_forced_charge_discharge_cmd_raw` | sensor | Battery forced charge discharge cmd raw | Erzwungene Ladung der SBR128 Batterie aktiv/inaktiv | 170 |  |
| `sensor.battery_forced_charge_discharge_power` | sensor | Battery forced charge discharge power | Erzwungene Ladung der SBR128 Batterie aktiv/inaktiv | 4630 | W |
| `sensor.battery_level` | sensor | Battery level | Ladestand der SBR128 Batterie (12.8 kWh) in Prozent | 80.8 | % |
| `sensor.battery_level_nominal` | sensor | Battery level (nominal) | UNBEKANNT: Sungrow-Modbus-Register — Battery level (nominal) | 81.8 | % |
| `sensor.battery_max_charge_power` | sensor | Battery max charge power | Maximale Ladeleistung der SBR128 Batterie | 10600 | W |
| `sensor.battery_max_discharge_power` | sensor | Battery max discharge power | Maximale Entladeleistung der SBR128 Batterie | 10600 | W |
| `sensor.battery_max_soc` | sensor | Battery max SoC | Maximaler Ladestand (SOC) der SBR128 Batterie | 100.0 | % |
| `sensor.battery_min_soc` | sensor | Battery min SoC | Minimaler Ladestand (SOC) der SBR128 Batterie | 5.0 | % |
| `sensor.battery_power` | sensor | Battery power | Aktuelle Lade-/Entladeleistung der SBR128 Batterie | 1297 | W |
| `sensor.battery_state_of_health` | sensor | Battery state of health | Gesundheitszustand (SOH) der SBR128 Batterie | 99 | % |
| `sensor.battery_temperature` | sensor | Battery temperature | Temperatur der SBR128 Batterie | 23.0 | °C |
| `sensor.battery_voltage` | sensor | Battery voltage | Spannung der SBR128 Batterie | 263.0 | V |
| `sensor.bdc_rated_power` | sensor | BDC rated power | Nennleistung des Batterie-DC-Wandlers (BDC) | 10000 | W |
| `sensor.bms_max_charging_current` | sensor | BMS max. charging current | Max. Ladestrom laut Batterie-BMS | 30 | A |
| `sensor.bms_max_discharging_current` | sensor | BMS max. discharging current | Max. Entladestrom laut Batterie-BMS | 30 | A |
| `sensor.communication_module_firmware_version` | sensor | Communication Module Firmware Version | Firmware-Version des Sungrow Kommunikationsmoduls |                                |  |
| `sensor.daily_battery_charge` | sensor | Daily battery charge | Heutige Batterie-Lademenge der SBR128 | 6.9 | kWh |
| `sensor.daily_battery_charge_from_pv` | sensor | Daily battery charge from PV | Heutige Batterie-Lademenge der SBR128 | 6.9 | kWh |
| `sensor.daily_battery_discharge` | sensor | Daily battery discharge | Heutige Batterie-Entlademenge der SBR128 | 7.1 | kWh |
| `sensor.daily_consumed_energy` | sensor | Daily consumed energy | Heutiger Gesamtenergieverbrauch des Haushalts | 12.5 | kWh |
| `sensor.daily_consumed_energy_filtered` | sensor | Daily consumed energy (filtered) | Heutiger Gesamtenergieverbrauch des Haushalts | 12.38 | kWh |
| `sensor.daily_direct_energy_consumption` | sensor | Daily direct energy consumption | Heutiger PV-Direktverbrauch (ohne Batterie/Netz) | 5.4 | kWh |
| `sensor.daily_exported_energy` | sensor | Daily exported energy | Heutige ins Netz eingespeiste Energiemenge | 5.6 | kWh |
| `sensor.daily_exported_energy_from_pv` | sensor | Daily exported energy from PV | Heutige ins Netz eingespeiste Energiemenge | 5.6 | kWh |
| `sensor.daily_imported_energy` | sensor | Daily imported energy | Heutige aus dem Netz bezogene Energiemenge | 0.0 | kWh |
| `sensor.daily_pv_generation` | sensor | Daily PV generation | Heutige PV-Erzeugung der 9.345 kWp Anlage | 17.9 | kWh |
| `sensor.daily_pv_generation_battery_discharge` | sensor | Daily PV generation & battery discharge | Heutige Batterie-Entlademenge der SBR128 | 17.2 | kWh |
| `sensor.ems_mode_selection_raw` | sensor | EMS mode selection raw | EMS-Betriebsmodus des Sungrow-Energiemanagers | 0 |  |
| `sensor.energy_battery_battery_discharging_power_battery_charging_power_net_power` | sensor | Battery Power | Aktuelle Ladeleistung der SBR128 Batterie | 1297.0 | W |
| `sensor.energy_grid_import_power_export_power_net_power` | sensor | Grid Power | Aktueller Netzbezug (Stromimport aus dem Netz) | 0.0 | W |
| `sensor.export_power` | sensor | Export power | Aktuelle Netzeinspeisung (Stromexport ins Netz) | 0 | W |
| `sensor.export_power_limit` | sensor | Export power limit | Aktuelle Netzeinspeisung (Stromexport ins Netz) | 10000 | W |
| `sensor.export_power_limit_mode_raw` | sensor | Export power limit mode raw | Aktuelle Netzeinspeisung (Stromexport ins Netz) | 170 |  |
| `sensor.export_power_raw` | sensor | Export power raw | Aktuelle Netzeinspeisung (Stromexport ins Netz) | 0 | W |
| `sensor.grid_frequency` | sensor | Grid frequency | Netzfrequenz am Anschlusspunkt (Sollwert: 50 Hz) | 50.01 | Hz |
| `sensor.import_power` | sensor | Import power | Aktueller Netzbezug (Stromimport aus dem Netz) | 0 | W |
| `sensor.inverter_firmware_version` | sensor | Inverter Firmware Version | Firmware-Version des SH10RT-20 Wechselrichters |                                |  |
| `sensor.inverter_rated_output` | sensor | Inverter rated output | Nenn-Ausgangsleistung des SH10RT-20 (10 kW) | 10000 | W |
| `sensor.inverter_temperature` | sensor | Inverter temperature | Gehäusetemperatur des SH10RT-20 Wechselrichters | 39.3 | °C |
| `sensor.iphone_von_david_battery_level` | sensor | iPhone von David Battery Level | UNBEKANNT: Sungrow-Modbus-Register — iPhone von David Battery Level | 15 | % |
| `sensor.load_adjustment_mode_enable_raw` | sensor | Load adjustment mode enable raw | Lastanpassung des Sungrow-Energiemanagers | 85 |  |
| `sensor.load_adjustment_mode_selection_raw` | sensor | Load adjustment mode selection raw | Lastanpassung des Sungrow-Energiemanagers | 3 |  |
| `sensor.load_power` | sensor | Load power | Aktueller Stromverbrauch des gesamten Haushalts | 1316 | W |
| `sensor.meter_active_power` | sensor | Meter active power | Wirkleistung am Smartmeter (Netzübergabepunkt) | -18 | W |
| `sensor.meter_phase_a_active_power` | sensor | Meter phase A active power | Leistung/Messwert Phase A (L1) | 664 | W |
| `sensor.meter_phase_a_current` | sensor | Meter phase A current | Strom Phase A (L1) | unavailable | A |
| `sensor.meter_phase_a_voltage` | sensor | Meter phase A voltage | Netzspannung Phase A (L1) | unavailable | V |
| `sensor.meter_phase_b_active_power` | sensor | Meter phase B active power | Leistung/Messwert Phase B (L2) | -258 | W |
| `sensor.meter_phase_b_current` | sensor | Meter phase B current | Strom Phase B (L2) | unavailable | A |
| `sensor.meter_phase_b_voltage` | sensor | Meter phase B voltage | Netzspannung Phase B (L2) | unavailable | V |
| `sensor.meter_phase_c_active_power` | sensor | Meter phase C active power | Leistung/Messwert Phase C (L3) | -400 | W |
| `sensor.meter_phase_c_current` | sensor | Meter phase C current | Strom Phase C (L3) | unavailable | A |
| `sensor.meter_phase_c_voltage` | sensor | Meter phase C voltage | Netzspannung Phase C (L3) | unavailable | V |
| `sensor.mppt1_current` | sensor | MPPT1 current | Leistung MPPT-Tracker 1 (PV-String Ost) | 0.0 | A |
| `sensor.mppt1_power` | sensor | MPPT1 power | Leistung MPPT-Tracker 1 (PV-String Ost) | 0 | W |
| `sensor.mppt1_voltage` | sensor | MPPT1 voltage | Leistung MPPT-Tracker 1 (PV-String Ost) | 0.0 | V |
| `sensor.mppt2_current` | sensor | MPPT2 current | Leistung MPPT-Tracker 2 (PV-String West) | 0.0 | A |
| `sensor.mppt2_power` | sensor | MPPT2 power | Leistung MPPT-Tracker 2 (PV-String West) | 0 | W |
| `sensor.mppt2_voltage` | sensor | MPPT2 voltage | Leistung MPPT-Tracker 2 (PV-String West) | 0.0 | V |
| `sensor.mppt3_current` | sensor | MPPT3 current | MPPT-Tracker Leistung eines PV-Strings | 0.0 | A |
| `sensor.mppt3_power` | sensor | MPPT3 power | MPPT-Tracker Leistung eines PV-Strings | 0 | W |
| `sensor.mppt3_voltage` | sensor | MPPT3 voltage | MPPT-Tracker Leistung eines PV-Strings | 0.0 | V |
| `sensor.mppt4_current` | sensor | MPPT4 current | MPPT-Tracker Leistung eines PV-Strings | 0.0 | A |
| `sensor.mppt4_power` | sensor | MPPT4 power | MPPT-Tracker Leistung eines PV-Strings | 0 | W |
| `sensor.mppt4_voltage` | sensor | MPPT4 voltage | MPPT-Tracker Leistung eines PV-Strings | 0.0 | V |
| `sensor.p_hybrid_inverter` | sensor | PV Hybrid Inverter | Gesamtleistung des SH10RT-20 Hybrid-Wechselrichters | 1110.00 | W |
| `sensor.phase_a_current` | sensor | Phase A current | Strom Phase A (L1) | 1.8 | A |
| `sensor.phase_a_power` | sensor | Phase A power | Leistung/Messwert Phase A (L1) | 421 | W |
| `sensor.phase_a_voltage` | sensor | Phase A voltage | Netzspannung Phase A (L1) | 234.1 | V |
| `sensor.phase_b_current` | sensor | Phase B current | Strom Phase B (L2) | 1.8 | A |
| `sensor.phase_b_power` | sensor | Phase B power | Leistung/Messwert Phase B (L2) | 422 | W |
| `sensor.phase_b_voltage` | sensor | Phase B voltage | Netzspannung Phase B (L2) | 234.7 | V |
| `sensor.phase_c_current` | sensor | Phase C current | Strom Phase C (L3) | 1.8 | A |
| `sensor.phase_c_power` | sensor | Phase C power | Leistung/Messwert Phase C (L3) | 423 | W |
| `sensor.phase_c_voltage` | sensor | Phase C voltage | Netzspannung Phase C (L3) | 235.1 | V |
| `sensor.power_factor` | sensor | Power factor | Leistungsfaktor (cos phi) am Netzanschlusspunkt | 1.000 | % |
| `sensor.power_flow_status` | sensor | Power Flow Status | Energiefluss-Richtung (PV/Batterie/Netz/Last) | 28 |  |
| `sensor.reactive_power` | sensor | Reactive power | Blindleistung am Netzanschlusspunkt | -6 | W |
| `sensor.running_state_raw` | sensor | Running state raw | Betriebszustand des SH10RT-20 Wechselrichters | 0 |  |
| `sensor.sungrow_arm_software` | sensor | Sungrow Arm Software | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Arm Software | ARM_SAPPHIRE-H_V11_V01_B       |  |
| `sensor.sungrow_device_type` | sensor | Sungrow device type | UNBEKANNT: Sungrow-Modbus-Register — Sungrow device type | SH10RT-20 |  |
| `sensor.sungrow_device_type_code` | sensor | Sungrow device type code | UNBEKANNT: Sungrow-Modbus-Register — Sungrow device type code | 3603 |  |
| `sensor.sungrow_dsp_software` | sensor | Sungrow DSP Software | UNBEKANNT: Sungrow-Modbus-Register — Sungrow DSP Software | MDSP_SAPPHIRE-H_V11_V01_B      |  |
| `sensor.sungrow_inverter_serial` | sensor | Sungrow inverter serial | UNBEKANNT: Sungrow-Modbus-Register — Sungrow inverter serial | A2352614033          |  |
| `sensor.sungrow_inverter_state` | sensor | Sungrow inverter state | UNBEKANNT: Sungrow-Modbus-Register — Sungrow inverter state | Running |  |
| `sensor.sungrow_protocol_version` | sensor | Sungrow Protocol Version | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Protocol Version | 16781568 |  |
| `sensor.sungrow_version_1` | sensor | Sungrow Version 1 | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Version 1 | SAPPHIRE-H_01011.95.07 |  |
| `sensor.sungrow_version_2` | sensor | Sungrow Version 2 | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Version 2 | unavailable |  |
| `sensor.sungrow_version_3` | sensor | Sungrow Version 3 | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Version 3 | unavailable |  |
| `sensor.sungrow_version_4_sungrow_battery` | sensor | Sungrow Version 4 (Sungrow Battery) | UNBEKANNT: Sungrow-Modbus-Register — Sungrow Version 4 (Sungrow Battery) | unavailable |  |
| `sensor.total_active_power` | sensor | Total active power | Gesamte Wirkleistung am Netzanschlusspunkt | 1304 | W |
| `sensor.total_battery_charge` | sensor | Total battery charge | Gesamtwert Sungrow seit Inbetriebnahme: Total battery charge | 1131.7 | kWh |
| `sensor.total_battery_charge_from_pv` | sensor | Total battery charge from PV | Gesamtwert Sungrow seit Inbetriebnahme: Total battery charge from PV | 1060.4 | kWh |
| `sensor.total_battery_discharge` | sensor | Total battery discharge | Gesamtwert Sungrow seit Inbetriebnahme: Total battery discharge | 1037.9 | kWh |
| `sensor.total_consumed_energy` | sensor | Total consumed energy | Gesamter Energieverbrauch seit Inbetriebnahme | 9058.6 | kWh |
| `sensor.total_dc_power` | sensor | Total DC power | DC-Gesamtleistung aller PV-Strings am SH10RT-20 Wechselrichter | 0 | W |
| `sensor.total_exported_energy` | sensor | Total exported energy | Gesamte Netzeinspeisung seit Inbetriebnahme | 258.3 | kWh |
| `sensor.total_exported_energy_from_pv` | sensor | Total exported energy from PV | Gesamte Netzeinspeisung seit Inbetriebnahme | 264.1 | kWh |
| `sensor.total_imported_energy` | sensor | Total imported energy | Gesamter Netzbezug seit Inbetriebnahme | 6527.3 | kWh |
| `sensor.total_pv_generation` | sensor | Total PV generation | Gesamte PV-Erzeugung seit Inbetriebnahme | 2883.4 | kWh |
| `sensor.total_pv_generation_battery_discharge` | sensor | Total PV generation & battery discharge | Gesamte PV-Erzeugung seit Inbetriebnahme | 2696.7 | kWh |
| `switch.export_power_limit` | switch | Export power limit | Aktuelle Netzeinspeisung (Stromexport ins Netz) | on |  |
| `switch.load_adjustment_mode` | switch | Load adjustment mode | Lastanpassung des Sungrow-Energiemanagers | off |  |
| `switch.sungrow_dashboard_enable_danger_mode` | switch | Sungrow dashboard enable danger mode | UNBEKANNT: Sungrow-Modbus-Register — Sungrow dashboard enable danger mode | off |  |

## Synology NAS

28 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.ds218_drive_1_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 1) Max. fehlerhafte Sektoren überschritten | Synology DS218 Status: DS218 (Drive 1) Max. fehlerhafte Sektoren überschritten | off |  |
| `binary_sensor.ds218_drive_1_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 1) Unterhalb der Mindestrestlebensdauer | Synology DS218 Festplatte 1 Restlebensdauer-Warnung | off |  |
| `binary_sensor.ds218_drive_2_max_fehlerhafte_sektoren_uberschritten` | binary_sensor | DS218 (Drive 2) Max. fehlerhafte Sektoren überschritten | Synology DS218 Status: DS218 (Drive 2) Max. fehlerhafte Sektoren überschritten | off |  |
| `binary_sensor.ds218_drive_2_unterhalb_der_mindestrestlebensdauer` | binary_sensor | DS218 (Drive 2) Unterhalb der Mindestrestlebensdauer | Synology DS218 Festplatte 2 Restlebensdauer-Warnung | off |  |
| `binary_sensor.ds218_sicherheitsstatus` | binary_sensor | DS218 Sicherheitsstatus | Synology DS218 Sicherheitsstatus (Security Advisor) | off |  |
| `button.ds218_reboot` | button | DS218 Reboot | Synology DS218 Neustart auslösen | unknown |  |
| `button.ds218_shutdown` | button | DS218 Shutdown | Synology DS218 Herunterfahren | unknown |  |
| `sensor.ds218_cpu_auslastung_benutzer` | sensor | DS218 CPU-Auslastung (Benutzer) | Synology DS218 CPU-Auslastung (Benutzerprozesse) | 69 | % |
| `sensor.ds218_cpu_auslastung_gesamt` | sensor | DS218 CPU-Auslastung (gesamt) | Synology DS218 CPU-Gesamtauslastung | 78 | % |
| `sensor.ds218_download_durchsatz` | sensor | DS218 Download-Durchsatz | Synology DS218 Netzwerk-Download-Rate | 4.462 | kB/s |
| `sensor.ds218_drive_1_status` | sensor | DS218 (Drive 1) Status | Synology DS218 Festplatte 1 Gesundheitsstatus | normal |  |
| `sensor.ds218_drive_1_temperatur` | sensor | DS218 (Drive 1) Temperatur | Synology DS218 Festplatte 1 Temperatur | 35 | °C |
| `sensor.ds218_drive_2_status` | sensor | DS218 (Drive 2) Status | Synology DS218 Festplatte 2 Gesundheitsstatus | normal |  |
| `sensor.ds218_drive_2_temperatur` | sensor | DS218 (Drive 2) Temperatur | Synology DS218 Festplatte 2 Temperatur | 34 | °C |
| `sensor.ds218_durchschnittliche_cpu_last_15_min` | sensor | DS218 Durchschnittliche CPU-Last (15 min) | Synology DS218 CPU-Last Durchschnitt 15 Min. | 1.15 | load |
| `sensor.ds218_durchschnittliche_cpu_last_5_min` | sensor | DS218 Durchschnittliche CPU-Last (5 min) | Synology DS218 CPU-Last Durchschnitt 5 Min. | 1.15 | load |
| `sensor.ds218_speicher_gesamt_real` | sensor | DS218 Speicher gesamt (real) | Synology DS218 Arbeitsspeicher gesamt (RAM) | 10282.41408 | MB |
| `sensor.ds218_speicher_gesamt_swap` | sensor | DS218 Speicher gesamt (Swap) | Synology DS218 Swap-Speicher gesamt | 8317.227008 | MB |
| `sensor.ds218_speicher_verfugbar_real` | sensor | DS218 Speicher verfügbar (real) | Synology DS218 freier Arbeitsspeicher | 500.166656 | MB |
| `sensor.ds218_speicher_verfugbar_swap` | sensor | DS218 Speicher verfügbar (Swap) | Synology DS218 freier Swap-Speicher | 7284.8384 | MB |
| `sensor.ds218_speichernutzung_real` | sensor | DS218 Speichernutzung (real) | Synology DS218 Arbeitsspeicher-Auslastung | 21 | % |
| `sensor.ds218_temperatur` | sensor | DS218 Temperatur | Synology DS218 Gehäusetemperatur | 40 | °C |
| `sensor.ds218_upload_durchsatz` | sensor | DS218 Upload-Durchsatz | Synology DS218 Netzwerk-Upload-Rate | 1.439 | kB/s |
| `sensor.ds218_volume_1_belegter_speicherplatz` | sensor | DS218 (Volume 1) Belegter Speicherplatz | Synology DS218 Speicher: DS218 (Volume 1) Belegter Speicherplatz | 3.098583412736 | TB |
| `sensor.ds218_volume_1_durchschnittliche_festplattentemperatur` | sensor | DS218 (Volume 1) Durchschnittliche Festplattentemperatur | Synology DS218 Festplatte  Temperatur | 34.0 | °C |
| `sensor.ds218_volume_1_status` | sensor | DS218 (Volume 1) Status | Synology DS218 Volume 1 Gesundheitsstatus | normal |  |
| `sensor.ds218_volume_1_volume_nutzung` | sensor | DS218 (Volume 1) Volume-Nutzung | Synology DS218 Volume 1 Belegung in Prozent | 53.8 | % |
| `update.ds218_dsm_update` | update | DS218 DSM-Update | Synology DSM Update-Status | off |  |

## Template-Sensoren

10 Entitäten

| Entity ID | Domain | Friendly Name | Beschreibung | State | Unit |
|---|---|---|---|---|---|
| `binary_sensor.exporting_power` | binary_sensor | Exporting Power | Netzeinspeisung aktiv (ja/nein) | on |  |
| `binary_sensor.exporting_power_delay` | binary_sensor | Exporting Power (delay) | Netzeinspeisung aktiv (verzögerter Binärsensor) | off |  |
| `binary_sensor.importing_power` | binary_sensor | Importing Power | Netzbezug aktiv (ja/nein) | off |  |
| `binary_sensor.importing_power_delay` | binary_sensor | Importing Power (delay) | Netzbezug aktiv (verzögerter Binärsensor) | off |  |
| `binary_sensor.pv_generating` | binary_sensor | PV generating | PV erzeugt aktuell Strom (ja/nein) | off |  |
| `binary_sensor.pv_generating_delay` | binary_sensor | PV generating (delay) | PV erzeugt Strom (verzögerter Binärsensor) | off |  |
| `sensor.autarkiegrad` | sensor | Autarkiegrad | Berechneter Autarkiegrad (Anteil Eigenversorgung) | 100.0 | % |
| `sensor.eigenverbrauchsquote` | sensor | Eigenverbrauchsquote | Berechnete Eigenverbrauchsquote des PV-Stroms | 68.7 | % |
| `sensor.entscheidungs_delta_kumuliert` | sensor | Entscheidungs-Delta kumuliert | Kumuliertes Entscheidungs-Delta (Optimierung vs. Ist) | unavailable | EUR |
| `sensor.entscheidungs_delta_laufend` | sensor | Entscheidungs-Delta laufend | Laufendes Entscheidungs-Delta (Optimierung vs. Ist) | unavailable | EUR/h |
