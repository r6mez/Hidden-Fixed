<p align="center">
	<img width="200" height="200" src="https://github.com/dwarvesf/hidden/blob/develop/img/icon_512%402x.png?raw=true">
</p>
<p align="center">
	<a href="https://github.com/r6mez/Hidden-Fixed/releases/latest">
		<img src="https://img.shields.io/badge/download-latest-brightgreen.svg" alt="download">
	</a>
	<img src="https://img.shields.io/badge/platform-macOS-lightgrey.svg" alt="platform">
	<img src="https://img.shields.io/badge/requirements-macOS Ventura+-ff69b4.svg" alt="requirements">
</p>

## Hidden Bar (Fixed)

Hidden Bar hides menu bar icons to give your Mac a cleaner look.

This is a fork of [dwarvesf/hidden](https://github.com/dwarvesf/hidden). The original stopped working well on macOS 27 and is no longer updated. **This version fixes those problems**: hiding works again, the bar stays collapsed, the always-hidden section works, and clicking the clock opens Notification Center. See the [changelog](CHANGELOG.md) for the full list.

<p align="center">
	<img width="400" src="img/screen1.png">
	<img width="400" src="img/screen2.png">
</p>

## Install

1. Quit the original Hidden Bar if you have it, and delete it from Applications.
2. Download `Hidden-Bar-<version>.zip` from the [latest release](https://github.com/r6mez/Hidden-Fixed/releases/latest).
3. Unzip it and drag **Hidden Bar** into your **Applications** folder. It must run from there.
4. Open Hidden Bar. macOS blocks it the first time, because this build is not notarized by Apple.
5. Go to **System Settings → Privacy & Security**, scroll down, and click **Open Anyway** next to Hidden Bar. Confirm.
6. When asked, allow Hidden Bar in **Privacy & Security → Accessibility** (called **Device Control and Automation** on some macOS 27 versions). If an old Hidden Bar entry is already there, remove it with **−** and add the app again with **+**.
7. Quit Hidden Bar and open it again.

Tip: instead of steps 4 and 5, you can run this in Terminal once:

```sh
xattr -dr com.apple.quarantine "/Applications/Hidden Bar.app"
```

## Use

- Click the arrow to hide or show the icons on its left.
- Hold **⌘** and drag icons to choose which side of the arrow they sit on.
- **Option-click** the arrow to hide or show the always-hidden section (icons left of the thin "|" line). Turn this section on in Preferences.
- Right-click the arrow for Preferences.

<p align="center">
	<img src="img/tutorial.gif">
</p>

## Known limits on macOS 27

macOS 27 only lets apps hide icons through its exam mode. Because of that:

- Now Playing, Siri, Focus and Live Activities hide while the bar is collapsed.
- When you click the clock, hidden icons flash for a moment.
- An app with several icons hides or shows them all together.

## Documentation

- [Manual](docs/MANUAL.md): every setting and troubleshooting.
- [Architecture](docs/ARCHITECTURE.md): how hiding works.
- [Runbook](docs/RUNBOOK.md): building and releasing.

## License

MIT © [Dwarves Foundation](https://github.com/dwarvesf), the original authors. Thanks to everyone who contributed fixes to the original repo.
