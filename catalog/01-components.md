# Components

Every UI component Apple documents in the Human Interface Guidelines, grouped as
the HIG groups them. Names are facts (Apple's). The "what" and "when" columns are
this project's own concise paraphrase, not Apple's prose.

Snapshot current to mid-2026 (iOS 27, iPadOS 27, macOS 27, watchOS 26, tvOS 18,
visionOS 26). Verify the latest at
https://developer.apple.com/design/human-interface-guidelines/components

Platform key. iOS, iPadOS, macOS, watchOS, tvOS, visionOS.

## Content

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Charts | iOS, iPadOS, macOS, watchOS, visionOS | Data visualization built with Swift Charts | Show trends, comparisons, and distributions in data |
| Image views | all | Displays one image or an animated sequence | Present photos, illustrations, or rendered art |
| Text views | all | Scrollable area of read-only or editable multiline text | Show or edit long-form text |
| Web views | iOS, iPadOS, macOS, visionOS | Embeds web content inside the app | Display HTML or a remote page in place |

## Layout and organization

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Boxes | macOS | A bordered region that groups related controls | Visually group settings on macOS |
| Collections | iOS, iPadOS, macOS, tvOS, visionOS | An ordered grid or group of items | Show a gallery or grid of content |
| Column views | macOS | A hierarchy shown as side-by-side columns | Browse deep hierarchies, Finder-style |
| Disclosure controls | iOS, iPadOS, macOS, visionOS | Shows or hides a section of content | Reveal or hide detail and nested items |
| Labels | all | Static text that describes UI or content | Caption controls and show short read-only text |
| Lists and tables | all | Rows of data, optionally in columns | Present settings, structured rows, and data tables |
| Lockups | tvOS | A combined image and text focusable unit | Represent media items in tvOS grids |
| Outline views | macOS | An expandable hierarchical list | Show nested data with disclosure on macOS |
| Split views | iOS, iPadOS, macOS, visionOS | Two or three side-by-side panes | Master and detail, multi-column layouts |
| Tab views | macOS, visionOS | Switches between panes using tabs | Group settings or content into tabbed panes |

## Menus and actions

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Activity views | iOS, iPadOS, macOS, visionOS | The system share sheet | Share or act on the current content |
| Buttons | all | A control that performs an action when activated | Trigger any action (refreshed under Liquid Glass) |
| Context menus | iOS, iPadOS, macOS, visionOS | A long-press or right-click menu of actions | Offer contextual actions on an item |
| Dock menus | macOS | A menu from the app's Dock icon | Quick actions from the Dock |
| Edit menus | iOS, iPadOS, visionOS | Cut, copy, paste, and text actions | Selection and text actions |
| Menus | all | A list of commands or options | Group commands compactly |
| Pop-up buttons | iOS, iPadOS, macOS, visionOS | A button showing mutually exclusive choices | Pick one value from a short list |
| Pull-down buttons | iOS, iPadOS, macOS, visionOS | A button showing a menu of actions | Offer a compact set of actions |
| The menu bar | macOS | The app-wide command bar at the top of the screen | Expose the full command set on macOS |
| Toolbars | iOS, iPadOS, macOS, visionOS | A bar of frequent actions and controls | Frequent commands (refreshed under Liquid Glass) |

## Navigation and search

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Navigation bars | iOS, iPadOS, visionOS | A top bar with title and navigation controls | Title, back, and actions in a hierarchy |
| Path controls | macOS | Shows and moves through a file path | Display the current location in a hierarchy |
| Search fields | all | A field for entering search text | Let people search content |
| Sidebars | iPadOS, macOS, visionOS | A side list of top-level destinations | Top-level navigation (new corner radii in the latest design) |
| Tab bars | iOS, iPadOS, tvOS, visionOS | A bar that switches top-level views | Switch primary sections (now adaptive under Liquid Glass) |
| Token fields | macOS | A text field holding tokenized items | Enter multiple discrete values like recipients or tags |

## Presentation

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Action sheets | iOS, iPadOS | A sheet of choices tied to an action | Confirm or choose among action options |
| Alerts | all | A modal message that needs attention | Critical information or a confirmation |
| Page controls | iOS, iPadOS, tvOS, visionOS | Dots indicating position across pages | Show position in paged content |
| Panels | macOS | An auxiliary window such as an inspector | Float supporting tools beside content |
| Popovers | iOS, iPadOS, macOS, visionOS | A temporary view anchored to a control | Show focused content or controls in place |
| Scroll views | all | A scrollable container | Show content larger than the screen |
| Sheets | iOS, iPadOS, macOS, visionOS | A card or modal presented over content | A self-contained subtask or form |
| Windows | macOS, iPadOS, visionOS | A container for app content | Hold app content, resizable on macOS and visionOS |

## Selection and input

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Color wells | iOS, iPadOS, macOS | A control to pick a color | Choose a color value |
| Combo boxes | macOS | A text field plus a list to pick from | Pick a value or type a new one |
| Digit entry views | watchOS | A control for entering digits | Enter PINs or numbers on the watch |
| Pickers | all | A scrollable set of values | Choose from a fixed set of values |
| Segmented controls | iOS, iPadOS, macOS, tvOS, visionOS | A linear set of mutually exclusive buttons | Switch among a few options or modes |
| Sliders | iOS, iPadOS, macOS, visionOS | A track and thumb for a value in a range | Adjust a continuous value |
| Steppers | iOS, iPadOS, macOS, visionOS | Plus and minus to change a value | Fine increment or decrement |
| Text fields | all | Single-line text entry | Enter short text |
| Toggles | all | An on and off switch | Flip a single boolean setting |
| Virtual keyboards | iOS, iPadOS, tvOS, visionOS | The on-screen keyboard | Text entry without a hardware keyboard |

## Status

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Gauges | iOS, iPadOS, macOS, watchOS, visionOS | Shows a value within a range | Display a measured level |
| Progress indicators | all | A bar or spinner showing activity | Show determinate or indeterminate progress |
| Rating indicators | macOS | Stars representing a rating | Capture or show a rating |

## System experiences

| Component | Platforms | What it is | When to use |
|---|---|---|---|
| Complications | watchOS | Glanceable data on watch faces | Show app info on the watch face |
| Controls | iOS, iPadOS | Quick toggles and actions in Control Center, Lock Screen, and the Action button | Expose a fast action system-wide |
| Home Screen quick actions | iOS, iPadOS | Long-press shortcuts on the app icon | Offer the top few actions from the icon |
| Live Activities | iOS, iPadOS | Live-updating Lock Screen and Dynamic Island info | Track an ongoing event in real time |
| Notifications | all | System banners and alerts | Inform about events while the app is closed |
| Status bars | iOS, iPadOS | The top system information strip | Manage the appearance of the status area |
| Top Shelf | tvOS | Featured content above the top row | Showcase content for a focused app |
| Watch faces | watchOS | The watch face design | Host complications and glanceable context |
| Widgets | iOS, iPadOS, macOS, watchOS, visionOS | Glanceable Home and Lock Screen views | Show key info outside the app |
