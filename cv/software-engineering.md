---
layout: cv
title: Software Engineering CV
permalink: /cv/software-engineering/
description: Software engineering, architecture and application development experience of Raluca D. Gaina.
---

<div class="cv-screen-actions">
  <a href="{{ '/' | relative_url }}">Back to home</a>
  <a href="{{ '/assets/cv/RG_CV_SD.pdf' | relative_url }}" download>Download PDF</a>
  <button type="button" onclick="window.print()">Print / Save as PDF</button>
</div>

<article class="cv-page" aria-labelledby="cv-name">
  <header class="cv-header">
    <div>
      <p class="cv-eyebrow">SOFTWARE ENGINEERING · ARCHITECTURE · APPLICATIONS</p>
      <h1 id="cv-name">Raluca D. Gaina</h1>
      <p class="cv-headline">Software Engineer | AI &amp; Game Systems | Full-Stack Development</p>
    </div>
    <address class="cv-contact">
      <span>Getafe, Madrid, Spain</span>
      <a href="tel:+34642031911">+34 642031911</a>
      <a href="mailto:{{ site.author.email }}">{{ site.author.email }}</a>
      <a href="{{ site.data.links.linkedin }}">LinkedIn</a>
      <a href="{{ site.data.links.github }}">GitHub</a>
      <a href="{{ site.data.links.scholar }}">Google Scholar</a>
    </address>
  </header>

  <section class="cv-section cv-profile" aria-labelledby="cv-profile-heading">
    <h2 id="cv-profile-heading">Profile</h2>
    <p>
      Software engineer with 10+ years across reusable Java frameworks,
      simulation systems and TypeScript/React applications. Co-led a framework
      spanning 60+ tabletop games and led technical work on Tabletop R&amp;D
      research prototypes.
    </p>
  </section>

  <section class="cv-section" aria-labelledby="cv-skills-heading">
    <h2 id="cv-skills-heading">Technical Skills</h2>
    <div class="cv-skill-grid">
      <div>
        <h3>Languages &amp; frameworks</h3>
        <p>Java, Python, TypeScript/JavaScript, React, C#, Unity, SQL/MySQL, PHP</p>
      </div>
      <div>
        <h3>Architecture &amp; delivery</h3>
        <p>Architecture, scalable systems, large codebases, backend/full-stack, Agile, Git</p>
      </div>
      <div>
        <h3>Engineering practice</h3>
        <p>Object-oriented design, code review, debugging, UI, simulation-based evaluation</p>
      </div>
      <div>
        <h3>Domains</h3>
        <p>AI prototypes, game development, simulation, data integration, LLM applications</p>
      </div>
    </div>
  </section>

  <section class="cv-section" aria-labelledby="cv-experience-heading">
    <h2 id="cv-experience-heading">Experience</h2>

    <article class="cv-entry">
      <div class="cv-entry-heading">
        <h3>Co-founder &amp; Director · Tabletop R&amp;D</h3>
        <span>2023–Present</span>
      </div>
      <ul>
        <li>Led technical direction and architecture for client tabletop-game research, using digital twins and thousands of simulations.</li>
        <li>Built game/agent research tools; AI tooling remained prototype methods, not standalone products. Raised £120k+ for R&amp;D.</li>
      </ul>
      <p class="cv-links"><a href="{{ '/projects/tabletop-rnd/' | relative_url }}">Tabletop R&amp;D case study</a></p>
    </article>

    <article class="cv-entry">
      <div class="cv-entry-heading">
        <h3>Lecturer in Game AI · Queen Mary University of London</h3>
        <span>2021–2026</span>
      </div>
      <ul>
        <li>Taught game development and computational design; supervised 25+ software, AI and simulation projects.</li>
      </ul>
    </article>

    <article class="cv-entry">
      <div class="cv-entry-heading">
        <h3>Research Intern · Microsoft Research, Cambridge</h3>
        <span>2018 · 3 months</span>
      </div>
      <ul>
        <li>Designed Python/Java games for MARLO, applying procedural generation and code review.</li>
      </ul>
    </article>
  </section>

  <section class="cv-section" aria-labelledby="cv-projects-heading">
    <h2 id="cv-projects-heading">Selected Engineering Projects</h2>

    <article class="cv-project">
      <h3><a href="{{ '/projects/tag/' | relative_url }}">TAG: Tabletop Games Framework</a></h3>
      <p>
        Co-led Java architecture, APIs and analytics for a reusable 60+ game
        framework; coordinated and reviewed contributions.
      </p>
    </article>

    <article class="cv-project">
      <h3><a href="{{ '/portfolio/#gvgai' | relative_url }}">General Video Game AI Framework</a></h3>
      <p>
        Built two-player competition systems and an MCTS controller; worked
        across the framework, game sets, website and SQL/MySQL backend.
      </p>
    </article>

    <article class="cv-project">
      <h3><a href="{{ '/portfolio/#typescript-rpg-creator' | relative_url }}">TypeScript RPG Character Creator &amp; LLM Chat</a></h3>
      <p>
        Independently built a TypeScript/React RPG creator and LLM chat
        prototype using an agentic AI workflow.
        <a href="https://github.com/rdgain/TypescriptPlayground" target="_blank" rel="noopener noreferrer">Source code</a>
      </p>
    </article>

    <article class="cv-project">
      <h3><a href="{{ '/portfolio/#rebirth-game' | relative_url }}">Rebirth · Unity Game</a></h3>
      <p>
        Led team design/engineering, then independently modernized the game to
        Unity 6 and built a web version with Codex.
      </p>
    </article>

    <article class="cv-project">
      <h3><a href="{{ '/portfolio/#gameai-group-website' | relative_url }}">Game AI Group Website Redesign</a></h3>
      <p>
        Redesigned a research-group site with Jekyll, Liquid, HTML, CSS,
        JavaScript and Git.
      </p>
    </article>
  </section>

  <section class="cv-section" aria-labelledby="cv-education-heading">
    <h2 id="cv-education-heading">Education</h2>
    <p><strong>PhD</strong>, Intelligent Games &amp; Games Intelligence · QMUL, 2017–2021 (transferred from Essex in 2017)<br><strong>MSc</strong>, Computer Games · Essex, 2015–2016 · Distinction<br><strong>BSc</strong>, Computer Games · Essex, 2012–2015 · First Class</p>
  </section>
</article>
