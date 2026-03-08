#!/usr/bin/env bash
# ============================================================================
# Shelly-Geräteliste
#
# Format: register "IP" "Name" "Hostname"
# IP = "" → Gerät wird beim Rename übersprungen, Discover füllt IP per MAC
#
# Namenskonvention:
#   Name:     {Geschoss}_{Raum}_{Typ}[_{Nr}]
#   Hostname: shelly-{geschoss}-{raum}-{typ}[-{nr}]
#
# Quelle: Shelly Cloud API (control.shelly.cloud) + shelly-discover.sh
# Cloud-Name in Kommentaren zur Referenz
# ============================================================================

DEVICES=()

register() {
    DEVICES+=("$1;$2;$3")
}

# --- KG (Cloud Room 6) ---
register "192.168.1.147" "KG_Keller_Licht"              "shelly-kg-keller-licht"               # Cloud: Kellerraum | Mini 1PM Gen4
register "192.168.1.11"  "KG_Technik_Waermepumpe_3EM"   "shelly-kg-technik-waermepumpe-3em"    # Cloud: Novelan LICV 8.2R1/3 | Pro 3EM
register "192.168.1.220" "KG_Technik_Serverschrank"      "shelly-kg-technik-serverschrank"      # Cloud: Serverschrank | Plug S Gen3
register "192.168.1.38"  "KG_Technik_Waschmaschine"      "shelly-kg-technik-waschmaschine"      # Cloud: Waschmaschine | Plug S Gen3
register "192.168.1.122" "KG_Technik_Trockner"           "shelly-kg-technik-trockner"           # Cloud: Trockner | Plug S Gen3
register "192.168.1.231" "KG_Flur_Kuehlschrank"       "shelly-kg-flur-kuehlschrank"       # Cloud: Kühlschrank | Plug S Gen3

# --- EG (Cloud Room 5) ---
register "192.168.1.13"  "EG_WC_Licht"                  "shelly-eg-wc-licht"                   # Cloud: WC | Mini 1PM Gen4 (light)
register "192.168.1.99"  "EG_WC_Jalousie"               "shelly-eg-wc-jalousie"                # Cloud: WC | Mini 2PM Gen4 (roller)
register "192.168.1.74"  "EG_Diele_Jalousie-1"             "shelly-eg-diele-jalousie-1"             # Cloud: Garderobe | Mini 2PM Gen4 (roller)
register "192.168.1.179" "EG_Diele_Jalousie-2"              "shelly-eg-diele-jalousie-2"              # Cloud: Treppe | Mini 2PM Gen4 (roller)
register "192.168.1.63"  "EG_Kueche_Jalousie"            "shelly-eg-kueche-jalousie"            # Cloud: Küche | Mini 2PM Gen4 (roller)
register "192.168.1.47"  "EG_Kueche_Spuelmaschine"       "shelly-eg-kueche-spuelmaschine"       # Cloud: Spülmaschine | Plug S Gen3
register "192.168.1.83"  "EG_Wohnen_Jalousie_1"          "shelly-eg-wohnen-jalousie-1"          # Cloud: Schiebetür links | Mini 2PM Gen4 (roller)
register "192.168.1.73"  "EG_Wohnen_Jalousie_2"          "shelly-eg-wohnen-jalousie-2"          # Cloud: Schiebetür rechts | Mini 2PM Gen4 (roller)
register "192.168.1.27"  "EG_Essen_Jalousie"             "shelly-eg-essen-jalousie"             # Cloud: Sitzfenster | Mini 2PM Gen4 (roller)

# --- OG (Cloud Room 3) ---
register "192.168.1.189" "OG_Zimmer2_Licht"             "shelly-og-zimmer2-licht"              # Cloud: Luan | Mini 1PM Gen4 (light)
register "192.168.1.29"  "OG_Zimmer2_Jalousie"          "shelly-og-zimmer2-jalousie"           # Cloud: Luan | Mini 2PM Gen4 (roller)
register "192.168.1.164" "OG_Zimmer2_Lichtstreifen"     "shelly-og-zimmer2-lichtstreifen"      # Cloud: Luan Lichtstreifen | Plug S Gen3
register "192.168.1.214" "OG_Zimmer1_Licht"             "shelly-og-zimmer1-licht"              # Cloud: Kiano neu | Mini 1PM Gen4
register "192.168.1.107" "OG_Zimmer1_Jalousie"          "shelly-og-zimmer1-jalousie"           # Cloud: Kiano | Mini 2PM Gen4 (roller)
register "192.168.1.87"  "OG_Bad_Licht"                 "shelly-og-bad-licht"                  # Cloud: Bad | Mini 1PM Gen4
register "192.168.1.162" "OG_Bad_Jalousie_1"            "shelly-og-bad-jalousie-1"             # Cloud: Bad Süd | Mini 2PM Gen4 (roller)
register "192.168.1.64"  "OG_Bad_Jalousie_2"            "shelly-og-bad-jalousie-2"             # Cloud: Bad West | Mini 2PM Gen4 (roller)
register "192.168.1.108" "OG_Ankleide_Licht"            "shelly-og-ankleide-licht"             # Cloud: Ankleide | Mini 1PM Gen4
register "192.168.1.109" "OG_Ankleide_Jalousie_1"         "shelly-og-ankleide-jalousie-1"          # Cloud: Ankleide | Mini 2PM Gen4 (roller)
register "192.168.1.144" "OG_Ankleide_Jalousie_2"           "shelly-og-ankleide-jalousie-2"            # Cloud: Treppe | Mini 2PM Gen4 (roller)
register "192.168.1.18"  "OG_Flur_Jalousie"             "shelly-og-flur-jalousie"              # Cloud: Flur | Mini 2PM Gen4 (roller)

# --- DG (Cloud Room 4) ---
register "192.168.1.133" "DG_Schlafen_Jalousie_1"       "shelly-dg-schlafen-jalousie-1"        # Cloud: Schlafzimmer links | Mini 2PM Gen4 (roller)
register "192.168.1.177" "DG_Schlafen_Jalousie_2"       "shelly-dg-schlafen-jalousie-2"        # Cloud: Schlafzimmer rechts | Mini 2PM Gen4 (roller)
register "192.168.1.21"  "DG_Bad_Jalousie"              "shelly-dg-bad-jalousie"               # Cloud: Bad | Mini 2PM Gen4 (roller)
register "192.168.1.34"  "DG_Buero_Jalousie"            "shelly-dg-buero-jalousie"             # Cloud: Büro | Mini 2PM Gen4 (roller)
register "192.168.1.100" "DG_Buero_Workstation"          "shelly-dg-buero-workstation"          # Cloud: Workstation | Plug S Gen3
