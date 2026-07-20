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

title="Featured Projects"

subtitle="A selection of projects I'm most proud of."

%}

<div class="container">

<div class="card-grid grid-3">

{% include components/cards/project-card.html
title="TAG Framework"
image="/assets/images/projects/tag.jpg"
text="AI-powered tabletop simulation framework."
tech="Java,AI,Simulation"
link="/projects"
%}

{% include components/cards/project-card.html
title="Research Software"
image="/assets/images/projects/research.jpg"
text="Tools developed throughout my PhD."
tech="Python,Unity"
link="/projects"
%}

{% include components/cards/project-card.html
title="Game Development"
image="/assets/images/projects/game.jpg"
text="Games and prototypes built over the years."
tech="Unity,C#,Gameplay"
link="/projects"
%}

</div>

</div>

{% include components/expertise.html %}

{% include components/highlights.html %}