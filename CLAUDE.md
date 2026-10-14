# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal academic website of Yliès Falcone, deployed to https://yfalcone.github.io. It is a Jekyll site built on the [al-folio](https://github.com/alshedivat/al-folio) theme. `README.md`, `INSTALL.md`, `CUSTOMIZE.md` and `FAQ.md` are the upstream al-folio docs, not specific to this site. Most commits are content edits (about, teaching, project pages).

## Commands

- Install: `bundle install` (also `npm install` for Prettier)
- Dev server: `bundle exec jekyll serve` (Docker alternative: `docker compose up`, see `INSTALL.md`)
- Build: `bundle exec jekyll build` (this is what `bin/cibuild` runs)
- Format: `npx prettier --write <file>`. Config is `.prettierrc` (printWidth 150, Liquid plugin). CI runs Prettier checks on PRs.
- Pre-commit hooks (`.pre-commit-config.yaml`): trailing whitespace, end-of-file newline, YAML check, large-file check.

There is no test suite. Verify changes by building or serving the site. `_site/` and `.jekyll-cache/` are build output.

## Architecture

Site-wide settings (title, social/scholar config, plugin options, collections) live in [_config.yml](_config.yml). Content is split across several places:

- [_pages/](_pages/): top-level pages (about, publications, teaching, projects, 404). Front matter `permalink` and `nav`/`nav_order` control routing and the navbar. The about page is the home page (`permalink: /`).
- [_projects/](_projects/): the `projects` collection (`output: true`, permalink `/projects/:title/`). Each file's front matter (`importance`, `category`, `img`, `related_publications`) controls ordering and grouping on the projects page. Some are still stubs ("Description to come.").
- [_news/](_news/): the `news` collection. The announcements block is disabled in the about page front matter.
- [_bibliography/papers.bib](_bibliography/papers.bib): the single source for the publications page, rendered by jekyll-scholar (APA style, author `Falcone, Yliès` highlighted). `related_publications: true` in a project's front matter pulls in the matching bib entries. Per-entry options (abstract, selected, venue badges) come from custom bib fields and [_data/venues.yml](_data/venues.yml) and [_data/coauthors.yml](_data/coauthors.yml).
- [_data/](_data/): YAML data. `socials.yml` drives the social icons, `cv.yml` the CV page, `repositories.yml` the GitHub cards.
- [_layouts/](_layouts/), [_includes/](_includes/), [_sass/](_sass/): theme templates and styles (Liquid, formatted with Prettier). Edit these only for structural or styling changes.
- [_plugins/](_plugins/): local Ruby plugins (citation fetching from Google Scholar and InspireHEP, cache busting, bibtex hiding, 3rd-party asset download). The Scholar and Inspire plugins make network calls at build time.
- [assets/](assets/): images (`assets/img`), PDFs (`assets/pdf`), JS and CSS.

## Deployment

`.github/workflows/deploy.yml` builds and deploys on pushes to `main` that touch content, data, assets, or `.yml`, `.md`, `.liquid`, `.js` and `.bib` files. Other workflows cover broken-link checks (lychee, see `.lycheeignore`), axe accessibility, Lighthouse, CodeQL and Prettier.
