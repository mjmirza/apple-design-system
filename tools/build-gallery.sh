#!/usr/bin/env bash
# GRIND_CHECKPOINT_OK: one-shot local gallery builder (single-pass)
#
# Builds a LOCAL, browsable visual review page from the downloaded assets.
#
# It copies the real image files that ship inside Apple's downloads (glyphs,
# icons, logos, Siri art, device bezels, and each UI kit's preview thumbnail)
# into assets/_gallery/, and generates assets/_gallery/index.html. For the UI
# components, foundations, and patterns (which are vector symbols that cannot be
# rendered without the Sketch app), it lists every one by name with a direct
# "View at Apple" link to the Human Interface Guidelines, where Apple shows the
# picture.
#
# Everything it writes lives under assets/, which is git-ignored. Nothing of
# Apple's is committed or published. Open the result locally with:
#   open assets/_gallery/index.html
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/assets"
GAL="$DEST/_gallery"
IMG="$GAL/img"
LOG="$ROOT/tools/gallery.log"
rm -rf "$GAL"; mkdir -p "$IMG"; : > "$LOG"

log() { printf '%s  %s\n' "$(date -u +%FT%TZ)" "$1" | tee -a "$LOG"; }

MNTROOT=/tmp/ads_gal; mkdir -p "$MNTROOT"
detach_all() { for mp in "$MNTROOT"/dmg.*; do [[ -d "$mp" ]] && hdiutil detach -quiet -force "$mp" 2>/dev/null; done; }
trap detach_all EXIT

shopt -s nullglob
for dmg in "$DEST"/*/*.dmg; do
  cat="$(basename "$(dirname "$dmg")")"
  base="$(basename "$dmg" .dmg)"
  mp=$(yes | hdiutil attach -nobrowse -noverify -noautoopen -readonly -mountrandom "$MNTROOT" "$dmg" 2>>"$LOG" | grep -Eo "$MNTROOT/dmg\.[A-Za-z0-9]+" | tail -1)
  if [[ -z "$mp" ]] || [[ ! -d "$mp" ]]; then log "MOUNT-FAIL $cat/$base"; continue; fi
  outdir="$IMG/$cat"; mkdir -p "$outdir"
  # Copy displayable raster/vector images (png, jpg, svg). The hash-named
  # internal bitmaps inside .sketch are skipped; kit previews handled below.
  n=0
  while IFS= read -r -d '' f; do
    fn="$(basename "$f")"
    if cp "$f" "$outdir/${base}__${fn}" 2>/dev/null; then n=$((n+1)); fi
  done < <(find "$mp" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.svg' \) -not -path '*/.*' -print0 2>/dev/null)
  # Each UI kit / template .sketch carries a single document preview thumbnail.
  while IFS= read -r sk; do
    if [[ -z "$sk" ]]; then continue; fi
    prev="$outdir/${base}__kit-preview.png"
    if unzip -p "$sk" 'previews/preview.png' > "$prev" 2>/dev/null && [[ -s "$prev" ]]; then
      n=$((n+1))
    else
      rm -f "$prev"
    fi
  done < <(find "$mp" -maxdepth 3 -name '*.sketch' 2>/dev/null)
  log "images  $cat/$base  copied=$n"
  hdiutil detach -quiet -force "$mp" 2>/dev/null
done

log "generating index.html"
python3 - "$ROOT" "$GAL" <<'PY'
import os, sys, html, re
root, gal = sys.argv[1], sys.argv[2]
img_root = os.path.join(gal, "img")

HIG = "https://developer.apple.com/design/human-interface-guidelines/"
def slug(name):
    s = name.strip().lower().replace("&", "and")
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return s

def parse_table_names(md_path):
    names = []
    if not os.path.exists(md_path):
        return names
    for line in open(md_path, encoding="utf-8"):
        line = line.rstrip("\n")
        if not line.startswith("| "):
            continue
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if not cells:
            continue
        first = cells[0]
        if first.lower() in ("component", "topic", "pattern", "input", "technology",
                             "platform", "kit", "template", "font", "library", "asset", "category", ""):
            continue
        if set(first) <= set("-: "):
            continue
        names.append(first)
    return names

CAT_TITLES = {
    "glyphs": "Glyphs, icons, and logos",
    "bezels": "Device bezels",
    "ui-kits": "UI kit previews",
    "tvos": "tvOS template previews",
    "visionos": "visionOS template previews",
    "app-icons": "App-icon template",
}

def img_cards(cat):
    d = os.path.join(img_root, cat)
    if not os.path.isdir(d):
        return ""
    files = sorted(f for f in os.listdir(d) if f.lower().endswith((".png", ".jpg", ".svg")))
    if not files:
        return ""
    cards = []
    for f in files:
        rel = os.path.join("img", cat, f)
        label = html.escape(f.replace("__", "  /  ").rsplit(".", 1)[0])
        cards.append(f'<figure><img loading="lazy" src="{html.escape(rel)}" alt="{label}">'
                     f'<figcaption>{label}</figcaption></figure>')
    return f'<h2>{html.escape(CAT_TITLES.get(cat, cat))}</h2><div class="grid">' + "".join(cards) + "</div>"

def link_list(title, md_file, fallback_slug=None):
    names = parse_table_names(os.path.join(root, "catalog", md_file))
    if not names:
        return ""
    items = []
    for n in names:
        url = HIG + (fallback_slug if fallback_slug else slug(n))
        items.append(f'<li>{html.escape(n)} <a href="{html.escape(url)}" target="_blank" rel="noopener">View at Apple</a></li>')
    return f'<h2>{html.escape(title)} <span class="count">{len(names)}</span></h2><ul class="links">' + "".join(items) + "</ul>"

parts = []
parts.append("""<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Apple Design System, local visual review</title>
<style>
:root{color-scheme:light dark}
body{font:16px/1.5 -apple-system,Helvetica,Arial,sans-serif;margin:0;padding:24px;max-width:1100px;margin-inline:auto;background:#fafafa;color:#111}
@media (prefers-color-scheme:dark){body{background:#141414;color:#eee}figure{background:#1f1f1f}}
h1{font-size:28px;margin:0 0 4px}
.lead{color:#666;margin:0 0 24px}
.legal{border:1px solid #d9b;background:#fff7f7;padding:12px 16px;border-radius:10px;font-size:14px;margin:0 0 28px}
@media (prefers-color-scheme:dark){.legal{background:#2a1f1f;border-color:#553}}
h2{margin:32px 0 12px;font-size:20px;border-top:1px solid #ddd;padding-top:20px}
.count{font-size:13px;color:#888;font-weight:normal}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(150px,1fr));gap:14px}
figure{margin:0;background:#fff;border-radius:10px;padding:10px;text-align:center;border:1px solid #eee}
figure img{max-width:100%;height:90px;object-fit:contain;display:block;margin:0 auto 8px}
figcaption{font-size:11px;color:#777;word-break:break-word}
ul.links{columns:2;gap:24px;padding-left:18px}
ul.links li{margin:2px 0;break-inside:avoid}
ul.links a{font-size:12px;margin-left:6px}
nav a{margin-right:14px;font-size:14px}
</style></head><body>""")
parts.append("<h1>Apple Design System, local visual review</h1>")
parts.append('<p class="lead">Generated locally from the downloaded assets. Not committed, not published.</p>')
parts.append('<div class="legal"><strong>All images are the property of Apple Inc.</strong> They are shown here only on your machine for your own review, under Apple\'s license. They are never committed or redistributed by this project. Component, foundation, and pattern rows link to Apple\'s Human Interface Guidelines, where Apple shows each one.</div>')
parts.append('<nav><a href="#components">Components</a><a href="#foundations">Foundations</a><a href="#patterns">Patterns</a><a href="#inputs">Inputs</a><a href="#technologies">Technologies</a><a href="#images">Real images</a></nav>')
parts.append('<a id="components"></a>' + link_list("Components", "01-components.md"))
parts.append('<a id="foundations"></a>' + link_list("Foundations", "02-foundations.md"))
parts.append('<a id="patterns"></a>' + link_list("Patterns", "03-patterns.md"))
parts.append('<a id="inputs"></a>' + link_list("Inputs", "04-inputs.md"))
parts.append('<a id="technologies"></a>' + link_list("Technologies", "05-technologies.md"))
parts.append('<a id="platforms"></a>' + link_list("Designing for each platform", "06-platforms.md", fallback_slug="platforms"))
parts.append('<a id="images"></a>')
for cat in ["glyphs", "bezels", "ui-kits", "tvos", "visionos", "app-icons"]:
    parts.append(img_cards(cat))
parts.append("</body></html>")
open(os.path.join(gal, "index.html"), "w", encoding="utf-8").write("\n".join(p for p in parts if p))
print("wrote", os.path.join(gal, "index.html"))
PY
log "DONE. open $GAL/index.html"
