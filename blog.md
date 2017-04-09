---
layout: page
---


<ul class="posts">
  {% for post in site.posts %}
	  {% assign count = site.posts.size | modulo: 3 %}
	  {% if count == 1 %}
		{% if forloop.index == 1 %}	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image3 }}" width="950" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		  
	  {% elsif count == 2 %}
		{% if forloop.index == 1 %}		
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="625" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		
	  {% else %}
	      <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" width="300" height="300" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>	  
	  
      {% endif %}
	  
	  
	  
  {% endfor %}
</ul>
