---
layout: page
title: Portfolio
permalink: /portfolio/
---

{% include components/section-header.html

title="Portfolio"

subtitle="Selected projects demonstrating my work across AI, simulation, games and research."

%}

{% for project in site.data.portfolio %}

{% include components/case-study.html project=project %}

{% endfor %}