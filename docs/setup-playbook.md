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
| **GoSunGrow** | `https://github.com/MickMake/HomeAssistantAddons` | iSolarCloud / Sungrow App |

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

### 3.3 Mosquitto MQTT Broker ✅

- [x] App Store → "Mosquitto broker" suchen → **Installieren**
- [x] App starten
- [x] Integration einrichten: Einstellungen → Geräte & Dienste → MQTT → Konfigurieren
- [x] Automatisch erkannten Broker bestätigen

> Standardeinstellungen reichen aus. GoSungrow publiziert seine Daten hierüber.

### 3.4 Samba Share (Dateizugriff vom PC) — optional

> **Optional:** Nicht nötig wenn Konfiguration über Git-Repo + File Editor gepflegt wird.
> Samba ist nur sinnvoll wenn man vom PC direkt auf die HA-Dateien zugreifen möchte.

- [ ] App Store → "Samba share" suchen → **Installieren**
- [ ] App Config: Benutzername + Passwort setzen
- [ ] App starten
- [ ] Vom PC verbinden: `\\homeassistant.local` (Windows) / `smb://homeassistant.local` (Mac)

### 3.5 InfluxDB

- [x] App Store → "InfluxDB" suchen → **Installieren**
- [x] App starten → "In Seitenleiste anzeigen" aktivieren
- [x] InfluxDB UI öffnen → Admin → Databases → Datenbank `homeassistant` anlegen
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "InfluxDB"
  - Version: **InfluxDB 1.x** (passend zum Add-on)
  - URL: `http://a0d7b954-influxdb:8086` (Hostname aus App → Info)
  - Datenbank: `homeassistant`
  - Benutzername: `homeassistant` (vorher in InfluxDB Admin → Users anlegen)
  - Passwort: wie vergeben
  - SSL: deaktiviert
- [x] Home Assistant neustarten

> **Hinweis:** Seit HA 2026.9 wird InfluxDB über die UI-Integration konfiguriert, nicht mehr per YAML.

### 3.6 Grafana ✅

- [x] App Store → "Grafana" suchen → **Installieren**
- [x] App starten → "In Seitenleiste anzeigen" aktivieren
- [x] Grafana öffnen → Connections → Data sources → Add data source → **InfluxDB**
  - URL: `http://a0d7b954-influxdb:8086`
  - Database: `homeassistant`
  - User: `homeassistant`
  - Password: wie bei InfluxDB vergeben
  - Save & Test

### 3.7 Terminal & SSH (optional, für CLI-Zugriff)

- [ ] App Store → "Terminal & SSH" suchen → **Installieren**
- [ ] App starten → "In Seitenleiste anzeigen" aktivieren

## 4. HACS installieren ✅

- [x] App Store → ⋮ → Repositories → `https://github.com/hacs/addons` hinzufügen
- [x] App Store → "Get HACS" suchen → **Installieren** → **Starten**
- [x] App Logs prüfen für Anweisungen
- [x] Home Assistant neustarten
- [x] Einstellungen → Geräte & Dienste → Integration hinzufügen → "HACS"
- [x] GitHub-Konto verknüpfen (Device Code Flow)

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

### 6.3 Sungrow Inverterdaten (Phase 1)

> ~~GoSungrow Cloud-API~~ — funktioniert nicht mehr (AppKey-Problem seit Nov 2023, nicht gefixt).
> Stattdessen: **mkaiser Sungrow Modbus-Integration** (lokal, Echtzeit, alle Daten).
> Siehe aktualisierter ADR-0006.

**Quelle:** https://github.com/mkaiser/Sungrow-SHx-Inverter-Modbus-Home-Assistant

- [x] `modbus_sungrow.yaml` (Release 2026-03-09) vom GitHub-Repo herunterladen → nach `/config/` kopieren
- [x] `secrets.yaml` auf dem N100 ergänzen:
  ```yaml
  sungrow_modbus_host_ip: "192.168.1.134"  # gridBox (stabil), NICHT WiNet-S2 (192.168.1.191, instabil)
  sungrow_modbus_port: "502"
  sungrow_modbus_device_address: 1
  sungrow_modbus_wait_milliseconds: 200   # konservativ wg. parallelem Heartbeat
  sungrow_modbus_battery_max_power: 5000
  ```
- [x] `configuration.yaml` ergänzen:
  ```yaml
  homeassistant:
    packages:
      sungrow: !include modbus_sungrow.yaml
  ```
- [x] Home Assistant neustarten
- [x] Prüfen: Entwicklerwerkzeuge → Zustände → nach `sungrow` filtern → Inverter erkannt (SH10RT-20)
- [ ] **Wichtig:** Über mehrere Tage 1komma5° App beobachten (Heartbeat-Tab), ob Steuerung weiterhin funktioniert

> **Netzwerk-Info:** WiNet-S2 (`192.168.1.191`) und gridBox (`192.168.1.134`) antworten beide auf Modbus TCP Port 502.
> **WiNet-S2 ist instabil** (Verbindung bricht nach ~20s ab). Die **gridBox ist stabil** und wird als Modbus-Gateway genutzt.
> Falls Heartbeat-Störungen auftreten → `modbus_sungrow.yaml` Einbindung in `configuration.yaml` auskommentieren und neustarten.
> Siehe ADR-0006 für Details.

## 7. ~~Template-Sensoren~~ — entfällt

> **Entfällt:** Die mkaiser Modbus-Integration liefert bereits saubere Entity-Namen mit eigenen Template-Sensoren.
> Eine separate Abstraktionsschicht ist nicht mehr nötig (siehe ADR-0008 superseded).
> Dashboards und EMHASS referenzieren direkt die mkaiser-Entities:
> `sensor.total_dc_power`, `sensor.battery_level`, `sensor.load_power`, `sensor.import_power`, `sensor.export_power`, etc.

## 8. Energy Dashboard einrichten

- [x] Einstellungen → Dashboards → Energie

### 8.1 Stromnetz (Netzanschluss) ✅

- [x] **Verbrauch (Import):** `sensor.daily_imported_energy`
- [x] **Einspeisung (Export):** `sensor.daily_exported_energy`
- [x] Leistungsmessung: Zwei Sensoren
  - Importleistung: `sensor.import_power`
  - Exportleistung: `sensor.export_power`

### 8.2 Solar (PV-Module) ✅

- [x] **Energie der PV-Erzeugung:** `sensor.total_pv_generation`
- [x] **Leistung der PV-Erzeugung:** `sensor.total_dc_power`
- [x] Prognose: leer lassen (Solcast/Forecast.Solar kommt später)

### 8.3 Batterie ✅

- [x] **In die Batterie geladene Energie:** `sensor.daily_battery_charge`
- [x] **Aus der Batterie entladene Energie:** `sensor.daily_battery_discharge`
- [x] Leistungsmessung: Zwei Sensoren
  - Entladeleistung: `sensor.battery_discharging_power`
  - Ladeleistung: `sensor.battery_charging_power`

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
→ Mosquitto → (Samba optional) → Terminal               ✅ Mosquitto erledigt
→ InfluxDB → Grafana (Monitoring)                       ✅ erledigt
→ HACS                                                  ✅ erledigt
→ Sungrow Modbus (mkaiser via gridBox)                  ✅ erledigt
→ Energy Dashboard                                      ✅ erledigt
→ hacs_1komma5grad → ENTSO-e → Solcast (Datenquellen)
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
