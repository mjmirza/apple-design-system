# Apple Design Language. Governance and how to apply it everywhere

This is the doctrine for using this catalog. It applies to Apple-platform work
(Swift, SwiftUI, UIKit) AND, for the principles only, to web and any other kind
of development.

## The legal line (read this first)

There are two different things here, and they have different rules.

1. **Apple's design principles** (clarity, deference, depth, hierarchy, harmony,
   consistency, the Liquid Glass approach). These are ideas. Ideas are not
   copyrightable. You may apply them anywhere, including on the web, using your
   own assets and fonts.

2. **Apple's design files** (the UI kits, the San Francisco and New York fonts,
   SF Symbols, templates, glyphs, bezels). These are Apple's property, licensed
   for mock-ups of user interfaces for software that runs on Apple's operating
   systems. Do not use Apple's actual font, symbol, or kit files on the web or
   in non-Apple products beyond what their licenses allow. See `CREDITS.md`.

So. Apply the thinking everywhere. Use the files only where Apple allows.

## The principles to apply

The classic three.
- **Clarity.** Legible text at every size, precise icons, clear meaning. Let
  content lead.
- **Deference.** The UI helps people understand and interact with content, and
  then gets out of the way. Restraint over decoration.
- **Depth.** Visual layers and motion convey hierarchy and give life, so people
  understand where they are.

The Liquid Glass era adds emphasis on.
- **Hierarchy.** Make the most important thing obviously the most important,
  through size, spacing, and placement, not color tricks alone.
- **Harmony.** Align to the platform's shapes, spacing, and concentric corner
  geometry so custom UI sits naturally next to system UI.
- **Consistency.** Reuse standard components and behaviors so people already know
  how to use your app.

## How to apply it on Apple platforms

1. Start from the catalog. `catalog/01-components.md` for what exists by name,
   `catalog/02-foundations.md` for color, typography, Materials, SF Symbols,
   layout, motion, and accessibility, `catalog/03-patterns.md` for flows.
2. Prefer standard components over custom ones. They get Liquid Glass, Dynamic
   Type, and accessibility for free.
3. Use the official UI kit for the target platform (see
   `catalog/10-resources-downloads.md`) as the source of truth for spec.
4. Use SF Symbols for icons, San Francisco and New York for type, system colors
   for color, and the system Materials so content stays legible.
5. Respect light and dark, Dynamic Type, Reduce Motion, and the platform's
   safe areas.

## How to apply it on the web and other platforms

1. Use the catalog as a reference for the principles and the mental model, not as
   a source of Apple's files.
2. Translate the idea, not the asset. A web app can have clear hierarchy,
   deference to content, depth through layering, and consistent reusable
   components without using Apple's fonts or symbols.
3. Use your own design language and your own assets. On the web that is the
   project's existing system (for example a chosen type pairing, color system,
   and component library), not Apple's restricted resources.
4. Glass-like translucency on the web is a visual idea you can build with your
   own CSS. It is not Apple's Liquid Glass file or asset.

## Composition with existing project rules

This doctrine sits under, and never overrides, the project's own design rules.
On the web the project's chosen design language and its UI rules govern the look.
This catalog informs the thinking and is the reference for what Apple offers by
name. It is not a license to copy Apple's look onto a non-Apple product, and not
a replacement for the project's own design language.
