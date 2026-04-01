# gamov.io — Hugo

Personal blog powered by [Hugo](https://gohugo.io/) with the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Local Development

```bash
cd hugo-site

# Install asciidoctor (required for .adoc posts)
brew install asciidoctor

# Start dev server with drafts
hugo server --buildDrafts

# Build for production
hugo --gc --minify
```

The site will be available at http://localhost:1313/

## Structure

```
hugo-site/
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
