---
layout: page
---


  {% for post in site.posts %}
	  {% assign count = site.posts.size | modulo: 3 %}
	  {% if count == 1 %}
		{% if forloop.index == 1 %}	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image3 }}" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		  
	  {% elsif count == 2 %}
		{% if forloop.index == 1 %}		
		  <div class="post-container">
			  <img src="assets/images/{{ post.image2 }}" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
		{% else %}	
		  <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>
        {% endif %}
		
	  {% else %}
	      <div class="post-container">
			  <img src="assets/images/{{ post.image1 }}" />
			  <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
		  </div>	  
	  
      {% endif %}
	  
	  
	  
  {% endfor %}
