# R6 Review — "Coming soon: iPad" teaser section

**Verdict: APPROVE**

Reviewed branch `tempus-ipad-teaser` (commit `1fd8d08 feat(tempus): add iPad teaser section`) against `docs/tempus-ipad-teaser-design.md` and the design system (`docs/tempus-landing-design.md`), and cross-checked `docs/B4-report.md`'s claims. Ran `hugo server -p 1418` locally, drove it with Playwright (desktop 1440, tablet 834, mobile 390, all light, plus desktop dark), and diffed key structural facts against the live `https://gamov.io/tempus/`. Screenshots below; server stopped after the review (`pkill -f "hugo server -p 1418"` confirmed no process left).

## What I checked and confirmed correct

- **Copy** — eyebrow, H2, body, all three feature-list items, both link label and href (`https://apps.apple.com/app/tempus-world-clock/id6757654219`), and all three image alt texts match the spec **verbatim** (checked via `outerHTML`/`alt` inspection, not just visually).
- **Placement/order** — `document.querySelectorAll('section')` on the live page returns `hero → value-props → features → privacy-promise → ipad → faq` (footer is outside `<section>`), exactly matching the spec's Hero→Why Tempus→Feature showcases→Privacy→**iPad teaser**→FAQ→Footer order. `id="ipad"` and `aria-labelledby="ipad-title"` are both present.
- **Hero pill** — `.hero .badge` order is `["Apple Watch", "Coming soon on iPad", "No ads"]` locally vs. `["Apple Watch", "No ads"]` on the live site — confirms the new pill was inserted in exactly the specified position without disturbing the other two. It's a `<span class="badge">`, not a link/button — not styled as a CTA.
- **Semantic markup** — feature list is a real `<ul>` with a CSS `::before { content: "✓" }` checkmark (color `#E3AE5C`, gold, decorative — not in the accessibility tree, so the list text alone carries the meaning, per spec). The shortcut accent is a real `<table>` with a visible `<caption>A few iPad shortcuts</caption>`, `<kbd>` for each key, correct 4-row mapping (`⌘N`/`⌘F`/`⌘,`/`⌘1`).
- **Images** — all three `<picture>` elements have a `<source type="image/webp" srcset="...-1x.webp 1x, ...-2x.webp 2x">` plus a PNG `<img>` fallback with `width="2752" height="2064"` (correct 4:3 intrinsic ratio), `loading="lazy"`, `decoding="async"` — matches spec exactly.
- **CSS frame tokens** — measured via computed styles, not just spec text: desktop/tablet frame is `border-radius: 18px`, `border: 6px solid #111318`, `background: #111318`, `aspect-ratio: 4/3`, `overflow: hidden`; mobile frame is `border-radius: 14px`, `border: 4px solid #111318`, inner image `border-radius: 10px`, `object-fit: contain` — both rows match the spec table exactly, including the desktop/mobile split.
- **Responsive layout** — tablet (834px): copy `max-width: 680px` (exact), supporting frames at 381px each (comfortably above the "at least 320px" two-column threshold), stacked-above-frame lead per spec. Mobile (390px): DOM order is copy → shortcuts table → link → primary frame → Meeting Finder (captioned) → Converter (captioned), full-width frames, no horizontal overflow (`scrollWidth === clientWidth`) — matches the spec's exact reading order.
- **Contrast** — measured actual rendered colors against the section's own background (`rgb(10,20,36)`, i.e. `--ink-bg`), not just token values: H2 17.19:1, body/feature-list/caption/table text (`--ink-text-secondary`) 9.09:1, eyebrow (`--gold-500`) 6.07:1, link text 17.19:1. All comfortably clear of the 4.5:1 requirement.
- **Alt text** — exact match to spec for all three images (verified via DOM, not eyeballing).
- **Keyboard order / focus** — exactly one focusable element inside the section (the App Store link), natural DOM tab order, no stray `tabindex`. Focused state shows a `2px solid` gold outline with `2px` offset (the site's existing focus-ring treatment, unchanged). The link's hit target measures `269×44px` — meets the 44px minimum exactly.
- **Reduced motion** — no element inside `#ipad` has any `animation` or `transition` applied at all (checked computed styles across every descendant) — correctly has no entrance animation, consistent with "this section needs no entrance animation."
- **Dark mode** — emulated `prefers-color-scheme: dark` and reshot: the ink-band teaser renders **pixel-identical** to light mode (as it must — ink bands are fixed-dark per the design system and never flip), while the neighboring light-band "Why Tempus" section correctly flips to its dark tokens. Confirms the new section doesn't interfere with the site's light/dark mechanism.
- **Nothing else regressed** — FAQ still has all 6 questions in the same order, the last one still reads "Can I use Tempus on iPad or Mac? / Version 1.0 is designed for iPhone and Apple Watch." unchanged (per spec's explicit instruction), exactly one `<h1>` on the page, and the H2 list/section order otherwise matches the live site plus one insertion.
- **SEO** — `content/tempus/_index.md`'s `description` and `summary` both match the spec's exact string, verified at **155 characters** by direct count. Title, canonical URL, and OG image left untouched as instructed.
- **Do-not list** — no carousel/autoplay/parallax, no waitlist/email/countdown/release-date, no second primary button, no hover-only information, no baked-in image marketing text as a headline (can't fully confirm the *images themselves* since they don't exist yet — see below), only Lora/Inter/JetBrains Mono in use.

## Findings

### 1. LOW (disclosed, not a code defect) — Screenshot assets don't exist yet; three 404s on every load

`http://127.0.0.1:1418/tempus/ipad/ipad_0{1,2,3}_*-1x.webp` all 404 (confirmed via `browser_console_messages`), because `static/tempus/ipad/` is empty. This is exactly what `B4-report.md` discloses ("source files were not available... no image variants were generated") — not a hidden defect. The page degrades acceptably in the meantime: browser broken-image icon + the correct alt text is visible inline, layout doesn't collapse or shift, dimensions stay reserved (via the `width`/`height` attributes), and nothing else on the page is affected. **Not blocking** — this is a known asset dependency, not an implementation bug — but flagging so it isn't missed before this ships live: the three PNGs plus their `-1x`/`-2x` WebP variants need to land in `static/tempus/ipad/` before merge, or the section will show broken-image placeholders on the real site.

### 2. Note, not a finding — App Store text-link renders in `--ink-text` (white), not gold, on this ink band

The component spec (§3, "Nav CTA / primary button") says `.text-link` should be "no fill, `--gold-500` text." The rendered "View Tempus on the App Store →" link is white (`--ink-text`), not gold. I checked whether this is new: the **pre-existing** hero secondary link ("See how it works ↓", also `.text-link` on the ink band) renders identically white on the live site today. So this is consistent, established site behavior for `.text-link` specifically *on ink bands* (the component spec's gold rule is evidently scoped to light-band usage, e.g. the Privacy section's "Read the full privacy policy →" does render gold). The new section correctly matches its one existing ink-band precedent rather than inventing a one-off gold treatment. Not a defect — noting only so a future spec revision can reconcile the written component spec with actual ink-band behavior.

## Screenshots

All under `docs/review-ipad/`:

- `desktop-1440-full-light.png` — full page, 1440px, light
- `ipad-section-desktop-1440-light.png` — teaser section only, 1440px, light
- `ipad-section-tablet-834-light.png` — teaser section only, 834px, light
- `ipad-section-mobile-390-light.png` — teaser section only, 390px, light
- `ipad-section-desktop-1440-dark.png` — teaser section only, 1440px, dark
- `desktop-1440-full-dark.png` — full page, 1440px, dark (for the light-band flip comparison)

## Summary

The implementation matches `docs/tempus-ipad-teaser-design.md` exceptionally closely — copy, structure, tokens, breakpoints, accessibility, and contrast all check out against direct DOM/computed-style inspection rather than visual impression alone, and nothing else on the page regressed against the live site. The only open item is the three screenshot assets themselves, which are a known, disclosed, pre-merge dependency rather than an implementation defect.

DONE: docs/R6-site-review.md
