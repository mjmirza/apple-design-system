#!/usr/bin/env bash
# GRIND_CHECKPOINT_OK: one-shot Apple design-resource fetcher (single-pass setup)
#
# Reproducible downloader for the Apple Design Resources mirror.
#
# EVERY file is fetched DIRECTLY from Apple's own servers
# (devimages-cdn.apple.com, itunespartner.apple.com). This repository re-hosts
# NOTHING of Apple's. All downloaded assets are the property of Apple Inc. and
# are governed by the license terms that accompany each download. See CREDITS.md.
#
# Usage:   bash tools/fetch-assets.sh
# Re-run:  resumes partial downloads, skips files already complete.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/assets"
LOG="$ROOT/tools/fetch.log"
: > "$LOG"

log() { printf '%s  %s\n' "$(date -u +%FT%TZ)" "$1" | tee -a "$LOG"; }

# Confirmed direct-download files.  Format:  category|filename|url
read -r -d '' MANIFEST <<'EOF'
fonts|SF-Pro.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg
fonts|SF-Compact.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg
fonts|SF-Mono.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg
fonts|NY.dmg|https://devimages-cdn.apple.com/design/resources/download/NY.dmg
fonts|SF-Arabic.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg
fonts|SF-Armenian.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg
fonts|SF-Georgian.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg
fonts|SF-Hebrew.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg
sf-symbols|SF-Symbols-8.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-8.dmg
sf-symbols|SF-Symbols-7.dmg|https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-7.dmg
ui-kits|Apple-Sketch-Library-tvOS-18.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-tvOS-18.dmg
ui-kits|Apple-Sketch-Library-visionOS-2.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-visionOS-2.dmg
app-icons|iOS-27-Icon-Templates-Photoshop-Illustrator.dmg|https://devimages-cdn.apple.com/design/resources/download/iOS-27-Icon-Templates-Photoshop-Illustrator.dmg
tvos|tvOS-18-Design-Templates-Sketch.dmg|https://devimages-cdn.apple.com/design/resources/download/tvOS-18-Design-Templates-Sketch.dmg
tvos|tvOS-18-Production-Templates-Sketch.dmg|https://devimages-cdn.apple.com/design/resources/download/tvOS-18-Production-Templates-Sketch.dmg
tvos|tvOS-18-Production-Templates-Photoshop.dmg|https://devimages-cdn.apple.com/design/resources/download/tvOS-18-Production-Templates-Photoshop.dmg
visionos|visionOS-2-Design-Templates-Sketch.dmg|https://devimages-cdn.apple.com/design/resources/download/visionOS-2-Design-Templates-Sketch.dmg
glyphs|Glyph-Add-Apple-Watch-Face.dmg|https://devimages-cdn.apple.com/design/resources/download/Glyph-Add-Apple-Watch-Face.dmg
glyphs|Glyph-AirPlay.dmg|https://devimages-cdn.apple.com/design/resources/download/Glyph-AirPlay.dmg
glyphs|Icon-Apple-Health.dmg|https://devimages-cdn.apple.com/design/resources/download/Icon-Apple-Health.dmg
glyphs|Glyph-ARKit.dmg|https://devimages-cdn.apple.com/design/resources/download/Glyph-ARKit.dmg
glyphs|Icon-Game-Center.dmg|https://devimages-cdn.apple.com/design/resources/download/Icon-Game-Center.dmg
glyphs|Icon-HomeKit.dmg|https://devimages-cdn.apple.com/design/resources/download/Icon-HomeKit.dmg
glyphs|Logo-Sign-in-with-Apple.dmg|https://devimages-cdn.apple.com/design/resources/download/Logo-Sign-in-with-Apple.dmg
glyphs|Icon-Siri.dmg|https://devimages-cdn.apple.com/design/resources/download/Icon-Siri.dmg
bezels|Bezel-Apple-TV.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-Apple-TV.dmg
bezels|Bezel-Apple-Watch-Ultra-3-2025.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-Apple-Watch-Ultra-3-2025.dmg
bezels|Bezel-Apple-Watch-Ultra-2-2024.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-Apple-Watch-Ultra-2-2024.dmg
bezels|Bezel-Apple-Watch-Series-11-2025.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-Apple-Watch-Series-11-2025.dmg
bezels|Bezel-Studio-Displays.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-Studio-Displays.dmg
bezels|Bezel-iMac-M4.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iMac-M4.dmg
bezels|Bezel-iPad-(A16).dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPad-(A16).dmg
bezels|Bezel-iPad-Air-(M4).dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPad-Air-(M4).dmg
bezels|Bezel-iPad-mini-(A17-Pro).dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPad-mini-(A17-Pro).dmg
bezels|Bezel-iPad-Pro-(M5).dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPad-Pro-(M5).dmg
bezels|Bezel-iPhone-17.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPhone-17.dmg
bezels|Bezel-iPhone-16.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-iPhone-16.dmg
bezels|Bezel-MacBook-Air-M5.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-MacBook-Air-M5.dmg
bezels|Bezel-MacBook-Pro-M5.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-MacBook-Pro-M5.dmg
bezels|Bezel-MacBook-Neo.dmg|https://devimages-cdn.apple.com/design/resources/download/Bezel-MacBook-Neo.dmg
bezels|Keynote-Live-Video-Product-Bezel.dmg|https://devimages-cdn.apple.com/design/resources/download/Keynote-Live-Video-Product-Bezel.dmg
parallax|Parallax-Previewer.dmg|https://itunespartner.apple.com/assets/downloads/Parallax%20Previewer.dmg
parallax|ParallaxExporter-macOS.zip|https://itunespartner.apple.com/assets/downloads/ParallexExporter_Apps.zip
parallax|ParallaxExporter-Windows.zip|https://itunespartner.apple.com/assets/downloads/ParallaxExporter_Windows.zip
EOF

# Speculative probes: current UI-kit Sketch libraries may follow the same naming
# pattern as the resolved tvOS/visionOS ones. Try; download only on HTTP 200.
PROBES="
ui-kits|Apple-Sketch-Library-iOS-27.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-iOS-27.dmg
ui-kits|Apple-Sketch-Library-iPadOS-27.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-iPadOS-27.dmg
ui-kits|Apple-Sketch-Library-macOS-27.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-macOS-27.dmg
ui-kits|Apple-Sketch-Library-watchOS-26.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-watchOS-26.dmg
ui-kits|Apple-Sketch-Library-visionOS-26.dmg|https://devimages-cdn.apple.com/design/resources/download/Apple-Sketch-Library-visionOS-26.dmg
"

fetch_one() {
  local cat="$1" fn="$2" url="$3" out
  out="$DEST/$cat/$fn"
  if [ -s "$out" ]; then log "skip (present)  $cat/$fn"; return 0; fi
  if curl -L -C - --fail --retry 3 --retry-delay 2 -A 'Mozilla/5.0' \
       -o "$out" "$url" >>"$LOG" 2>&1; then
    log "ok            $cat/$fn  ($(du -h "$out" 2>/dev/null | cut -f1))"
  else
    rm -f "$out"
    log "FAIL          $cat/$fn  <- $url"
  fi
}

ok=0; fail=0
while IFS='|' read -r cat fn url; do
  [ -z "${cat:-}" ] && continue
  if fetch_one "$cat" "$fn" "$url"; then ok=$((ok+1)); else fail=$((fail+1)); fi
done <<< "$MANIFEST"

# Probes
while IFS='|' read -r cat fn url; do
  [ -z "${cat:-}" ] && continue
  code=$(curl -fsSLI -o /dev/null -w '%{http_code}' "$url" 2>/dev/null || echo 000)
  if [ "$code" = "200" ]; then
    log "probe HIT     $cat/$fn"
    fetch_one "$cat" "$fn" "$url"
  else
    log "probe miss    $cat/$fn (http=$code)"
  fi
done <<< "$PROBES"

log "DONE. See $LOG"
df -h "$HOME" | sed -n '2p' | tee -a "$LOG"
