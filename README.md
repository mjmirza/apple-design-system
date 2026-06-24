# Apple Design System Catalog

A named, documented, reproducible reference to Apple's entire design system, so
that when you build anything you can find what Apple offers by its real name and
know when to use it.

## What you get

- A master sheet of every Apple design building block by name. Components,
  foundations, patterns, inputs, technologies, and per-platform traits, each with
  a short "when to use".
- A reproducible fetcher that pulls every official resource (UI kits, fonts, SF
  Symbols, templates, glyphs, bezels, tools) straight from Apple onto your
  machine.
- The real file names and Sketch symbol names extracted from those resources, so
  you can search the catalog instead of opening design tools.
- Governance for applying Apple's design principles across Swift and web alike,
  with the legal line drawn clearly.

## Important. This is Apple's property, not ours

Everything this catalog documents and fetches belongs to **Apple Inc.** This
repository hosts none of it. The fetcher downloads each file directly from
Apple's own servers into a local, git-ignored `assets/` folder. The Apple
binaries are never committed. The committed catalog holds only names, structure,
and usage notes, which are facts.

Apple's resources are licensed, not sold, and are for mock-ups of interfaces for
software that runs on Apple's operating systems. The fonts and SF Symbols carry
their own licenses. **Read `CREDITS.md` and `NOTICE` before using any asset.**

## Master index

| Catalog file | What it covers | Size |
|---|---|---|
| [catalog/00-overview.md](catalog/00-overview.md) | Versions and the Liquid Glass design language | the current state |
| [catalog/01-components.md](catalog/01-components.md) | Every UI component, grouped, with when to use | 60-plus across 8 groups |
| [catalog/02-foundations.md](catalog/02-foundations.md) | Color, typography, Materials, SF Symbols, layout, motion, accessibility, and more | 19 topics |
| [catalog/03-patterns.md](catalog/03-patterns.md) | Onboarding, loading, modality, feedback, settings, and more | 25 patterns |
| [catalog/04-inputs.md](catalog/04-inputs.md) | Digital Crown, Apple Pencil, Camera Control, gestures, Siri, and more | 16 inputs |
| [catalog/05-technologies.md](catalog/05-technologies.md) | App Clips, Wallet, Live Activities, Sign in with Apple, and which ship a template | 28 technologies |
| [catalog/06-platforms.md](catalog/06-platforms.md) | Designing for each platform, the defining traits | 8 platforms |
| [catalog/10-resources-downloads.md](catalog/10-resources-downloads.md) | Every downloadable resource, by name, with sources | all resources |
| [catalog/_extracted/](catalog/_extracted/) | Real file names and Sketch symbol names from the downloads | 1,125 tvOS + 923 visionOS symbols, and more |
| [governance/apple-design-language-rule.md](governance/apple-design-language-rule.md) | How to apply Apple principles across Swift and web | the doctrine |

## Reproduce it

```sh
git clone <this-repo>
cd apple-design-system
bash tools/fetch-assets.sh        # downloads every direct file from Apple into assets/
bash tools/enumerate-assets.sh    # mounts each download and lists real names into catalog/_extracted/
```

`fetch-assets.sh` is re-runnable. It resumes partial downloads and skips files
already present. The UI Kits that live only on Sketch Cloud or Figma Community
are opened in those apps, not downloaded as files (their links are in
`catalog/10-resources-downloads.md`).

## What gets downloaded vs documented

- Downloaded to your machine (git-ignored, never committed). The fonts, SF
  Symbols, glyphs, bezels, app-icon and platform templates, and the tvOS and
  visionOS Sketch libraries. About 3.1 GB across 43 files.
- Documented in git (committed, facts only). Every name, the structure, the
  usage notes, and the extracted file and symbol names.

## Repo structure

```
apple-design-system/
  README.md                 this file, the master index
  CREDITS.md                ownership, license, commercial-use boundary
  NOTICE                    short legal statement
  LICENSE                   covers only this project's own text and scripts
  catalog/                  the named reference (committed)
    _extracted/             real names pulled from the downloads (committed)
  governance/               how to apply Apple principles everywhere (committed)
  tools/
    fetch-assets.sh         reproducible downloader (from Apple's servers)
    enumerate-assets.sh     mounts downloads and extracts names
  assets/                   the local mirror (git-ignored, never committed)
```

## Source

Everything traces to Apple's official design resources at
https://developer.apple.com/design/resources/ and the Human Interface Guidelines
at https://developer.apple.com/design/human-interface-guidelines/
