# Projects page and portfolio expansion plan

## Scope and guardrails

This document began as a plan; Milestone 7 implementation is now in progress. The Projects overview has a page-specific data source and More Projects section, and each featured project has a case-study route. The homepage and `/portfolio/` dataset remain unchanged. The four supplied thumbnails are mapped to LLM program search for games, Tabletop R&D, TAG and RHEA. Individual role details remain marked for confirmation. Implementation status is tracked in [milestones.md](milestones.md), Milestone 7.

## Publication analysis

The current `_data/papers.yml` contains 37 publication records. Group them by the project, framework or research effort they evidence, rather than treating each paper as a separate portfolio project. The following is a proposed primary grouping; cross-links between related projects are appropriate, but avoid duplicating the same paper as if it represented separate work.

| Project / cluster | Publication evidence (`id` values from `papers.yml`) | Planning notes |
| --- | --- | --- |
| **RHEA — Rolling Horizon Evolutionary Algorithms** | `gaina2017rhanalysis`, `gaina2017rhhybrids`, `gaina2017rhseeding`, `gaina2020rhea`, `gaina2020onlinerhea`, `perez2020rhneat`, `gaina2021phd`, `lucas2019efficient` | Core algorithm and PhD thread: parameter analysis, population seeding, algorithm enhancements, self-adaptation, NEAT hybridisation and efficient agent optimisation. Keep distinct from the broader GVGAI framework while cross-linking them.
| **GVGAI — General Video Game AI** | `gaina2016gvgai2p`, `gaina2018gvgai2P`, `perez2017macro-physics`, `sironi2018mctsGVGP`, `gaina2018win`, `perez2019gvgaisurvey`, `gaina2019sparse-rewards`, `gvgaibook2019`, `gaina2019thyia`, `gaina2019audio`, `dockhorn2019unforgiving`, `lucas2019gog` | Framework, competitions, multi-agent play, macro-actions, agent-performance prediction, sparse rewards, persistent game-playing vision, audio input and forward-model learning. The framework is an umbrella with several possible child case studies.
| **TAG — Tabletop Games Framework** | `gaina2020tag`, `gaina2020tagdesign`, `gaina2021terraforming`, `gaina2022pandemic`, `balla2023pytag`, `best2024journeys`, `eberhardinger2025code` | Framework and design paper, Terraforming Mars, Pandemic competition, PyTAG/RL access, Descent game-master AI, and the LLM code-to-play work. Link child stories to the parent TAG case study where they share the platform.
| **Tabletop R&D** | No single publication ID uniquely represents the company/platform. Related research appears in the TAG/tabletop records above. | Use company/product evidence, confirmed personal role, public site, funding and outcomes as evidence. Keep this distinct from TAG, and avoid claiming all TAG work was company work.
| **VERTIGO** | `gaina2018vertigo` | Visualization of Rolling Horizon Evolutionary Algorithms within GVGAI. Candidate standalone project or a clearly linked RHEA/GVGAI subproject.
| **Pommerman planning and evaluation** | `perez2019pommerman` | Statistical forward-planning methods analysed in the Pommerman multi-agent environment. Verify the exact personal contribution and results before writing impact claims.
| **Tribes** | `perez2020tribes` | Turn-based strategy game/framework for AI research, with a forward model and benchmarked agents. Emphasize environment design and agent evaluation only where supported by the paper and confirmed role.
| **AI-assisted game design and game improvement** | `gaina2017tuning`, `kunanusont2017ntuple`, `drageset2019generator` | Strategic-diversity tuning, the N-Tuple Bandit Evolutionary Algorithm for game improvement, and level-generator optimisation. May be one umbrella case study with clearly separated examples if the contributions form a coherent story.
| **MARLO competition** | `perez2018multi` | Multi-agent reinforcement-learning competition in MalmO. Candidate compact case study; confirm role in competition setup and tools.
| **Legends of Code and Magic agent optimisation** | `montoliu2020cards` | Heuristic-policy optimisation for a strategic card game. Candidate case study or a concise example within game-agent optimisation.
| **BoardGameGeek data analysis** | `nguyen2024unveiling` | Interpretable ML analysis of relationships between board-game mechanics and player ratings. Candidate data-science case study; confirm the exact data pipeline and individual contribution.
| **Gameplay trace explanation and clustering** | `gutierrez2025playtraces` | Temporal-logic descriptions and clustering of gameplay traces, evaluated on a stealth game. Candidate recent analytics/XAI case study; confirm implementation ownership and result details.

### Explicit LLM highlight

Give **From code to play: Benchmarking program search for games using large language models** a distinct highlight in the expanded portfolio. Its paper (`eberhardinger2025code`) describes LLM-guided hill-climbing program search across 29 tasks, 11 language models, and Python and Java, including tasks built around TAG games. Present the measured scope and findings accurately; verify the user's exact role, implementation details, and any performance comparisons before adding claims.

## Proposed project summaries and skill tags

These short summaries and tags are planning drafts based on the current project cards and publication titles/abstracts. Confirm language, ownership, outcomes and terminology before publishing. Tags should describe demonstrated skills, not every technology mentioned in a paper.

| Project | Draft summary | Candidate skill tags |
| --- | --- | --- |
| LLM program search for games | Evaluated LLM-guided program search for game-related code across Python and Java tasks, comparing models and search configurations. | LLMs, program synthesis, search, Python, Java, benchmarking, game AI |
| Tabletop R&D | Co-founded a company building simulation-driven AI playtesting tools to help tabletop designers evaluate balance and gameplay. | AI playtesting, simulation, Java, multi-agent systems, product development, entrepreneurship |
| TAG Framework | Built an open-source Java framework for implementing, simulating and evaluating tabletop games with AI agents. | Java, game systems, simulation, game AI, multi-agent systems, open source |
| RHEA | Developed and evaluated evolutionary planning methods that can play games without game-specific strategies, including population management, self-adaptation and algorithm hybrids. | Evolutionary algorithms, planning, search, game AI, Java, algorithm evaluation |
| GVGAI | Contributed to a framework and benchmark ecosystem for agents that play previously unseen games, spanning competitions, multi-agent settings and varied observations. | Game AI, Java, benchmarking, planning, MCTS, reinforcement learning, competition design |
| VERTIGO | Created a visualization effort for exploring how Rolling Horizon Evolutionary Algorithms behave while playing GVGAI games. | Data visualization, evolutionary algorithms, game AI, Java, interactive tools |
| Pommerman | Evaluated statistical forward-planning approaches in a competitive multi-agent game environment. | Planning, search, multi-agent systems, game AI, experimental evaluation |
| Tribes | Introduced a complex turn-based strategy environment for studying planning and AI agents under partial information and resource-management challenges. | Game systems, forward models, planning, MCTS, evolutionary algorithms, benchmarking |
| AI-assisted game design | Applied evolutionary search and learned fitness estimates to tune games, increase strategic diversity and optimise generated levels. | Evolutionary algorithms, procedural content generation, game design, optimisation, player evaluation |
| MARLO competition | Helped advance a multi-agent reinforcement-learning competition built around a game-playing environment. | Reinforcement learning, multi-agent systems, competition design, evaluation |
| Legends of Code and Magic | Investigated heuristic-policy optimisation for agents in a challenging strategic card game. | Evolutionary algorithms, heuristic optimisation, card-game AI, experimental design |
| BoardGameGeek data analysis | Used interpretable machine-learning models to study how tabletop-game mechanics relate to player ratings. | Python (verify), machine learning, data analysis, interpretability, feature importance |
| Gameplay trace analysis | Explored temporal-logic methods for describing play styles and grouping gameplay traces to surface behavioural patterns. | Explainable AI, temporal logic, search, data analysis, game analytics |
| LLM program search for games | Evaluated LLM-guided program search for game-related code across Python and Java tasks, comparing models and search configurations. | LLMs, program synthesis, search, Python, Java, benchmarking, game AI |

## Recruiter-facing case-study content

For every project page, use the publications as source evidence and structure the story around:

1. **At a glance:** project name, time period (if confirmed), role, collaborators/team context (if appropriate), and one-sentence outcome.
2. **Why it was interesting:** the distinctive technical or product challenge.
3. **Problem:** what users, researchers or designers could not do effectively before the work.
4. **What I did:** specific personal contributions, separating individual work from team outcomes.
5. **Approach:** architecture, algorithms, tools, data, evaluation design and relevant technical decisions.
6. **Impact and evidence:** verified adoption, funding, competition results, performance numbers, users, publications, demos or repositories. Include only claims supported by a source or confirmed by the author.
7. **What remains unknown:** use visible editorial placeholders such as `[Confirm personal contribution]`, `[Add verified metric]`, or `[Add demo/repository link]` during drafting. Replace or remove every placeholder before publication; do not infer impact from a paper title or abstract.
8. **Related work:** links to selected publication IDs and related projects, avoiding a repeated full publication list on every page.

Projects needing especially careful placeholders include Tabletop R&D (personal role, product usage, funding/metrics), Project Thyia (which ideas were implemented versus proposed), Pommerman and Tribes (specific individual contributions and measured results), and the LLM project (implementation ownership and model/task result details).

## Page and card interaction proposal

Preserve the current Featured Projects card appearance, but use this selected order: **LLM program search for games**, **Tabletop R&D**, **TAG**, and **RHEA**. Put every other group—including GVGAI—in a separate **More Projects** section. The LLM project is a featured project, not a More Projects item. Retain existing external links where relevant, and verify each card's claims against the linked publications and confirmed personal role.

**Implemented:** each featured overview card has an explicit “View case study” link to a separate page. These routes provide shareable URLs and room for recruiter-focused detail. External links (website, repository, paper) remain separate actions; the whole card is not an ambiguous click target.

Proposed routes can follow `/projects/<project-slug>/`, subject to a route-collision check before implementation. Retain `/projects/` as the overview and `/portfolio/` as its existing separate route unless a later route review decides otherwise.

## Representative image plan

Use the four landscape thumbnails supplied for the featured projects. Treat them as project illustrations, not factual screenshots or evidence of measured results. Plan additional images for More Projects only after the first four are reviewed. Reuse one image for the parent/child project only where it remains clear which work is being represented.

Suggested art directions:

- **LLM program search for games:** abstract code branching into several original game worlds, suggesting iterative program search; no model-brand logos or legible generated code.
- **Tabletop R&D:** an abstract tabletop board with simulation trajectories and analytic overlays.
- **TAG:** a digital tabletop-game board with modular pieces and an abstract agent/simulation motif.
- **RHEA:** an abstract sequence of candidate moves through a changing game state, suggesting rolling-horizon search.
- **GVGAI:** a grid of distinct fictional game worlds connected by a general-purpose agent motif.
- **VERTIGO:** a visualization-inspired field of evolving paths over an abstract game arena.
- **Pommerman:** a non-branded top-down tactical grid with agents and planned routes; avoid recognizable game characters or copied artwork.
- **Tribes:** a fictional strategy map with resource routes, technology progression and multi-agent decisions.
- **Other projects:** use a visual representing the research question (audio signals, card-game decision trees, game traces, or board-game data) rather than a fabricated product interface.

The four supplied assets are stored as `LLM-thumb.png`, `TRD-thumb.png`, `TAG-thumb.png`, and `RHEA-thumb.png` under `assets/images/projects/`. The Projects overview and matching case-study pages use these thumbnails with descriptive alt text. The earlier project artwork remains in place and was not overwritten.

## Implementation sequence after review

1. Confirm project group boundaries, personal roles and dates; the selected featured set is LLM program search for games, Tabletop R&D, TAG and RHEA.
2. Confirm one-paragraph summaries and skill tags for featured and More Projects entries; resolve all editorial placeholders with the author.
3. Review the supplied featured thumbnails for consistency, file size and accessibility text.
4. The overview's **More Projects** section and explicit featured case-study links are implemented while preserving the current card visual treatment.
5. Draft and fact-check the four featured case studies from publication and product evidence; resolve the contribution notes and publish only substantiated outcomes. Add other case studies selectively.
6. Check route uniqueness, local asset/references, mobile layout and keyboard navigation; run the Jekyll build and generated-page checker before publishing.
