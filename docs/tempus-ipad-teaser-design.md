# Tempus iPad teaser design

Status: implementation handoff for the pre-1.1 landing page  
Route: `/tempus/`  
Design system: `docs/tempus-landing-design.md` (*Quiet Premium*)

## 1. Placement and page order

| Surface | Exact change | Reason |
|---|---|---|
| Hero badges | Add a third pill with the exact text **“Coming soon on iPad”**, between “Apple Watch” and “No ads.” Use the existing `.badge` treatment; it is not a CTA. | Announces iPad above the fold without competing with the App Store CTA. |
| Page order | Hero (ink) → Why Tempus (light) → Feature showcases (ink) → Privacy (light) → **iPad teaser (ink)** → FAQ (light) → Footer (ink). | Inserting between Privacy and FAQ preserves the established ink/light alternation. |
| Section anchor | `id="ipad"` and `aria-labelledby="ipad-title"`. Do not add a nav item; the current minimal nav remains unchanged. | The section is linkable without expanding navigation. |

The teaser is a distinct `<section class="ipad-teaser ink-band section">`.
It does not replace or become a fifth row in the existing iPhone feature
showcase. Keep the current FAQ answer about version 1.0 unchanged: it remains
factually correct while the teaser communicates the future release.

## 2. Section content and visual specification

### Exact copy

| Element | Copy |
|---|---|
| Eyebrow | `Tempus 1.1 · iPad` |
| H2 | `More room for every time zone.` |
| Body | `Tempus is coming to iPad with a native sidebar that keeps your clocks beside City Detail on larger screens. Time Converter and Meeting Finder open in the detail column, with iPad toolbars, keyboard shortcuts, pointer support, and layouts that adapt across portrait, landscape, and Stage Manager.` |
| Feature 1 | `Browse clocks and City Detail side by side.` |
| Feature 2 | `Keep Time Converter and Meeting Finder in the detail column.` |
| Feature 3 | `Use iPad toolbars, keyboard shortcuts, pointer hover, and manual reordering.` |
| Link | `View Tempus on the App Store →` |
| Link target | `https://apps.apple.com/app/tempus-world-clock/id6757654219` |

Use a semantic `<ul>` for the three features. Give each item a small
gold checkmark drawn with CSS or the existing single-color SVG style; the text
must carry the meaning. The App Store link uses `.text-link` and is secondary
to the page's existing download CTA. Do not add “Notify me,” a form, a launch
date, or a second primary button.

### Screenshots

| Priority | Asset | Use | Alt text |
|---|---|---|---|
| Primary | `tempus/ipad/ipad_01_sidebar_city_detail.png` | Large frame paired with the copy. | `Tempus on iPad showing world clocks in a sidebar beside Tokyo Office City Detail.` |
| Supporting | `tempus/ipad/ipad_02_meeting_finder.png` | First of two smaller frames below the lead row; caption “Meeting Finder.” | `Tempus Meeting Finder on iPad showing Tokyo Office, Sydney, and New York with overlap results.` |
| Supporting | `tempus/ipad/ipad_03_converter.png` | Second smaller frame; caption “Time Converter.” | `Tempus Time Converter on iPad showing converted world-clock times in the detail column.` |

All captures are 2752×2064 (4:3). Preserve the complete UI; no crop,
perspective transform, reflection, or screenshot overlap. Generate WebP 1x/2x
variants and use `<picture>`/`srcset`; retain the PNG as fallback. Set intrinsic
`width`/`height`, `loading="lazy"`, and `decoding="async"` on all three.

### CSS iPad frame

| Property | Desktop/tablet | Mobile |
|---|---:|---:|
| Aspect ratio | `4 / 3` | `4 / 3` |
| Outer radius | `18px` | `14px` |
| Bezel | `6px solid #111318` | `4px solid #111318` |
| Inner image radius | `12px` | `10px` |
| Background/shadow | `#111318`; existing `--shadow-card` | Same |

The frame is a plain landscape rounded rectangle: no home button, camera dot,
notch, Dynamic Island, hardware labels, or fake browser chrome. Use
`overflow:hidden`; the image fills the exact 4:3 interior with
`object-fit:contain`. On ink, add a `1px solid var(--ink-border)` outer
hairline only if the bezel edge needs separation.

### Responsive layout

| Width | Layout |
|---|---|
| Desktop ≥1024px | Lead row is a 38/62 two-column grid, 64px gap: copy/feature list/shortcuts/link left, primary frame right. Supporting frames form a two-column row below with 24px gap and captions. |
| Tablet 431–1023px | Stack copy above the primary frame; cap copy at 680px and frame at 880px, centered. Keep supporting frames in two columns while each remains at least 320px wide; otherwise stack. |
| Mobile ≤430px | Single DOM-order column: copy, shortcuts, link, primary, Meeting Finder, Converter. Frames use full content width. Captions remain visible; no horizontal scroller. |

Use the design-system section padding (96/64/48px) and the existing 1120px
content wrapper. Copy measure is 58ch maximum. Supporting frames begin 48px
below the lead row on desktop and 32px below it on tablet/mobile.

## 3. Keyboard shortcut accent

Recommended as a compact semantic table after the feature list. If the section
must be shortened, omit the entire table; never hide it only at one breakpoint.

| Keys | Action |
|---|---|
| `⌘N` | New clock |
| `⌘F` | Search clocks |
| `⌘,` | Settings |
| `⌘1` | Return to clocks |

Use `<table>` with a visually visible caption, `A few iPad shortcuts`, and
`<kbd>` for each key. The table sits on `--ink-surface` with a 1px
`--ink-border`, 16px radius, and 16px padding. Keys use JetBrains Mono 500,
`--gold-100` background, `#1C1917` text, 6px radius, and a minimum 32px height.
Action labels use Inter 500 and `--ink-text-secondary`.

## 4. Accessibility and do-not list

| Do | Do not |
|---|---|
| Keep DOM order identical to mobile reading order; use one H2 and semantic figures/captions. | Do not use a carousel, auto-advance, parallax, or scroll-triggered screenshot motion. |
| Use the exact descriptive alt text above; captions name the two supporting tools. | Do not repeat the caption in alt text or put marketing copy inside images. |
| Preserve existing focus-visible rings and 44px minimum link target. | Do not make the hero pill or feature bullets look clickable. |
| Keep `--ink-text`/`--ink-text-secondary` contrast and gold only as accent. | Do not communicate “coming soon” by color alone or imply iPad is available now. |
| Honor `prefers-reduced-motion`; this section needs no entrance animation. | Do not add a waitlist, email field, notification CTA, countdown, or release date. |
| Keep all screenshots available at every breakpoint and optimize their bytes. | Do not ship three full-resolution PNG downloads without responsive WebP sources. |
| Describe keyboard and pointer features in text, with touch-equivalent features visible in screenshots. | Do not make any information hover-only or add fake pointer effects to the frames. |

Also retain the existing fonts, tokens, App Store URL, privacy claims, and
single hero entrance-animation limit. No new JavaScript is required.

## 5. SEO description

Update both `description` and `summary` in `content/tempus/_index.md` to this
exact 155-character value:

`Named clocks, instant time conversion, and a meeting finder across time zones. No accounts, ads, or tracking. For iPhone and Apple Watch; iPad coming soon.`

Keep the existing title unchanged until iPad ships; adding iPad to a title that
still says “for iPhone” would either exceed the title target or imply current
availability. Keep the existing canonical URL and OG image.

DONE: docs/tempus-ipad-teaser-design.md
