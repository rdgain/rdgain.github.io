---
layout: page
---

<ul class="posts">
  {% for post in site.posts %}
	  <div class="post-container">
		  <img src="assets/images/{{ post.image1 }}" width=300 />
		  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
	  </div>
  {% endfor %}
</ul>
