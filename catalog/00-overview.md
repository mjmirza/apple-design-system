# Overview and the current design language

This is the entry point to the catalog. It records the current Apple platforms,
the current design language (Liquid Glass), and how the catalog is organized.

## Platform and design-resource versions (observed June 2026)

These are the versions of the official design resources published on
https://developer.apple.com/design/resources/ at the time of writing.

| Platform | Design-resource / UI Kit version | Formats offered |
|---|---|---|
| iOS | 27 | Figma, Sketch |
| iPadOS | 27 | Figma, Sketch |
| macOS | 27 | Figma, Sketch |
| watchOS | 26 | Figma, Sketch |
| tvOS | 18 (UI Kit), templates current | Sketch, Photoshop |
| visionOS | 26 (also a visionOS 2 kit) | Figma, Sketch |

All of these run on the Liquid Glass generation of Apple's operating systems.

## Liquid Glass, the current design language

Liquid Glass is the design language Apple announced on 9 June 2025 at WWDC and
shipped across iOS 26, iPadOS 26, macOS Tahoe 26, tvOS 26, watchOS 26, and
visionOS 26. It was refined for iOS 27, iPadOS 27, and macOS 27 ("Golden Gate")
at WWDC 2026.

What it is. A translucent system finish that reflects and refracts its
surroundings and shifts as content moves beneath it, used to draw focus to
content. It reaches from the smallest controls (buttons, switches, sliders, text
and media controls) to large structures (tab bars and sidebars).

What changed in behavior. Hierarchy is no longer fixed. The interface can
prioritize, simplify, or hide structures such as the tab bar based on the
content and what the person is doing. Earlier versions kept these elements
static.

What changed in iOS 27 and macOS 27 (the 2026 refinement). Apple reduced the
default transparency so content stays legible, added a slider that lets people
choose anywhere from a tinted opaque look to a clearer glass look, adjusted
sidebar corner radii on iPad and Mac, and redesigned app icons. Developers
gained APIs that tap the system transparency engine so custom icons keep
contrast at any glass setting.

What designers and developers do differently. Lead with content and a clear
hierarchy. Let spacing, size, and component behavior guide the eye rather than
relying on color or effects alone. Choose the glass treatment that highlights
content instead of hiding it. Respect adaptive light and dark behavior and the
new concentric, consistent corner shapes. Test legibility at the full range of
the opacity setting.

Sources.
- Apple Newsroom, the June 2025 software-design announcement (apple.com/newsroom)
- [Liquid Glass, Wikipedia](https://en.wikipedia.org/wiki/Liquid_Glass)
- [iOS 27 Liquid Glass changes, Macworld](https://www.macworld.com/article/3089789/big-changes-are-coming-to-ios-27-but-liquid-glass-is-here-to-stay.html)
- [iOS 27 and macOS 27 changes, Cult of Mac](https://www.cultofmac.com/news/liquid-glass-changes-ios-27-macos-27)

## How the catalog is organized

| File | What it covers |
|---|---|
| `00-overview.md` | This file. Versions and the Liquid Glass design language |
| `01-components.md` | Every UI component, by name, grouped, with when to use |
| `02-foundations.md` | Foundations (color, typography, Materials, SF Symbols, layout, motion, accessibility, and more) |
| `03-patterns.md` | Interaction patterns (onboarding, loading, modality, feedback, settings, and more) |
| `04-inputs.md` | Inputs (Digital Crown, Apple Pencil, Camera Control, gestures, Siri, and more) |
| `05-technologies.md` | Technologies and which ship a design template (App Clips, Wallet, Live Activities, Sign in with Apple, and more) |
| `06-platforms.md` | Designing for each platform, the defining traits |
| `10-resources-downloads.md` | Every downloadable resource, by name, with source links |
| `_extracted/` | Real file names and Sketch symbol names pulled from the downloaded assets |

For ownership, license, and the legal boundary, read `CREDITS.md` and `NOTICE`
at the repo root before using any asset.
