---
layout: default
---



# Introduction

<p>Hi there! This resource was created specifically for QMUL MSc Game AI Project students. If you do not fit in that category, then a lot of these resources will probably be inaccessible or not very useful to you. However, maybe you do find something interesting!</p>

<p>For QMUL MSc Game AI Project students: this page wishes to offer a helping hand in getting started with your MSc project. It aims to introduce several concepts that are usually assumed you already know. And you might already know all of this, in which case, awesome! The hope is that you find something useful here to take away and use in your project, even if this is just some inspiration.</p>

<p>The page is structured in several tabs:
<ul>
	<li> Writing guide, specifically aimed at research papers / project reports, but including:
		<ul>
			<li>Critical Literature Review</li>
			<li>Other writing tools</li>
		</ul>
	</li>
	<li> Some basic information for getting started with…
		<ul>
			<li>Java, with particular applications in Game AI</li>
			<li>Github and version control</li>
			<li>IntelliJ / PyCharm (IDEs for Java/Python)</li>
			<li>Latex/Overleaf for report writing</li>
		</ul>
		</li>
	<li> Support page with links to various useful resources - please check it out!</li>
	</ul>
</p>


# Links

An assortment of other useful links:

<ul>
	<li> <a href="http://gameai.eecs.qmul.ac.uk">QMUL Game AI group website</a>  </li>
	<li> <a href="https://calendar.google.com/calendar?cid=MXI5bjNwaTAwaWIydm5tM2RlZ3Nzb3Z2czBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ">QMUL Game AI group calendar</a>  (we can also add you to the mailing list if you'd like to take part in our weekly meetings and seminars, contact your supervisor in this case)</li>
</ul><ul>
	<li> <a href="https://qmplus.qmul.ac.uk/pluginfile.php/2363262/mod_resource/content/2/How%20to%20Research%20Guide.pdf">QMUL How to research</a> </li>
	<li> <a href="https://qmplus.qmul.ac.uk/pluginfile.php/2363244/mod_resource/content/1/Guidance_for_Writing_Lab_Reports.pdf">QMUL Guidance for writing lab reports</a> </li>
	<li> <a href="https://www.qmul.ac.uk/library/academic-skills/">QMUL academic skills resources</a> </li>
	<li> <a href="https://qmplus.qmul.ac.uk/pluginfile.php/2363246/mod_resource/content/1/Harvard%20Referencing%20-%20Imperial.pdf">QMUL Harvard referencing</a> </li>
</ul><ul>
	<li> <a href="http://support.eecs.qmul.ac.uk/faq/newcomers/">EECS IT for new students</a> </li>
	<li> <a href="https://www.its.qmul.ac.uk/support/self-help/software/free-and-discounted-software/office365-proplus/">Install Office</a> </li>
</ul><ul>
	<li> <a href="https://docs.google.com/spreadsheets/d/1ySqFUBdchv_e6Dc9vt_8DrbfBtElIT01iimSdamdo00/edit?usp=sharing">Game AI conferences</a> </li>
	<li> <a href="https://gaigresearch.github.io/gameaisurvey">Game AI survey</a> </li>
	<li> <a href="http://www.kmjn.org/game-rankings/">Technical Games Research Groups World-Ranking</a> </li>
	<li> <a href="https://docs.google.com/spreadsheets/d/1oPvg0Um9ZdBBcsfKg4PSaMViVtU2SWW5tWZUbF_LjFc/edit#gid=0">Game Design talks</a> </li>
</ul><ul>
	<li> <a href="https://github.com/philippbayer/Things-a-scientist-is-suppposed-to-know">Things a scientist is supposed to know</a> </li>
	<li> <a href="https://www.nature.com/articles/d41586-018-07332-x?utm_source=fbk_nnc&utm_medium=social&utm_campaign=naturenews&sf201730242=1">"Twenty things I wish I’d known when I started my PhD"</a> </li>
	<li> <a href="https://huyenchip.com/2018/10/04/sotawhat.html">State-of-the-art script</a> </li>
	<li> <a href="https://getfuse.io/">Fuse</a> </li>
	<li> <a href="https://tinytools.directory/">Many tools for writing or others</a> </li>
</ul>

<img src="/assets/research-guide/new-revolution.jpg"/>
<br/><br/>

# Main
		
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Writing Guide')">Writing Guide</button>
  <button class="tablinks" onclick="openCity(event, 'Getting Started With ...')">Getting Started With ...</button>
  <button class="tablinks" onclick="openCity(event, 'Support')">Support</button>
</div>

<!-- Tab content -->
<div id="Writing Guide" class="tabcontent">

	<div class="tab">
	  <button class="tablinks2" onclick="openSubCat(event, 'General')">General</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Critical Literature Review')">Critical Literature Review</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Other Tools & Tips')">Other Tools & Tips</button>
	</div>

	<div id="General" class="tabcontent2">
		{% include writingguide.html %}
	</div>

	<div id="Critical Literature Review" class="tabcontent2">
		{% include writinglit.html %}
	</div>

	<div id="Other Tools & Tips" class="tabcontent2">
		{% include writingother.html %}
	</div>

</div>


<div id="Getting Started With ..." class="tabcontent">
	<div class="tab">
	  <button class="tablinks2" onclick="openSubCat(event, 'Github')">Github</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Latex/Overleaf')">Latex/Overleaf</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Java')">Java for Game AI</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Intellij')">IntelliJ/PyCharm</button>
	</div>

	<div id="Github" class="tabcontent2">
		{% include startgithub.html %}
	</div>

	<div id="Latex/Overleaf" class="tabcontent2">
		{% include startoverleaf.html %}
	</div>

	<div id="Java" class="tabcontent2">
		{% include startjava.html %}
	</div>
	
	<div id="Intellij" class="tabcontent2">
		{% include startintellij.html %}
	</div>
</div>

<div id="Support" class="tabcontent">
	<div class="tab">
	  <button class="tablinks2" onclick="openSubCat(event, 'Resources')">Resources</button>
	  <button class="tablinks2" onclick="openSubCat(event, 'Twitter')">A Word From Twitter</button>
	</div>

	<div id="Resources" class="tabcontent2">
		{% include supportresources.html %}
	</div>

	<div id="Twitter" class="tabcontent2">
		{% include supporttwitter.html %}
	</div>

</div>


<hr>

<div class="contactfooter"><a href="mailto:r.d.gaina@qmul.ac.uk"><i class="fas fa-envelope"></i></a> <a href="https://www.researchgate.net/profile/Raluca_Gaina"><i class="fab fa-researchgate"></i></a> <a href="https://scholar.google.co.uk/citations?user=tC5klQYAAAAJ"><i class="fab fa-google"></i></a> <a href="https://www.linkedin.com/in/raluca-gaina-347518114/"><i class="fab fa-linkedin"></i></a> <a href="https://twitter.com/b_gum22"><i class="fab fa-twitter"></i></a> <a href="https://publists.qmul.ac.uk/userprofile.html?uid=41431&em=false"><i class="fas fa-archive"></i></a></div>
