# Maintaining this site

Personal notes. Jekyll + [al-folio](https://github.com/alshedivat/al-folio). Run `make help` for all commands.

## Daily workflow

```sh
make install   # once
make serve     # edit, browser reloads at http://localhost:4000
make build     # sanity check before pushing
git push       # push to main -> GitHub Actions builds and deploys
```

## Where to edit what

| I want to...               | Edit                                                                               |
| -------------------------- | ---------------------------------------------------------------------------------- |
| Change the home/about text | `_pages/about.md`                                                                  |
| Change teaching            | `_pages/teaching.md`                                                               |
| Add or edit a project      | `_projects/<name>.md` (`importance` sets the order, `img` the card image)          |
| Add a publication          | `_bibliography/papers.bib` (a project shows its papers via `related_publications`) |
| Change email/social links  | `_data/socials.yml`                                                                |
| Change CV                  | `_data/cv.yml`                                                                     |
| Site title, nav, plugins   | `_config.yml`                                                                      |
| Navbar order               | `nav_order` in each `_pages/*.md` front matter                                     |
| Images / PDFs              | `assets/img/`, `assets/pdf/`                                                       |

## Gotchas

- New root-level files without front matter get published as-is. Add dev-only files to `exclude:` in `_config.yml` (already done for this file, the Makefile and CLAUDE.md).
- `_config.yml` is only read at startup: restart `make serve` after changing it.
- Citation counts come from Google Scholar/InspireHEP at build time, so builds need network access.
- Projects still containing "Description to come." are stubs.
- `make format` rewrites files; run `make format-check` first if unsure.
