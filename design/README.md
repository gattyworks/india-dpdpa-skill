# design/ - India DPDPA Skill visual assets

Maintained assets for this repo's README banner and mascot (**Saakshi**).
Saakshi is the evidence witness for this project: a folded source sheet with
line-number ticks, a face, and saffron, white, and green bands.

## Banner

![India DPDPA Skill banner](banner.svg)

Project-themed: the colors and facts come from this repo, with the mascot as
one element. `banner.html` is a self-contained reference page showing the
banner plus the exact theme tokens it was built from.

## Mascot - Saakshi

| Static | Blinking |
| --- | --- |
| ![Saakshi static](mascot.svg) | ![Saakshi blinking](mascot-animated.svg) |

`mascot.svg` is the static sprite; `mascot-animated.svg` blinks (CSS inside
the SVG, honors prefers-reduced-motion). Both are transparent-background,
22x20 pixel-grid sprites with a black outline halo, so they sit cleanly on
any surface.
