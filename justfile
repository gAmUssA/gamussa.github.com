# gamov.io — Hugo command runner
# Run `just` to see all available recipes

# Keep local rendering caches within the project unless explicitly overridden.
export HUGO_CACHEDIR := env("HUGO_CACHEDIR", justfile_directory() + "/.build/hugo-cache")

# Default recipe: list all commands
default:
    @just --list

# Start dev server with live reload (drafts included)
dev: check
    bundle exec hugo server --buildDrafts --navigateToChanged

# Start dev server without drafts (production preview)
preview: check
    bundle exec hugo server --navigateToChanged

# Build the site for production
build: check
    bundle exec hugo --gc --minify

# Clean generated files
clean:
    rm -rf public resources/_gen .hugo_build.lock

# Create a new blog post (usage: just new "my post title")
new title:
    #!/usr/bin/env bash
    set -euo pipefail
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
    date=$(date +%Y-%m-%d)
    file="content/posts/${date}-${slug}.adoc"
    printf '%s\n' \
      '---' \
      'title: "{{title}}"' \
      "date: ${date}" \
      'author: "Viktor Gamov"' \
      'tags: []' \
      "slug: \"${slug}\"" \
      '---' \
      '' \
      'Write your post here...' \
      > "$file"
    echo "Created: $file"

# Create a new markdown post (usage: just new-md "my post title")
new-md title:
    #!/usr/bin/env bash
    set -euo pipefail
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
    date=$(date +%Y-%m-%d)
    file="content/posts/${date}-${slug}.md"
    printf '%s\n' \
      '---' \
      'title: "{{title}}"' \
      "date: ${date}" \
      'author: "Viktor Gamov"' \
      'tags: []' \
      "slug: \"${slug}\"" \
      '---' \
      '' \
      'Write your post here...' \
      > "$file"
    echo "Created: $file"

# List all posts (most recent first)
posts:
    #!/usr/bin/env bash
    ls -1 content/posts/*.adoc content/posts/*.md 2>/dev/null | grep -v _index | sort -r | head -20

# List draft posts
drafts:
    @grep -rl 'draft: true' content/posts/ 2>/dev/null || echo "No drafts found"

# Render all d2 diagrams to SVG
diagrams:
    #!/usr/bin/env bash
    set -euo pipefail
    test "$(d2 --version)" = "v$(cat .d2-version)" || {
        echo "Use D2 $(cat .d2-version) before regenerating diagrams." >&2
        exit 1
    }
    count=0
    for f in diagrams/*.d2; do
        name=$(basename "$f" .d2)
        if [[ "$name" == "when-claude-is-offline" ]]; then
            out="static/images/${name}.svg"
        else
            out="static/images/workshops/cc-workshop/${name}.svg"
        fi
        mkdir -p "$(dirname "$out")"
        d2 --theme 1 "$f" "$out"
        count=$((count + 1))
    done
    echo "Rendered $count diagrams"

# Check that dependencies are installed
check:
    #!/usr/bin/env bash
    set -euo pipefail
    ok=true
    for cmd in hugo bundle; do
        if command -v "$cmd" &>/dev/null; then
            printf "✓ %-15s %s\n" "$cmd" "$(command -v $cmd)"
        else
            printf "✗ %-15s NOT FOUND\n" "$cmd"
            ok=false
        fi
    done
    "$ok" || exit 1
    hugo_version=$(hugo version | sed -n 's/^hugo v\([0-9.]*\).*/\1/p')
    if [[ "$hugo_version" != "$(cat .hugo-version)" ]]; then
        echo "Use Hugo Extended $(cat .hugo-version); found $hugo_version." >&2
        exit 1
    fi
    bundle check
    bundle exec asciidoctor --version

# Build and show stats
stats: build
    #!/usr/bin/env bash
    echo ""
    echo "--- Site stats ---"
    printf "Pages:  %s\n" "$(find public -name '*.html' | wc -l | tr -d ' ')"
    printf "Size:   %s\n" "$(du -sh public | awk '{print $1}')"

# Generate OG images for all posts
og-all:
    #!/usr/bin/env bash
    set -euo pipefail
    count=0
    for f in content/posts/2026-*.adoc; do
        slug=$(grep -m1 '^slug:' "$f" | sed 's/slug: *"*\([^"]*\)"*/\1/')
        title=$(grep -m1 '^title:' "$f" | sed 's/title: *"*\([^"]*\)"*/\1/')
        out="static/images/og/${slug}.png"
        mkdir -p "$(dirname "$out")"
        uv run --script --locked --no-python-downloads scripts/og-image.py "$title" "$out"
        count=$((count + 1))
    done
    echo "Generated $count OG images"

# Serve and open in browser
open: check
    #!/usr/bin/env bash
    bundle exec hugo server --buildDrafts --navigateToChanged &
    sleep 1
    open http://localhost:1313
    wait
