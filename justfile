# gamov.io — Hugo command runner
# Run `just` to see all available recipes

# Ensure homebrew asciidoctor is found before the broken Ruby 2.6 shim
export PATH := "/opt/homebrew/bin:" + env("PATH")

# Default recipe: list all commands
default:
    @just --list

# Start dev server with live reload (drafts included)
dev:
    hugo server --buildDrafts --navigateToChanged

# Start dev server without drafts (production preview)
preview:
    hugo server --navigateToChanged

# Build the site for production
build:
    hugo --gc --minify

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
    count=0
    for f in diagrams/*.d2; do
        name=$(basename "$f" .d2)
        out="static/images/workshops/cc-workshop/${name}.svg"
        mkdir -p "$(dirname "$out")"
        d2 --theme 1 "$f" "$out"
        count=$((count + 1))
    done
    echo "Rendered $count diagrams"

# Check that dependencies are installed
check:
    #!/usr/bin/env bash
    ok=true
    for cmd in hugo asciidoctor d2; do
        if command -v $cmd &>/dev/null; then
            printf "✓ %-15s %s\n" "$cmd" "$(command -v $cmd)"
        else
            printf "✗ %-15s NOT FOUND\n" "$cmd"
            ok=false
        fi
    done
    $ok && echo "" && echo "All good!" || (echo "" && echo "Install missing deps first." && exit 1)

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
        python3 scripts/og-image.py "$title" "$out"
        count=$((count + 1))
    done
    echo "Generated $count OG images"

# Serve and open in browser
open:
    #!/usr/bin/env bash
    hugo server --buildDrafts --navigateToChanged &
    sleep 1
    open http://localhost:1313
    wait
