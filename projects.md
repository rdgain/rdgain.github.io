---
layout: default
title: Projects page moved
---

<div class="page-content narrow">
  <h1>Projects has moved to Portfolio</h1>
  <p>The project overview is now on the Portfolio page. Your selected project will be preserved when possible.</p>
  <p><a id="portfolio-handoff" href="{{ '/portfolio/' | relative_url }}">Go to Portfolio</a></p>
</div>

<script>
  (function () {
    var destination = "{{ '/portfolio/' | relative_url }}" + window.location.search + window.location.hash;
    document.getElementById("portfolio-handoff").href = destination;
    window.location.replace(destination);
  }());
</script>
