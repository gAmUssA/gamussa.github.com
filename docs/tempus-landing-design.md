# Tempus World Clock — Landing Page Design Spec

For Codex to implement in plain HTML + CSS inside a Hugo layout (no Tailwind build, no JS framework; small vanilla JS OK for the FAQ/nav only if `<details>` isn't enough). No site code was written for this brief — spec only.

Design-system research: `ui-ux-pro-max` `--design-system` run for "iOS app landing page world clock productivity premium elegant timeless" recommended an **App Store Style Landing** pattern (hero device mock → screenshots → features → CTA) and a **premium black+gold** color family (`#1C1917 / #CA8A04 / #FAFAF9`). That gold family is corroborated by the actual app icon (`static/tempus/icon-1024.png`, a warm amber-to-gold gradient), so gold is adopted as the sole brand accent below, tuned to the icon rather than the generic swatch. Typography keeps the blog's existing Lora/Inter/JetBrains Mono system (see gamov.io design memory) instead of the tool's default Playfair Display, so the page reads as a Tempus-branded product page that still belongs to gamov.io.

## 1. Design system

**Style name:** *Quiet Premium* — minimal, editorial, generous white space (per "Minimal & Direct" + "App Store Style Landing" patterns), one accent color, real screenshots, no stock photography, no decorative icon soup.

### 1.1 Palette

Three token groups: **Neutral** (adapts to light/dark), **Ink** (fixed-dark "showcase" bands — always dark, matches the hero artwork's own navy, does not flip with theme), **Gold** (brand/CTA accent, constant in both modes).

| Token | Light value | Dark value | Role |
|---|---|---|---|
| `--bg` | `#FDFBF8` | `#14110D` | Page background (warm off-white / warm near-black) |
| `--surface` | `#FFFFFF` | `#1D1914` | Cards, FAQ items, nav-on-scroll |
| `--text` | `#1C1917` | `#F5F1EA` | Body/heading text |
| `--text-secondary` | `#52504B` | `#B9B2A6` | Subheads, captions |
| `--text-muted` | `#8A8680` | `#79736A` | Meta, footnotes |
| `--border` | `#E7E2DA` | `#332C22` | Card/section borders, rules |
| `--focus-ring` | `#C8862E` at 45% alpha | same | Focus outline, all modes |

| Token | Value (fixed) | Role |
|---|---|---|
| `--ink-bg` | `#0A1424` | Hero + feature-showcase band background |
| `--ink-surface` | `#16233D` | Cards/badges sitting on an ink band |
| `--ink-border` | `#2C3F63` | Hairlines on ink band |
| `--ink-text` | `#F5F7FA` | Heading/body text on ink band |
| `--ink-text-secondary` | `#A9B7CE` | Subhead/meta on ink band |
| `--gold-600` | `#9C6420` | CTA pressed/active |
| `--gold-500` | `#C8862E` | Primary CTA, links, active nav, icon accent |
| `--gold-400` | `#E3AE5C` | Hover state, gradient highlight |
| `--gold-100` | `#FBEEDA` | Badge/tint background on light surfaces |

Contrast check (WCAG AA, verified pairs): text `#1C1917` on `--bg` `#FDFBF8` = 15.6:1; `--text-secondary` `#52504B` on `#FDFBF8` = 7.1:1; dark-mode text `#F5F1EA` on `#14110D` = 14.9:1; `--ink-text` `#F5F7FA` on `--ink-bg` `#0A1424` = 15.2:1; gold CTA text `#1C1917` on `--gold-500` `#C8862E` = 5.3:1 (use dark text on gold, never white). All ≥ 4.5:1 for body text, ≥3:1 for large text/UI.

### 1.2 Typography

| Role | Font | Fallback stack | Weight(s) |
|---|---|---|---|
| Display/headings | Lora | `ui-serif, Georgia, "Times New Roman", serif` | 600 (h1/h2), 500 (h3) |
| Body/UI | Inter | `-apple-system, "Segoe UI", Roboto, sans-serif` | 400, 500, 600 |
| Numerals/mono accents (digital time readouts, GMT offsets in feature captions) | JetBrains Mono | `ui-monospace, "SF Mono", Menlo, monospace` | 500 |

Load via existing site Google Fonts `<link>`s (Lora + Inter + JetBrains Mono already loaded sitewide) — do not add Playfair Display or any new family.

| Style | Size (desktop) | Size (mobile ≤430) | Line-height | Font |
|---|---|---|---|---|
| Hero H1 | 56px | 34px | 1.1 | Lora 600 |
| Section H2 | 36px | 26px | 1.2 | Lora 600 |
| Feature H3 | 22px | 20px | 1.3 | Lora 500 |
| Subhead/lede | 20px | 17px | 1.5 | Inter 400 |
| Body | 17px | 16px | 1.6 | Inter 400 |
| Caption/meta | 14px | 13px | 1.5 | Inter 500 |
| Mono accent | 15px | 14px | 1.4 | JetBrains Mono 500 |

Line length target 60–72ch for body copy blocks.

### 1.3 Spacing, radius, shadow, motion

- **Spacing scale (px):** 4, 8, 12, 16, 24, 32, 48, 64, 96, 128 — section vertical padding: 96px desktop / 64px tablet / 48px mobile.
- **Radius:** `--radius-sm: 8px` (badges, small buttons), `--radius-md: 16px` (cards), `--radius-lg: 28px` (CTA buttons, phone device frame), `--radius-full: 999px` (pills, nav CTA).
- **Shadow:** `--shadow-card: 0 1px 2px rgba(28,25,23,.04), 0 8px 24px rgba(28,25,23,.06)` (light); `0 1px 2px rgba(0,0,0,.4), 0 12px 32px rgba(0,0,0,.35)` (dark/ink). One shadow depth only — no elevation ladder.
- **Motion:** transitions 150–220ms `ease-out` on color/background/transform only (never layout-affecting properties). Max one hero entrance animation (fade+8px rise on hero content) and simple hover states elsewhere — no scroll-jacking, no parallax. Wrap every animation/transition in:
  ```css
  @media (prefers-reduced-motion: reduce) {
    * { animation: none !important; transition: none !important; }
  }
  ```

## 2. Page structure

Global note: sections alternate **Light band** (`--bg`/`--surface`/`--text` tokens, flips with `prefers-color-scheme`) and **Ink band** (fixed dark, uses `--ink-*` tokens always) — see table below. All copy given verbatim; do not add claims beyond §4.

| # | Section | Band |
|---|---|---|
| 0 | Nav | Ink (transparent→solid on scroll) |
| 1 | Hero | Ink |
| 2 | Why Tempus | Light |
| 3 | Feature showcases (4) | Ink |
| 4 | Privacy promise | Light |
| 5 | FAQ | Light |
| 6 | Footer | Ink |

### 0. Nav

- Fixed/sticky top. Transparent over hero (ink-bg shows through), gains `--ink-surface` background + `--ink-border` bottom hairline + `--shadow-card` once the page scrolls past the hero.
- Left: 24×24 clock-mark cropped from `icon-1024.png` (see badge/icon note in §3) + "Tempus" wordmark, Lora 600, 18px, `--ink-text`.
- Right: single primary button, label **"Get Tempus"**, links to `https://apps.apple.com/app/tempus-world-clock/id6757654219` (from `docs/appstore-url.txt`).
- No secondary nav links (per "Minimal & Direct" pattern — avoid complex navigation). Mobile: same two elements, no hamburger, nothing to collapse.

### 1. Hero (ink band)

- **Headline:** "Every time zone. One glance."
- **Subhead:** "Tempus is the world clock for people who work, travel, and stay close to the people they love — named clocks, instant conversion, and a meeting finder that actually finds the meeting."
- **CTA:** primary button "Download on the App Store" linking to `https://apps.apple.com/app/tempus-world-clock/id6757654219` (use Apple's official App Store badge artwork, per Apple marketing guidelines) + text link "See how it works ↓" (anchors to §3 feature showcases).
- **Visual:** `hero/00b_clock_list_hero.png`, **art-only crop** — the source PNG has a baked-in marketing headline ("Perfect Time, Every Time") in a non-brand rounded sans typeface; that band must be cropped away so it never appears next to the real HTML headline above. Implementation: put the image in a container with `aspect-ratio: 1320 / 2180` (≈ bottom 76% of the 1320×2868 source) and `object-fit: cover; object-position: bottom;` — this keeps the phone mockup + glow + globe graphic and discards the top text band automatically, no image editing required.
- **Layout:**
  - Desktop (≥1024): two columns, 45/55. Left: headline, subhead, CTAs, left-aligned, vertically centered. Right: cropped hero image, max-width 420px, right-aligned, may bleed to the section's right edge.
  - Tablet: stacked, text block then image, both centered, image max-width 360px.
  - Mobile (≤430): stacked, text left-aligned, image full-width edge-to-edge (no side padding) so the phone reads large; text block keeps 24px side padding.
- Alt text for hero image: `"Tempus app showing a list of named world clocks for New York, Edinburgh, Kyoto, Marseille, Sydney, and San Francisco with live times."`

### 2. Why Tempus (light band)

H2: **"Built for people juggling time zones, not tourists checking one."**

Four icon cards, single row desktop / 2×2 tablet / stacked mobile. No screenshots here — keep this section light and scannable; screenshots live in §3.

| Card | Icon | Heading | Body |
|---|---|---|---|
| 1 | name tag / person | Clocks with names, not just cities | Add a clock for a city or a person — "Mum in Sydney," "Design team, Berlin" — with a custom name, emoji, and color tag so it's readable at a glance. |
| 2 | scrubber/slider | Convert instantly | Pick any time in any zone and every clock updates together. Drag the time scrubber to slide through the day and see who's awake. |
| 3 | calendar/overlap | Find a meeting that actually works | Set working hours per clock and Tempus shows the overlap. Add it to your calendar in one tap or share an .ics invite. |
| 4 | lock/shield | Private by design | No account, no ads, no tracking. Your clocks live on your device and in your own private iCloud database. |

### 3. Feature showcases (ink band, one continuous section, 4 alternating rows)

Shared layout rule: desktop alternates image-left/text-right and text-left/image-right per row (zig-zag); tablet/mobile always image-above-text, both centered, 100% width up to a 480px cap on the image.

| Row | Feature | Headline | Body | Asset | Frame |
|---|---|---|---|---|---|
| A | Meeting Finder | Find the window that works for everyone | Select two or more clocks, set working hours for each, and Tempus highlights the overlap. Tap a slot to add it to your calendar or export it as an .ics invite. | `screens/03_meeting_finder.png` | CSS device frame (§3 component spec) |
| B | Time Converter | Drag once, see every zone move | Pick a time in any clock and every other clock updates with it. Drag the scrubber to slide through the day; day/night dots show who's awake. | `screens/02_converter.png` | CSS device frame |
| C | City Detail | A place, not just an offset | Tap any clock for a full city view — a skyline that shifts with the time of day, sunrise and sunset, and current conditions from Apple Weather. | `screens/07_city_detail.png` | CSS device frame |
| D | Apple Watch | Time on your wrist | Tempus on Apple Watch shows your clocks, converts with the Digital Crown, and offers complications for your favorite cities. Clocks sync instantly between iPhone and Watch. | `hero/00c_watch_hero.png`, art-only crop | See crop rule below |

Watch row crop rule (same technique as hero): container `aspect-ratio: 1536 / 2035` (≈ bottom 74% of the 1536×2752 source), `object-fit: cover; object-position: bottom;` — discards the baked "Time On Your Wrist" text band, keeps the sunset skyline + wrist + watch face.

Widgets & iCloud sync are real product facts but do not warrant a 5th full row — fold them into a single caption line under row D: *"Home Screen widgets and iCloud keep every device in sync."*

Alt text: A = "Tempus Meeting Finder showing selected cities, an overlap timeline, and best meeting times." B = "Tempus Time Converter with a scrubber showing converted times for Tokyo and Sydney." C = "Tempus City Detail view for Tokyo with skyline, sunrise and sunset times." D = "Apple Watch on a wrist showing the Tempus complication against a city skyline at dusk."

### 4. Privacy promise (light band)

H2: **"No accounts. No ads. No tracking."**
Body: "Tempus doesn't know who you are and doesn't want to. Your clocks are stored on your device and, if you turn on iCloud, in your own private iCloud database — never on our servers, because we don't have any. Weather comes from Apple Weather for the cities you add, never for your location."
CTA (text link): "Read the full privacy policy →" → `/tempus/privacy/`

### 5. FAQ (light band)

H2: **"Questions"**. Reuse the support page's Q&A verbatim (source of truth: `content/pages/tempus-support.md`) as an accordion, in this order:

1. **How do I add a clock?** Tap **+** on the clock list, search for a city, then optionally give it a custom name, emoji and color.
2. **How do I convert a time?** Open **Convert**, choose a source clock and time, or drag the scrubber. All your clocks update together.
3. **How does the Meeting Finder work?** Pick two or more clocks, set working hours for each, and Tempus shows the windows where everyone is available. Tap a slot to add it to your calendar or share an .ics invite.
4. **Why don't I see weather?** Weather is optional. Turn it on in **Settings › Weather**. It needs an internet connection and is provided by Apple Weather for the cities you added, not for your location.
5. **My clocks are not syncing to my Apple Watch.** Make sure both devices are signed into the same iCloud account and that the watch app is installed. Opening Tempus on the iPhone triggers an immediate sync to the watch.
6. **Can I use Tempus on iPad or Mac?** Version 1.0 is designed for iPhone and Apple Watch.

Below the accordion: "Still stuck? Email **viktor@gamov.io** — see the [full support page](/tempus/support/)."

### 6. Footer (ink band)

Single row, wraps on mobile: © 2026 Viktor Gamov · [Privacy](/tempus/privacy/) · [Support](/tempus/support/) · [viktor@gamov.io](mailto:viktor@gamov.io). No social icons, no newsletter form (none exist for this product — don't invent one).

## 3. Component specs

### Nav CTA / primary button

| State | Background | Text | Border |
|---|---|---|---|
| Default | `--gold-500` | `#1C1917` | none |
| Hover | `--gold-400` | `#1C1917` | none |
| Active/pressed | `--gold-600` | `#1C1917` | none |
| Focus | `--gold-500` | `#1C1917` | `2px solid var(--focus-ring)`, `2px` offset |

Shape: `--radius-full`, min height 44px, horizontal padding 20px, Inter 600 15px. Secondary/text-link buttons: no fill, `--gold-500` text, underline on hover/focus, same 44px min hit target via padding.

### Feature card (Why Tempus)

`--surface` background, `--radius-md`, `24px` padding, `1px solid var(--border)`, `--shadow-card`. Icon: 40×40px, single-color SVG line icon in `--gold-500` circle badge (`--gold-100` background, 56×56px) — **not** an emoji (product facts mention emoji as an in-app feature, not as our UI icon system). Heading Lora 500 20px, body Inter 400 16px `--text-secondary`. Hover: border color → `--gold-500` at 40% alpha, no transform/scale (avoid layout shift).

### Screenshot frame (feature showcases)

CSS-drawn device frame, not a separate image asset — the raw captures in `screens/` have no bezel baked in, so the frame is built in CSS around the `<img>`:

- Outer frame: `border-radius: 44px` (scale down proportionally on mobile, min 28px), `border: 10px solid #1a1a1a` (both modes — the physical device is black regardless of site theme), background `#000`, `--shadow-card`.
- Inner screenshot: `border-radius: 34px`, `object-fit: cover`, full bleed inside the border (the captures already include their own status bar — do not add a second one).
- Dynamic-Island pill: `::before`, 90×26px, `border-radius: 999px`, `background:#000`, centered top, `12px` from the frame's top inner edge.
- Watch variant (if used for a secondary inset): `border-radius: 34%`, `border: 8px solid #1a1a1a`, plus a small side "digital crown" nub via `::after` (10×18px rounded rect on the right edge) — optional, only needed if a `watch_0X` screen is used outside the hero-crop watch row.

### FAQ accordion

Native `<details>`/`<summary>` — free keyboard support, no JS required, works with `prefers-reduced-motion`.

- Closed row: `--surface`, `1px solid var(--border)`, `--radius-md`, 20px padding, Inter 600 17px question text, chevron icon right-aligned.
- Open row: chevron rotates 180° (`transform: rotate(180deg); transition: transform 180ms ease-out;` — skip transition under reduced motion), answer text `--text-secondary`, 12px top margin.
- Focus-visible on `<summary>`: same `--focus-ring` outline as buttons. Min tap target height 44px even when collapsed.

### Badge / pill

Used sparingly for meta tags like "iOS 17+", "Apple Watch", "No ads": `--radius-full`, `--gold-100` background / `--gold-600` text (light), `--ink-surface` background / `--gold-400` text (ink band), Inter 600 13px, 4px/12px padding, no icon.

## 4. Do-not list

- No emoji used as UI icons anywhere in the page chrome (emoji *inside screenshots* are fine — that's the product).
- No stock photography, illustration packs, or AI-generated lifestyle imagery beyond the two hero composites explicitly provided; every other visual is a real captured screenshot.
- No marketing claims beyond §"Product facts" in the brief — no "#1", no fabricated ratings/review counts/download numbers, no comparison to other apps, no pricing claims (App Store handles pricing).
- No baked-in image text used as a page headline — the hero/watch composites' own headline bands must be cropped out per §2.
- No account/newsletter/signup forms — Tempus has no accounts and this page collects no data.
- No parallax, autoplay video, or scroll-jacking. No more than one entrance animation on the page.
- No new font families beyond Lora / Inter / JetBrains Mono.
- No hamburger menu — nav has exactly one link (the CTA).

## 5. SEO / meta

| Field | Value |
|---|---|
| Title (≤60) | `Tempus — World Clock & Meeting Finder for iPhone` (48 chars) |
| Description (≤155) | `Named clocks, instant time conversion, and a meeting finder for people working across time zones. No accounts, no ads, no tracking. iPhone + Apple Watch.` (154 chars) |
| OG image | Crop `hero/00b_clock_list_hero.png` to a 1200×630 safe-zone version (phone + globe centered, headline band excluded — same art used in the hero) and save as `static/images/og/tempus-landing.png`, following the site's existing `static/images/og/` convention. |
| Canonical URL | `/tempus/` (or wherever the landing page is routed — keep consistent with `/tempus/privacy/` and `/tempus/support/`) |

DONE: docs/tempus-landing-design.md
