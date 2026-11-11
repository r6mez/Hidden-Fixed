#!/bin/sh
# Builds the direct (non-App Store) app, signs it with a local self-signed
# identity, and installs it to /Applications, then relaunches it.
#
# Signing with the same identity every time keeps macOS's Accessibility
# permission across rebuilds; an ad-hoc signature changes with each build and
# makes macOS forget the permission.
#
# Usage: scripts/install-local.sh [identity name]
# Default identity: "Hidden Bar Local Signing" (a self-signed code-signing
# certificate in the login keychain).
set -eu

IDENTITY="${1:-Hidden Bar Local Signing}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP="$ROOT/build/dd/Build/Products/Release-Direct/Hidden Bar.app"

cd "$ROOT"
xcodebuild -project 'Hidden Bar.xcodeproj' -scheme 'Hidden Bar' -configuration Release-Direct \
  -derivedDataPath build/dd CODE_SIGN_IDENTITY=- CODE_SIGN_STYLE=Manual DEVELOPMENT_TEAM= \
  PROVISIONING_PROFILE_SPECIFIER= build | grep -E 'error:|\*\* BUILD'

codesign --force --options runtime --timestamp=none \
  --entitlements hidden/Hidden-Direct.entitlements --sign "$IDENTITY" "$APP"

pkill -x "Hidden Bar" || true
sleep 1
ditto "$APP" "/Applications/Hidden Bar.app"
open "/Applications/Hidden Bar.app"
echo "Installed and launched /Applications/Hidden Bar.app (signed with \"$IDENTITY\")"
