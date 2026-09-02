# B3 fix report — designer review

## Findings fixed

### 1 and 5 — light-band contrast and eyebrow consistency

Commit: `770ebfa fix(tempus): correct light-band gold contrast`

- Reused `--gold-600: #9c6420` as the light-band gold text token.
- Added a higher-specificity light-band rule for `.eyebrow`, `.text-link`, and FAQ contact links so it beats the general privacy/FAQ paragraph rules.
- Removed `!important` from `.text-link` color.
- All three light-band eyebrows now use the same computed gold, as do every light-band text link.

WCAG contrast calculations use the standard sRGB relative-luminance formula:

| Rendered content | Foreground | Background | Ratio |
|---|---:|---:|---:|
| Why Tempus eyebrow | `#9c6420` | `#fdfbf8` | 4.78:1 |
| Privacy first eyebrow | `#9c6420` | `#fdfbf8` | 4.78:1 |
| Privacy policy link | `#9c6420` | `#fdfbf8` | 4.78:1 |
| Support eyebrow | `#9c6420` | `#fdfbf8` | 4.78:1 |
| FAQ email and support links | `#9c6420` | `#fdfbf8` | 4.78:1 |
| Hero ink-band gold | `#c8862e` | `#0a1424` | 6.07:1 |
| Feature/footer ink-band gold | `#e3ae5c` | `#0a1424` | 9.20:1 |
| Pill gold | `#e3ae5c` | `#16233d` | 7.81:1 |

The review rounded the first pairing to 4.80:1; the independent calculation here yields 4.78:1. Both exceed the required 4.5:1.

### 2 — Apple Watch image

Commit: `558370e fix(tempus): correct Apple Watch artwork crop`

- Regenerated both WebP variants from the original 1320×2868 `00c_watch_hero.png` composite.
- Cropped the headline-free art region at `1320×2035+0+833`, preserving the sunset skyline, wrist, watch, and Tempus clock list.
- Output dimensions are 660×1018 for 1× and 1320×2035 for 2×.
- Updated the HTML intrinsic dimensions to 1320×2035 and the CSS crop container to the matching `1320 / 2035` aspect ratio.

### 3 — Open Graph image

Commit: `fb1329c fix(tempus): center OG phone and globe crop`

- Rebuilt `static/images/og/tempus-landing.png` at 1200×630 from the headline-free region of `00b_clock_list_hero.png`.
- Centered the recognizable full phone and connected globe on the hero's navy background.
- Quantized the PNG without changing dimensions, reducing it to approximately 187 KB.

### 4 — tablet layout

Commit: `2e3853e fix(tempus): stack tablet layouts at 900px`

- Raised both tablet stacking breakpoints from 800px to 900px.
- Browser measurements at 834px show one 786px hero column and one 786px feature column.
- Browser measurements at 1024px show the desktop layout: 418px + 510px hero columns and 360px + 514px feature columns.

### 6 and 7 — mobile frame radius and focus offset

Commit: `ee90665 fix(tempus): align mobile radius and focus offset`

- Raised the mobile screenshot inner radius from 24px to the specified 28px minimum.
- Changed the global focus outline offset from 3px to 2px.

## Screenshots

Captured with the existing Playwright Chromium installation after scrolling through the page to load lazy imagery:

- `docs/review/b3-desktop-1440-light-full.png` — 1440×6490
- `docs/review/b3-tablet-834-light-full.png` — 834×7617
- `docs/review/b3-mobile-390-light-full.png` — 390×8017

The captures were inspected directly. All screenshots and the corrected Watch composite render; the 834px and 390px views stack in image-first order. At 390px, browser measurement returned `clientWidth: 390` and `scrollWidth: 390`, confirming no horizontal overflow.

## Quality gates

### Production build

```text
env PATH=/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin /opt/homebrew/bin/hugo --gc --minify
```

Exit status: `0`

```text
                  │ EN
──────────────────┼─────
 Pages            │ 233
 Paginator pages  │  13
 Non-page files   │   0
 Static files     │ 208
 Processed images │   0
 Aliases          │  75
 Cleaned          │   0

Total in 2238 ms
```

The explicit `PATH` selects the already-installed Homebrew Asciidoctor instead of the machine's stale Ruby 2.6 shim. No dependency was installed or changed.

### Live curl checks

Started `hugo server -p 1414 --bind 127.0.0.1`, ran the same live HTML checks as B2, and stopped the server afterward.

```text
h1_count=1
img_count=6
invalid_images=0
placeholder_count=0
tempus_status=200
privacy_status=200
support_status=200
```

Additional checks:

- Correct Watch intrinsic dimensions emitted: 1320×2035.
- Correct OG image dimensions: 1200×630.
- `prefers-reduced-motion`, focus visibility, responsive image sizing, and lazy loading remain in place.
- `git diff --check` passes.

## Deviations

None.
