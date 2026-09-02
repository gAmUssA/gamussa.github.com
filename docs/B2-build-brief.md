# Brief B2 — builder (Codex): implement the designer's spec on the Tempus landing page

Same worktree and rules as B1 (`/Users/vikgamov/projects/gamussa-tempus-landing`, branch `tempus-landing`, conventional commits, no push, Hugo 0.155-compatible, keep using the UI/UX Pro Max skill searches for each component you touch). The design system is now final: read `docs/tempus-landing-design.md` in full and implement it exactly — palette tokens (light/dark via `prefers-color-scheme`), Lora/Inter/JetBrains Mono (the site already loads these from Google Fonts — reuse that `<link>`, do not add a second one), the type scale, spacing/radius/shadow/motion tokens, section order and band colors, exact copy, component states (hover/active/focus), FAQ accordion (native `<details>`/`<summary>` is fine, styled), badges, screenshot frame treatment, SEO/meta (title, description, OG image — generate the 1200×630 OG crop with `magick` from `static/tempus/hero/00b_clock_list_hero.png` as the spec describes and reference it).

App Store link: `https://apps.apple.com/app/tempus-world-clock/id6757654219` (from `docs/appstore-url.txt`). Use the official Apple "Download on the App Store" badge as inline SVG (black badge) for the primary CTA; the nav CTA can be the gold button from the spec.

Quality gates before you report:
1. `hugo --gc --minify` succeeds; `/tempus/privacy/` and `/tempus/support/` still render with PaperMod.
2. Run `hugo server -p 1414 --bind 127.0.0.1` in the background, then check `http://127.0.0.1:1414/tempus/` with `curl` for: exactly one `<h1>`, every `<img>` has non-empty `alt`, `width`/`height` attributes, no `__` or `TODO` or `lorem` strings, no emoji in icon positions (use inline SVG icons: Lucide or Heroicons paths, MIT). Stop the server when done.
3. Lighthouse-style hygiene by inspection: total page weight of images on first load under ~600 KB (hero uses WebP with 1x/2x, screenshots lazy), no layout shift (all images sized), `prefers-reduced-motion` respected, focus rings visible, 44px targets, contrast per the spec.
4. Mobile: at 390px wide nothing overflows horizontally (check with the CSS; no fixed-width containers wider than 100vw).

## Report
Write `docs/B2-report.md`: what was implemented per spec section, deviations (with reason), commits, gate results. End your turn with exactly `DONE: docs/B2-report.md` or `BLOCKED: <reason>`.
