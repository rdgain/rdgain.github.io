# Site data conventions

These YAML files are the content sources for the Liquid includes. Keep records in the collection that matches their purpose; related entries should reference stable IDs rather than copy the same record.

## Shared conventions

- Use quoted strings for IDs and year ranges. IDs are stable, unique slugs used by links between collections.
- Leave genuinely unavailable optional values blank or omit the key. Empty images, links, locations and optional metadata are supported by current templates; do not invent placeholder URLs.
- Keep prose in folded YAML scalars (`description: >`) when it should render as a normal paragraph.

## Files

- `links.yml` is the canonical map of profile URLs, the CV path and publications archive URL. The footer renders the profile links; the archive link is rendered only where requested.
- `papers.yml` is a list of publication records. `id`, `type`, `title`, `author` and `year` are required. The `id` must be unique and also determines expected local filenames when `pdf`, `talkpdf` or `talkppt` is true. Abstracts, notes, DOI and external links are optional.
- `portfolio.yml` is a list of concrete project/case-study records. `id`, `title`, `category` and `summary` identify each entry. Images, detailed problem/solution text, impacts, technologies and nested GitHub/papers/website links may be absent or blank.
- `projects_page.yml` is the single source for the Projects overview and its featured case studies. It has a `featured` list and a `more` list. Each project stores shared title/category/image/alt text, summary, technologies, links and `skill_ids` once. Skill IDs reference `_data/skills.yml`; their order determines the three high-signal skill labels shown on overview cards. The complete `technologies` list remains available on case-study pages and in expandable details on More Projects cards. A featured project's nested `case_study` adds its detailed summary, why it matters, problem, approach, role and outcomes. Link `type` values drive evidence filters. This stays separate from `portfolio.yml` because the homepage and `/portfolio/` use that data and retain their existing selection. Nested source pages in `projects/` define each case-study route and include the matching featured project by ID. Any contribution details marked for confirmation must be resolved before publishing.
- `research.yml` contains a `topics` list of research themes. Each topic requires `id`, `title` and `summary`; details such as motivation, focus, contributions, technologies and imagery vary by topic. Its optional `portfolio` values reference `portfolio.yml` IDs; optional `publications` values reference `papers.yml` IDs.
- `timeline.yml` is a chronological list of education, employment and other career milestones. Each entry requires `id`, `year`, `title`, `organisation` and `description`. `portfolio` values reference project IDs; `teaching` values reference module IDs or the supervision ID in `teaching.yml`. Images and technology lists are optional. These reference lists are currently stored as relationships and are not rendered by the timeline include.
- `teaching.yml` has three separate content groups: `modules` (current module leadership), `supervision` (a summary record with an optional list of example projects), and `experience` (past teaching roles). Module records require `id`, `title`, `institution`, `years`, `role` and `description`. Experience records require `year`, `title`, `institution`, `role` and `description`; they do not currently need individual IDs. The supervision summary has the stable ID used by timeline references.
- `community.yml` groups records by `leadership`, `tutorials`, `invited_talks`, `reviewing`, `professional_service` and `events`. Fields differ by activity type; absent dates, locations, links and images are valid when that information does not apply.
- `skills.yml` is the controlled project-discovery vocabulary. Each group has a `category`; its skill records have stable `id` and display `label` values. Project records reference these IDs in `skill_ids`. The Projects page only offers skills assigned to at least one project.

## Relationships and validation

Research topics, timeline milestones and teaching roles have different meanings and lifecycles, so they remain separate rather than being merged. The content validator checks the stable required fields and IDs in the main collections, plus the cross-references between research, portfolio, timeline, teaching and publications. The local-reference checker verifies referenced local assets and routes.
