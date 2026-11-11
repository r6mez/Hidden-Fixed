# Changelog

## v1.12.0 (2026-11-11) — Hidden-Fixed fork

First release of the community fork [r6mez/Hidden-Fixed](https://github.com/r6mez/Hidden-Fixed). It collects open fixes from the original repo plus new ones, focused on macOS 27.

### Fixed
- macOS 27: hiding no longer undoes itself about half a second after collapsing. macOS posts a screen-change notice whenever native hiding reflows the bar; only a real display change is acted on now, and opening an app or waking the Mac no longer shows every icon.
- macOS 27: with a second display taller than the main one (e.g. a rotated monitor), hiding never engaged. Icon positions are now measured from the main display, as macOS does.
- macOS 27: right after launch, before the arrow is placed, every icon could be hidden. The launch collapse now waits for the arrow and retries for a few seconds.
- macOS 27: clicking the clock opens Notification Center again while collapsed (#410, #421, #435, #454), including on 27.2 where it used to close straight away. macOS ignores the clock while hiding, so the hidden icons flash briefly.
- macOS 27: Option-click on the arrow toggles the always-hidden section again, and the "|" separator hides with its section (#434, #458) (upstream PR #445).
- macOS 27: SystemUIServer items such as Time Machine can stay visible (#424) (upstream PR #425).
- macOS 27: the whole bar shows while a microphone or camera is in use, so the recording indicator is never hidden (#437) (upstream PR #438).
- macOS 27: multi-display layouts are resolved per display (upstream PR #422).
- macOS 27: the menu-bar scan runs in parallel, so collapsing is faster (upstream PR #450).
- Less memory before Preferences is first opened (upstream PR #447).
- The Dock icon no longer lingers after turning off "use the full menu bar on expanding" (#423), and several Preferences layout glitches are fixed (upstream PR #460).

### Known limits (macOS 27)
- Native hiding is macOS's exam (assessment) mode, so Now Playing, Live Activities, Siri and Focus hide while collapsed, whatever their position (#437, #446). Hidden Bar cannot opt out.
- Icons from processes without a bundle identifier cannot be kept visible (#465).
- Hiding is per app: an app with several icons hides or shows them together.

## v1.11.1 (2026-09-18)

### Fixed
- macOS 27: the Preferences window showed a "Custom View" placeholder instead of the General/About tabs, and the label overlapped the window once clicked (#406).

## v1.11 (2026-09-18)

Requires macOS 13 Ventura or later. (Pre-Ventura users: stay on
[v1.10](https://github.com/dwarvesf/hidden/releases/tag/v1.10).)

### Added
- Opt-in hover-to-expand: set `defaults write com.dwarvesv.minimalbar hoverToExpand -bool true` to expand the bar when the pointer dwells in the menu bar.
- Right-clicking the expand/collapse arrow now opens the same context menu as the separator, so Preferences is reachable from the control you already click.

### Fixed
- macOS 27 (direct download build): hiding works again (#360) using macOS 27's native menu-bar visibility instead of widening the separator, which macOS 27 ejects from the bar. The arrow is the boundary: icons ⌘-dragged to its left hide when collapsed. Needs the Accessibility permission, and Hidden Bar must run from /Applications. Hiding is per app, and macOS's own items always stay visible. The App Store build is unchanged for now.
- Enabling the always-hidden section at runtime no longer creates an invisible (0pt) separator.
- Multi-display: the collapse width is now sized for the widest attached screen, so icons no longer leak on wider external monitors; the width re-applies on display hot-plug.
- Auto-collapse no longer fires while you are interacting with the menu bar (the timer defers and re-arms while the pointer is in the bar).
- The Preferences window no longer closes when auto-collapse fires with "use full menu bar on expanding" enabled (#170, #66, #151).
- Status items that were dragged off the bar are restored at launch instead of leaving the app unreachable.
- Fixed constraint and observer leaks in the tutorial view rebuild.
- Tutorial strings and F-key shortcut labels now render correctly (no more private-use glyphs).

### Changed
- Start-at-login now uses `SMAppService` (macOS 13+); the legacy launcher helper was removed and any leftover login item is deauthorized automatically on first launch.
- Pinned the HotKey dependency to an exact version and removed an unused file-access entitlement and dead code (no behavior change).

### Known / in progress
- macOS 27, App Store build: hiding still does not work (#360). Native hiding needs Accessibility reads that the App Sandbox blocks; an App Store approach is tracked separately.
- New menu-bar icons can appear in the hidden zone because macOS inserts them at the far left; ⌘-drag them to the right of the separator (see the manual). A built-in pin is part of the planned redesign.
