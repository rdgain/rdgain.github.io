---
layout: page
---

Welcome to blog! Here's an ugly list of posts before I make it prettier. Yes, that's a sample post.

<ul class="posts">
  {% for post in site.posts %}
	  <div class="post-container">
		  <img src="assets/images/{{ post.image1 }}" />
		  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
	  </div>
  {% endfor %}
</ul>
