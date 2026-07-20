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
title="Featured Work"
subtitle="A selection of projects that best represent my experience."
%}

<div class="container">

{% assign featured = site.data.portfolio | where: "featured", true %}

{% for project in featured limit:3 %}

{% include components/case-study.html project=project %}

{% endfor %}

</div>

{% include components/expertise.html %}

{% include components/highlights.html %}