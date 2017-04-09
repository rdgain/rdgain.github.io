---
layout: page
---

Welcome to blog! Here's an ugly list of posts before I make it prettier. Yes, that's a sample post.

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}"><img src="assets/images/{{ post.image1 }}"/></a></li>
  {% endfor %}
</ul>

<!-- {{ post.title }} -->