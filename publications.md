---
layout: default
title: Publications archive moved
---

<div class="page-content narrow">
  <h1>Publications archive moved</h1>
  <p>The publications archive is now part of the Research page. Your project filter will be preserved when possible.</p>
  <p><a id="research-handoff" href="{{ '/research/' | relative_url }}">Go to Research</a></p>
</div>

<script>
  (function () {
    var destination = "{{ '/research/' | relative_url }}" + window.location.search + window.location.hash;
    document.getElementById("research-handoff").href = destination;
    window.location.replace(destination);
  }());
</script>
