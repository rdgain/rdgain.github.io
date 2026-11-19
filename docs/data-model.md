# Site data conventions

These YAML files are the content sources for the Liquid includes. Keep records in the collection that matches their purpose; related entries should reference stable IDs rather than copy the same record.

## Shared conventions

- Use quoted strings for IDs and year ranges. IDs are stable, unique slugs used by links between collections.
- Leave genuinely unavailable optional values blank or omit the key. Empty images, links, locations and optional metadata are supported by current templates; do not invent placeholder URLs.
- Keep prose in folded YAML scalars (`description: >`) when it should render as a normal paragraph.

## Files

- `links.yml` is the canonical map of profile URLs, the CV path and publications archive URL. The footer renders the profile links; the archive link is rendered only where requested.
- `papers.yml` is a list of publication records. `id`, `type`, `title`, `author` and `year` are required. The `id` must be unique and also determines expected local filenames when `pdf`, `talkpdf` or `talkppt` is true. Abstracts, notes, awards, DOI and external links are optional. An award is displayed as a publication badge.
- `portfolio.yml` contains legacy project records retained for compatibility; it no longer renders a standalone page or supplies timeline project links.
- `projects_page.yml` is the single source for the Portfolio overview at `/portfolio/` and its case studies. It has a `featured` list and a `more` list. Each project stores shared title/category/image/alt text, summary, technologies, links, `skill_ids` and `publication_ids` once. Skill IDs reference `_data/skills.yml`; their order determines the three high-signal skill labels shown on overview cards. Publication IDs reference `_data/papers.yml` and drive project-filtered publication links; they indicate relevant project context, not exclusive ownership or authorship. The complete `technologies` list remains available on case-study pages and in expandable details on More Projects cards. A project's nested `case_study` adds its detailed summary, why it matters, problem, approach, role and outcomes. Link `type` values drive evidence filters. Nested source pages in `projects/` define case-study routes under `/projects/` and include the matching project by ID. Any contribution details marked for confirmation must be resolved before publishing.
- `timeline.yml` is a chronological list of education, employment and other career milestones. Each entry requires `id`, `year`, `title`, `organisation` and `description`. `portfolio` values reference IDs in either `projects_page.yml` list and render as links to the matching Portfolio cards; `teaching` values reference module IDs or the supervision ID in `teaching.yml`. Images and technology lists are optional.
- `teaching.yml` has a `teaching_since` year plus separate content groups: `modules` (current module leadership), `supervision` (undergraduate and MSc supervision, with an optional list of example projects), `phd_supervision` (PhD students, project topics, profile links and PhD-period papers, rendered as cards at the top of Research), and `experience` (past teaching roles). Module records require `id`, `title`, `institution`, `years`, `role` and `description`. Experience records require `year`, `title`, `institution`, `role` and `description`; they do not currently need individual IDs. The supervision summary has the stable ID used by timeline references and is the source for the undergraduate/MSc supervised-project count.
- `community.yml` groups records by `awards`, `leadership`, `tutorials`, `invited_talks`, `reviewing`, `professional_service` and `events`. Fields differ by activity type; absent dates, locations, links and images are valid when that information does not apply.
- `skills.yml` is the controlled project-discovery vocabulary. Each group has a `category`; its skill records have stable `id` and display `label` values. Project records reference these IDs in `skill_ids`. The Portfolio page only offers skills assigned to at least one project.

## Project-filtered publication discovery

The project/publication relationship is a manually curated many-to-many mapping. It is not inferred from publication tags, project titles, or paper topics.

### Source of the relationship

- Each project in `_data/projects_page.yml` has a stable `id` and a `publication_ids` list.
- Each publication in `_data/papers.yml` has a stable `id`.
- A project is associated with a paper when that paper's ID appears in the project's `publication_ids`. The same paper ID may appear under several projects when it is relevant to each project's work. An empty list means no publications are currently associated with that project.
- `_tools/validate-content.rb` checks that project publication IDs refer to existing paper IDs and that a project's list has no duplicate IDs. It cannot determine whether a human-curated association is substantively correct or complete; review those associations in `projects_page.yml`.

### How the mapping reaches the page

1. `_includes/publications/filters.html` concatenates the `featured` and `more` project lists from `projects_page.yml` to create the Project selector. Each option's value is the project ID; its visible text is the project title.
2. `_includes/publications/publication-card.html` uses the same two lists while rendering each paper. For every project whose `publication_ids` contains that paper's ID, it adds the project ID to the card's `data-projects` attribute, separated by `|`. This gives the browser a compact representation of the curated relationships without another data source.
3. `_includes/projects/publication-filter-link.html` builds a link to `/research/?project=<project-id>`. Project cards and case studies use this include, so their links and the selector use the same project ID.
4. `assets/js/publications.js` initializes the selector from the optional `project` query parameter, but only if the value matches an option. It then applies all active filters to each card: text search, publication type, subject tag, and project must all match. Changing the Project selector filters the cards immediately; selecting a project does not submit a form or reload the page. A direct project link follows the same filtering path on page initialization.
5. The script hides non-matching cards, updates the live result count, and shows a contextual message when no paper is associated with the selected project. With JavaScript disabled, all rendered publications remain visible.

### Diagnosing a broken project filter

Build the site and inspect the generated output, not just the YAML source:

- `_site/research/index.html` should contain a Project selector with an option whose value matches the chosen project ID, and publication cards with non-empty `data-projects` values where associations exist.
- A generated project page should contain a `View related publications` link whose `project` query value exactly matches the corresponding selector option.
- In a browser, opening `/research/?project=<id>` should select that project and hide cards whose `data-projects` does not contain its ID. Changing the selector should update the visible cards and result count without a reload.

`/publications/` is retained as a legacy handoff to `/research/`. It preserves the query string and fragment when JavaScript is available, so older project-filter links continue to reach the Research archive.

If the built HTML has these values and local browser testing works, but the deployed site does not contain the selector, card attributes, or project links, the deployed site is serving an older build; changing the filter JavaScript alone cannot make missing markup or relationship data appear. Publish the source changes through the normal approved GitHub Pages deployment, then check the deployed HTML and reload the page to verify the updated assets.

## Relationships and validation

Timeline milestones and teaching roles have different meanings and lifecycles, so they remain separate rather than being merged. The content validator checks the stable required fields and IDs in the main collections, plus the cross-references between projects, skills, timeline, teaching and publications. The local-reference checker verifies referenced local assets and routes.
