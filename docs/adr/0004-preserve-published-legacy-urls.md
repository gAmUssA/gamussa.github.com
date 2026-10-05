# Preserve published legacy URLs

Status: accepted

Date: 2026-10-05

## Context

The old generated site publishes dated posts, workshop/archive URLs, an Atom
subscription endpoint, utility pages, and a self-contained slide deck. Slug
aliases preserve pages, but Hugo's default meta refresh loses section fragments.
Removing archive URLs or freezing the old feed would break existing links/readers.

## Decision

Keep legacy post and workshop aliases, archive aliases, and an updating Atom feed
at `/feed.atom`. Alias pages use a fixed generated target with the incoming query
and fragment appended in JavaScript; a meta refresh and link remain available
without JavaScript. Old pagination points to the current blog archive.

Preserve the utility pages, slide deck, and missing supporting static assets from
`backup/master-pre-hugo`. Do not overwrite the Hugo site's existing assets. These
files are archival snapshots; their bundled libraries are not dependencies of
the active Hugo/PaperMod build and are not loaded by its pages.

## Consequences

Current and legacy pages share one production deployment, and feed subscribers
keep receiving current posts. Canonical links identify the current slug pages.
The historical Nashorn article remains a draft. Future active-toolchain upgrades
must retain these compatibility outputs and check section-fragment navigation.
