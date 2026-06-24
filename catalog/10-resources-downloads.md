# Downloadable resources

Every resource Apple publishes on https://developer.apple.com/design/resources/,
by name, with where it comes from. Run `tools/fetch-assets.sh` to pull the
direct-download files into the local `assets/` folder (never committed). The
UI Kits that live only on Sketch Cloud or Figma Community are opened in those
apps, not downloaded as files.

For the real file names and Sketch symbol names inside each downloaded asset, see
`_extracted/` (for example the tvOS UI library has 1,125 symbols, visionOS 923).

## UI Kits

| Kit | Platform | Formats | How to get it |
|---|---|---|---|
| iOS and iPadOS 27 UI Kit | iOS, iPadOS | Figma, Sketch | Open in app. Sketch Cloud `sketch.com/s/04c24d8b-38fb-4afb-8836-36617e022f02`, Figma Community |
| macOS 27 UI Kit | macOS | Figma, Sketch | Open in app. Sketch Cloud `sketch.com/s/57153a31-3379-4737-8ac6-dbfd6525f052`, Figma Community |
| watchOS 26 UI Kit | watchOS | Figma, Sketch | Open in app. Sketch Cloud `sketch.com/s/2b12618d-596c-41fd-8488-132bff9535e7`, Figma Community |
| visionOS 26 UI Kit | visionOS | Figma, Sketch | Open in app. Sketch Cloud `sketch.com/s/eb13bfe1-2ddb-4f87-b92c-740a36abed7a`, Figma Community |
| tvOS 18 UI Kit (Sketch Library) | tvOS | Sketch | Direct download (DMG). 1,125 symbols, see `_extracted/ui-kits` |
| visionOS 2 UI Kit (Sketch Library) | visionOS | Sketch, Figma | Direct download (DMG). 923 symbols, see `_extracted/ui-kits` |

## App-icon templates

| Template | Platforms | Formats | How to get it |
|---|---|---|---|
| App Icon Template 27 | iOS, iPadOS, watchOS | Figma, Sketch, Photoshop, Illustrator | Direct download (Photoshop and Illustrator DMG), plus Figma and Sketch Cloud |
| Icon Composer | iPhone, iPad, Mac, Apple Watch | App | Download from Apple Developer downloads. Builds layered Liquid Glass icons |

## Technology templates (open in Figma or Sketch)

| Template | Formats | Sketch Cloud |
|---|---|---|
| App Clips | Figma, Sketch | `sketch.com/s/e6ed1af0-508c-4fd5-bc6f-05f7ccb91c6e` |
| Apple Pay | Figma, Sketch | `sketch.com/s/b0fa95e1-e12d-4694-895f-a70f39b8f313` |
| Camera Control | Sketch | `sketch.com/s/85a0f9d2-d76c-42f9-b681-6225882d8024` |
| Live Activities | Figma, Sketch | `sketch.com/s/d1e8992f-14c2-4eef-b29d-24a32c0c0ef9` |
| Messages (iMessage Apps and Stickers) | Figma, Sketch | `sketch.com/s/d6cd3d23-7aec-43d5-acb9-52f720ff48b7` |
| Sign in with Apple (buttons) | Figma, Sketch | `sketch.com/s/7cd7dbf4-41b2-4e90-bb00-2796ced3cf2b` |
| Siri and App Shortcuts | Figma, Sketch | `sketch.com/s/84ba051b-c6ad-48c5-8106-28185947754a` |
| Tap to Pay on iPhone | Figma, Sketch | `sketch.com/s/fbd2fa90-fadd-403a-b319-0f4d7c04ae5f` |
| TipKit | Figma, Sketch | `sketch.com/s/b99f22e1-235e-481b-9ccd-aa7d8f31fedc` |
| Wallet | Figma, Sketch | `sketch.com/s/dd2ce40a-097e-486b-9053-b60088e1d6c3` |

## Fonts (direct download)

| Font | Used for |
|---|---|
| SF Pro | System font for iOS, iPadOS, macOS, tvOS |
| SF Compact | System font for watchOS, tuned for small sizes |
| SF Mono | Fixed-width font, used in Xcode |
| New York | Serif companion to San Francisco |
| SF Arabic | Arabic system font |
| SF Armenian | Armenian system font |
| SF Georgian | Georgian system font |
| SF Hebrew | Hebrew system font |

## SF Symbols (direct download)

| Library | Notes |
|---|---|
| SF Symbols 8 (beta) | 7,000-plus symbols, nine weights, three scales, multi-layer for motion. Needs the SF Symbols app on macOS |
| SF Symbols 7 | Symbol library with localized designs for 20-plus scripts |

## Glyphs, icons, and logos (direct download)

| Asset | Formats | Real file names |
|---|---|---|
| Add Apple Watch Face | PNG, PDF, SVG | see `_extracted/glyphs` |
| AirPlay | PDF | see `_extracted/glyphs` |
| Apple Health icon | PNG | see `_extracted/glyphs` |
| ARKit badge and glyph | PDF | see `_extracted/glyphs` |
| Game Center | PNG, PDF | see `_extracted/glyphs` |
| HomeKit icon and glyph | PNG, PDF | see `_extracted/glyphs` |
| Sign in with Apple logo | PNG, PDF, SVG | see `_extracted/glyphs` |
| Siri icons | PNG | see `_extracted/glyphs` |

## Product bezels (direct download, device frames)

iPhone 17, iPhone 16, iPad Pro (M5), iPad Air (M4), iPad (A16), iPad mini (A17
Pro), MacBook Pro M5, MacBook Air M5, MacBook Neo, iMac (M4), Studio Displays,
Apple Watch Series 11, Apple Watch Ultra 3 (2025), Apple Watch Ultra 2 (2024),
Apple TV, and the Keynote Live Video product bezel. Real frame file names are in
`_extracted/bezels`.

## Platform templates (direct download)

| Template | Platform | Formats |
|---|---|---|
| tvOS 18 Design Templates | tvOS | Sketch (892 symbols, see `_extracted/tvos`) |
| tvOS 18 Production Templates | tvOS | Sketch, Photoshop |
| visionOS 2 Design Templates | visionOS | Sketch (900 symbols, see `_extracted/visionos`) |

## Tools

| Tool | Platform | Notes |
|---|---|---|
| Icon Composer | macOS | Builds layered Liquid Glass app icons |
| Parallax Previewer | tvOS, visionOS | Previews parallax effects for static images |
| Parallax Exporter (Photoshop plug-in) | tvOS, visionOS | Exports layered parallax images. The macOS plug-in zip was unavailable at fetch time, treat as reference |
