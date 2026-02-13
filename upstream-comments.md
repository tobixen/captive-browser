# Comments to post on upstream issues/PRs
# Each section is a separate comment. Review and edit before posting.

## Issue #10 — dhcp-dns query using nmcli (for NetworkManager-managed DNS)
This has been addressed in a community fork: https://github.com/tobixen/captive-browser

The fork includes a config file (`captive-browser-networkmanager-chromium-wayland.toml`) that uses `nmcli -t -f IP4.DNS device show wlan0` for DHCP DNS detection, as well as a Firefox config with the same approach.

(This comment was created with the help of AI)

## Issue #16 — How to use bind to device feature
The community fork at https://github.com/tobixen/captive-browser documents this in the README troubleshooting section. The segfault when using `setcap` is caused by dynamic linker restrictions. Workarounds include using `sudo` or ambient capabilities.

(This comment was created with the help of AI)

## Issue #20 — Brave or Firefox
A Firefox config based on @Mynacol's and @bb010g's contributions has been added to a community fork: https://github.com/tobixen/captive-browser (see `captive-browser-firefox.toml`). Thank you both for the comprehensive privacy-hardened config!

(This comment was created with the help of AI)

## Issue #23 — Maybe a bit help for us n00bies?
The community fork at https://github.com/tobixen/captive-browser has migrated to Go modules and updated the install instructions to use `go install`. The README has also been rewritten with better documentation.

(This comment was created with the help of AI)

## Issue #28 — Captive Browser at this one particular Starbucks will not work
The DNS timeouts in the log (`lookup ... on 127.0.0.53:53: i/o timeout`) suggest the SOCKS proxy was resolving through the systemd-resolved stub instead of the actual DHCP DNS server. The community fork at https://github.com/tobixen/captive-browser documents this in the troubleshooting section and provides configs using `nmcli` that return the real upstream DNS IP.

(This comment was created with the help of AI)

## Issue #31 — Deprecated cli flag: --host-resolver-rules
Fixed in the community fork at https://github.com/tobixen/captive-browser — all configs now use `--proxy-bypass-list="<-loopback>"` instead.

(This comment was created with the help of AI)

## Issue #33 — Updated version to build with recent Go
The community fork at https://github.com/tobixen/captive-browser has migrated from Gopkg to Go modules and builds with modern Go.

(This comment was created with the help of AI)

## Issue #37 — Chrome not founded
The community fork at https://github.com/tobixen/captive-browser documents this in the README — the Chrome/Chromium binary name varies by distro (`google-chrome`, `google-chrome-stable`, `chromium`). The fork also provides separate config files for Chrome and Chromium.

(This comment was created with the help of AI)

## PR #24 — reword config names and readme
The README has been comprehensively rewritten in the community fork at https://github.com/tobixen/captive-browser, incorporating clearer config naming and explanations.

(This comment was created with the help of AI)

## PR #26 — migrate from Gopkg to go modules and update to go 1.18
This has been done in the community fork at https://github.com/tobixen/captive-browser. Thank you for the groundwork!

(This comment was created with the help of AI)

## PR #29 — Change README due to go get being deprecated
Addressed in the community fork at https://github.com/tobixen/captive-browser — install instructions now use `go install`.

(This comment was created with the help of AI)

## PR #32 — [FIX]: Deprecated cli flag: --host-resolver-rules & [ADDS] flatpak chromium support
The deprecated flag fix has been incorporated in the community fork at https://github.com/tobixen/captive-browser across all config files. The fork also adds `--disable-features=HttpsUpgrades` to prevent Chromium from upgrading captive portal HTTP pages. The Flatpak config was not included but could be added in the future.

(This comment was created with the help of AI)
