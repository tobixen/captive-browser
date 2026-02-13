The original project has not been maintained for several years.  This fork adds the fixes I needed for getting this to work on my laptop, but I also asked Claude the AI to look through all open pull requests and "low-hanging fruit" issues and incorporate/fix everything that was relevant and/or "low-hanging fruit".  Disclaimer: This fork was completely "vibe-programmed", Claude has done the job here, I haven't even bothered looking into the changes.  I take responsibility for testing this on Archlinux, Wayland and Sway, but not much more than that.

# captive-browser

A more secure, dedicated browser for logging into captive portals, without messing with DNS settings.

`captive-browser` detects the DHCP DNS server and runs a SOCKS5 proxy that resolves hostnames through it. Then it starts a browser instance in private/incognito mode with a separate data directory and waits for it to exit.

This is a community-maintained fork of [FiloSottile/captive-browser](https://github.com/FiloSottile/captive-browser). The upstream repository appears to be unmaintained (last commit 2021, many unmerged PRs). This fork incorporates community contributions and fixes.

[Read more on Filippo's blog.](https://blog.filippo.io/captive-browser)

## Installation

You'll need Go 1.18 or newer, and a supported browser (Chrome, Chromium, or Firefox).

```
go install github.com/tobixen/captive-browser@latest
```

Then install a config file in `$XDG_CONFIG_HOME/captive-browser.toml` (if set) or `~/.config/captive-browser.toml`. Choose one of the stock configs below based on your setup. You may need to adjust the network interface name (e.g., `wlan0`, `wlp3s0`).

### Choosing a config

The config file has three main settings:
1. **Browser** — which browser to launch and how (Chrome, Chromium, or Firefox)
2. **DHCP DNS detection** — how to obtain the DHCP-provided DNS server
3. **SOCKS5 proxy address** — where the proxy listens (usually `localhost:1666`)

The DHCP DNS detection method depends on your network manager:
- **NetworkManager** — uses `nmcli` (most common on desktop Linux: Fedora, Ubuntu, Arch with GNOME/KDE/Sway)
- **systemd-networkd** — uses the `systemd-networkd-dns` helper (see below)
- **dhcpcd** — uses `dhcpcd -U`

Note: on some distros, the Chrome/Chromium binary is named `google-chrome`, `google-chrome-stable`, or `chromium`. Check which one is available on your system and adjust the config accordingly.

### Linux / NetworkManager / Chromium / Wayland

For Wayland compositors (Sway, Hyprland, etc.) with NetworkManager:

```
cp captive-browser-networkmanager-chromium-wayland.toml ~/.config/captive-browser.toml
```

The `--ozone-platform=wayland` flag is required for Wayland. Without it, Chromium will fail with "Missing X server or $DISPLAY".

### Linux / NetworkManager / Firefox

For Firefox users with NetworkManager (works on both X11 and Wayland):

```
cp captive-browser-firefox.toml ~/.config/captive-browser.toml
```

This config creates a dedicated Firefox profile with extensive privacy hardening (~80 preferences) that prevents all unnecessary network requests.

### Ubuntu / Chrome

```
cp captive-browser-ubuntu-chrome.toml ~/.config/captive-browser.toml
```

### Arch / systemd-networkd / Chrome

```
go install github.com/tobixen/captive-browser/cmd/systemd-networkd-dns@latest
cp captive-browser-arch-chrome.toml ~/.config/captive-browser.toml
```

### Arch / dhcpcd / Chromium

```
cp captive-browser-dhcpcd-chromium.toml ~/.config/captive-browser.toml
```

### macOS / Chrome

```
cp captive-browser-mac-chrome.toml ~/.config/captive-browser.toml
```

To disable the insecure system captive browser [see here](https://github.com/drduh/macOS-Security-and-Privacy-Guide#captive-portal). If that doesn't work, disable SIP (remember to re-enable it), and rename `/System/Library/CoreServices/Captive Network Assistant.app`.

## Usage

Simply run `captive-browser`, log into the captive portal, and then *quit* (Ctrl-Q on Linux, Cmd-Q on macOS) the browser instance.

To configure the Chromium-based browser, open a non-Incognito window (Ctrl-N / Cmd-N).

## Troubleshooting

### "Missing X server or $DISPLAY" on Wayland

Use the Wayland config (`captive-browser-networkmanager-chromium-wayland.toml`) which includes `--ozone-platform=wayland`.

### DNS resolution timeouts (e.g., at specific hotspots)

If you see errors like `lookup example.com on 127.0.0.53:53: i/o timeout`, the SOCKS proxy is resolving through the systemd-resolved stub (`127.0.0.53`) instead of the actual DHCP DNS server. Ensure your `dhcp-dns` config returns the real upstream DNS IP, not the stub resolver. Using `nmcli -t -f IP4.DNS device show wlan0` should return the correct address.

### bind-device and CAP_NET_RAW

The `bind-device` option requires `CAP_NET_RAW`. Using `setcap` on the binary may cause a segfault due to dynamic linker restrictions. As a workaround, run with `sudo` and specify the config path explicitly, or use ambient capabilities.

## License

MIT — see [LICENSE](LICENSE).

Firefox config contributions by [bb010g](https://github.com/bb010g) and [Mynacol](https://github.com/Mynacol), also MIT licensed.
