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

Files: `design/banner.svg` is the README banner. It is project-themed:
the ink background, teal accent, and tricolor rule bar plus the facts on it
come from this repo itself, not from a shared org template, and the mascot
is one element of it, not the whole banner. `design/banner.html` is a
self-contained reference page showing the banner plus the theme tokens it
was built from. Referenced from README.md by a plain relative img src so
GitHub rewrites the asset path for the current branch. The old mascot-only
`.github/banner-*.svg` files are removed.

The standalone mascot sprites live alongside it: `design/mascot.svg`
(static) and `design/mascot-animated.svg` (blinking eyes, CSS inside the
SVG, honors prefers-reduced-motion). `design/README.md` showcases all of
these assets.

## Historical banner

This repo previously stored a separate banner and social assets under
`assets/`, plus mascot-only banner variants under `.github/`. Those files
are no longer present. The maintained design source is `design/banner.svg`;
see `CHANGELOG.md` for the history.
