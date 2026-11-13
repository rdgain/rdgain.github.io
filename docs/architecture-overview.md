# Architecture overview and project review

## Scope

This document describes the source project as inspected on 13 November 2026. It does not include generated `_site/` output. The repository contains a GitHub Pages compatible Jekyll site for a personal academic and professional portfolio. The implementation is a static site: Jekyll renders Markdown, Liquid templates and YAML data into HTML, CSS and copied assets.

## Architecture

### Rendering and page composition

- `_config.yml` sets the site title, description, canonical URL, empty `baseurl`, pretty permalinks, Kramdown, Rouge, and `jekyll-sitemap`.
- Root Markdown pages are the route entry points. Most use the `default` layout directly; `portfolio.md` uses the `page` layout. The `post` layout exists but there is no `_posts/` collection in the source tree.
- `_layouts/default.html` composes the shared head, header, content area, and footer. `_layouts/page.html` and `_layouts/post.html` add narrower or article-specific wrappers.
- `_includes/` contains domain-specific page sections (`about`, `community`, `projects`, `publications`, `research`, `teaching`) and reusable components (cards, hero, timeline, buttons, social links, etc.). Page composition is partly data-driven and partly written directly in page Markdown/HTML.
- `_data/` contains `portfolio.yml`, `research.yml`, `papers.yml`, `teaching.yml`, `timeline.yml`, `community.yml`, `skills.yml`, and `links.yml`. `docs/data-model.md` documents their fields, optional values and relationships. The publications page sorts `papers.yml` by year, renders cards and provides browser-side filters.

### Route inventory

Pretty permalinks map Markdown pages to clean routes. `/projects/` and `/portfolio/` are separate pages with different content and remain distinct.

| Route | Source | Status / purpose |
| --- | --- | --- |
| `/` | `index.md` | Active home page |
| `/about/` | `about.md` | Active profile page |
| `/projects/` | `projects.md` | Active project landing page |
| `/portfolio/` | `portfolio.md` | Active data-driven project details |
| `/research/` | `research.md` | Active research overview |
| `/teaching/` | `teaching.md` | Active teaching page |
| `/publications/` | `publications.md` | Active publication catalog |
| `/community/` | `community.md` | Active community page |
| `/research-guide/` | `research-guide.md` | Support/reference route |
| `/tag-tm/` | `tag-tm.md` | Legacy project detail; retained and accessible |
| `/exp.html` | `exp.html` | Standalone experiment placeholder; retained and outside primary navigation |
| `/404.html` | `404.html` | Not-found page using the default layout |

The primary navigation is configured in `_config.yml`; its links use `relative_url` and mark the current route with `aria-current="page"`. The experiment and Terraforming Mars routes remain available at their existing URLs and are not in the primary navigation.

### Styling, scripts, and assets

- `assets/css/style.scss` is the Sass entry point. It imports variables, base/layout/theme styles and page/component partials from `_sass/`. The import graph is compiled by Jekyll's Sass support; there is no separate front-end build system.
- `assets/js/publications.js` is the active publication search/filter behavior and uses browser-native JavaScript. `assets/js/script.js` is an older jQuery-dependent utility for code line numbers and tab switching; no source template currently loads it, and the shared head does not load jQuery.
- `assets/` includes local images, PDFs, presentations, transcripts, a video and other downloadable material. Fonts are requested from Google Fonts and Font Awesome CSS is loaded from cdnjs at runtime.
- Root-level pages also include some raw HTML alongside Markdown. `research-guide.md` is a particularly large legacy-style page with nested interactive tabs and many external resources.

## Dependencies and hosting assumptions

### Ruby/Jekyll

`Gemfile` declares `github-pages`, `csv`, and `bigdecimal`. The lockfile pins GitHub Pages gem 233 and Jekyll 3.10.0, along with the GitHub Pages plugin set, including `jekyll-sitemap`, `jekyll-seo-tag`, and other dependencies. The effective dependency set is much larger than the three direct Gemfile entries because `github-pages` supplies the supported Jekyll stack. `Gemfile.lock` records Bundler 2.6.9 and a Windows `x64-mingw-ucrt` platform. Keep the Gemfile and lockfile aligned and do not independently upgrade Jekyll or the GitHub Pages stack without a compatibility review.

There is no Node package manifest or npm/yarn/pnpm build. Browser JavaScript and externally hosted CSS/fonts are included directly.

### Hosting constraints

The source is configured for the user/organization site at `https://rdgain.github.io` with `baseurl: ""`. Primary navigation and active-page local links use Jekyll's `relative_url` filter. The retained research-guide support content still has root-relative asset references. GitHub Pages builds do not run arbitrary plugins; the configured sitemap plugin is part of the GitHub Pages supported environment.

## Confirmed findings and risks

### Local reference fixes and remaining checks

Milestone 1 has corrected the confirmed source-level broken references:

- Shared CV links now resolve through `_data/links.yml` to `assets/cv/RG_CV_AI.pdf`, selected to match the site's current AI engineering focus. The About, home and navigation links use this shared destination.
- Portfolio images now use the tracked PNG files. Research topics reuse existing matching project images where available; topics with no suitable image and timeline records with no corresponding assets leave the optional image field blank.
- The Terraforming Mars page no longer exposes an empty JAR download link; its paper link points to the local PDF.
- The footer social-links include now uses configured email/profile links, correcting its misspelled email and inconsistent LinkedIn value.
- Primary contact details use `site.author` across the site. Page contact blocks reuse the shared include, with the publications archive available as an optional link.
- `_tools/check-local-references.rb` checks source markup, YAML asset references, generated HTML references when given a built site directory, empty `href` values, and the expected publication PDF/slide files.

Run the source check with `bundle _2.6.9_ exec ruby _tools/check-local-references.rb` and the content/YAML check with `bundle _2.6.9_ exec ruby _tools/validate-content.rb`. A generated-site check remains pending because this Windows Ruby/Jekyll Sass converter run omits the project `_sass` directory after expanding it to an absolute drive path. The Sass partial names are valid for the configured `_sass` directory; relative imports do not fix the converter's missing load path. External links are not checked for availability by the local-reference tool.

### URL and metadata consistency

- The primary navigation is centralized in `_config.yml`; retained research-guide content is the remaining area with root-relative local asset links.
- Contact icons use one shared footer row. `_config.yml` owns the author name and Gmail address used by SEO and all email links; `_data/links.yml` owns profile URLs, the CV path and the optional publications archive link.
- Research, publications, and support pages all use the same configured Gmail contact without repeating profile URLs in page markup.
- The `portfolio` route is present in source and distinct from the `projects` route; documentation/navigation should not assume they are aliases.

### Accessibility and browser behavior

- Header navigation has an accessible label and current-page indication. Shared icon links have accessible names; the retained research-guide's inline contact links remain legacy markup and are outside the core-page accessibility milestone.
- Publication search and type controls have programmatic labels and identify the result list they affect. Generated subject filters are native buttons with `aria-pressed` state, and the visible result count is announced through a polite live region. The results list has a named heading; the portfolio page also has a page-level heading.
- Core-page links opened in new tabs use `rel="noopener noreferrer"`. Shared focus-visible styling provides a high-contrast outline for links and common controls. These source changes still need a manual browser and assistive-technology pass, including mobile layout and contrast review.
- The research guide tabs use clickable buttons, but the legacy `script.js` which defines their handlers is not loaded by the current layouts. As written, those tab controls may not function. The script also depends on jQuery, which is not loaded in the shared layout. Validate actual page output before deciding whether the file is dead code or a missing include.
- The 404 route now uses the shared layout and offers links to the home page and primary navigation sections.
- Layouts and Sass contain responsive rules, but this source review did not constitute a browser or assistive-technology audit.

### Maintenance and quality controls

- `_tools/check-local-references.rb` checks source/YAML local references and can inspect generated HTML. `_tools/validate-content.rb` parses configuration, page front matter and data YAML, then checks required fields and unique IDs in the primary publication, portfolio, research and teaching collections. There is no CI workflow or external-link availability checker. The prescribed Jekyll build currently fails during Sass import, so generated-page checking remains unavailable until that is resolved.
- YAML records have nested and optional fields. The content validator checks a focused set of stable required fields and leaves optional images, links and metadata optional; data-key documentation and broader schema coverage remain possible improvements.
- The Sass organization has one partial per broad area. Duplicate declarations in the publication partial were consolidated; broader selector ownership can still be reviewed if additional duplication becomes difficult to maintain.
- `_plugins/debug.rb` registers a debug Liquid filter and monkey-patches Jekyll object inspection. It is not listed as an explicit plugin in `_config.yml`, but Jekyll loads local plugins from `_plugins/` in local builds; check GitHub Pages compatibility and whether it is still needed before keeping it in the deploy source.
- `exp.html` remains a standalone “Hello world” experiment without front matter or the shared layout. Its route is documented and it remains outside primary navigation.
- `assets/js/script.js` appears unused and contains legacy jQuery code. Confirm intended research-guide tab behavior, then either wire up a supported implementation or remove unused code.

## Strengths

- Static output and the GitHub Pages gem stack keep hosting and deployment simple.
- Shared layouts and many domain/component includes provide a usable base for reuse.
- Structured YAML makes publication, teaching, community and portfolio content easier to edit independently from templates.
- The site has no custom frontend dependency installation or runtime server requirement.
- The current configuration already uses `relative_url` for the stylesheet and brand link, providing an established pattern for path-safe internal links.

## Design improvement directions

Prioritize correctness and discoverability before larger refactors:

1. Keep local asset and route references valid with the repeatable check at `_tools/check-local-references.rb`.
2. Keep profile URLs and CV path in `_data/links.yml`, identity and Gmail address in `site.author`, and reuse the shared social-links include for repeated contact rows.
3. Keep internal links baseurl-safe with `relative_url` if the retained research-guide support content is revised later.
4. Complete the manual accessibility review of the active core pages, including keyboard operation, focus states, contrast and responsive layouts.
5. Extend the documented data conventions and local content checks only when new stable requirements emerge. Keep `papers.yml` as one dataset unless its size or editing conflicts justify splitting it; it currently has 583 lines and a single publication page consumer.
6. Remove or intentionally integrate experiment/legacy pages and the debug helper only after confirming their purpose and deployment behavior.
7. Reduce duplicated Sass rules and add focused visual checks after higher-priority correctness/accessibility work.

## Assessment

The architecture is a sensible fit for a modest personal portfolio: Jekyll, Liquid, YAML, Sass and static assets are sufficient, and no architectural rewrite is indicated. Core profile and contact links now have shared sources; local-reference and content checks pass on the source tree. Remaining risks include root-relative paths within retained support content, the local Sass build failure, external URL availability, and unfinished legacy interactions/accessibility. Address them with small, verified changes and lightweight checks before expanding the data model or introducing new tooling.
