# Changelog

Changes in this fork (tobixen/captive-browser) relative to the upstream
(FiloSottile/captive-browser, last upstream commit 2021-08-01).

## Unreleased

### Build system
- Migrated from deprecated Gopkg to Go modules (builds with Go >= 1.18)
- Removed vendored dependencies
- Removed Travis CI config
- Added Makefile with build/test/lint/clean targets
- Added version info via `-ldflags` (version.go)
- Added GitHub Actions CI (lint + test on ubuntu/macOS)
- Added dependabot for automated dependency updates
- Added .gitignore

### Config files
- Moved config files to `config_examples/` with clearer names describing
  the target setup rather than distro/browser combination
- **New: Linux / NetworkManager / Wayland config** — adds `--ozone-platform=wayland`
  for Sway, Hyprland, etc. and `nmcli`-based DHCP DNS detection
- **New: Firefox config** — comprehensive privacy-hardened profile with ~80
  preferences disabled (based on contributions by bb010g and Mynacol from
  upstream issue #20, MIT licensed)
- Replaced deprecated `--host-resolver-rules` flag with
  `--proxy-bypass-list="<-loopback>"` in all Chromium/Chrome configs
- Added `--disable-features=HttpsUpgrades` to all Chromium/Chrome configs
  to prevent breaking captive portal HTTP pages
- Updated `go get` to `go install` in config comments

### Bug fixes
- Fixed unchecked error return from DBus GetLink call in
  `cmd/systemd-networkd-dns` (ported from pacoorozco/captive-browser)

### Code cleanup
- Replaced deprecated `ioutil.ReadFile` with `os.ReadFile`
- Updated build constraint syntax from `// +build` to `//go:build`
- Simplified variable declarations

### Documentation
- Rewrote README with comprehensive install/config/troubleshooting docs
- Documented Chrome/Chromium binary name variations across distros
- Documented DNS resolution timeout workaround (systemd-resolved stub)
- Documented bind-device/CAP_NET_RAW segfault workaround
