# Brief DS2 — web designer (Claude): review the built landing page against your spec

Codex has implemented `docs/tempus-landing-design.md` on branch `tempus-landing` in `/Users/vikgamov/projects/gamussa-tempus-landing` (see `docs/B2-report.md`). Review it visually and in code. Do not edit site files; do not commit.

1. Start Hugo: `cd /Users/vikgamov/projects/gamussa-tempus-landing && env PATH=/opt/homebrew/bin:$PATH hugo server -p 1415 --bind 127.0.0.1 -D &` then open `http://127.0.0.1:1415/tempus/`. Use the Playwright browser tools (`browser_navigate`, `browser_resize`, `browser_take_screenshot`, `browser_snapshot`) to capture desktop (1440×900), tablet (834×1112) and mobile (390×844) in light mode, plus desktop in dark mode (emulate `prefers-color-scheme: dark` via `browser_run_code_unsafe` or a CDP emulation call if available). Save screenshots under `docs/review/`.
2. Compare to the spec section by section: palette/tokens, typography scale, spacing, band order, copy accuracy, component states (hover/focus — tab through the page), FAQ behavior, screenshot framing, OG/meta tags (view source), reduced-motion handling, and the UI/UX Pro Max critical rules (contrast, 44px targets, alt text, keyboard order). Check `/tempus/privacy/` still looks like the rest of the site.
3. Stop the Hugo server when done (`pkill -f "hugo server -p 1415"`).

## Report
Write `docs/DS2-review.md`: verdict APPROVE / REQUEST CHANGES, then findings as a table (severity BLOCKER/HIGH/MEDIUM/LOW, where, what you saw, exact fix — reference spec section and file/line). Include the screenshot paths. End your turn with exactly `DONE: docs/DS2-review.md`.
