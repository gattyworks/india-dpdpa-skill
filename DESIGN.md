# Design

## Mascot and banner

This repo's mascot is Kavach ("shield" in Hindi/Sanskrit): a heraldic shield
in real saffron, white, and green tricolor bands (proportional thirds, like
the actual flag, not just accent trim), with a navy face (eyes and a simple
mouth) on the white band roughly where the Ashoka Chakra sits on the flag.
That position is deliberate: it echoes the Chakra without reproducing it.
The Chakra and the national emblem are protected symbols, so the mascot uses
a plain lock/keyhole-style face instead of a literal copy.

Kavach is one of twelve pixel mascots across the GattyWorks org, one per
repo, each drawn from what that repo actually does rather than a shared
template. The full cast and the generator that produced these banners live
outside this repo's history; check the workspace mascot sheet if you need
to regenerate or reshape this one.

Palette: navy `#1B3A6B` (face and shading), saffron `#FF9933`, flag green
`#138808`, white `#FFFFFF`.

Files: `.github/banner-dark.svg` and `.github/banner-light.svg`, swapped
automatically in `README.md` via `prefers-color-scheme`. Both are static
(no animation) so they render identically wherever GitHub displays them.

## Replaced the old banner

This repo previously had its own banner (`assets/banner-dark.png` /
`banner-light.png`, plus source `.svg` files and a `banner.html` proofing
page, teal gradient with the GattyWorks monogram). The mascot banner
replaces it outright instead of stacking alongside it, per the repo owner.
`assets/logo.*` and `assets/social-preview.*` are separate assets and were
left untouched. See `CHANGELOG.md` for the dated entry.
