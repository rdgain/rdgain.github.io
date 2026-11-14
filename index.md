---
layout: default
title: Home
---

{% include components/hero.html

image="/assets/images/headshot8.jpg"

intro="Hi, I'm"

name="Raluca Gaina"

subtitle="AI Engineer • Game AI Researcher • Simulation Systems"

description="I build intelligent systems for games, AI playtesting frameworks, simulation platforms and procedural generation tools. My work combines academic research with practical software engineering to solve complex gameplay and AI challenges."

%}

{% include components/section-header.html
title="Explore by Role"
subtitle="Jump to a project highlight on the Projects page."
%}

<div class="container recruiter-homepage">

  <div class="role-entry-grid" aria-label="Featured projects by role">
    {% assign all_projects = site.data.projects_page.featured | concat: site.data.projects_page.more %}

    {% assign project = all_projects | where: "id", "llm-program-search" | first %}
    {% assign related_project_ids = "typescript-rpg-creator,rhea" | split: "," %}
    <div class="role-entry">
      <span class="role-entry-label">Agentic AI / LLM</span>
      <a class="role-entry-primary" href="{{ '/projects/#' | append: project.id | relative_url }}">{{ project.title | escape }}</a>
      <p class="role-entry-related">
        Also:
        {% for related_id in related_project_ids %}
          {% assign related_project = all_projects | where: "id", related_id | first %}
          {% if related_project %}
            <a href="{{ '/projects/#' | append: related_project.id | relative_url }}">{{ related_project.title | escape }}</a>{% unless forloop.last %}, {% endunless %}
          {% endif %}
        {% endfor %}
      </p>
    </div>

    {% assign project = all_projects | where: "id", "tabletop-rnd" | first %}
    {% assign related_project_ids = "board-game-data,vertigo,rhea" | split: "," %}
    <div class="role-entry">
      <span class="role-entry-label">Data Science</span>
      <a class="role-entry-primary" href="{{ '/projects/#' | append: project.id | relative_url }}">{{ project.title | escape }}</a>
      <p class="role-entry-related">
        Also:
        {% for related_id in related_project_ids %}
          {% assign related_project = all_projects | where: "id", related_id | first %}
          {% if related_project %}
            <a href="{{ '/projects/#' | append: related_project.id | relative_url }}">{{ related_project.title | escape }}</a>{% unless forloop.last %}, {% endunless %}
          {% endif %}
        {% endfor %}
      </p>
    </div>

    {% assign project = all_projects | where: "id", "tag" | first %}
    {% assign related_project_ids = "rebirth-game,tribes,gvgai,tabletop-rnd" | split: "," %}
    <div class="role-entry">
      <span class="role-entry-label">Game Development</span>
      <a class="role-entry-primary" href="{{ '/projects/#' | append: project.id | relative_url }}">{{ project.title | escape }}</a>
      <p class="role-entry-related">
        Also:
        {% for related_id in related_project_ids %}
          {% assign related_project = all_projects | where: "id", related_id | first %}
          {% if related_project %}
            <a href="{{ '/projects/#' | append: related_project.id | relative_url }}">{{ related_project.title | escape }}</a>{% unless forloop.last %}, {% endunless %}
          {% endif %}
        {% endfor %}
      </p>
    </div>

    {% assign project = all_projects | where: "id", "rhea" | first %}
    {% assign related_project_ids = "tag,tabletop-rnd,gvgai,typescript-rpg-creator" | split: "," %}
    <div class="role-entry">
      <span class="role-entry-label">AI / Software Engineering</span>
      <a class="role-entry-primary" href="{{ '/projects/#' | append: project.id | relative_url }}">{{ project.title | escape }}</a>
      <p class="role-entry-related">
        Also:
        {% for related_id in related_project_ids %}
          {% assign related_project = all_projects | where: "id", related_id | first %}
          {% if related_project %}
            <a href="{{ '/projects/#' | append: related_project.id | relative_url }}">{{ related_project.title | escape }}</a>{% unless forloop.last %}, {% endunless %}
          {% endif %}
        {% endfor %}
      </p>
    </div>
  </div>

</div>

{% include components/expertise.html %}

{% include components/highlights.html %}