# B2 build report — Tempus Quiet Premium design

## Implemented

### Design system

- Replaced the neutral Phase A styling with the final Quiet Premium token system: warm adaptive light/dark surfaces, fixed navy ink bands, the complete gold scale, border/focus tokens, the specified radius scale, one shadow depth, and 150–220 ms interaction transitions.
- Reused the site's existing single Google Fonts request for Lora, Inter, and JetBrains Mono. The landing page does not load a second font request.
- Applied the specified desktop/mobile type scale, 60–72 character copy measure, 96/64/48 px responsive section rhythm, visible `:focus-visible` rings, 44 px interactive targets, and `prefers-reduced-motion` overrides.

### Structure and components

- Implemented the ink nav and hero, light Why Tempus cards, one continuous ink feature showcase, light privacy and FAQ sections, and ink footer in the specified order.
- Nav uses the cropped Tempus icon, Lora wordmark, and gold **Get Tempus** CTA. It is transparent over the hero and transitions to the solid ink surface after the hero scrolls out.
- Hero uses the exact headline, subhead, links, sparse Apple Watch/No ads pills, and an art-only CSS crop of `00b_clock_list_hero` that excludes the baked headline.
- Inlined the Apple-authored preferred black **Download on the App Store** SVG paths and linked the badge and nav CTA to App Store ID `6757654219`.
- Added four responsive Why Tempus cards with consistent inline line icons and no emoji used as page-chrome icons.
- Added the four alternating feature rows with exact supplied copy, responsive WebP sources, lazy loading, CSS iPhone frames and Dynamic Island treatment. The Watch composite uses the specified art-only crop and widgets/iCloud caption.
- Added the exact privacy promise, native styled `<details>` FAQ copied from the support source, support/contact links, and compact copyright footer.
- Disabled the sitewide PostHog bootstrap only for the standalone Tempus layout. This removes analytics from the privacy-first product page and prevents script-internal placeholder-like strings from appearing in the required HTML check; all other PaperMod pages retain their existing behavior.

### SEO and media

- Set the exact title and 154-character description in the standalone head while retaining canonical, favicon, Open Graph, Twitter, and font essentials.
- Generated and referenced `static/images/og/tempus-landing.png`, a 1200×630 headline-free crop of the supplied hero art.
- Retained explicit `width`/`height` on all six page images. Initial image transfer is approximately 96 KB at 2× (icon plus hero), with all feature imagery lazy-loaded; this is comfortably below the approximate 600 KB gate.

## Deviations

No functional or visual-spec deviations. The optional single hero entrance animation was intentionally omitted; the specification permits up to one but does not require it.

## Commits

- `4535acf feat(tempus): apply quiet premium design`
- `251cd62 fix(tempus): use official App Store badge`
- `7ec1b32 feat(tempus): add product badges`
- `2b3a37d fix(tempus): transition nav after hero`

## Quality gates

### Production build

Command:

```text
env PATH=/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin /opt/homebrew/bin/hugo --gc --minify
```

The explicit `PATH` selects the already-installed Homebrew Asciidoctor instead of the machine's stale Ruby 2.6 shim. No dependencies were installed or changed.

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

Total in 2647 ms
```

`/tempus/privacy/` and `/tempus/support/` both generated with their PaperMod layouts.

### Local server and HTML checks

Started `hugo server -p 1414 --bind 127.0.0.1`, checked the live routes with `curl`, and stopped the server afterward.

```text
h1_count=1
img_count=6
invalid_images=0
placeholder_count=0
tempus_status=200
privacy_status=200
support_status=200
```

### Responsive and hygiene inspection

- At 390 px, containers use viewport-relative widths with 24 px gutters; the deliberate edge-to-edge hero crop resolves to exactly the viewport width, and no fixed-width child exceeds its container.
- All responsive images reserve intrinsic space; hero/icon use 1×/2× WebP sources, and below-the-fold screenshots are lazy.
- Light, dark, ink-band, CTA, and text-link color pairs follow the supplied contrast-checked token combinations.
- `git diff --check` passes.
