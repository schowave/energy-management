# Setup-Playbook: KAMRUI N100 mit Home Assistant OS

> Schritt-für-Schritt-Anleitung für die komplette Einrichtung. Checkboxen abhaken wenn erledigt.

## 0. HAOS installieren

- [x] HAOS-Image für Generic x86-64 herunterladen: https://www.home-assistant.io/installation/generic-x86-64
- [x] Image auf USB-Stick flashen (Balena Etcher oder Ubuntu Live USB)
- [x] KAMRUI N100: Beim Booten `DEL` oder `F7` drücken → Boot von USB
- [x] UEFI Boot-Modus aktiv, Secure Boot deaktiviert
- [x] Von USB booten → HAOS wird auf interne SSD geschrieben
- [x] USB entfernen, Ethernet anschließen, neustarten
- [x] Browser öffnen: http://homeassistant.local:8123
- [x] Onboarding: Benutzer anlegen, Standort, Einheiten

## 1. Grundkonfiguration

- [x] **Erweiterter Modus** aktivieren: Profil (links unten) → "Erweiterter Modus" Toggle
- [x] **App Store** öffnen: Einstellungen → Apps → App Store (oder direkt: http://homeassistant.local:8123/hassio/store)

## 2. App Repositories hinzufügen

Im App Store: **⋮ (3 Punkte oben rechts) → Repositories**

Folgende URLs einzeln einfügen und jeweils "Hinzufügen" klicken:

> **Wichtig:** URLs exakt eingeben, kein Leerzeichen am Anfang/Ende!

| Repository | URL | Enthält |
|---|---|---|
| **Cloudflared** | `https://github.com/brenner-tobias/ha-addons` | Cloudflare Tunnel App |

Danach "Schließen" und die Seite neu laden (Ctrl+Shift+R).

## 3. Apps installieren & konfigurieren

### 3.1 File Editor ✅

- [x] App Store → "File editor" suchen → **Installieren**
- [x] App Config: "Enforce Basepath" deaktivieren (um alle Verzeichnisse zu sehen)
- [x] App starten → "In Seitenleiste anzeigen" aktivieren

> File Editor wird für viele weitere Schritte gebraucht (configuration.yaml bearbeiten).

### 3.2 Cloudflared (Remote-Zugriff) ✅

**App installieren:**
- [x] App Store → "Cloudflared" suchen → **Installieren**
  - Falls nicht gefunden: Zuerst Repository hinzufügen (siehe Schritt 2)

**App konfigurieren (über UI):**
- [x] Tab "Konfiguration" → Externer Hostname: `ha.schowalter.co` → **Speichern**

**HTTP-Proxy konfigurieren (VOR dem ersten Tunnel-Start!):**
- [x] File Editor → `/config/configuration.yaml` öffnen → folgenden Block einfügen:
  ```yaml
  http:
    use_x_forwarded_for: true
    trusted_proxies:
      - 172.30.33.0/24
  ```
- [x] Home Assistant neustarten (Einstellungen → System → Neustart)

> **Wichtig:** Ohne diesen Block gibt es `400: Bad Request` beim Zugriff über ha.schowalter.co!
> HA muss dem Cloudflare-Proxy vertrauen, sonst blockiert es die weitergeleiteten Anfragen.

**Tunnel einrichten:**
- [x] Tab "Informationen" → App **Starten**
- [x] Tab "Protokoll" → **Cloudflare Login-Link** erscheint
- [x] Link im Browser öffnen → Domain `schowalter.co` autorisieren
- [x] Testen: https://ha.schowalter.co im Browser aufrufen

**External URL setzen:**
- [x] Einstellungen → System → Netzwerk → External URL: `https://ha.schowalter.co`

### 3.3 Mosquitto MQTT Broker

- [ ] App Store → "Mosquitto broker" suchen → **Installieren**
- [ ] App starten
- [ ] Integration einrichten: Einstellungen → Geräte & Dienste → MQTT → Konfigurieren
- [ ] Automatisch erkannten Broker bestätigen

### 3.4 Samba Share (Dateizugriff vom PC)

- [ ] App Store → "Samba share" suchen → **Installieren**
- [ ] App Config: Benutzername + Passwort setzen
- [ ] App starten
- [ ] Vom PC verbinden: `\\homeassistant.local` (Windows) / `smb://homeassistant.local` (Mac)

### 3.5 InfluxDB

- [ ] App Store → "InfluxDB" suchen → **Installieren**
- [ ] App starten → "In Seitenleiste anzeigen" aktivieren
- [ ] InfluxDB UI öffnen → Datenbank `homeassistant` anlegen (InfluxDB 1.x) oder Bucket erstellen (2.x)
- [ ] `configuration.yaml` ergänzen (InfluxDB 1.x Beispiel):
  ```yaml
  influxdb:
    host: a0d7b0f9-influxdb
    port: 8086
    database: homeassistant
    max_retries: 3
    default_measurement: state
    include:
      domains:
        - sensor
        - binary_sensor
    exclude:
      domains:
        - automation
        - persistent_notification
  ```
- [ ] Home Assistant neustarten

### 3.6 Grafana

- [ ] App Store → "Grafana" suchen → **Installieren**
- [ ] App starten → "In Seitenleiste anzeigen" aktivieren
- [ ] Grafana öffnen → InfluxDB als Datenquelle hinzufügen:
  - URL: `http://a0d7b0f9-influxdb:8086`
  - Database: `homeassistant`

### 3.7 Terminal & SSH (optional, für CLI-Zugriff)

- [ ] App Store → "Terminal & SSH" suchen → **Installieren**
- [ ] App starten → "In Seitenleiste anzeigen" aktivieren

## 4. HACS installieren

- [ ] App Store → ⋮ → Repositories → `https://github.com/hacs/addons` hinzufügen
- [ ] App Store → "Get HACS" suchen → **Installieren** → **Starten**
- [ ] App Logs prüfen für Anweisungen
- [ ] Home Assistant neustarten
- [ ] Einstellungen → Geräte & Dienste → Integration hinzufügen → "HACS"
- [ ] GitHub-Konto verknüpfen (Device Code Flow)

## 5. HACS-Integrationen installieren

### 5.1 hacs_1komma5grad (Heartbeat Preise + Energy)

- [ ] HACS → Integrationen → Repository durchsuchen → "1KOMMA5GRAD"
- [ ] Herunterladen → Home Assistant neustarten
- [ ] Einstellungen → Geräte & Dienste → Integration hinzufügen → "1KOMMA5GRAD"
- [ ] Mit `app.1komma5grad.com` Zugangsdaten anmelden
- [ ] Prüfen: Neue Sensoren unter Einstellungen → Geräte & Dienste → 1KOMMA5GRAD

## 6. Integrationen einrichten (über UI)

### 6.1 ENTSO-e (Börsenpreise)

- [ ] API-Key beantragen: https://transparency.entsoe.eu/ → Registrieren
- [ ] Einstellungen → Geräte & Dienste → Integration hinzufügen → "ENTSO-e Transparency Platform"
- [ ] API-Key eingeben, Bidding Zone: DE-LU

### 6.2 Solcast / Forecast.Solar (PV-Prognose)

- [ ] Einstellungen → Geräte & Dienste → Integration hinzufügen → "Forecast.Solar" (oder Solcast via HACS)
- [ ] Anlagendaten hinterlegen: Ausrichtung, Neigung, kWp

### 6.3 GoSungrow (Inverterdaten Phase 1)

- [ ] GoSungrow Integration einrichten (MQTT oder REST)
- [ ] Prüfen ob Sensoren verfügbar: SOC, PV Power, Grid, Load

## 7. Template-Sensoren anlegen

- [ ] `templates.yaml` aus dem Repo übernehmen: `config/kamrui-n100/templates.yaml`
- [ ] In `configuration.yaml` referenzieren:
  ```yaml
  template: !include templates.yaml
  ```
- [ ] Home Assistant neustarten
- [ ] Prüfen: Entwicklerwerkzeuge → Zustände → nach `sensor.pv_power`, `sensor.battery_soc` etc. suchen

## 8. Energy Dashboard einrichten

- [ ] Einstellungen → Dashboards → Energie
- [ ] Grid Import/Export: hacs_1komma5grad kWh-Sensoren oder GoSungrow-Sensoren
- [ ] Solar: PV kWh-Sensor
- [ ] Batterie: Battery In/Out kWh-Sensoren

## 9. Backups auf Synology

- [ ] Samba/NFS Share auf Synology erstellen (z.B. `ha-backups`)
- [ ] Einstellungen → System → Speicher → Netzwerkspeicher hinzufügen
  - Typ: CIFS/SMB
  - Server: IP der Synology
  - Share: `ha-backups`
  - Verwendung: Backup
- [ ] Einstellungen → System → Backups → Automatische Backups konfigurieren

## 10. Recorder konfigurieren

- [ ] `configuration.yaml` ergänzen:
  ```yaml
  recorder:
    purge_keep_days: 90
    commit_interval: 5
  ```
- [ ] Home Assistant neustarten

---

## Reihenfolge zusammengefasst

```
HAOS flashen → Onboarding → Erweiterter Modus          ✅ erledigt
→ File Editor → Cloudflared (Grundlagen + Remote)       ✅ erledigt
→ Mosquitto → Samba → Terminal (Infrastruktur)
→ InfluxDB → Grafana (Monitoring)
→ HACS → hacs_1komma5grad (Integrationen)
→ ENTSO-e → Solcast → GoSungrow (Datenquellen)
→ Template-Sensoren → Energy Dashboard (Abstraktionsschicht)
→ Synology Backup (Sicherheit)
→ Recorder konfigurieren (90 Tage)
```

## Nützliche URLs

| Was | URL |
|---|---|
| HA Lokal | http://homeassistant.local:8123 |
| App Store | http://homeassistant.local:8123/hassio/store |
| Systeminformationen | http://homeassistant.local:8123/config/info |
| Entwicklerwerkzeuge | http://homeassistant.local:8123/developer-tools/state |
| HA Extern | https://ha.schowalter.co |
| ENTSO-e Registrierung | https://transparency.entsoe.eu/ |
| Solcast | https://solcast.com/ |
| Cloudflare Dashboard | https://dash.cloudflare.com/ |
