#!/usr/bin/env python3
"""
Fetches all Home Assistant entities via the REST API (using curl),
categorizes them by domain, and writes a structured Markdown file.
"""

import json
import subprocess
from collections import defaultdict
from pathlib import Path
from datetime import date

# --- Konfiguration ---
BASE_DIR = Path(__file__).resolve().parent.parent
TOKEN_FILE = BASE_DIR / ".ha_token"
OUTPUT_FILE = BASE_DIR / "docs" / "ha-entities.md"
API_URL = "https://ha.schowalter.co/api/states"

# --- Token laden ---
token = TOKEN_FILE.read_text().strip()

# --- API-Aufruf via curl ---
result = subprocess.run(
    ["curl", "-s", "-H", f"Authorization: Bearer {token}", API_URL],
    capture_output=True, text=True, timeout=30
)
if result.returncode != 0:
    raise RuntimeError(f"curl failed: {result.stderr}")

entities = json.loads(result.stdout)
print(f"Fetched {len(entities)} entities")

# --- Hilfsfunktionen ---
MYUPLINK_KEYWORDS = ["myuplink", "licv", "novelan"]


def is_myuplink(entity: dict) -> bool:
    """Erkennt myUplink-Entitaeten anhand von ID, Name oder Attributen."""
    eid = entity.get("entity_id", "").lower()
    fname = entity.get("attributes", {}).get("friendly_name", "").lower()
    attrs_str = json.dumps(entity.get("attributes", {})).lower()
    for kw in MYUPLINK_KEYWORDS:
        if kw in eid or kw in fname or kw in attrs_str:
            return True
    return False


def entity_row(e: dict) -> str:
    """Erzeugt eine Markdown-Tabellenzeile fuer eine Entitaet."""
    eid = e["entity_id"]
    attrs = e.get("attributes", {})
    fname = attrs.get("friendly_name", "—")
    state = e.get("state", "")
    if len(state) > 80:
        state = state[:77] + "..."
    uom = attrs.get("unit_of_measurement", "")
    # Pipe- und Newline-Zeichen in Werten escapen
    fname = fname.replace("|", "\\|").replace("\n", " ")
    state = state.replace("|", "\\|").replace("\n", " ")
    uom = (uom or "").replace("|", "\\|")
    return f"| `{eid}` | {fname} | {state} | {uom} |"


TABLE_HEADER = "| Entity ID | Friendly Name | State | Unit |\n|---|---|---|---|"

# --- Kategorisieren ---
myuplink_entities = []
domains = defaultdict(list)

for e in entities:
    eid = e.get("entity_id", "")
    domain = eid.split(".")[0] if "." in eid else "unknown"
    domains[domain].append(e)
    if is_myuplink(e):
        myuplink_entities.append(e)

# Sortieren
for d in domains:
    domains[d].sort(key=lambda x: x["entity_id"])
myuplink_entities.sort(key=lambda x: x["entity_id"])

sorted_domains = sorted(domains.keys())

# --- Markdown generieren ---
lines = []
lines.append("# Home Assistant Entities")
lines.append("")
lines.append(f"> Automatisch generiert am **{date.today().isoformat()}** — {len(entities)} Entitäten gesamt")
lines.append("")

# Inhaltsverzeichnis
lines.append("## Inhaltsverzeichnis")
lines.append("")
lines.append(f"- [myUplink / Novelan Entitäten](#myuplink--novelan-entitäten) ({len(myuplink_entities)})")
for d in sorted_domains:
    count = len(domains[d])
    lines.append(f"- [{d}](#{d}) ({count})")
lines.append("")

# Domain-Zusammenfassung
lines.append("## Zusammenfassung nach Domain")
lines.append("")
lines.append("| Domain | Anzahl |")
lines.append("|---|---|")
for d in sorted_domains:
    lines.append(f"| {d} | {len(domains[d])} |")
lines.append("")

# myUplink-Sektion
lines.append("## myUplink / Novelan Entitäten")
lines.append("")
if myuplink_entities:
    lines.append(
        f"{len(myuplink_entities)} Entitäten erkannt (Filter: entity_id/friendly_name/attributes "
        f'enthalten "myuplink", "licv" oder "novelan").'
    )
    lines.append("")
    lines.append(TABLE_HEADER)
    for e in myuplink_entities:
        lines.append(entity_row(e))
else:
    lines.append("Keine myUplink-Entitäten gefunden.")
lines.append("")

# Pro Domain
for d in sorted_domains:
    elist = domains[d]
    lines.append(f"## {d}")
    lines.append("")
    lines.append(f"{len(elist)} Entitäten")
    lines.append("")
    lines.append(TABLE_HEADER)
    for e in elist:
        lines.append(entity_row(e))
    lines.append("")

# --- Datei schreiben ---
OUTPUT_FILE.write_text("\n".join(lines), encoding="utf-8")
print(f"Written to {OUTPUT_FILE} ({len(lines)} lines)")
