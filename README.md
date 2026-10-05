# gamov.io — Hugo

Personal blog powered by [Hugo](https://gohugo.io/) with the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Local Development

```bash
git clone --branch hugo-migration --recurse-submodules https://github.com/gAmUssA/gamussa.github.com.git
cd gamussa.github.com

# With Hugo Extended from .hugo-version and Ruby 4.0.x available:
bundle config set --local path vendor/bundle
bundle install

# Start dev server with drafts
bundle exec hugo server --buildDrafts

# Build for production
bundle exec hugo --gc --minify --baseURL https://gamov.io/
```

The site will be available at http://localhost:1313/

CI uses the exact Ruby version in `.ruby-version` and Bundler version in
`Gemfile.lock`. See [build toolchain maintenance](docs/toolchain.md) for versions,
checksums, and updates.

## Structure

```
gamussa.github.com/
├── content/
│   ├── posts/       # Blog posts (.adoc, .md)
│   ├── workshops/   # Workshop materials (.adoc)
│   └── search.md    # Search page
├── static/
│   ├── images/      # All images
│   ├── fonts/       # Fira Code web fonts
│   ├── CNAME        # Custom domain
│   └── robots.txt
├── assets/css/extended/
│   └── custom.css   # Theme customizations
├── hugo.toml        # Site configuration
└── themes/PaperMod/ # Theme (git submodule)
```

## Writing a New Post

```bash
hugo new posts/my-new-post.adoc
```

Or manually create a file in `content/posts/` with frontmatter:

```asciidoc
---
title: "My New Post"
date: 2026-04-01
tags: ["kafka", "streaming"]
---
:icons: font
:toc:

Your AsciiDoc content here...
```

## Deployment

Automated via GitHub Actions on push to `hugo-migration` branch (change to `master` when ready).
