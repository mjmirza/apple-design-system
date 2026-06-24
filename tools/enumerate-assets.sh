#!/usr/bin/env bash
# GRIND_CHECKPOINT_OK: one-shot enumeration of locally-downloaded Apple assets
#
# Mounts each downloaded DMG (read-only), lists the real file names inside, and
# for Sketch UI-kit libraries parses the symbol/component names out of the
# .sketch document. Writes plain-text name listings to catalog/_extracted/.
#
# These listings are FILE NAMES and SYMBOL NAMES only (facts), not Apple's
# binary content, so they are safe to commit. The binaries themselves stay in
# the git-ignored assets/ folder.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/assets"
OUT="$ROOT/catalog/_extracted"
LOG="$ROOT/tools/enumerate.log"
mkdir -p "$OUT"; : > "$LOG"

log() { printf '%s  %s\n' "$(date -u +%FT%TZ)" "$1" | tee -a "$LOG"; }

MNTROOT=/tmp/ads_mnt; mkdir -p "$MNTROOT"
detach_all() { for mp in "$MNTROOT"/dmg.*; do [ -d "$mp" ] && hdiutil detach -quiet -force "$mp" 2>/dev/null; done; }
trap detach_all EXIT

parse_sketch() { # $1 .sketch file  $2 out file
  local sk="$1" out="$2" tmp
  tmp="$(mktemp -d)"
  if unzip -o -q "$sk" 'pages/*.json' 'document.json' -d "$tmp" 2>>"$LOG"; then
    python3 - "$tmp" >> "$out" 2>>"$LOG" <<'PY'
import json, glob, os, sys
root = sys.argv[1]
syms, arts = set(), set()
def walk(o):
    if isinstance(o, dict):
        c = o.get('_class'); n = o.get('name')
        if c == 'symbolMaster' and n: syms.add(n)
        if c == 'artboard' and n: arts.add(n)
        for v in o.values(): walk(v)
    elif isinstance(o, list):
        for v in o: walk(v)
for f in glob.glob(os.path.join(root, 'pages', '*.json')) + glob.glob(os.path.join(root, 'document.json')):
    try: walk(json.load(open(f)))
    except Exception: pass
print("--- Symbols (reusable components) ---")
for n in sorted(syms): print(n)
print("\n--- Artboards (screens / layouts) ---")
for n in sorted(arts): print(n)
print(f"\n[counts] symbols={len(syms)} artboards={len(arts)}")
PY
  fi
  rm -rf "$tmp"
}

shopt -s nullglob
for dmg in "$DEST"/*/*.dmg; do
  cat="$(basename "$(dirname "$dmg")")"
  base="$(basename "$dmg" .dmg)"
  mp=$(yes | hdiutil attach -nobrowse -noverify -noautoopen -readonly -mountrandom "$MNTROOT" "$dmg" 2>>"$LOG" | grep -Eo "$MNTROOT/dmg\.[A-Za-z0-9]+" | tail -1)
  if [ -z "$mp" ] || [ ! -d "$mp" ]; then log "MOUNT-FAIL  $cat/$base"; continue; fi
  outdir="$OUT/$cat"; mkdir -p "$outdir"
  listing="$outdir/$base.files.txt"
  {
    echo "# Contents of $cat/$base.dmg  (file names only — Apple Inc. property)"
    echo "# source: https://developer.apple.com/design/resources/"
    echo
    ( cd "$mp" && find . -maxdepth 4 -not -path '*/.*' -printf '%y  %p\n' 2>/dev/null \
        || find "$mp" -maxdepth 4 -not -path '*/.*' )
  } > "$listing"
  log "ok  $cat/$base  ($(grep -c '/' "$listing") entries)"

  # Sketch UI libraries: parse component/symbol names.
  while IFS= read -r sk; do
    [ -n "$sk" ] || continue
    skout="$outdir/$base.symbols.txt"
    echo "# Sketch symbols/artboards from $cat/$base ($(basename "$sk")) — names are facts" > "$skout"
    parse_sketch "$sk" "$skout"
    log "  parsed sketch  $(basename "$sk")"
  done < <(find "$mp" -maxdepth 3 -name '*.sketch' 2>/dev/null)

  hdiutil detach -quiet -force "$mp" 2>/dev/null
done

log "DONE"
