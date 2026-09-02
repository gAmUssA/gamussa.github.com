# Brief DS1 — web designer (Claude): Tempus World Clock landing page design system

You are the designer on a two-person team. Codex is building the page in parallel; your deliverable is a spec it can implement without asking questions. Work in the Hugo site worktree `/Users/vikgamov/projects/gamussa-tempus-landing` (branch `tempus-landing`, deploys to https://gamov.io). Do not write site code; do not commit.

**Use the `ui-ux-pro-max` skill** (`/ui-ux-pro-max:ui-ux-pro-max`). Start with its required design-system step, e.g.
`python3 /Users/vikgamov/.claude/plugins/cache/ui-ux-pro-max-skill/ui-ux-pro-max/2.0.1/src/ui-ux-pro-max/scripts/search.py "iOS app landing page world clock productivity premium elegant timeless" --design-system -p "Tempus World Clock"`, then targeted searches (style, palette, typography, ux) as the skill prescribes. Stack is plain HTML + CSS inside a Hugo layout (no Tailwind build step, no JS framework; vanilla JS allowed for small interactions).

## Product facts (do not invent features)
Tempus World Clock, iPhone + Apple Watch, iOS 17+. Features: named clocks with emoji and color tags; analog/digital; Time Converter with a scrubber; Meeting Finder with working hours, overlap timeline, calendar/.ics export; City Detail with skyline art, sunrise/sunset, Apple Weather; Apple Watch app with Digital Crown scrubber and complications; Home Screen widgets; iCloud sync; no accounts, no ads, no tracking. Copy source: `static/tempus/appstore-description.txt`. Brand: "Tempus" is Latin for time; elegant, timeless, minimal. App icon: `static/tempus/icon-1024.png` (look at it and derive the palette from it plus the skill's recommendation). Existing site is Hugo + PaperMod (Inter/Lora/JetBrains Mono) but the landing page may have its own look; it must still feel at home next to https://gamov.io/tempus/privacy/.

Assets available (all under `static/tempus/`): `hero/00a_meeting_hero.png`, `hero/00b_clock_list_hero.png`, `hero/00c_watch_hero.png` (1320×2868 marketing composites with real UI), `screens/01…07_*.png` (iPhone captures), `screens/watch_01…04.png` (416×496), `hero/bg_*_green.png` (device frames with green screens, for custom composites if you want them).

## Deliverable: `docs/tempus-landing-design.md` containing
1. Design system: style name, palette (hex, roles, light AND dark mode via `prefers-color-scheme`), type pairing (Google Fonts or system, with fallbacks and sizes/scale), spacing scale, radius/shadow tokens, motion rules (respect `prefers-reduced-motion`).
2. Page structure, section by section, top to bottom, with: purpose, exact copy (headline, subhead, body, CTA labels), which asset goes where and at what size, layout at desktop (≥1024), tablet, mobile (≤430). Sections to cover at minimum: hero with App Store CTA, "why Tempus" value props (3–4), feature showcases (Meeting Finder, Converter, City Detail, Watch), privacy promise, FAQ (reuse the support page's FAQ), footer with links to `/tempus/privacy/` and `/tempus/support/` and viktor@gamov.io.
3. Component specs: nav/CTA button, feature card, screenshot frame treatment, FAQ accordion, badge. Include hover/focus states and accessibility notes (contrast ratios verified, 44px targets, alt text for every image).
4. A short "do not" list for the builder (e.g. no emoji as icons, no stock photos, no marketing claims beyond the product facts).
5. SEO/meta: title (≤60 chars), description (≤155), OG image choice.

Keep it under ~350 lines; tables over prose. End your turn with exactly `DONE: docs/tempus-landing-design.md`.
