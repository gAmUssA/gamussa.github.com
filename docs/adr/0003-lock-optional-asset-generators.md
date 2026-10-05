# Lock optional asset generators

Status: accepted

Date: 2026-10-05

## Context

The optional D2 and OG image recipes generate committed assets. The image script
installed an unversioned Pillow into the ambient interpreter when it was missing,
and the diagram recipe did not declare the generator version. These paths should
follow the same project-local dependency discipline as the core renderer.

## Decision

Pin D2 in `.d2-version` and check it before regeneration. Declare Pillow through
PEP 723 and commit the script's adjacent uv lock file. Run image generation with
`uv run --script --locked --no-python-downloads` and an existing Python 3.10+.

## Consequences

Optional generation no longer changes the developer's global Python environment.
Maintenance requires explicit pin and lock updates and visual verification of
generated assets. Normal production builds continue to consume committed assets
without installing these optional tools.
