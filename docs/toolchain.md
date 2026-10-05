# Build toolchain maintenance

Production and local builds use `bundle exec hugo --gc --minify --baseURL https://gamov.io/`.
The Ruby tools belong to this project; no global gem install is required.

| Dependency | Pin | Renewal |
| --- | --- | --- |
| Hugo Extended | `.hugo-version` and matching SHA-256 entries in `.hugo-checksums` | Check [official releases](https://github.com/gohugoio/hugo/releases) monthly and review security releases promptly. Update version and checksums together. |
| Ruby | `.ruby-version` | Check [Ruby releases](https://www.ruby-lang.org/en/downloads/releases/) monthly; keep local Ruby within the same 4.0 series. |
| Bundler | `Gemfile.lock` and `ruby/setup-ruby` input | Check [Bundler releases](https://rubygems.org/gems/bundler) monthly and update both pins together. |
| Asciidoctor, Rouge, and Logger | `Gemfile` and committed `Gemfile.lock` | Dependabot checks Bundler weekly. Exact versions must change with the lock file. Logger is explicit because Asciidoctor requires it under Ruby 4. |
| PaperMod | Git submodule commit | Dependabot checks submodules weekly. Use the upstream development branch, which contains compatibility fixes newer than the v8.0 release. |
| GitHub Actions | Full commit SHA with version comment | Dependabot checks Actions weekly. Review major-version runner requirements before merging. |
| Medium Zoom | Version in `layouts/partials/extend_footer.html` | Check [official releases](https://github.com/francoischalifour/medium-zoom/releases) monthly; 1.1.0 is current. |

The theme's bundled assets follow its submodule pin. Giscus, Google Fonts, and
PostHog are hosted services and do not have a site-managed package lock.

After any update, build the entire site, check existing routes against the previous
build, and inspect the home page, search, a post, product pages, and the workshop
on desktop and mobile. Keep dependency upgrades in a focused PR.
