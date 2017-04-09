---
layout: page
---

Welcome to blog! Here's an ugly list of posts before I make it prettier. Yes, that's a sample post.

<ul class="posts">
  {% for post in site.posts %}
	  <div id="post-container">
		  <img id="post-image" src="assets/images/{{ post.image1 }}" />
			  <p id="post-text">
				<a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
			  </p>
	  </div>
  {% endfor %}
</ul>

<!-- 
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}"><img src="assets/images/{{ post.image1 }}"/></a></li>
	{{ post.title }} -->