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

<div class="publication-list">

{% assign papers = site.data.papers | sort: "year" | reverse %}

{% for paper in papers %}

    {% include publications/publication-card.html paper=paper %}

{% endfor %}

</div>

<hr>

{% include components/social-links.html class="contactfooter" archive=true %}

<script src="/assets/js/publications.js"></script>

</div>
