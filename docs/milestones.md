# Proposed design improvements and milestones

This roadmap follows the findings in [architecture-overview.md](architecture-overview.md). It preserves the current Jekyll/GitHub Pages architecture and prioritizes correctness and accessibility before broad refactoring. Status notes track completed implementation and validation; remaining proposals are not implied to be complete.

## Milestone 1: Repair and verify local references

### Goal

Make sure local links and media resolve to assets that exist in the repository and to the intended routes.

### Proposed work

- Reconcile the three CV references (`/assets/files/Raluca_Gaina_CV.pdf`, `/assets/files/CV.pdf`) with the tracked files under `assets/cv/`; RG_CV_AI should be the main entry point, the other files should be accessible by URL if needed, but not linked directly on the website.
- Compare project, research and timeline image paths in YAML/includes with the actual asset tree and correct missing or outdated references. If an asset is misisng, a suitable placeholder should be created and used. The placeholders should be documented into a follow-up milestone to be replaced at a later point.
- Remove the unavailable download action in `tag-tm.md`.
- Check root-relative internal links, including links emitted by Liquid, against generated routes. Use `relative_url` for site-local URLs where appropriate.
- Add a lightweight local-reference check that reports missing files and routes without treating external URLs as local files.

### Acceptance criteria

- Every local CV/image/download reference used in generated pages resolves to an existing intended asset or placeholder.
- No active internal link has an empty target or points to a missing generated route.
- The reference check can be run using the existing Ruby/Jekyll toolchain and does not require a frontend dependency stack.

**Status:** Source-level references have been corrected: shared CV links use `assets/cv/RG_CV_AI.pdf`, portfolio and research imagery was reconciled with tracked assets, the unavailable Terraforming Mars download action was removed, and `_tools/check-local-references.rb` was added. The source reference check passes. Generated-route verification remains pending because the Jekyll build currently fails while resolving the existing Sass `variables` import.

## Milestone 2: Clarify shared profile and contact data

### Goal

Reduce avoidable duplication while retaining contact details that intentionally vary by page or audience.

### Proposed work

- Use `site.author` as the source for the display name and the Gmail address shown across the site.
- Keep profile URLs, the CV path and publications archive in `_data/links.yml`; remove duplicate profile URL fields from `site.author`.
- Reuse `_includes/components/social-links.html` in pages where the same links are intended, with an explicit option for the archive link.
- Give icon-only links accessible names and use the same canonical profile URLs in shared and page-specific sections.

### Acceptance criteria

- Shared profile links and CV destination are defined once and rendered from that source.
- Every website email link uses the configured Gmail address.
- Shared icon links have accessible names and are consistent across pages using the include.

**Status:** Shared author/contact data and accessible profile links are in place. Contact icons now appear once in the shared footer on pages using the shared include; duplicate page-level rows were removed from the core pages and the Terraforming Mars page. The configured Gmail is the website email destination. The research guide remains untouched.

## Milestone 3: Navigation, routing, and legacy page intent

### Goal

Make the primary routes easier to maintain and resolve known uncertainty about older pages.

### Proposed work

- Create a route inventory for active pages, support/reference pages, experiments and error handling. Include `/portfolio/` separately from `/projects/`.
- Keep `exp.html` and the Terraforming Mars material unchanged; not active, but should remain accessible; keep decisions explicit and avoid deleting pages before checking inbound links.
- Move the primary nav list into `_config.yml` and render it through Liquid, preserving accessible navigation labels and a current-page indicator.
- Apply `relative_url` consistently to internal navigation and asset links so a future non-empty `baseurl` does not break them.
- Improve the 404 page with the shared layout and a clear route back to active sections.

### Acceptance criteria

- The route inventory identifies the purpose/status of every top-level page and known experiment.
- Primary navigation points to existing routes and indicates the current page accessibly.
- Internal links render correctly with the current empty baseurl and a non-empty test baseurl.
- No page is removed without checking its inbound links and preserving an appropriate redirect or replacement where needed.

**Status:** Route inventory documented, primary navigation centralized with a current-page state, active-page local links use `relative_url`, and the 404 page uses the shared layout. Generated-site verification with a non-empty `baseurl` remains pending because the local Jekyll build fails at the existing Sass import.

## Milestone 4: Improve accessibility on core pages

### Goal

Ensure page controls work with keyboard, assistive technology, and without undeclared JavaScript dependencies.

### Proposed work

- Add labels for publication search and type controls, selected state to generated tag controls, and an announced result count.
- Add accessible names to icon-only social links and ensure new-tab links include safe `rel` values.
- Check heading order, image alternative text, keyboard focus visibility, contrast and mobile layouts across the principal pages.

**Status:** Core markup and styles are implemented: publication controls have labels and state, filter counts are announced, focus indicators are visible, publication-list/portfolio heading structure is named, and links opened in new tabs use safe `rel` values. Teaching and Projects summary labels were made compact; Teaching Experience now renders responsive cards with year fallbacks and description placeholders. The teaching experience YAML indentation was corrected so its nine records are available at the expected top-level key. The local-reference check and YAML parsing pass. The documented manual browser/accessibility pass remains pending; review home, about, research, projects, teaching, publications and community at desktop and narrow mobile widths, including keyboard operation and contrast.

### Acceptance criteria

- Publication controls have programmatic labels and state, and filtering results are announced.
- Icon-only actions have meaningful accessible names; externally opened new tabs use safe link attributes.
- A documented manual accessibility pass covers home, about, research, projects, teaching, publications and community pages.

## Milestone 5: Add content and build validation

### Goal

Catch syntax and content-reference failures before publishing while keeping maintenance proportional to a static personal site.

### Proposed work

- Continue using the pinned `Gemfile`/`Gemfile.lock` and the prescribed Bundler/Jekyll build; do not upgrade dependencies as part of validation work.
- Add checks for YAML parsing, required fields with real optionality, local asset references, and duplicate or missing publication identifiers where appropriate.
- Decide whether a generated-page link checker is useful after the local-reference checker; exclude or separately report external URLs because availability can be transient.
- Add a GitHub Actions build check only if it fits the repository's preferred publishing workflow and uses the same locked dependencies.
- Review any plugin compatibility concerns around `_plugins/debug.rb` before changing or removing it.

**Status:** Added `_tools/validate-content.rb` for YAML syntax, front matter, required fields, publication types, and unique IDs across the primary data collections. The existing local-reference checker covers local assets/routes and generated HTML when available. Both commands are documented in `README.md`; the validation and source-reference checks pass. No CI workflow was added because the repository has no existing workflow and the required local Jekyll build is currently blocked by the Sass `variables` import failure. Generated-page checking and review of `_plugins/debug.rb` remain pending.

### Acceptance criteria

- The prescribed Jekyll build completes successfully and its warnings are reviewed.
- Validation detects malformed YAML and missing referenced local assets without flagging intentional optional fields.
- If CI is adopted, pull requests run the same locked build and validation checks; publishing remains a separate, explicitly controlled action.

## Milestone 6: Simplify the content and Sass model when needed

### Goal

Make future edits safer without adding structure or dependencies the site does not need.

### Proposed work

- Document the keys, value formats and optional fields in each `_data` file, including how IDs connect research, portfolio, timeline and publication entries.
- Review overlap between `portfolio.yml`, `research.yml` and `timeline.yml`; consolidate only records that have the same meaning and lifecycle.
- Keep `papers.yml` as one dataset unless editorial scale, merge conflicts or validation needs provide a concrete reason to split it.
- Remove duplicated publication Sass declarations and clarify which partial owns shared component rules.
- Review external font/icon dependencies for availability, performance and privacy; retain current simplicity unless there is a clear user or maintenance benefit to self-hosting.

**Status:** `docs/data-model.md` documents collection fields, optional values and ID relationships. The timeline's teaching references were corrected to current module/supervision IDs, and the Teaching module include now reads the data's `title` field. Duplicate publication Sass selectors were consolidated while preserving their effective declarations. Google Fonts and Font Awesome remain external; no self-hosting change was justified for this small static site. The Sass imports already use the partial names under `_sass`; relative-path edits did not fix the Windows build and were reverted. The locked Jekyll Sass converter's safe-mode path handling omits `_sass` after expanding it to an absolute Windows drive path. A Linux/GitHub Actions build is still needed to verify the production build and determine whether any cross-platform change is necessary.

### Acceptance criteria

- Data documentation reflects actual rendering requirements and optionality.
- Data records do not duplicate the same fact unnecessarily, or documented references explain why a fact appears in more than one context.
- Sass has a clear ownership convention for shared and page-specific rules, with no visual changes introduced without review of affected pages.
- No new dependency is added without a defined maintenance benefit.

## Milestone 7: Expand the projects portfolio

### Goal

Strengthen the Projects page as a recruiter-facing portfolio while preserving the current Featured Projects presentation as the starting point. Develop the four selected projects into clear, evidence-based stories, then make the remaining work discoverable in a separate **More Projects** section.

### Featured projects

Feature these four projects, in this order:

1. **LLM program search for games** — highlight the work evaluating LLM-guided program search across game-related tasks.
2. **Tabletop R&D** — focus on AI-assisted game testing and the product/research connection.
3. **TAG** — present general AI research in tabletop games and the framework supporting it.
4. **RHEA** — present Rolling Horizon Evolutionary Algorithms and their development/evaluation for game-playing agents.

Keep all other portfolio groups, including GVGAI, in **More Projects**. Preserve existing project-page content and links as the source material while these new stories are prepared; do not imply that a proposed case study or image is already live.

### Proposed work

- Confirm the project groupings and publication evidence in [portfolio-planning.md](portfolio-planning.md).
- Write concise summaries and evidence-based skill tags for the four featured projects and every project in More Projects. Separate confirmed individual contributions from team outcomes and leave explicit placeholders where author confirmation is needed.
- Use the four supplied landscape thumbnails under `assets/images/projects/`, map them to the matching featured projects, and provide meaningful alt text. Keep them as conceptual illustrations, not factual screenshots or evidence of results.
- Preserve the current Featured Projects card visual treatment while replacing with the four selected stories. Add a separate **More Projects** section for other project groups.
- Decide and implement an accessible card action: prefer an explicit **View case study** link to a shareable `/projects/<slug>/` page. Keep publication, repository and external project links distinct. Evaluate inline expansion only if concise summaries can remain usable on keyboard and mobile.
- Draft a recruiter-focused case study for each of the four featured projects, covering why it is interesting, the problem, the author's contribution, technical approach, impact/evidence, and related publications. Use placeholders for unverified roles, dates, metrics, adoption and links; resolve them before publishing.
- Prepare summaries, skill tags and concise entries for the remaining project clusters in More Projects, linking to their evidence and adding case-study pages selectively where content is strong enough.
- Check routes for collisions, image dimensions/weight, meaningful alt text, keyboard access, responsive layout, local references and the locked Jekyll build before release.

### Acceptance criteria

- The Projects overview presents exactly the four selected Featured Projects in the specified order and provides a distinct More Projects section for the rest.
- Each listed project has a concise summary and specific, supportable skill tags; claims that need author confirmation remain clearly marked during drafting and are resolved before publication.
- Each featured project uses an approved representative thumbnail with a descriptive asset name and meaningful alt text.
- Each featured case study explains the problem, individual contribution, approach and impact using evidence, with no unresolved editorial placeholders in published content.
- Case-study navigation is keyboard-accessible, routes are unique, and the overview remains usable on narrow mobile screens.
- Current projects content and links are retained or intentionally migrated; no unrelated site pages, data models or dependencies are changed as part of this milestone.

**Status:** In progress. The Projects overview now uses the four supplied thumbnails and includes the selected featured projects, draft summaries and skill tags, plus a More Projects grid. Four case-study routes and a shared detail template are in place, based on the publication and project evidence. The homepage and `/portfolio/` dataset remain unchanged. The content validator passes and Jekyll recognizes all five `/projects/` routes, but the full build stops at the previously documented Sass `variables` import issue. 

## Milestone 8: Align the recruiter landing page

### Goal

Make the first page recruiters see consistent with the current Projects portfolio and provide a short route into the work most relevant to their role.

### Proposed work

- Replace the homepage's legacy featured-project selection with the four Projects-page selections, in the same order: LLM program search, Tabletop R&D, TAG and RHEA. Reuse the canonical project records rather than maintaining another set of summaries.
- Add three concise role-oriented entry points—AI/LLM, Data Science and Game Development—that take visitors to matching projects or apply matching project filters. Keep one shared portfolio and do not duplicate project content into separate pages.
- Preserve the main homepage value statement, CV and existing research links while making the project and role paths visible without scrolling through the full page.
- Check any metrics and claims shown in the home-page project cards against the current project records and supporting evidence.

### Acceptance criteria

- The homepage and `/projects/` agree on the four featured projects and their order.
- Each role-oriented entry point leads to relevant projects and can be used with a keyboard and on mobile.
- Project summaries shown on the homepage use the same canonical content as `/projects/` or are explicitly shorter variants maintained in that data.
- No duplicate project records are introduced in `_data/portfolio.yml` or another data file solely to support the homepage.

**Status:** In progress. The homepage provides four concise role-oriented mini-cards, each led by its matching Projects-page highlight and followed by smaller links to related projects. Project titles are drawn from the shared project data; no duplicate project records were introduced. Links scroll past the sticky header and visually identify the matching project card. See the recruiter-specific paths in [recruiter-review.md](recruiter-review.md).

## Milestone 9: Add skill-based project discovery

### Goal

Let recruiters find projects that demonstrate a particular skill, method or kind of work, without relying on a long, unstructured list of tags.

### Proposed work

- Define a controlled vocabulary and categories for languages/frameworks, AI and data methods, game/product domains, and delivery/leadership skills. Review `_data/skills.yml` and `_data/projects_page.yml` together and consolidate synonyms or inconsistent capitalization where they mean the same thing.
- Map each project to the skills it demonstrates. Keep a small set of high-signal tags on overview cards and make the complete relevant technology/method list available on case-study pages.
- Add project search and filters for skill, project type and evidence type (for example: case study, publication, source code, playable demo). Build them from the canonical project data rather than a separate hand-maintained index.
- Provide a clear reset control, selected-filter state, and result count. Ensure controls have accessible names, work by keyboard, and remain usable on narrow screens.
- Check that filtering does not hide a project from a role-oriented entry point unexpectedly; document how combined filters behave.

### Acceptance criteria

- A visitor can locate projects by a normalized skill and by project/evidence type.
- Skills shown as filters are backed by at least one project record, and each project tag is a skill or method actually evidenced by that project.
- Filter state and results are understandable to keyboard and screen-reader users; reset restores the full list.
- The existing featured and More Projects sections remain understandable when filters are unused or when no results match.
- The implementation reuses current YAML data and adds no dependency without a clear maintenance need.

**Status:** Proposed. Discovery recommendations are detailed in [recruiter-review.md](recruiter-review.md).

## Milestone 10: Strengthen project case studies and proof

### Goal

Make each project page fast to evaluate by showing role, scope, technical decisions and verifiable outcomes, with demonstrations or artifacts where available.

### Proposed work

- Add a consistent “At a glance” block to featured case studies with role/ownership, dates, team size, project status, core technologies and direct links. Keep individual contributions distinct from team outcomes.
- Expand the LLM program-search case study with a system/benchmark diagram, the author's implementation boundaries, evaluation criteria, baseline, key quantitative results, run variability and limitations. Add a short UI demonstration or screenshots if shareable.
- Expand Rebirth with a playable Unity 6 web build or gameplay video, controls/platform information, game loop, selected design decisions and a clear split between the original six-teammate coursework and the later solo modernization work.
- Expand Boardgame Data Analysis and Gameplay Trace Analysis with data sources, sample/experiment scale, methods, validation, metrics, result visuals, limitations and direct reproducibility/code links where shareable.
- Add concise technical evidence to the remaining featured stories: TAG's framework scope and current scale; RHEA's tested settings, baselines and measured outcomes; Tabletop R&D's verified client, product, funding and deployment evidence.
- Replace general archive links on More Projects entries with the specific publication, source repository, demo or case-study URL that supports the card. Use an explicit note where evidence cannot be made public.
- Pair conceptual thumbnails with real product screenshots, plots, diagrams or demonstrations when available, and label illustrations so they are not mistaken for product evidence.

### Acceptance criteria

- Each featured case study contains the at-a-glance role/team/time/stack fields, problem, approach, individual contribution and outcomes.
- Every impact statement is supported by a public artifact or confirmed by the author; team and individual contributions are clearly separated.
- LLM program search and Rebirth each have a direct demonstration or a clear, specific reason one cannot be shared.
- Data-oriented case studies report their data, method, evaluation and limitations rather than only naming the research topic.
- Each More Projects card links directly to relevant evidence, not only to the generic publications archive when a specific source is available.
- All local artifacts and routes resolve; pages remain usable on mobile and with keyboard navigation.

**Status:** Proposed. Recruiter-specific evidence requests and suggested review order are in [recruiter-review.md](recruiter-review.md).

## Milestone 11: Reconcile profile claims and contact paths

### Goal

Make experience, impact figures, CV routing and contact details consistent and easy to verify across the recruiter journey.

### Proposed work

- Reconcile publication totals on Home and Research with the Publications data, and make the same current count appear wherever a count is used. Define whether the count includes all record types.
- Reconcile teaching-duration statements on Home and Teaching; state the dates or scope used for each figure.
- Verify funding totals, currency, award attribution and whether amounts represent awarded, raised or delivered funding. Use one consistent phrasing and link to supporting evidence where possible.
- Review the current AI CV and the available game-development/general CV files. Link to role-specific versions only if they are current, accurate and intentionally public; otherwise maintain one canonical CV and align its summary and skills with the site.
- Add a direct contact action to the primary recruiter paths (home, Projects and case studies), using the configured Gmail address and existing profile/contact components.
- Check role titles, years, technology labels and capitalization across Home, About, Research, Projects, Teaching and Publications.

### Acceptance criteria

- Publication and teaching totals are consistent across pages and have a clear counting basis.
- Funding claims use verified amounts and consistent currency/attribution language.
- CV links resolve to the intended current documents; no obsolete CV or inactive contact address is presented.
- A recruiter can reach an explicit contact action from Home, Projects and any featured case study.
- The site passes a content and local-reference check after the wording and links are reconciled.

**Status:** Proposed. Identified inconsistencies and contact/CV recommendations are recorded in [recruiter-review.md](recruiter-review.md).

## Suggested order

1. Fix and verify local asset/route references.
2. Decide shared profile/contact values and reuse existing configuration/includes.
3. Define route and legacy page intent, then make internal URLs baseurl-safe.
4. Address accessible controls on core pages.
5. Add local content validation and consider CI build validation.
6. Document data conventions and make targeted Sass/content-model cleanup.
7. Expand the projects portfolio, following the featured-project and case-study plan in [portfolio-planning.md](portfolio-planning.md).
8. Align the homepage featured work and recruiter entry points (Milestone 8).
9. Establish a consistent skill vocabulary and add project discovery filters (Milestone 9).
10. Strengthen featured case studies, demonstrations and project evidence (Milestone 10).
11. Reconcile profile metrics, CV links and contact paths (Milestone 11).

For visual changes, manually review the pages affected by the change at desktop and narrow mobile widths. Do not modify generated files in `_site/`, upgrade the locked Jekyll stack, or publish changes as part of these milestones without explicit authorization.
