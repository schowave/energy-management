# Proxmox-Migration: Schritt-für-Schritt

> Migrationsanleitung: KAMRUI N100 von HA OS (bare metal) auf Proxmox VE mit HA OS VM + LXC-Diensten.
> Siehe ADR-0016 für die Entscheidungsbegründung.

## Voraussetzungen

- USB-Stick (≥ 2 GB) für Proxmox-Installer
- Zweiter PC/Laptop für Web-UI-Zugriff
- Netzwerkkabel (Ethernet)
- Ca. 1-2 Stunden Zeit (keine Automationen in der Zeit)

## Phase 1: Vorbereitung

### 1.1 HA-Backup erstellen

- [ ] In HA: Einstellungen → System → Backups → **Vollständiges Backup erstellen**
- [ ] Backup auf **Synology NAS kopieren** (SMB/CIFS) — NICHT nur lokal!
- [ ] Backup zusätzlich auf USB-Stick oder PC herunterladen (Sicherheitskopie)
- [ ] Backup-Datei prüfen: `.tar`-Datei sollte mehrere hundert MB groß sein

### 1.2 Aktuelle Konfiguration dokumentieren

- [ ] IP-Adresse des KAMRUI notieren: `_______________`
- [ ] Statische IP im Router? Ja/Nein: `___`
- [ ] Cloudflare Tunnel Token notieren (Cloudflared Add-on → Konfiguration)
- [ ] InfluxDB-Zugangsdaten notieren (falls vorhanden)
- [ ] Liste der USB-Geräte am KAMRUI: `_______________`
- [ ] Netzwerk-Gateway und DNS notieren: `_______________`

### 1.3 Proxmox-Installer vorbereiten

- [ ] Proxmox VE ISO herunterladen: https://www.proxmox.com/en/downloads
- [ ] ISO auf USB-Stick flashen (Balena Etcher oder Rufus)

## Phase 2: Proxmox installieren

> **Achtung:** Ab hier wird die SSD gelöscht. HA-Backup muss extern gesichert sein!

### 2.1 Installation

- [ ] USB-Stick einstecken, KAMRUI starten
- [ ] Beim Boot `DEL` oder `F7` → Boot vom USB-Stick
- [ ] Proxmox-Installer durchlaufen:
  - Target Disk: interne SSD auswählen
  - Land/Zeitzone: Germany
  - Passwort + E-Mail setzen
  - Netzwerk: Management Interface auswählen, statische IP vergeben (gleiche IP wie vorher empfohlen)
  - Hostname: `kamrui.local` (oder nach Wahl)
- [ ] Installation abschließen, USB entfernen, neustarten

### 2.2 Proxmox Web-UI prüfen

- [ ] Browser öffnen: `https://<IP>:8006`
- [ ] Login: `root` + gewähltes Passwort
- [ ] Subscription-Warnung wegklicken (Community Edition ist kostenlos nutzbar)

### 2.3 Proxmox Community Repo aktivieren

In der Proxmox-Shell (Web-UI → Node → Shell):

```bash
# Enterprise-Repo deaktivieren (braucht Subscription)
sed -i 's/^deb/# deb/' /etc/apt/sources.list.d/pve-enterprise.list

# Community-Repo hinzufügen
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

# System aktualisieren
apt update && apt full-upgrade -y
```

## Phase 3: Home Assistant OS als VM

### 3.1 HA OS Image herunterladen

In der Proxmox-Shell:

```bash
# HA OS QCOW2-Image herunterladen (aktuellste Version prüfen!)
cd /var/lib/vz/template
wget https://github.com/home-assistant/operating-system/releases/download/14.2/haos_ova-14.2.qcow2.xz
xz -d haos_ova-14.2.qcow2.xz
```

> **Hinweis:** Version 14.2 ist ein Beispiel — aktuelle Version unter https://github.com/home-assistant/operating-system/releases prüfen.

### 3.2 VM erstellen

```bash
# VM mit ID 100 erstellen
qm create 100 --name homeassistant --memory 4096 --cores 2 --net0 virtio,bridge=vmbr0 --bios ovmf --machine q35 --efidisk0 local-lvm:1,efitype=4m --agent enabled=1

# HA OS Image als Disk importieren
qm importdisk 100 /var/lib/vz/template/haos_ova-14.2.qcow2 local-lvm

# Importierte Disk als SCSI-Disk zuweisen
qm set 100 --scsi0 local-lvm:vm-100-disk-1,ssd=1
qm set 100 --boot order=scsi0
qm set 100 --scsihw virtio-scsi-single

# Disk vergrößern (32 GB empfohlen)
qm resize 100 scsi0 +24G
```

### 3.3 USB-Geräte durchreichen (falls vorhanden)

```bash
# USB-Geräte auflisten
lsusb

# Beispiel: Zigbee-Stick durchreichen (Vendor:Product ID anpassen!)
# qm set 100 --usb0 host=1a86:7523
```

### 3.4 VM starten und HA einrichten

- [ ] VM starten: Proxmox UI → VM 100 → Start
- [ ] Warten bis HA erreichbar ist: `http://<IP>:8123` (kann 5-10 Min dauern)
- [ ] Onboarding durchlaufen ODER Backup wiederherstellen:
  - Einstellungen → System → Backups → Backup hochladen → `.tar`-Datei auswählen → Wiederherstellen

### 3.5 VM Autostart aktivieren

- [ ] Proxmox UI → VM 100 → Options → Start at boot → **Yes**

## Phase 4: LXC-Container einrichten

### 4.1 Community Helper Scripts (empfohlen)

Die Community Helper Scripts (https://community-scripts.github.io/ProxmoxVE/) automatisieren die LXC-Erstellung. In der Proxmox-Shell:

### 4.2 Pi-hole

```bash
bash -c "$(wget -qLO - https://community-scripts.github.io/ProxmoxVE/scripts?id=pihole)"
```

- [ ] LXC wird automatisch erstellt (~512 MB RAM, Debian)
- [ ] Nach Erstellung: Pi-hole Web-UI unter `http://<PIHOLE-IP>/admin`
- [ ] Admin-Passwort setzen: `pihole -a -p <passwort>` (im LXC-Terminal)
- [ ] Router DNS auf Pi-hole-IP umstellen

### 4.3 Cloudflared

```bash
bash -c "$(wget -qLO - https://community-scripts.github.io/ProxmoxVE/scripts?id=cloudflared)"
```

- [ ] LXC wird automatisch erstellt (~256 MB RAM)
- [ ] Tunnel authentifizieren (im LXC-Terminal):

```bash
cloudflared tunnel login
cloudflared tunnel create kamrui
```

- [ ] Tunnel-Config erstellen (`/root/.cloudflared/config.yml`):

```yaml
tunnel: kamrui
credentials-file: /root/.cloudflared/credentials.json

ingress:
  - hostname: ha.schowalter.co
    service: http://<HA-VM-IP>:8123
  - hostname: grafana.schowalter.co
    service: http://<GRAFANA-LXC-IP>:3000
  - hostname: pihole.schowalter.co
    service: http://<PIHOLE-LXC-IP>/admin
  - service: http_status:404
```

- [ ] DNS-Einträge in Cloudflare anlegen (CNAME → Tunnel)
- [ ] Tunnel starten und als Systemd-Service einrichten:

```bash
cloudflared service install
systemctl enable cloudflared
systemctl start cloudflared
```

- [ ] Cloudflared Add-on in HA deaktivieren/entfernen (wird nicht mehr gebraucht)

### 4.4 InfluxDB

```bash
bash -c "$(wget -qLO - https://community-scripts.github.io/ProxmoxVE/scripts?id=influxdb)"
```

- [ ] LXC wird erstellt (~1 GB RAM)
- [ ] InfluxDB Web-UI: `http://<INFLUXDB-LXC-IP>:8086`
- [ ] Initial Setup: Organisation, Bucket, API-Token anlegen
- [ ] In HA `configuration.yaml` — InfluxDB-Integration auf neue IP umstellen:

```yaml
influxdb:
  api_version: 2
  host: <INFLUXDB-LXC-IP>
  port: 8086
  token: <API-TOKEN>
  organization: home
  bucket: homeassistant
  # include/exclude wie bisher
```

- [ ] Alte Daten aus HA-Add-on exportieren/importieren (optional)

### 4.5 Grafana

```bash
bash -c "$(wget -qLO - https://community-scripts.github.io/ProxmoxVE/scripts?id=grafana)"
```

- [ ] LXC wird erstellt (~512 MB RAM)
- [ ] Grafana Web-UI: `http://<GRAFANA-LXC-IP>:3000`
- [ ] InfluxDB als Datasource hinzufügen (neue LXC-IP)
- [ ] Dashboards neu aufbauen oder aus HA-Grafana exportieren/importieren

### 4.6 Docker-Host LXC (Paperless-ngx & weitere)

Für Anwendungen, die es nicht als fertiges Community-Script gibt, einen Docker-Host LXC erstellen:

```bash
bash -c "$(wget -qLO - https://community-scripts.github.io/ProxmoxVE/scripts?id=docker)"
```

- [ ] LXC wird erstellt (Debian + Docker + Docker Compose)
- [ ] RAM: mindestens 2 GB empfohlen (Paperless-ngx + Redis + PostgreSQL)

#### Paperless-ngx installieren

Im Docker-Host LXC-Terminal:

```bash
mkdir -p /opt/paperless && cd /opt/paperless

# Docker Compose File erstellen
cat > docker-compose.yml << 'EOF'
services:
  broker:
    image: redis:7
    restart: unless-stopped
    volumes:
      - redis-data:/data

  db:
    image: postgres:16
    restart: unless-stopped
    volumes:
      - pgdata:/var/lib/postgresql/data
    environment:
      POSTGRES_DB: paperless
      POSTGRES_USER: paperless
      POSTGRES_PASSWORD: <SICHERES-PASSWORT>

  webserver:
    image: ghcr.io/paperless-ngx/paperless-ngx:latest
    restart: unless-stopped
    depends_on:
      - db
      - broker
    ports:
      - "8000:8000"
    volumes:
      - data:/usr/src/paperless/data
      - media:/usr/src/paperless/media
      - /opt/paperless/export:/usr/src/paperless/export
      - /opt/paperless/consume:/usr/src/paperless/consume
    environment:
      PAPERLESS_REDIS: redis://broker:6379
      PAPERLESS_DBHOST: db
      PAPERLESS_DBUSER: paperless
      PAPERLESS_DBPASS: <SICHERES-PASSWORT>
      PAPERLESS_OCR_LANGUAGE: deu
      PAPERLESS_TIME_ZONE: Europe/Berlin
      PAPERLESS_URL: https://paperless.schowalter.co

volumes:
  data:
  media:
  pgdata:
  redis-data:
EOF

docker compose up -d
```

- [ ] Warten bis alle Container laufen: `docker compose ps`
- [ ] Superuser anlegen: `docker compose exec webserver createsuperuser`
- [ ] Paperless-ngx Web-UI: `http://<DOCKER-LXC-IP>:8000`
- [ ] Cloudflared-Config ergänzen: `paperless.schowalter.co → http://<DOCKER-LXC-IP>:8000`
- [ ] Optional: Consume-Verzeichnis auf Synology NAS mounten (Scan → automatischer Import)

#### Weitere Docker-Anwendungen

Im selben LXC können weitere Compose-Stacks hinzugefügt werden:

```bash
mkdir -p /opt/<anwendung> && cd /opt/<anwendung>
# docker-compose.yml erstellen, docker compose up -d
```

## Phase 5: Validierung

### 5.1 Home Assistant

- [ ] HA erreichbar unter `http://<IP>:8123`
- [ ] `ha.schowalter.co` erreichbar (Cloudflare Tunnel)
- [ ] Alle Entitäten vorhanden (Sungrow Modbus, 1komma5°, Solcast, Shelly)
- [ ] EMHASS Add-on läuft und liefert Optimierungen
- [ ] Mosquitto MQTT funktioniert
- [ ] Automationen laufen (EMHASS 3x täglich)

### 5.2 Neue Dienste

- [ ] Pi-hole: DNS-Auflösung funktioniert, Ads werden geblockt
- [ ] Cloudflared: Alle Subdomains erreichbar (`ha.`, `grafana.`, `pihole.`, `paperless.`)
- [ ] InfluxDB: Sensordaten kommen an (HA → InfluxDB)
- [ ] Grafana: Dashboards zeigen Daten
- [ ] Paperless-ngx: Web-UI erreichbar, OCR funktioniert (Testdokument hochladen)
- [ ] Alle LXCs starten automatisch nach Reboot

### 5.3 Proxmox

- [ ] Snapshots erstellen und testen (HA VM → Snapshot → Rollback)
- [ ] Backup-Job einrichten (Proxmox Backup auf Synology NAS)

## Phase 6: Aufräumen

- [ ] HA-Konfiguration anpassen:
  - `trusted_proxies` in `configuration.yaml` auf neues Netzwerk prüfen
  - InfluxDB Add-on entfernen (läuft jetzt als LXC)
  - Grafana Add-on entfernen (läuft jetzt als LXC)
  - Cloudflared Add-on entfernen (läuft jetzt als LXC)
- [ ] Router: DNS auf Pi-hole umstellen
- [ ] Proxmox: Autostart für alle VMs/LXCs aktivieren
- [ ] Dokumentation aktualisieren: `setup-playbook.md`, `architektur.md`

## Ressourcen-Übersicht

| ID | Dienst | Typ | RAM | CPU | Autostart |
|---|---|---|---|---|---|
| 100 | Home Assistant OS | VM | 4 GB | 2 Cores | Ja |
| 101 | Pi-hole | LXC | 512 MB | 1 Core | Ja |
| 102 | Cloudflared | LXC | 256 MB | 1 Core | Ja |
| 103 | InfluxDB | LXC | 1 GB | 1 Core | Ja |
| 104 | Grafana | LXC | 512 MB | 1 Core | Ja |
| 105 | Docker-Host (Paperless-ngx) | LXC | 2 GB | 2 Cores | Ja |
| — | **Gesamt** | — | **~8.3 GB** | — | — |
| — | **Frei (von 16 GB)** | — | **~6-7 GB** | — | — |
