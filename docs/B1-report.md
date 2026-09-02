# B1 build report — Tempus landing page

## Delivered

- Added the standalone `/tempus/` page at `content/tempus/_index.md`.
- Added `layouts/tempus/baseof.html` and `layouts/tempus/list.html`, which retain PaperMod's head partial (canonical, Open Graph, Twitter metadata and favicons) without inheriting PaperMod's header, post chrome or footer.
- Added fingerprinted Hugo Pipes CSS at `assets/css/tempus.css`. It is intentionally a neutral Phase A system: system fonts, one blue accent, responsive layout, visible keyboard focus, a skip link, descriptive image alternatives, and reduced-motion handling.
- Added semantic hero, value propositions, Meeting Finder, Converter, City Detail, Apple Watch, privacy, FAQ, and footer sections. The FAQ is copied from `content/pages/tempus-support.md`; product copy comes from `static/tempus/appstore-description.txt`.
- Used the available App Store ID (`6757654219`) for both live download CTAs.
- Added the staged Tempus source assets and generated responsive WebP pairs for all 18 PNGs: `*-1x.webp` at half the original width and `*-2x.webp` at the original width. Meaningful visual content uses `<picture>`/`srcset`; below-the-fold screenshots are lazy-loaded with explicit intrinsic dimensions.

## Commits

- `fe63a17 feat(tempus): add standalone landing page`

## Validation

Required build command (with Homebrew's existing Asciidoctor binary first in `PATH`):

```text
env PATH=/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin /opt/homebrew/bin/hugo --gc --minify
```

Exit status: `0`

Build-output tail:

```text
                  │ EN
──────────────────┼─────
 Pages            │ 233
 Paginator pages  │  13
 Non-page files   │   0
 Static files     │ 207
 Processed images │   0
 Aliases          │  75
 Cleaned          │   0

Total in 2771 ms
```

Confirmed generated routes:

- `/tempus/`
- `/tempus/privacy/`
- `/tempus/support/`

## Notes

- `docs/tempus-landing-design.md` was not present, so this implements the brief's requested neutral Phase A presentation and does not attempt the later designer-led Phase B.
- Invoking Hugo under the default shell `PATH` fails because an older user-level Asciidoctor shim points to a missing Ruby 2.6 gem. The already-installed Homebrew Asciidoctor binary resolves this without changing project dependencies.
