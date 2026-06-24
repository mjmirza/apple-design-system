# Credits and Licensing

Read this before using anything fetched through this project.

## 1. Ownership. Everything here is Apple's

Every design asset this project references or downloads (UI kits, app-icon
templates, product bezels, glyphs, logos, the San Francisco and New York font
families, SF Symbols, design and production templates, and the design tools) is
the property of **Apple Inc.** and its licensors. None of it is the property of
this project or its authors.

Apple makes these resources available to developers and designers to make
building for Apple platforms easier. This project is grateful for that and
exists only to make them easier to find by name. It claims no ownership and
grants no rights over any Apple material.

## 2. What this repository does and does not do

**What it does.** It documents the resources by name (the catalog), and it
fetches them, on your own machine, directly from Apple's own servers, via
`tools/fetch-assets.sh`.

**What it does not do.** It does not host, mirror, embed, bundle, or
redistribute any Apple asset. The downloaded binaries live only in the local,
git-ignored `assets/` folder and are never committed. The committed catalog
holds only names, structure, and usage notes (facts and original commentary),
which are not Apple's property.

## 3. The governing license (read it, follow it)

Each download carries Apple's own license, usually as a bundled file (for
example `Apple Design Resources License.rtf`, or a per-resource agreement such
as the Siri or font license). Those terms govern. This project does not restate,
alter, waive, or grant any rights.

The Apple Design Resources License Agreement is explicit about scope. Its own
Important Notes state that the resources are **licensed, not sold**, and that
they are

> "TO BE USED SOLELY FOR CREATING MOCK-UPS OF USER INTERFACES DESIGNED FOR USE
> IN SOFTWARE PRODUCTS THAT RUN ONLY ON APPLE'S macOS, iOS, watchOS, tvOS,
> AND/OR visionOS OPERATING SYSTEM SOFTWARE."

That is the boundary. Read the full agreement bundled with each download before
use, and consult Apple's terms directly:

- Apple Design Resources, https://developer.apple.com/design/resources/
- Apple Developer agreements and guidelines, https://developer.apple.com/terms/
- Apple Intellectual Property and trademarks, https://www.apple.com/legal/intellectual-property/

## 4. Commercial-use status (important)

These are **not** a general-purpose free asset library.

- The design resources are licensed for mock-ups of user interfaces for software
  that runs on Apple's operating systems. Not for arbitrary use, not as a
  clip-art pack, and (per the agreement) not for non-Apple-platform products.
- The San Francisco and New York fonts and SF Symbols each have their own
  license, bundled in their downloads, that restricts how and where they may be
  used. SF Symbols, for example, may not be used to create logos or be modified
  in disallowed ways. Read those licenses before using the fonts or symbols in
  any product.
- Sign in with Apple, Apple Pay, Wallet, and similar marks and buttons must
  follow Apple's identity and trademark guidelines.
- Using the design principles (hierarchy, clarity, deference, depth, materials,
  the Liquid Glass approach) in your own work, including web, is fine, because
  ideas and principles are not copyrightable. Doing so with your **own** assets
  and fonts is the safe path. Using Apple's actual font, symbol, or kit files
  outside what their licenses allow is not.

When anything is unclear, the safe default is to not use the asset and to read
Apple's terms first.

## 5. Per-category source and license

| Category | What it is | Source (Apple) | License governing the file |
|---|---|---|---|
| UI Kits | Per-platform interface kits (iOS, iPadOS, macOS, watchOS, tvOS, visionOS) | developer.apple.com/design/resources plus Sketch Cloud and Figma Community | Apple Design Resources License Agreement |
| App-icon templates | Layered app-icon production templates | developer.apple.com/design/resources | Apple Design Resources License Agreement |
| Technology templates | App Clips, Apple Pay, Wallet, Live Activities, Messages, Sign in with Apple, Siri Shortcuts, Tap to Pay, TipKit, Camera Control | developer.apple.com/design/resources | Apple Design Resources License plus per-feature identity guidelines |
| Fonts | SF Pro, SF Compact, SF Mono, New York, SF Arabic, SF Armenian, SF Georgian, SF Hebrew | developer.apple.com/fonts | Per-font Apple license bundled in each DMG |
| SF Symbols | SF Symbols 7 and 8 apps plus symbol library | developer.apple.com/sf-symbols | SF Symbols license (in-app and bundled) |
| Glyphs and logos | AirPlay, ARKit, Game Center, HomeKit, Apple Health, Siri, Add Apple Watch Face, Sign in with Apple logo | developer.apple.com/design/resources | Per-resource Apple agreement bundled in each DMG |
| Product bezels | Device frames for screenshots and mock-ups | developer.apple.com/design/resources | Apple Design Resources License Agreement |
| Tools | Icon Composer, Parallax Previewer, Parallax Exporter | developer.apple.com plus itunespartner.apple.com | Apple tool license terms |

## 6. Trademarks

Apple, the Apple logo, iPhone, iPad, Mac, Apple Watch, Apple TV, Apple Vision
Pro, San Francisco, New York, SF Symbols, Liquid Glass, Sign in with Apple,
Apple Pay, and the names of Apple products, services, and technologies are
trademarks of Apple Inc., registered in the U.S. and other countries. Their use
here is nominative (to refer to the things they name) and implies no affiliation
with or endorsement by Apple.

## 7. Full credit to Apple

This project gives Apple full and complete credit. Everything it documents and
fetches is Apple's, and it says so plainly throughout. Crediting the owner is
the right thing to do, and it is done here without reservation. Credit, though,
is not the same as a license to republish. Apple's resources are licensed, not
sold, so this project honors Apple's terms by fetching the files from Apple
rather than re-hosting them.

## 8. This project's own license

The original content authored in this repository is dual-licensed.

- The code (the shell scripts under `tools/`) is under the MIT License.
- The documentation and catalog content (under `catalog/` and `governance/`, and
  the README) is under Creative Commons Attribution 4.0 International (CC BY 4.0),
  https://creativecommons.org/licenses/by/4.0/.

Neither license covers Apple's materials, which remain governed by Apple's terms
above. See `LICENSE`.

## 9. No warranty, no responsibility

This catalog gathers and organizes publicly available information for
convenience and is provided as is, without warranty of any kind. The maintainers
accept no responsibility or liability for its use, accuracy, or completeness,
and take no responsibility for the Apple materials it references. Always verify
against Apple's official sources before relying on anything here.
