# Brief B3 — builder (Codex): act on the designer's review

Read `docs/DS2-review.md` in full (same worktree/branch/rules as B1/B2; keep using the UI/UX Pro Max skill checks). Fix findings 1–7, one conventional commit per finding (6 and 7 may share one). Specifics:

1. Contrast (#1 + #5 together): introduce a light-band gold text token (`--gold-600` `#9c6420`, 4.80:1 on `#fdfbf8`) and apply it with a selector that beats `.privacy-promise p` / `.faq p` so all three light-band eyebrows and all light-band text links render identically; remove the `!important` on `.text-link`. Ink-band gold stays `--gold-500`. Verify by computing contrast for every gold text instance on light surfaces (≥4.5:1) and report the numbers.
2. Watch image (#2): regenerate `static/tempus/hero/00c_watch_hero-1x.webp` and `-2x.webp` from the ORIGINAL composite. Note the staged file `static/tempus/hero/00c_watch_hero.png` is 1320×2868 (already fitted for the App Store); the uncropped 1536×2752 source is `static/tempus/hero/bg_watch_green.png` only as a green-screen frame — so instead crop the 1320×2868 PNG to the art-only region the spec describes (skyline + wrist + watch, headline band excluded) at its true aspect, and set matching `width`/`height` on the `<img>`. The rendered result must show the sunset skyline, the wrist, and the watch face with the Tempus clock list.
3. OG image (#3): recrop `static/images/og/tempus-landing.png` to 1200×630 centered on phone + globe from `00b_clock_list_hero.png`, no headline band; the phone must be recognizable in a Slack/iMessage preview.
4. Tablet (#4): stack hero and feature rows at ≤900px (or add a dedicated tablet breakpoint) so 834px renders the spec's stacked tablet layout; check 1024px still gets the desktop layout.
5. #6 and #7: 28px inner radius on mobile, 2px focus offset.

Quality gates: `hugo --gc --minify` succeeds; re-run your curl checks from B2; take your own screenshots at 1440 and 834 and 390 with Playwright if available to you, otherwise describe what you verified.

## Report
`docs/B3-report.md` with per-finding fix, commit, and contrast numbers. End with exactly `DONE: docs/B3-report.md` or `BLOCKED: <reason>`.
