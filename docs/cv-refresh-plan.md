# CV refresh plan

## Goal

Create a concise, recruiter-focused set of CVs grounded in the website's
published experience and project evidence. Each CV will be a website page with
a print stylesheet suitable for PDF export, use a minimalist layout with one
accent colour, and retain relevant links to supporting work.

The front-page expertise areas define the CV versions:

1. AI, Machine Learning and LLMs
2. Simulation and Game Development
3. Procedural Content Generation
4. Software Engineering
5. Research and Data Science

Keep the current Jekyll/GitHub Pages architecture, avoid duplicating project
facts where existing content can be linked, and do not publish claims that
have not been confirmed.

## Workflow

1. **Inspect and reconcile the existing CV against the website.** Review the
   CV and site evidence; record discrepancies and recommend any website
   additions. **Complete:** findings are in the first-step report below.
2. **Review the job-application spreadsheet.** Examine column M (Strengths)
   across the sheet, group recurring strengths, and compare them with
   demonstrated website evidence. Recommend content or skill updates only
   where the projects, roles or other evidence support them.
3. **Create the first CV.** Build the AI, Machine Learning and LLM version,
   using the strongest matching website content. Make the page print cleanly
   to no more than two A4 pages, with a minimalist design, a restrained colour
   accent, project links and the research-publications link.
4. **Create the remaining five CVs.** Tailor section order, projects, skills
   and emphasis to each expertise area. Include publications only where
   relevant; omit them for game-development-focused versions where they do not
   help the application.
5. **Write a recruiter review for each CV.** Assess each version as a recruiter
   for its target role, noting its strongest evidence, gaps, unclear claims and
   specific improvements.

## Step 1 — CV and website cross-check

### Source reviewed

The supplied Google Doc could not be fetched because it returned HTTP 401. I
used the project copy [RG_CV_AI.pdf](../assets/cv/RG_CV_AI.pdf) instead. The
website review covered the home-page expertise areas, About and career
timeline, portfolio summaries and case studies, skills, teaching, community
leadership, research/publications and shared links.

### CV facts supported by the website

- The AI/game-AI focus, intelligent systems and simulation experience, and
  “10+ years” positioning align with the homepage and About page.
- The Tabletop R&D co-founder/director role, AI-assisted tabletop testing,
  named clients and £120k+ R&D funding are represented in the portfolio.
- The Queen Mary University of London Game AI Lecturer role (2021–2026) and
  teaching, supervision and research work are represented across the career
  timeline and Teaching page.
- Research leadership and service are supported by the portfolio, research
  archive and Community page.

### Website evidence not yet used effectively in the CV

The PDF's selected projects are broad and short compared with the current
portfolio. For the later CV drafts, consider replacing them with concrete,
role-specific evidence already on the site:

- The LLM program-search study: 29 tasks, 11 models, Python and Java, with
  described benchmark, TAG integration, API extraction, prompt engineering
  and UI contributions.
- TAG: leadership of its framework and core systems, implementations of games
  and agents, and a framework now covering over 60 titles.
- RHEA: algorithm and experimental design, implementation, evaluation and
  analysis, with linked research findings.
- The TypeScript/React RPG creator and AI chat application, and the Rebirth
  Unity 6 modernization and web build.

These are stronger, more specific examples than “multiple prototypes” or
general statements about AI systems. Select among them according to the
target expertise area and link to their case studies or repositories.

### Items to reconcile before changing published facts

- **Education:** the current website and CV both place the BSc and MSc at the
  University of Essex. The CV gives First Class and Distinction classifications,
  which have now been added to the website timeline.
- **Conference role:** the CV says “General Chair” for IEEE Conference on
  Games 2026; the Community data says “General Co-Chair.” Keep the website version.
- **Supervision count:** the CV says 20+ projects; the Teaching data records
  25+. Use one confirmed current figure wherever it appears. Keep the website information as is.
- **Earlier experience:** the Microsoft Research internship, MARLO work and
  DSTL/Pommerman collaboration have now been added to the career timeline and
  portfolio. The two PhD-supervision examples have been added to Teaching.
- **Funding wording:** the CV says it secured £120k+ in grant funding; the
  website describes over £120k raised for R&D through Innovate UK and Queen
  Mary Innovation. Keep the website's more specific wording.
- **Tabletop R&D scale/product claims:** the case study now includes digital
  twins, thousands of simulations, the SaaS transition, user-facing tools,
  product direction, technical roadmap and AI integration strategy, as
  requested.
- **Awards and competition results:** the Community page now lists the awards,
  nominations, prizes and competition placements from the CV, distinguishing
  awards from nominations and placements.

The Research page is the site's main publication archive. The CV currently
links to `/publications/`, which is retained as a legacy handoff; use the
canonical Research URL consistently in the refreshed versions.

A prior maintenance note in [milestones.md](milestones.md) records that the
AI CV had been confirmed current. The comparison here nevertheless found
details that need reconciliation, so that earlier confirmation should not be
used to settle the conflicts listed above.

### Cross-check decisions

1. Keep the MSc institution consistent with the current website and CV.
   The PhD title is consistent across the documents; no change is needed.
2. Align the CoG 2026 role wording and the supervision figure across the CV,
   Community, Teaching and homepage content, using the confirmed website
   wording and count.
3. Keep portfolio case studies as the source of detailed project evidence;
   tailor the CV summaries to each expertise area and link to the relevant
   case studies and publications.

The Step 1 updates and the selected historical-CV additions below are
implemented on the website. The spreadsheet analysis and recommendations are
documented in Step 2. All CV pages and recruiter reviews remain to be done.

## Completion checklist

- [x] Document the workflow and inspect the existing AI CV against the website.
- [x] Apply the requested Step 1 website updates for education, experience,
  Tabletop R&D and awards.
- [x] Implement the user-selected historical research-CV website adjustments.
- [x] Analyze column M of the job-application spreadsheet and recommend
  evidence-based website updates.
- [ ] Build and print-check the AI, Machine Learning and LLM CV (maximum two
  A4 pages).
- [ ] Build and print-check the other five expertise CVs.
- [ ] Add a matching-role recruiter review for every CV.
- [x] Run the prescribed Jekyll build and local content/reference checks.
- [ ] Review affected pages in a browser.

## Step 2 — Job-application strengths analysis

### Source and method

Reviewed only column M (“Strengths”) of the shared job-application spreadsheet.
There were 38 applications with a non-empty Strengths cell and 47 distinct
labels. CSV-aware parsing preserves labels containing commas. Counts below are
how often a label appeared in the spreadsheet, not an assessment of proficiency;
similar labels are grouped for discussion but their counts are not added
together.

### Most frequent strengths

| Strength label | Applications |
| --- | ---: |
| Collaborate across teams | 16 |
| Python | 15 |
| Work independently | 14 |
| AI-assisted development tools | 14 |
| Git | 12 |
| Software development | 12 |
| Online communication | 12 |
| Unity | 12 |
| Game development | 12 |
| C# | 11 |
| Analytics | 11 |
| Large codebase | 11 |
| English | 11 |
| AI/ML | 11 |
| SQL | 10 |
| TypeScript/React | 10 |
| Architecture | 9 |
| Data analysis | 9 |
| Debugging | 8 |
| Written communication | 8 |
| LLM | 8 |
| Backend | 7 |
| Performance optimisation | 7 |
| Leadership / management | 6 |
| Agile development | 6 |

Other entries included Java and PhD (4 each); communication to a non-technical
audience, scalable architectures and full stack (3 each); board-game interest,
technical judgement, and open-source contribution (2 each); and a range of
single mentions including testing/QA, automated testing, PCG, initiative,
statistical analysis, and experimental work.

### Comparison with current website evidence

- **Already supported:** Python, Java, Unity, C#, SQL, TypeScript/React, Git,
  AI/ML, LLMs, game development, analytics and data analysis all have project,
  experience or skills evidence. Examples include the MARLO and GVGAI work,
  the Rebirth Unity project, the TypeScript/React RPG application, the LLM
  program-search study, and the RHEA/TAG research. English is listed as fluent
  in the About-page language details. AI-assisted development is evidenced by
  the Codex/agentic-AI workflows described for Rebirth, the RPG application
  and this website redesign.
- **Supported but could be easier to notice:** Cross-team collaboration is
  reflected in TAG leadership and developer/researcher contributions,
  Tabletop R&D stakeholder communication, and research collaborations.
  Independent ownership is explicit for the RPG application and the later
  Rebirth modernization. Large-codebase work and architecture are supported
  by TAG, MARLO and GVGAI; TAG's framework now covers over 60 titles.
  Communication is evidenced by teaching, publications, presentations and
  technical work with non-technical stakeholders.
- **Still unconfirmed:** General software QA/automated testing and production
  performance optimisation are not clearly demonstrated as distinct skills.
  AI playtesting and evaluation are strong evidence for game/product testing,
  but should not be presented as automated software QA.

### Recommendations and implementation

1. Keep the existing technical skills and language details; the recurring
   programming, game-development and AI strengths are already represented.
2. Make ownership and collaboration more prominent in the homepage and
   featured project summaries, using concrete examples rather than a generic
   soft-skills list: cross-functional Tabletop R&D work, TAG coordination and
   code review, and the independently owned RPG and Rebirth work.
3. Surface architecture and large-codebase evidence with specific scope:
   explain the reusable TAG framework and its 60+ titles, and clarify the
   MARLO/GVGAI engineering context where relevant.
4. Describe AI-assisted development precisely by naming the projects and
   explaining what was built or modernised and where the tools contributed.
   Avoid implying that AI tools replaced the engineering work.
5. In the upcoming tailored CVs, prioritize evidence to match each role:
   Python/Java and research for AI roles; Unity/C# and game systems for game
   development; TypeScript/React, SQL, backend and Git for software roles.
   Include collaboration, independent ownership and communication alongside
   those examples.
6. Add as skills: Agile development (Rebirth and agentic-AI projects), online
   communication (online teaching and coordination with teachers,
   demonstrators, lab assistants and students during and outside class), and
   scalable architecture (GVGAI, TAG and Tabletop R&D).

These changes are implemented: the new skills are attached to the relevant
project/teaching records; portfolio summaries now foreground individual
ownership, cross-team work, technical scope and the specific role of
agentic-AI workflows.

## Historical research-CV website adjustments

The attached `Raluca Gaina - Research.docx.pdf` was reviewed as historical
evidence. The user-selected additions below have been implemented, with claims
kept within the information in the document and existing website.

### Experience and project detail

- **Pommerman / DSTL:** Expanded the project into a case study
  describing the 2019 Queen Mary/DSTL work: a Java version of the Python
  Pommerman framework for statistical forward-planning agents and scenario
  modifications. Based on previous successful project OpDST (2018-2019)
  in collaboration between Queen Mary, Alan Turing Institute and DSTL 
  to develop a framework for simulating operational-planning scenarios. 
  My personal contribution there: framework engineering, experimental design 
  and results analysis and reporting. Keep it all in a single project, no
  further details can be disclosed about OpDST.
- **TravelApp:** Added a compact project entry for the
  2016–2017 University of Essex, Visteon UK and Essex County Council project
  to develop a travel application for calculating fastest routes given
  local incident information. My specific contribution
  was on setting and maintaining the traffic-incident feed providing accurate
  backend data for the Android/iOS application.
- **Game AI group website:** Added the 2019 GitHub Pages redesign as a concise
  software-delivery example (web development, frontend, Liquid, Git, CSS and
  HTML skills). The live site is http://gaigresearch.github.io/
- **Microsoft Research internship:** Updated the MARLO timeline to specify
  the confirmed three-month placement in Cambridge in 2018.
- **Student game projects:** Linked the MSc two-player GVGAI competition and
  MCTS coursework controller to the existing GVGAI portfolio project, and
  added the undergraduate detective game “City of Kalux” with an artifact
  placeholder.
- Added a compact project entry for this website redesign, using Agentic AI
  to refresh the look and clarify the content.

### Awards, placements and funding

The Community page now distinguishes categories and records the more precise
results from the older CV. Conference cards use consistent conference, location
and year metadata, with placements and paper/presentation titles in the card
details; related AIIDE and CIG recognitions and travel grants are grouped.

- IEEE CoG 2019 video competition: second place for *Project Thyia: A Forever
  Gameplayer*. https://www.youtube.com/watch?v=ruwH-lsIYcE&t=1s
- IEEE CIG 2018 video competition: third place for *General Win Prediction
  from Agent Experience*. https://www.youtube.com/watch?v=zq9zaEjspUY&t=1s
- Best Paper Award Nominee, IEEE CIG 2018, for *General Win Prediction from
  Agent Experience*. The recognition is attached to the publication record
  and uses a consistent conference name.
- IET Game AI Hackathon 2017: runner-up, Best Game Design.
- IEEE Present Around the World 2017: runner-up for “Could you play a game
  when guided only by sound?”
- MSc Project Prize in Computer Science, University of Essex, 2016: highest
  mark for an MSc project in the department.
- K. F. Bowden Memorial Prize, University of Essex, 2013 and 2014: top-four
  overall marks in the respective first and second years.
- Added the grants as category-labelled records, distinct from prizes and
  company R&D funding: the CV lists
  AAAI 2019 and AIIDE 2018 travel grants, EPSRC IGGI doctoral funding supporting PhD work (2016-2021),
  and a £10,000 University of Essex Postgraduate Support Scheme grant (2015).
  Keep these distinct from prizes and company R&D funding.
- Added the location for Best PC Member at AIIDE 2019 in Atlanta.

Category labels preserve distinctions between wins, runner-up placements,
nominations, travel grants and scholarships.

### Teaching, service and talks

- Added selected specifics to existing teaching records where they strengthen
  the teaching profile: half-module responsibility for MSc Artificial
  Intelligence in Games in 2019, course/lab design, assessment and student
  support. Avoid reproducing the older CV's full teaching duty list.
- Added the 2019 Erasmus MSc student mentoring example and its
  connection to the level-generator publication, plus the 2019 IET Faraday
  Challenge outreach role. 
- Added Google Scholar and IGGI profile links for Toby Best and Joshua Kritz,
  with their identified PhD-period papers.
- Added the Queen Mary GradFest 2018 GVGAI workshop and AIIDE 2018 VERTIGO
  demo to Community. Tutorial, workshop and demo cards use consistent
  type/location details; selected talk records include locations and recording
  links, and Bits, Bugs & Bots links to its AI: Brains and Bits series.

### Skills and profile details

Added HTML/CSS and JavaScript for website projects, Jekyll/Liquid for the Game
AI Group redesign, XML for the Microsoft Research internship,
object-oriented design patterns for Java projects, and MySQL and Linux/Unix
for GVGAI.

Languages: English and Romanian (fluent/native); Spanish (advanced
comprehension and listening, basic speaking).

### Historical details to reconcile

- Added a note that the PhD transferred from the University of Essex to QMUL
  in 2017. The PhD degree title is consistent across the documents.
- Do not copy the older CV's phone number or QMUL email;
  keep the current shared website contact details as the source of truth.
- Do not add extra publications.