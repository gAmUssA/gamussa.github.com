# Lock the rendering toolchain

Status: accepted

Date: 2026-10-05

## Context

Hugo renders both Markdown and AsciiDoc using PaperMod and external Ruby tools.
The previous CI job installed unversioned gems and used an older Hugo binary.
Global installs and a container would add more environment state than this build
needs; Ruby already supplies Bundler for locking project dependencies.

## Decision

Pin Hugo Extended with verified release checksums, Ruby and Bundler explicitly,
PaperMod by submodule commit, and Actions by immutable SHA. Commit a Gemfile and
lock file for Asciidoctor, Rouge, and the logger required by Ruby 4. Use
`bundle exec hugo` locally and in CI. Permit only the required Ruby bundle
variables through Hugo's subprocess environment filter.

## Consequences

The production renderer is reproducible and local gems stay project-local.
Updates must maintain pins, checksums, and the lock file together and verify
routes and layout. Dependabot covers supported ecosystems; the maintenance
schedule in `docs/toolchain.md` covers the remaining pins.
