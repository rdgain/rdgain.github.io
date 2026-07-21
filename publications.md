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

{% include publications/filters.html %}

{% assign papers_by_year = site.data.papers | group_by:"year" | sort:"name" | reverse %}

{% for year in papers_by_year %}

<section class="publication-year">

<h2>{{ year.name }}</h2>

<div class="publication-list">

{% assign sorted = year.items | sort:"highlight" %}

{% for paper in sorted %}

{% include publications/publication-card.html paper=paper %}

{% endfor %}

</div>

</section>

{% endfor %}

<hr>

<div class="contactfooter">

<a href="mailto:r.d.gaina@qmul.ac.uk"><i class="fas fa-envelope"></i></a>
<a href="https://www.researchgate.net/profile/Raluca_Gaina"><i class="fab fa-researchgate"></i></a>
<a href="https://scholar.google.co.uk/citations?user=tC5klQYAAAAJ"><i class="fab fa-google"></i></a>
<a href="https://www.linkedin.com/in/raluca-gaina-347518114/"><i class="fab fa-linkedin"></i></a>
<a href="https://twitter.com/b_gum22"><i class="fab fa-twitter"></i></a>
<a href="https://publists.qmul.ac.uk/userprofile.html?uid=41431&em=false"><i class="fas fa-archive"></i></a>

</div>

<script src="/assets/js/publications.js"></script>

</div>