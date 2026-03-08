# HACS – Home Assistant Community Store

> Quelle: https://hacs.xyz/docs/use/

## Installation (HAOS)

1. HACS Add-on Repository hinzufügen:
   - Einstellungen → Add-ons → 3-Punkt-Menü → Repositories
   - URL: `https://github.com/hacs/addons`
2. **Einstellungen → Add-ons → Add-on Store → "Get HACS"** installieren
3. Add-on starten
4. Logs prüfen für weitere Anweisungen
5. Home Assistant neustarten
6. HACS-Integration konfigurieren (GitHub-Konto verknüpfen)

## Nutzung

### Integration installieren
1. HACS → Integrationen → Repository durchsuchen
2. Gewünschte Integration auswählen → Herunterladen
3. Home Assistant neustarten
4. Integration über Einstellungen → Geräte & Dienste einrichten

### Repository-Typen
- **Integrationen** (z.B. hacs_1komma5grad)
- **Dashboard-Komponenten** (Custom Cards)
- **Themes**
- **AppDaemon Apps**
- **Python Scripts**

## Verwaltung

- **Updates**: HACS zeigt verfügbare Updates an
- **Entfernen**: HACS → Integration → Entfernen
- **Debug-Logging**: Über HA Logger-Konfiguration

## Für dieses Projekt relevante HACS-Integrationen

| Integration | Repository | Zweck |
|---|---|---|
| **hacs_1komma5grad** | BirknerAlex/hacs_1komma5grad | Heartbeat Preise + Energy-Sensoren |
