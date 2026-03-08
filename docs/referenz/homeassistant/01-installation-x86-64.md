# Home Assistant OS Installation – Generic x86-64

> Quelle: https://www.home-assistant.io/installation/generic-x86-64

## Voraussetzungen

- Dedizierter Intel/AMD-PC (64-bit)
- UEFI Boot-Modus
- Die meiste Hardware der letzten 10 Jahre erfüllt die Anforderungen

## Schritt 1: BIOS-Einstellungen

Beim Start `F2` (oder `DEL`, `F1`, `F10`) drücken:

- **UEFI Boot-Modus** aktivieren
- **Secure Boot** deaktivieren
- Speichern und beenden

## Schritt 2: Installationsmedium vorbereiten

### Methode 1: Ubuntu Live USB (empfohlen)

**Benötigt:** USB-Stick (min. 8 GB), Computer mit Internet

1. Ubuntu Live USB erstellen
2. Ziel-System von USB booten → "Try Ubuntu" wählen
3. HAOS-Image von der offiziellen Seite herunterladen
4. "Disks"-App öffnen → interne Festplatte auswählen
5. Image auf die Festplatte schreiben
6. Herunterfahren, USB entfernen

### Methode 2: Balena Etcher

1. Balena Etcher herunterladen
2. HAOS-Image (.xz) herunterladen und entpacken
3. "Flash from file" → Image auswählen
4. Ziel-Speichergerät wählen → Flashen

## Schritt 3: Erster Start

1. Boot-Medien entfernen
2. Ethernet-Kabel anschließen (Internet erforderlich!)
3. Einschalten
4. Nach wenigen Minuten: Welcome-Banner auf dem Display
5. Browser öffnen: `http://homeassistant.local:8123`

> **Hinweis:** Internet ist erforderlich, da HAOS beim ersten Start weitere Komponenten nachlädt.

## Fehlerbehebung

Falls das System kein bootfähiges Gerät findet:
- EFI-Einträge mit `efibootmgr` in der Ubuntu Live-Umgebung erstellen
- Oder im BIOS auf `\EFI\BOOT\bootx64.efi` zeigen

Falls `homeassistant.local` nicht funktioniert: IP-Adresse direkt verwenden (`homeassistant:8123`).
