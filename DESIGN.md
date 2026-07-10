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

Files: `.github/banner-dark.svg` is shown as a single static image in
README.md, with no light/dark switching. This repo is private, and GitHub's
raw content CDN (raw.githubusercontent.com) requires authentication for
private repos, so the absolute URLs a picture/source block needs return 404
to anyone without a session; GitHub also does not rewrite relative paths
inside a source srcset. A plain relative img src is the one pattern GitHub
reliably resolves for private-repo images, so that is what is used here, at
the cost of theme-adaptive switching. `.github/banner-light.svg` still
exists (generated alongside the dark one) but is not referenced.

## Replaced the old banner

This repo previously had its own banner (`assets/banner-dark.png` /
`banner-light.png`, plus source `.svg` files and a `banner.html` proofing
page, teal gradient with the GattyWorks monogram). The mascot banner
replaces it outright instead of stacking alongside it, per the repo owner.
`assets/logo.*` and `assets/social-preview.*` are separate assets and were
left untouched. See `CHANGELOG.md` for the dated entry.
