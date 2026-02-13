# Issue title: Project appears unmaintained — community fork available

# Issue body:

It seems this repository has not been actively maintained since 2021. There are currently 11 open issues and 5 open PRs, some dating back several years, with no responses from the maintainer. The project cannot be built with modern Go (>= 1.22) due to the deprecated Gopkg dependency management, and the example configs contain deprecated Chromium flags.

I asked Claude to get this to work on my laptop, and also to have a look at outstanding issues and pull requests.  The results are available at **https://github.com/tobixen/captive-browser**.  It's totally "vibe-coded", I haven't even bothered to look at it - but I would guess it's in a better state than the original project.

Claude claims to have incorporated those fixes from community contributions and added those new features:

- **Go modules migration** — builds with modern Go (addresses #23, #33)
- **Fixed deprecated `--host-resolver-rules` flag** — replaced with `--proxy-bypass-list` in all configs (closes #31)
- **Added `--disable-features=HttpsUpgrades`** — prevents Chromium from breaking captive portal HTTP pages
- **NetworkManager support** — `nmcli`-based DHCP DNS detection (addresses #10)
- **Wayland support** — `--ozone-platform=wayland` for Sway, Hyprland, etc.
- **Firefox config** — comprehensive privacy-hardened config from community contributions in #20
- **Improved README** — better docs, troubleshooting section (addresses #16, #23, #28, #37)

It did not touch #27 (KDE integration - wishlist item, and I don't use KDE myself), #30 (should be fixed, but wasn't considered low-hanging fruit by Claude) not #36 (Windows support - I don't use Windows).

Dear maintainer - if you happen to read this, I would ask you to either spend some few hours on maintenance here, or share the maintenance-burden with someone else.  I don't think I'm the right person for it, for me this is just "yet another rabbit hole" that I would have avoided falling into if I couldn't have outsourced it to the AI - but I would accept such a role nevertheless.

