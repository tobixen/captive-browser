# Changelog

Changes in this fork (tobixen/captive-browser) relative to the upstream
(FiloSottile/captive-browser, last upstream commit 2021-08-01).

## Unreleased

Note: the git history has been force-pushed to correct author attributions
on commits ported from other contributors' forks and PRs. Git `Author`
fields now reflect the original contributor where the work was substantially
theirs, with `Co-Authored-By` trailers for additional contributors.

### Build system
- Migrated from deprecated Gopkg to Go modules — builds with Go >= 1.18
  (upstream [#23](https://github.com/FiloSottile/captive-browser/issues/23)
  by @Peregrino69,
  [#33](https://github.com/FiloSottile/captive-browser/issues/33)
  by @pacoorozco,
  [PR #26](https://github.com/FiloSottile/captive-browser/pull/26)
  by @bonedaddy)
- Removed vendored dependencies
- Removed Travis CI config
- Added Makefile with build/test/lint/clean targets (based on work by
  @pacoorozco)
- Added version info via `-ldflags` (based on work by @pacoorozco)
- Added GitHub Actions CI — lint + test on ubuntu/macOS (based on work by
  @pacoorozco)
- Added dependabot for automated dependency updates (based on work by
  @pacoorozco)
- Added .gitignore

### Config files
- Moved config files to `config_examples/` with clearer names describing
  the target setup rather than distro/browser combination (inspired by
  @pacoorozco and
  [PR #24](https://github.com/FiloSottile/captive-browser/pull/24)
  by @pldubouilh)
- **New: Linux / NetworkManager / Wayland config** — adds
  `--ozone-platform=wayland` for Sway, Hyprland, etc. and `nmcli`-based
  DHCP DNS detection
  (upstream [#10](https://github.com/FiloSottile/captive-browser/issues/10)
  by @shazow, with input from @Mynacol)
- **New: Firefox config** — comprehensive privacy-hardened profile with ~80
  preferences disabled
  (upstream [#20](https://github.com/FiloSottile/captive-browser/issues/20),
  config by @bb010g and @Mynacol, MIT licensed)
- Replaced deprecated `--host-resolver-rules` flag with
  `--proxy-bypass-list="<-loopback>"` in all Chromium/Chrome configs
  (upstream [#31](https://github.com/FiloSottile/captive-browser/issues/31)
  by @GEkuL,
  [PR #32](https://github.com/FiloSottile/captive-browser/pull/32)
  by @GEkuL)
- Added `--disable-features=HttpsUpgrades` to all Chromium/Chrome configs
  to prevent breaking captive portal HTTP pages
- Updated `go get` to `go install` in config comments
  ([PR #29](https://github.com/FiloSottile/captive-browser/pull/29)
  by @Dev380)

### Bug fixes
- Fixed unchecked error return from DBus GetLink call in
  `cmd/systemd-networkd-dns` (ported from @pacoorozco's fork)

### Code cleanup
- Replaced deprecated `ioutil.ReadFile` with `os.ReadFile`
- Updated build constraint syntax from `// +build` to `//go:build`
- Simplified variable declarations

### Documentation
- Rewrote README with comprehensive install/config/troubleshooting docs
- Documented Chrome/Chromium binary name variations across distros
  (upstream [#37](https://github.com/FiloSottile/captive-browser/issues/37)
  by @lostdata2)
- Documented DNS resolution timeout workaround for systemd-resolved stub
  (upstream [#28](https://github.com/FiloSottile/captive-browser/issues/28)
  by @wyattbiker)
- Documented bind-device/CAP_NET_RAW segfault workaround
  (upstream [#16](https://github.com/FiloSottile/captive-browser/issues/16)
  by @sammoth)
