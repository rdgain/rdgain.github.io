---
layout: default
title: Research
---

<div class="page-content research-page publications-page">

<h1>Research</h1>

<p class="page-intro">
My research spans Artificial Intelligence, Game AI, Evolutionary Computation,
Simulation, Tabletop Games and Machine Learning. This page brings together my
PhD supervisions and publication record, with links to papers, presentations, repositories and
additional material where available.
</p>

{% include research/phd-supervision.html %}

<h2>Publications</h2>

<p class="publication-scope">
The total number of publications includes every record type in the archive: journal articles,
conference papers, books and doctoral theses.
</p>

<div class="publication-stats">

    <div class="stat">

        <div class="number">

            {{ site.data.papers.size }}

        </div>

        <div class="label">

            Publication records

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

<h2 class="visually-hidden" id="publication-list-heading">Research publications</h2>

<p id="publication-counter" class="publication-counter" role="status" aria-live="polite" aria-atomic="true"></p>
<p id="publication-no-results" class="publication-no-results" hidden>No publications match the current search and filters.</p>

<div class="publication-list" id="publication-list" aria-labelledby="publication-list-heading">

{% assign papers = site.data.papers | sort: "year" | reverse %}

{% for paper in papers %}

    {% include publications/publication-card.html paper=paper %}

{% endfor %}

</div>

<script src="{{ '/assets/js/publications.js' | relative_url }}"></script>

</div>
