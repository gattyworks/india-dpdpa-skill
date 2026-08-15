# Design

## Mascot and banner

This repo's mascot is Saakshi ("witness" in Hindi/Sanskrit): a folded evidence
sheet with navy line-number ticks, a friendly pixel face, and real saffron,
white, and green bands. The sheet represents the audit's core promise: every
finding points back to evidence in the build.

Saakshi does not reproduce the Ashoka Chakra, the national emblem, a seal, or
a certification mark. Those symbols carry legal and civic meaning that this
engineering aid should not borrow. Saakshi is one of the GattyWorks pixel
mascots, drawn from what this repository actually does.

Palette: navy `#1B3A6B` (face and shading), saffron `#FF9933`, flag green
`#138808`, white `#FFFFFF`.

Files: `design/banner.svg` is the README banner. It is project-themed:
the ink background, teal accent, and tricolor rule bar plus the facts on it
come from this repo itself, not from a shared org template, and the mascot
is one element of it, not the whole banner. `design/banner.html` is a local
reference page showing the banner plus the theme tokens it was built from.
Referenced from README.md by a plain relative img src so
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
