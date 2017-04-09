---
layout: page
---

{{ site.posts.size }}
{{ site.posts.size | modulo: 3 }}

<ul class="posts">
  {% for post in site.posts %}
	  {% assign count = site.posts.size | modulo: 3 %}
	  {% if count == 1 %}
		{% if forloop.index == 1 %}	
		  Right.	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="600" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}
		  Wrong.	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		  
	  {% elsif count == 2 %}
		{% if forloop.index == 1 %}	
		  Wrong.		
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="900" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}
		  Wrong.	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		
	  {% else %}
		  Wrong.	
	      <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>	  
	  
      {% endif %}
	  
	  
	  
  {% endfor %}
</ul>
