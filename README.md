# gamov.io — Hugo

Personal blog powered by [Hugo](https://gohugo.io/) with the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Local Development

```bash
git clone --branch main --recurse-submodules https://github.com/gAmUssA/gamussa.github.com.git
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

`main` is the default branch and contains the Hugo source. Open new pull requests
against `main`; each PR runs the complete production build without deploying.
Merging to `main` builds and deploys the resulting artifact to
[gamov.io](https://gamov.io/) using GitHub Actions and the `github-pages`
environment. That environment permits deployments only from `main`.

A manual workflow run deploys only when its selected ref is `main`; runs from
other refs can build but cannot upload a Pages artifact or deploy. PR jobs have
read-only permissions, and only the guarded deployment job can publish.

`hugo-migration` remains as historical migration context. The
`backup/master-pre-hugo` tag preserves the old generated site. See
[ADR 0002](docs/adr/0002-publish-hugo-source-from-main.md).
