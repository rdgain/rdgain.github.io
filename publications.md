---
layout: default
title: Publications
---

<div class="page-content publications-page">

<h1>Publications</h1>

<p class="page-intro">
My research spans Artificial Intelligence, Game AI, Evolutionary Computation,
Simulation, Tabletop Games and Machine Learning. This page contains my complete
publication record, with links to papers, presentations, repositories and
additional material where available.
</p>

<div class="publication-stats">

    <div class="stat">

        <div class="number">

            {{ site.data.papers.size }}

        </div>

        <div class="label">

            Publications

        </div>

    </div>

    <div class="stat">

        <div class="number">

            {{ site.data.papers | where:"type","article" | size }}

        </div>

        <div class="label">

            Journal Articles

        </div>

    </div>

    <div class="stat">

        <div class="number">

            {{ site.data.papers | where:"type","inproceedings" | size }}

        </div>

        <div class="label">

            Conference Papers

        </div>

    </div>

</div>

{% include publications/filters.html %}

<h2 class="visually-hidden" id="publication-list-heading">Publication list</h2>

<p id="publication-counter" class="publication-counter" role="status" aria-live="polite" aria-atomic="true"></p>

<div class="publication-list" id="publication-list" aria-labelledby="publication-list-heading">

{% assign papers = site.data.papers | sort: "year" | reverse %}

{% for paper in papers %}

    {% include publications/publication-card.html paper=paper %}

{% endfor %}

</div>

<script src="{{ '/assets/js/publications.js' | relative_url }}"></script>

</div>
