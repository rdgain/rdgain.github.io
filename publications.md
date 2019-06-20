---
layout: default
---

<h2>Color legend</h2>

<div class="pubs"><ul>
<li style="background-color:#daffbe;width:25%"> Core PhD papers </li>
<li style="background-color:#d0e8ff;width:25%"> Non-core first-author papers </li>
<li style="width:25%"> Other papers </li>
</ul></div>

<!-- Group papers by year, display in reverse order (most recent first) -->
{% assign papers_by_year = site.data.papers | group_by: "year" | sort: "name" | reverse %}
{% for categ in papers_by_year %}
  <h2 id="{{ categ.name }}">{{ categ.name }}</h2> <!-- Display current year -->
  <div class="pubs"><ul>
  {% assign sorted_items = categ.items | sort: "highlight" %}
  {% for paper in sorted_items %}
	{% if paper.highlight == "first" %}
	<li style="background-color:#d0e8ff">
	{% elsif paper.highlight == "core" %}
	<li style="background-color:#daffbe">
	{% else %}
    <li>
	{% endif %}
		<!-- Display citation, IEEE style -->
		<p>
			{{ paper.author | replace: " and", "," }},
			<b>"{{ paper.title }}"</b>, 
			{% if paper.journal %}in  <em>{{ paper.journal }}</em>, {% elsif paper.booktitle %}in <em>{{ paper.booktitle }}</em>, {% endif %}
			{% if paper.volume %} <strong>{{ paper.volume }}</strong>, {% elsif paper.number %}, <strong>{{ paper.number }}</strong>{% endif %}
			{% if paper.series %} <strong>{{ paper.series }}</strong>,{% endif %}
			{% if paper.edition %} <strong>{{ paper.edition }}</strong>,{% endif %}
			{% if paper.pages %} pp. {{ paper.pages | replace: "--", "-" }}, {% endif %}
			{% if paper.month %}{{ paper.month }}, {% endif %} {{ paper.year }}.
		</p>
		
		<!-- Print timestamp if available -->
		{% if paper.timestamp %}{{ paper.timestamp }}<br/>{% endif %}

		<!-- Several buttons to display more info and links -->
		
		
		<div style="float:right">
			{% if paper.url %}<a href="{{ paper.url }}" target="_blank"><i class="fas fa-link"></i></a>&nbsp; {% endif %}
			{% if paper.note %}<a data-toggle="collapse" href="javascript:toggleDiv('{{paper.id}}-note')"><i class="fas fa-sticky-note"></i></a>&nbsp; {% endif %}
			<!-- Arxiv link -->
			{% if paper.arxiv %}<a href="{{ paper.arxiv }}" target="_blank"><i class="fas fa-file-excel"></i></a>&nbsp; {% endif %}
			<!-- Link to pdf if on website -->
			{% if paper.pdf == true %}<a href="/assets/pdf/papers/{{ paper.id }}.pdf" target="_blank"><i class="fas fa-file-pdf"></i></a>&nbsp; {% endif %}
			<!-- If a link to bib is in the bibtex entry, link to that. Otherwise, display recreated bibtex (see below). -->
			{% if paper.biburl %}<a href="{{ paper.biburl }}"><i class="fas fa-quote-right"></i></a> 
			{% else %} <a data-toggle="collapse" href="javascript:toggleDiv('{{paper.id}}-bibtex')"><i class="fas fa-quote-right"></i></a> 
			{% endif %}
		</div> 
		{% if paper.abstract %}<a data-toggle="collapse" href="javascript:toggleDiv('{{paper.id}}-abstract')">[Abstract]</a>{% endif %}
		{% if paper.issn %}<a data-toggle="collapse" href="javascript:toggleDiv('{{paper.id}}-issn')">[ISSN]</a>{% endif %}
		{% if paper.isbn %}<a data-toggle="collapse" href="javascript:toggleDiv('{{paper.id}}-isbn')">[ISBN]</a>{% endif %}
		{% if paper.doi %}<a href="http://dx.doi.org/{{ paper.doi }}" target="_blank">[DOI]</a>{% endif %}
		
		<!-- Display information for abstract, note, issn and isbn when toggled -->
		<div id="{{paper.id}}-abstract" style="display:none" class="collapse"><h5>Abstract</h5><div class="pubcollapse">{{paper.abstract}}</div></div>
		<div id="{{paper.id}}-note" style="display:none" class="collapse"><h5>Note</h5><div class="pubcollapse">{{paper.note}}</div></div>
		<div id="{{paper.id}}-issn" style="display:none" class="collapse"><div class="pubcollapse">{{paper.issn}}</div></div>
		<div id="{{paper.id}}-isbn" style="display:none" class="collapse"><div class="pubcollapse">{{paper.isbn}}</div></div>
		
		<!-- Recreate bibtex -->
		<div id="{{paper.id}}-bibtex" style="display:none" class="collapse"><h5>BibTex</h5>
			<div class="pubcollapse">
				@{{paper.type}}&#123;{{paper.id}},<br/>
				<span style="margin:10px;">author: &#123;{{paper.author}}&#125;,</span><br/>
				<span style="margin:10px;">title: &#123;&#123;{{paper.title}}&#125;&#125;,</span><br/>
				<span style="margin:10px;">year: &#123;{{paper.year}}&#125;,</span><br/>
				{% if paper.journal %} <span style="margin:10px;">journal: &#123;&#123;{{paper.journal}}&#125;&#125;,</span><br/> {% endif %}
				{% if paper.booktitle %} <span style="margin:10px;">booktitle: &#123;&#123;{{paper.booktitle}}&#125;&#125;,</span><br/> {% endif %}
				{% if paper.month %} <span style="margin:10px;">month: &#123;{{paper.month}}&#125;,</span><br/> {% endif %}
				{% if paper.volume %} <span style="margin:10px;">volume: &#123;{{paper.volume}}&#125;,</span><br/> {% endif %}
				{% if paper.number %} <span style="margin:10px;">number: &#123;{{paper.number}}&#125;,</span><br/> {% endif %}
				{% if paper.series %} <span style="margin:10px;">series: &#123;{{paper.series}}&#125;,</span><br/> {% endif %}
				{% if paper.edition %} <span style="margin:10px;">edition: &#123;{{paper.edition}}&#125;,</span><br/> {% endif %}
				{% if paper.pages %} <span style="margin:10px;">pages: &#123;{{paper.pages}}&#125;,</span><br/> {% endif %}
				{% if paper.editor %} <span style="margin:10px;">editor: &#123;{{paper.editor}}&#125;,</span><br/> {% endif %}
				{% if paper.publisher %} <span style="margin:10px;">publisher: &#123;{{paper.publisher}}&#125;,</span><br/> {% endif %}
				{% if paper.address %} <span style="margin:10px;">address: &#123;{{paper.address}}&#125;,</span><br/> {% endif %}
				{% if paper.howpublished %} <span style="margin:10px;">howpublished: &#123;{{paper.howpublished}}&#125;,</span><br/> {% endif %}
				{% if paper.chapter %} <span style="margin:10px;">chapter: &#123;{{paper.chapter}}&#125;,</span><br/> {% endif %}
				{% if paper.organization %} <span style="margin:10px;">organization: &#123;{{paper.organization}}&#125;,</span><br/> {% endif %}
				{% if paper.school %} <span style="margin:10px;">school: &#123;{{paper.school}}&#125;,</span><br/> {% endif %}
				{% if paper.institution %} <span style="margin:10px;">institution: &#123;{{paper.institution}}&#125;,</span><br/> {% endif %}
				{% if paper.timestamp %} <span style="margin:10px;">timestamp: &#123;{{paper.timestamp}}&#125;,</span><br/> {% endif %}
				{% if paper.eprint %} <span style="margin:10px;">eprint: &#123;{{paper.eprint}}&#125;,</span><br/> {% endif %}
				{% if paper.archivePrefix %} <span style="margin:10px;">archivePrefix: &#123;{{paper.archivePrefix}}&#125;,</span><br/> {% endif %}
				{% if paper.keywords %} <span style="margin:10px;">keywords: &#123;{{paper.keywords}}&#125;,</span><br/> {% endif %}
				{% if paper.bibsource %} <span style="margin:10px;">bibsource: &#123;{{paper.bibsource}}&#125;,</span><br/> {% endif %}
				{% if paper.biburl %} <span style="margin:10px;">biburl: &#123;{{paper.biburl}}&#125;,</span><br/> {% endif %}
				{% if paper.url %} <span style="margin:10px;">url: &#123;{{paper.url}}&#125;,</span><br/> {% endif %}
				{% if paper.doi %} <span style="margin:10px;">doi: &#123;{{paper.doi}}&#125;,</span><br/> {% endif %}
				{% if paper.isbn %} <span style="margin:10px;">isbn: &#123;{{paper.isbn}}&#125;,</span><br/> {% endif %}
				{% if paper.issn %} <span style="margin:10px;">issn: &#123;{{paper.issn}}&#125;,</span><br/> {% endif %}
				{% if paper.note %} <span style="margin:10px;">note: &#123;{{paper.note}}&#125;,</span><br/> {% endif %}
				{% if paper.abstract %} <span style="margin:10px;">abstract: &#123;{{paper.abstract}}&#125;,</span><br/> {% endif %}
				}
			</div>
		</div>
	</li>
  {% endfor %}
  </ul></div>
{% endfor %}

<!---
### [](#header-3)Under review
MoBoGDL
-->


<hr> 

<div class="contactfooter"><a href="mailto:r.d.gaina@qmul.ac.uk"><i class="fas fa-envelope"></i></a> <a href="https://www.researchgate.net/profile/Raluca_Gaina"><i class="fab fa-researchgate"></i></a> <a href="https://scholar.google.co.uk/citations?user=tC5klQYAAAAJ"><i class="fab fa-google"></i></a> <a href="https://www.linkedin.com/in/raluca-gaina-347518114/"><i class="fab fa-linkedin"></i></a> <a href="https://twitter.com/b_gum22"><i class="fab fa-twitter"></i></a> <a href="https://publists.qmul.ac.uk/userprofile.html?uid=41431&em=false"><i class="fas fa-archive"></i></a></div>
