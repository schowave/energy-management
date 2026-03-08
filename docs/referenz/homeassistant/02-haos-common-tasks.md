# Home Assistant OS – Häufige Aufgaben

> Quelle: https://www.home-assistant.io/common-tasks/os/

## Dateizugriff

HAOS mappt Verzeichnisse (`addons`, `backup`, `config`, `media`, `share`, `ssl`) auf `/mnt/data/supervisor/` auf dem Host.

### Zugriffsmethoden

| Methode | Beschreibung |
|---|---|
| **Samba Share** | Netzwerkfreigabe: `\\IP` (Windows), `smb://IP` (macOS/Linux) |
| **Studio Code Server** | VS Code im Browser (AMD64 + ARM64) |
| **File Editor** | Leichtgewichtiger Web-Editor mit YAML-Validierung |
| **Terminal & SSH** | Web-Terminal + SSH. Erfordert "Erweiterter Modus" im Benutzerprofil |

## Backups

```bash
ha backups new --name nameofbackup
ha backups list
ha backups restore slugname
```

Backups extern speichern (z.B. NAS, Cloud).

## Updates

### Über UI
Einstellungen → System → Aktualisierungen

### Über CLI
```bash
ha core update --backup
ha core update --version 2026.3.1 --backup
```

> Vor Updates immer Release Notes prüfen (Breaking Changes).

## Netzwerkspeicher (NFS/CIFS)

Ab OS 10.2+: Einstellungen → System → Speicher → Netzwerkspeicher für Backups, Medien oder Shared.

## Externer Daten-Datenträger

USB SSD/HDD: Einstellungen → System → Speicher → Datenlaufwerk verschieben.

## CLI-Befehle

| Befehl | Funktion |
|---|---|
| `ha core check` | Konfiguration validieren |
| `ha core logs` | Logs anzeigen |
| `ha supervisor info` | System-Status |
| `ha host reboot` | System neustarten |
| `ha os info` | OS-Informationen |
