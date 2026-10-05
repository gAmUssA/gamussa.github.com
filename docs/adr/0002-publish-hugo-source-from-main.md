# Publish Hugo source from main

Status: accepted

Date: 2026-10-05

## Context

The default `master` branch holds the old generated site, while `hugo-migration`
holds the Hugo source and already supplies the live Pages artifact. Keeping two
primary branches makes cloning and contribution instructions ambiguous. The old
default branch is an ancestor of the Hugo branch, so its history can be preserved.

## Decision

Rename the old default branch to `main`, then merge the reviewed Hugo source into
it through a pull request. Build pull requests against `main`; publish only on
pushes or manual runs whose ref is `main`. Grant publishing permissions only to
the guarded deployment job and restrict the `github-pages` environment to `main`.
Keep the production base URL `https://gamov.io/` explicit in the site config.

## Consequences

A default clone contains runnable source, and the branch used for contribution
and production is the same. Generated output stays in Actions artifacts. Existing
routes and the custom domain stay intact. The old generated site remains in the
`backup/master-pre-hugo` tag, and the migration branch remains historical context.
Later workflow changes must preserve the build-only behavior for PRs and other refs.
