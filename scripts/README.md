# Shelly-Geräte-Skripte

Verwaltung der Shelly-Geräte: Erkennung, Benennung und Inventar.

## Quick Start: Neues Gerät hinzufügen

```bash
# 1. Gerät im Netzwerk finden und interaktiv registrieren
./shelly-discover.sh --add

# 2. (Optional) Mit Cloud-Namen als Hinweis
./shelly-discover.sh --add --cloud "AUTH_KEY" "https://shelly-XX-eu.shelly.cloud"
```

Das Skript fragt Geschoss, Raum und Typ ab, leitet den Hostnamen automatisch ab und bietet am Ende an, das Gerät direkt umzubenennen.

## Skripte

| Skript | Zweck |
|---|---|
| `shelly-discover.sh` | Netzwerk scannen, neue Geräte finden und hinzufügen |
| `shelly-rename.sh` | Gerätenamen und Hostnamen per RPC setzen |
| `shelly-devices.sh` | Geräteregister (Daten, kein ausführbares Skript) |
| `shelly-common.sh` | Gemeinsame Hilfsfunktionen (wird per `source` eingebunden) |

## Namenskonvention

```
Name:     {Geschoss}_{Raum}_{Typ}[_{Nr}]
Hostname: shelly-{geschoss}-{raum}-{typ}[-{nr}]
```

**Geschoss:** `KG` (Keller), `EG` (Erdgeschoss), `OG` (Obergeschoss), `DG` (Dachgeschoss)

**Raum (Beispiele):** `Keller`, `Technik`, `Flur`, `WC`, `Diele`, `Kueche`, `Wohnen`, `Essen`, `Zimmer1`, `Zimmer2`, `Bad`, `Ankleide`, `Schlafen`, `Buero`

**Typ (Beispiele):** `Licht`, `Jalousie`, `Waermepumpe`, `3EM`, `Serverschrank`, `Waschmaschine`, `Trockner`, `Kuehlschrank`, `Spuelmaschine`, `Workstation`, `Lichtstreifen`, `Steckdose`

**Nr:** Optional bei mehreren gleichen Geräten im selben Raum (z.B. `Jalousie_1`, `Jalousie_2`)

### Beispiele

| Name | Hostname |
|---|---|
| `DG_Buero_Jalousie` | `shelly-dg-buero-jalousie` |
| `OG_Bad_Jalousie_1` | `shelly-og-bad-jalousie-1` |
| `KG_Technik_Waermepumpe_3EM` | `shelly-kg-technik-waermepumpe-3em` |

## Häufige Aufgaben

### Status aller Geräte prüfen
```bash
./shelly-rename.sh --check
```

### Einzelnes Gerät umbenennen
```bash
./shelly-rename.sh --ip 192.168.1.42
```

### Probelauf (ohne Änderungen)
```bash
./shelly-rename.sh --dry-run
```

### Gerät ersetzen (gleiche IP)

Einfach `./shelly-rename.sh --ip X.X.X.X` — das neue Gerät bekommt Name und Hostname des alten.

### Gerät entfernen

Die `register`-Zeile in `shelly-devices.sh` löschen.

## Cloud API einrichten

Für Cloud-Namen als Hinweis beim Hinzufügen:

1. https://control.shelly.cloud/ → User Settings → Authorization cloud key → **Get**
2. Auth-Key und Server-URI kopieren

**Variante A:** Direkt übergeben
```bash
./shelly-discover.sh --add --cloud "AUTH_KEY" "SERVER_URI"
```

**Variante B:** In Datei speichern (empfohlen)
```bash
cat > ~/.config/shelly-cloud.env << 'EOF'
SHELLY_AUTH_KEY="dein-auth-key"
SHELLY_SERVER_URI="https://shelly-XX-eu.shelly.cloud"
EOF
```

## Geräteregister-Format

`shelly-devices.sh` enthält Zeilen im Format:
```bash
register "IP" "Name" "Hostname"  # Kommentar
```

Wird per `source` eingelesen — die `register`-Funktion wird vom aufrufenden Skript definiert.
