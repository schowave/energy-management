# ADR-0015: Cloudflare Tunnel für Remote-Zugriff

**Status:** Akzeptiert (März 2026)

## Kontext

Home Assistant soll von unterwegs erreichbar sein — über `ha.schowalter.co`. Die Domain wird bereits über Cloudflare verwaltet.

## Betrachtete Alternativen

| Option | Pro | Contra |
|---|---|---|
| **Cloudflare Tunnel (Cloudflared App)** | Kein Port-Forwarding, kein offener Port, automatisches SSL, DDoS-Schutz, einfaches HAOS App | Abhängigkeit von Cloudflare, minimale Latenz durch Proxy |
| Port-Forwarding + Let's Encrypt | Kein Drittanbieter-Proxy | Port 443 offen am Router, manuelles Zertifikats-Management, kein DDoS-Schutz |
| VPN (WireGuard/Tailscale) | Volle Verschlüsselung, kein offener Port | Kein Zugriff ohne VPN-Client, umständlicher für Companion App |
| Nabu Casa (HA Cloud) | Offiziell supportet, einfachste Einrichtung | 7,50 €/Mo, redundant wenn Cloudflare-Domain vorhanden |

## Entscheidung

**Cloudflare Tunnel** via Cloudflared App in HAOS.

## Begründung

- **Kein Port-Forwarding nötig** — der Tunnel ist ausgehend (N100 → Cloudflare), kein offener Port am Router
- **Domain bereits bei Cloudflare** — `schowalter.co` wird dort verwaltet, DNS-Eintrag wird automatisch erstellt
- **Automatisches SSL** — HTTPS ohne eigenes Zertifikats-Management
- **DDoS-Schutz** inklusive über Cloudflare-Netzwerk
- **Kostenlos** — Cloudflare Tunnels sind im Free-Plan enthalten
- **HAOS App verfügbar** — einfache Installation und Konfiguration

## Konfiguration

```yaml
# configuration.yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

- External URL: `https://ha.schowalter.co`
- Cloudflared App hostname: `ha.schowalter.co`

## Konsequenzen

- **Cloudflare-Abhängigkeit** — bei Cloudflare-Ausfall kein Remote-Zugriff (lokal weiterhin erreichbar)
- **Latenz** — minimaler Overhead durch Cloudflare-Proxy (~10-50ms), für Dashboard-Nutzung irrelevant
- **Datenschutz** — Traffic läuft über Cloudflare-Server (End-to-End verschlüsselt, aber Cloudflare terminiert TLS)
- **Companion App** — funktioniert direkt über die externe URL, kein VPN nötig
