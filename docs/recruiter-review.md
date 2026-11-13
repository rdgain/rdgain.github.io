# Recruiter review: AI, data science and game development

## Scope

This is a content and discoverability review of the current site, written from three hypothetical hiring perspectives. It covers the home, About, Projects and case-study pages, Research, Publications, Skills data, Teaching and the CV links. It is a set of recommendations only; no site changes are made here. No specific job descriptions were supplied, so the feedback focuses on the evidence each type of hiring team commonly needs to assess.

## Executive assessment

The strongest differentiator is the combination of research depth and hands-on delivery: LLM-guided program search, agentic AI applications, game AI, simulation and tabletop products, alongside game development and technical leadership. Several projects now describe concrete individual ownership, including the LLM benchmark integration and UI, Tabletop R&D leadership, TAG framework work, RHEA research and the Rebirth modernization.

The main improvement is to make that evidence faster to find. A recruiter should be able to identify relevant skills, see what Raluca personally built, and verify the outcome without searching through a long list of projects or publications. The Projects page is moving in that direction, but the homepage still uses the older `_data/portfolio.yml` featured set, while the newer Projects page uses `_data/projects_page.yml`. Skill information is presented as static tags and is not searchable across projects.

The most valuable changes would be:

1. Align the homepage's featured work with the current four featured projects.
2. Add accessible skill and project filters, backed by a consistent skill vocabulary.
3. Give each case study a concise “at a glance” panel and direct evidence links.
4. Add a playable build or short demo for game and application projects wherever available.
5. Reconcile experience and publication figures across pages.

## What stands out in the current site

### Strong evidence already present

- **LLM program search:** the study spans 29 tasks and 11 models across Python and Java. The current project data also describes hands-on work connecting LLM interaction to the TAG codebase, extracting the TAG API, prompt engineering, and building a UI to run the benchmark, inspect results and generated code, and guide further search.
- **Tabletop R&D:** the site describes co-founding and directing the company, AI-assisted tabletop testing, more than £120k in research and development funding, and named clients.
- **TAG:** the current case study describes leadership of the framework and contributions to its core game structure, API, agent interaction, game running, interfaces and metrics. It also reports more than 60 game titles.
- **RHEA:** the case study describes leadership across algorithm and experimental design, implementation, evaluation, analysis, publications, student supervision and the PhD thesis.
- **Recent applied work:** More Projects includes the TypeScript/React RPG character creator and LLM chat application with full project ownership, and Rebirth, including the original team context, lead design and engineering role, later Unity 6 modernization and web build using Codex.

These are persuasive signals, but they are split across the Projects overview, case studies, About page, Research page and More Projects cards. Bringing the most role-relevant evidence into a predictable structure would make it easier to assess.

### Discoverability and consistency issues

- The home page selects up to three projects from `_data/portfolio.yml` (TAG, GVGAI and Tabletop R&D), while the Projects page's featured set is LLM program search, Tabletop R&D, TAG and RHEA. A recruiter landing on the home page can miss the LLM, RHEA, TypeScript and Rebirth evidence.
- The Projects page shows skill tags but has no search or filter. The tags are a mixture of languages, methods, roles, product skills and broad areas, and project entries vary considerably in tag count.
- `_data/skills.yml` provides a separate skills list, but the visible expertise sections are hard-coded and project tags are maintained in the Projects data. This makes it harder to maintain a consistent vocabulary or build a reliable skill filter.
- Several More Projects cards point to the general Publications page rather than the specific paper, repository, demo or case study that proves the card's claims. The Boardgame Data Analysis and Gameplay Trace Analysis cards, for example, have brief summaries and skill labels but no detailed case studies.
- The Publications page does support search, type selection and subject-tag filters. Those controls help locate papers, but they do not answer the recruiter question “Which project demonstrates this skill?”
- Experience figures differ by page: Home says 30+ publications while Research says 35+ and the publication list is data-driven; Home says 10+ years teaching while Teaching says 7+. Funding also appears in multiple places. Reconcile each figure to a single current source and state what it counts.
- The main CV link points to the AI CV. Recruiters for game development roles may benefit from a clear route to the game-development CV if that version remains current.

## 1. AI company recruiter: LLMs, agentic systems and AI engineering

### What is compelling

The LLM program-search project is a strong opening example because it combines evaluation research with real implementation. The current description names the benchmark scope, the Java/TAG integration, automatic API extraction, prompt engineering, and an interface for launching runs and examining outputs. The TypeScript RPG creator adds evidence of end-to-end product ownership, while Tabletop R&D, TAG and RHEA show broader software and AI system experience.

### What I would look for next

- A small architecture diagram showing the benchmark loop: task/environment, initial program, LLM-generated mutations, execution/evaluation, selection and iteration. Mark which components Raluca built.
- More implementation detail where publishable: model/provider interface, prompting and context strategy, code execution boundary, failure handling, experiment orchestration and how results are persisted or inspected.
- Quantitative results beyond task/model counts: success criteria, per-task or aggregate performance, comparison baselines, run variability, runtime and cost where available. Explain limitations and avoid implying that a benchmark result demonstrates production readiness.
- A live demo or short recording of the LLM benchmark UI and the TypeScript RPG creator/chat. Include what the agent can do, how a person directs or corrects it, and what the system does when generation fails.
- For agentic workflows, distinguish the agent's automated steps from the human's role and state any approval, validation or sandboxing controls that are part of the work.
- A concise technology summary that separates languages/frameworks from AI methods. The current lists mix skills such as Java and Python with concepts such as program search and benchmarking.

### Best recruiter path

LLM Program Search case study → TypeScript RPG Character Creator and AI Chat → TAG → RHEA. Keep the benchmark first, and make the TypeScript application easy to discover as a hands-on AI product example.

## 2. Data science recruiter

### What is compelling

The portfolio already contains research with substantial analytical components: Boardgame Data Analysis, Gameplay Trace Analysis, RHEA benchmarking, VERTIGO visual analytics, and simulation-driven tabletop testing. The academic record and experimental design experience can be a differentiator for roles that value careful evaluation rather than only model implementation.

### What I would look for next

- For each data-heavy project, identify the data source, unit of analysis, sample size or number of runs, data-cleaning steps and any important sampling or coverage limitations.
- State the question and target clearly, then describe feature engineering, model or statistical methods, validation strategy, baseline, evaluation metrics and the actual result. For Gameplay Trace Analysis, explain how temporal-logic descriptions and clustering were evaluated; for Boardgame Data Analysis, identify the rating data, mechanics representation and interpretation method.
- Add one readable result visual per relevant case study: a comparison plot, calibration or error chart, sensitivity analysis, feature-importance view or example trace. Caption it with the finding and its limitation.
- Link directly to code, notebooks, data documentation or reproducible experimental artifacts when those can be shared. If the underlying data cannot be published, explain the constraint and provide a reproducible sample or method description.
- Make data-science skills searchable and specific. Add tools such as Python, SQL, statistical analysis, visualization or machine-learning libraries only where they are supported by project evidence; the current Boardgame Data card has broad tags but no visible implementation or evaluation detail.
- Separate research impact from analytical result. A publication or collaboration is useful context, but a hiring team also wants to know what was measured, what changed, and how confidently the result can be interpreted.

### Best recruiter path

Boardgame Data Analysis → Gameplay Trace Analysis → RHEA/VERTIGO → Tabletop R&D. This shows a progression from applied analysis to behavioral data, algorithm evaluation, visualization and product-facing simulation.

## 3. Game development studio recruiter

### What is compelling

Rebirth is an unusually useful signal for a studio because the current description gives a clear personal role and project history: a six-person coursework team, lead game designer and engineer, then a solo update to Unity 6 with a completed web build. TAG and the strategy/game-agent projects show deep knowledge of game systems, rules, simulation and AI behavior. The TypeScript RPG tool also indicates interactive product work.

### What I would look for next

- Put a playable Rebirth web build near the top of its project entry, plus a short trailer or gameplay capture for visitors who cannot play immediately. The current card links only to source code despite mentioning a web build.
- Show the game loop, genre, controls, key design decisions, one or two representative screenshots, and what changed in the Unity 6 modernization. Include target platform and any known performance or compatibility constraints.
- Separate the original team contribution from the later solo work. A short “Team of seven / my role / my later work” panel would make ownership easy to assess without diminishing the collaboration.
- For the TypeScript RPG creator, add a demo or screenshots, the user flow for character creation and chat, and a short explanation of the React/TypeScript architecture and AI workflow.
- Add playable or video demonstrations for other projects only when they show something a studio can evaluate: game feel, agent behavior, level generation, tooling or editor workflow. A repository alone is often a high-effort first step for a recruiter.
- Keep AI work tied to game-development outcomes: what behavior changed, what design decision the tool supports, how a designer or player experiences it, and what remains under human control.

### Best recruiter path

Rebirth → TypeScript RPG Character Creator and AI Chat → TAG → selected RHEA/GVGAI agent demonstrations. This makes game design and engineering visible alongside the research specialization.

## Recommendations for the next portfolio iteration

### Priority 1: Make the first click relevant

- Align the homepage featured-work section with the four featured projects already selected for Projects: LLM program search, Tabletop R&D, TAG and RHEA.
- Add three short role-oriented entry points or filter presets (AI/LLM, Data Science, Game Development) that reveal matching projects without creating three copies of the same portfolio.
- Add an accessible project search and filters for skills, project type and evidence type. Reuse the project records rather than hard-coding another set of cards. Include a clear reset control and result count; keep keyboard and mobile behavior straightforward.

### Priority 2: Make each case study easy to evaluate

Use a consistent “at a glance” block with role/ownership, dates, team size, project status, key technologies and direct links. Then keep the existing story structure (why, problem, approach, contribution, outcomes) and add evidence relevant to the project: metrics, diagrams, demo, code, paper or client/product evidence. Make personal contribution and team results visibly distinct.

### Priority 3: Normalize skills and evidence

Create one controlled skill vocabulary for technologies, methods and broader capabilities, and map each project to only the skills it demonstrates. Keep cards concise with a few high-signal tags; put the complete stack and methods on the case-study page. Link every More Projects entry to its specific evidence rather than a general archive wherever possible.

### Priority 4: Improve confidence and consistency

- Reconcile publication, teaching and funding totals across Home, Research, Teaching and case studies. Add a short definition or evidence link beside prominent numbers.
- Link directly to selected CV variants if they are current and intended for different role families; otherwise keep one canonical CV and ensure its headline and skills match the target roles.
- Add a direct contact action near the top-level hiring paths, not only in the footer or About page.
- Keep conceptual thumbnails, but pair them with real evidence—screenshots, result plots, demos or repository links—so recruiters can distinguish illustration from the implemented product.

## Suggested order

1. Align the homepage and Projects page around the same four featured projects.
2. Add the case-study quick facts and direct demo/evidence links, starting with the LLM benchmark and Rebirth.
3. Add skill-based project filtering with a controlled skill vocabulary.
4. Expand Boardgame Data Analysis and Gameplay Trace Analysis with methods, datasets, metrics and reproducible artifacts.
5. Reconcile career totals and CV routing, then manually review the three recruiter paths on desktop and mobile.

## Review limitation

This review evaluates current source content, page structure and generated HTML. The local Jekyll build still encounters the documented Sass `variables` import failure, so the complete styled site could not be verified in a browser as part of this review.
