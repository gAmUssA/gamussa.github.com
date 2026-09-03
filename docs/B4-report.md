# B4 — iPad teaser build report

## Delivered

- Added the `Coming soon on iPad` hero pill between `Apple Watch` and `No ads`.
- Added the native iPad teaser at `/tempus/#ipad`, between Privacy and FAQ, with the specified copy, semantic feature list, keyboard-shortcut table, App Store text link, and three semantic figures.
- Added responsive CSS for the 38/62 desktop lead grid, tablet stack, single-column mobile layout, landscape iPad frames, supporting captions, and reduced-motion compatibility.
- Updated the Tempus front matter `description` and `summary` to the exact 1.1 teaser copy.

## Screenshot handoff

`static/tempus/ipad/` was empty at the initial check and the final check. The three `<img>` fallbacks and their WebP `srcset` entries deliberately point to the expected filenames:

- `ipad_01_sidebar_city_detail.png`
- `ipad_02_meeting_finder.png`
- `ipad_03_converter.png`

Once those 2752×2064 PNGs arrive, generate the corresponding `-1x.webp` and `-2x.webp` variants in the same directory. No image variants were generated because source files were not available.

## Quality gates

- `env PATH=/opt/homebrew/bin:$PATH hugo --gc --minify`: passed (only existing Hugo deprecation warnings).
- `hugo server -p 1417 --bind 127.0.0.1`: started for checks and stopped afterward.
- Curl checks: `/tempus/`, `/tempus/privacy/`, and `/tempus/support/` all returned HTTP 200.
- Rendered `/tempus/` contains exactly one `<h1>`, all teaser image tags include descriptive `alt`, intrinsic `2752×2064` dimensions, `loading="lazy"`, and `decoding="async"`.
- CSS preserves full-width, single-column frames at 430px and below; there is no teaser horizontal scroller or fixed content width at mobile size.
- UI/UX Pro Max accessibility/responsive-image check was run before implementation; the section uses descriptive alternatives and container-sized images.

## Files changed

- `assets/css/tempus.css`
- `content/tempus/_index.md`
- `layouts/tempus/list.html`

DONE: docs/B4-report.md
