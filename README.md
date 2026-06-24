# Apple Design System Catalog

![Code MIT](https://img.shields.io/badge/code-MIT-informational)
![Docs CC BY 4.0](https://img.shields.io/badge/docs-CC%20BY%204.0-informational)
![Apple assets not redistributed](https://img.shields.io/badge/Apple%20assets-not%20redistributed-critical)
![Platforms](https://img.shields.io/badge/platforms-iOS%20%C2%B7%20iPadOS%20%C2%B7%20macOS%20%C2%B7%20watchOS%20%C2%B7%20tvOS%20%C2%B7%20visionOS-lightgrey)
![Design](https://img.shields.io/badge/design-Liquid%20Glass-lightgrey)
![Last commit](https://img.shields.io/github/last-commit/mjmirza/apple-design-system)
![Repo size](https://img.shields.io/github/repo-size/mjmirza/apple-design-system)

> A named, reproducible reference to Apple's whole design system. Find any
> building block by name, learn when to use it, review it visually, and pull
> every official asset straight from Apple.

## What is this, in plain words

Apple publishes a huge set of design resources and guidelines for building great
apps. They are spread across many pages, kits, and downloads, and it is easy to
not even know a thing exists or what it is called. This repository is a single,
organized, searchable map of all of it. Every component, every foundation, every
pattern, and every downloadable asset, listed by its real name with a short note
on when to use it. So when you build something, you can quickly find what Apple
already offers and what it is called, instead of guessing or rebuilding it.

It works for Apple apps (Swift and SwiftUI) and, for the design principles, for
web and any other kind of work too.

## Who is this for

- Designers and developers building for Apple platforms who want a fast index.
- Anyone on web or other platforms who wants to apply Apple's design thinking.
- Non-experts who simply want to see and understand what Apple's design system
  contains.

## What you get

- A master sheet of every Apple building block by name, with when to use it.
- A visual review you open in your browser to see the real images and click
  through to Apple for each component.
- A one-command fetcher that pulls every official asset straight from Apple onto
  your machine, with nothing re-hosted here.
- The real file names and component names pulled out of those assets, so you can
  search instead of opening design tools.

## Important. Apple owns all of this, and we credit it fully

Everything this catalog documents and fetches is the property of **Apple Inc.**
We credit Apple fully and completely, and we are grateful Apple makes these
resources available. This repository **re-hosts none of Apple's files.** It
documents them (names and notes, which are facts) and fetches them, on your
machine, directly from Apple's servers.

Apple's resources are licensed, not sold, and are intended for mock-ups of
interfaces for software that runs on Apple's operating systems. The fonts and SF
Symbols carry their own licenses. **No warranty, no responsibility.** This
catalog is compiled for convenience and provided as is. Always verify against
Apple's official sources. Read [`CREDITS.md`](CREDITS.md) and [`NOTICE`](NOTICE)
before using any asset.

## See it. Visual review

```sh
bash tools/fetch-assets.sh      # one-time, downloads the assets from Apple
bash tools/build-gallery.sh     # builds a local visual page
open assets/_gallery/index.html # browse every image, click any component to Apple
```

The gallery shows the real images that ship as files (glyphs, icons, logos, Siri
art, device bezels, kit previews) and gives a "View at Apple" link for every
component, foundation, and pattern. It is generated under the git-ignored
`assets/` folder, so it stays on your machine and is never published.

## Master index

| Catalog file | What it covers | Count |
|---|---|---|
| [catalog/00-overview.md](catalog/00-overview.md) | Versions and the Liquid Glass design language | current state |
| [catalog/01-components.md](catalog/01-components.md) | Every UI component, grouped, with when to use | 60-plus, 8 groups |
| [catalog/02-foundations.md](catalog/02-foundations.md) | Color, typography, Materials, SF Symbols, layout, motion, accessibility, and more | 19 |
| [catalog/03-patterns.md](catalog/03-patterns.md) | Onboarding, loading, modality, feedback, settings, and more | 25 |
| [catalog/04-inputs.md](catalog/04-inputs.md) | Digital Crown, Apple Pencil, Camera Control, gestures, Siri, and more | 16 |
| [catalog/05-technologies.md](catalog/05-technologies.md) | App Clips, Wallet, Live Activities, Sign in with Apple, and which ship a template | 28 |
| [catalog/06-platforms.md](catalog/06-platforms.md) | Designing for each platform, the defining traits | 8 |
| [catalog/10-resources-downloads.md](catalog/10-resources-downloads.md) | Every downloadable resource, by name, with sources | all |
| [catalog/_extracted/](catalog/_extracted/) | Real file and Sketch symbol names from the downloads | 1,125 tvOS, 923 visionOS, and more |
| [governance/apple-design-language-rule.md](governance/apple-design-language-rule.md) | How to apply Apple principles across Swift and web | doctrine |

## Quick start (reproduce the whole thing)

```sh
git clone https://github.com/mjmirza/apple-design-system
cd apple-design-system
bash tools/fetch-assets.sh        # downloads every direct file from Apple into assets/
bash tools/enumerate-assets.sh    # extracts real file and symbol names into catalog/_extracted/
bash tools/build-gallery.sh       # builds the local visual gallery
```

`fetch-assets.sh` is re-runnable. It resumes partial downloads and skips files
already present. The UI Kits that live only on Sketch Cloud or Figma Community
are opened in those apps, not downloaded as files. Their links are in
[catalog/10-resources-downloads.md](catalog/10-resources-downloads.md).

## What is downloaded vs documented

- Downloaded to your machine, git-ignored, never committed. The fonts, SF
  Symbols, glyphs, bezels, app-icon and platform templates, the tvOS and
  visionOS Sketch libraries, and the generated gallery. About 3.1 GB.
- Documented in git, committed, facts only. Every name, the structure, the usage
  notes, and the extracted file and symbol names.

## Repo structure

```
apple-design-system/
  README.md                 this file, the master index
  CREDITS.md                ownership, full credit, license, commercial-use boundary
  NOTICE                    short legal statement
  LICENSE                   MIT for code, CC BY 4.0 for docs, Apple assets excluded
  catalog/                  the named reference (committed)
    _extracted/             real names pulled from the downloads (committed)
  governance/               how to apply Apple principles everywhere (committed)
  tools/
    fetch-assets.sh         reproducible downloader (from Apple's servers)
    enumerate-assets.sh     mounts downloads and extracts names
    build-gallery.sh        builds the local visual review page
  assets/                   the local mirror and gallery (git-ignored, never committed)
```

## Licensing

- Code (the scripts under `tools/`). MIT.
- Documentation and catalog content. Creative Commons Attribution 4.0
  International (CC BY 4.0).
- Apple's materials. Not covered by either. They are Apple's property under
  Apple's own terms, and this repository redistributes none of them.

See [`LICENSE`](LICENSE) and [`CREDITS.md`](CREDITS.md).

## Source

Everything traces to Apple's official design resources at
https://developer.apple.com/design/resources/ and the Human Interface Guidelines
at https://developer.apple.com/design/human-interface-guidelines/
