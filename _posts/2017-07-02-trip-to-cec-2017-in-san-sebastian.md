---
layout: post
comments: true
category : [PhD-Life, Conferences, Travel]
short_title: CEC 2017
tagline: ": when there was sea food, a palace and big waves."
tags : [phd, event, first]
image1: post8/logo_short.png
image2: post8/logo_medium.png
image3: post8/logo_medium.png
finalimage: post8/finalimage.png
---
{% include JB/setup %}

Hello and welcome. 

Presentation download: [(PPTX)]({{ site.url }}/assets/ppt/cecPpt.pptx) [(PDF)]({{ site.url }}/assets/pdf/cecPdf.pdf).

A few weeks ago (I know, I'm slow at updating this blog) I was in Spain for the Conference on Evolutionary Computation (CEC) 2017, which happened to take place in San Sebastian this year. Considering my timing issues in Amsterdam, for this one I arrived a few days early just to be sure I'd make it on time to my presentation. And also to enjoy the city and a little holiday a bit more before the conference. One other student and friend from the University of Essex, Kamolwan Kunanusont, who was also presenting at the conference, joined me for these early days. There was one day that was warm and sunny and we did get to enjoy the beach before the cold and the rain arrived. It was a great experience regardless, San Sebastian is absolutely gorgeous and a recommended visit for anyone who's not been there, I will definitely have to return at some point.

I had two jobs at this conference (besides meeting certain key people, some of which are now my Facebook friends, win!): presenting the results of the **2017 2-player GVGAI Competition** and presenting my paper entitled **"Population Initializaion Techniques for Rolling Horizon Evolution in General Video Game Playing"**. (Yes, I do have some long titles in my papers).

I'll start with my presentation first. I've had a comment in the past from someone who came across my blog post about my EvoStar presentation that they would like more than my slides. But hey, your loss for not being at the conference, it was a great presentation! (I think I'd also had some cider right before, oh dear). But I do want to add something to the slides (which can be found at the top of this post). And that is the questions that I was asked (or part of them, my memory may be worse than I thought; I'll definitely have to write them down right after next time for this purpose.) I'll also add quick answers to them all, although discussion is highly encouraged if you are interested in knowing more!

<img style="margin:15px;width:250px;float:left" src="{{ site.url }}/assets/images/post3/mepresentrh.png" />

- **Have you considered modifying the budget given to the MCTS seeding (paper presented it as 0.5 seeding and 0.5 evolution)?** We have briefly experimented with several different budget allocations in the beginning, but no in-depth study on this has been performed; it will definitely be a point of further work.
- **(One of the problems with the algorithm described in all papers so far is it is not able to search the solution space efficiently enough, therefore Random Search sometimes outperforms it due to simply having more options to choose from). Have you tried using novelty search and how do you think it would help the algorithm?** We have not tried that, the work so far has been focused on gathering different things tried in literature and see what actually works on this problem. Novelty search has not been applied to a RHEA algorithm so far, but it might indeed be the thing we need to break the performance limit we seem to be bumping against.
- **(We use a 900 Forward Model call budget for all algorithms in the experiments, the average vanilla RHEA can achieve in GVGAI games in 40ms execution time). What if the budget was increased?** Firstly, that would not be a real-time game anymore and that is the problem we are trying to solve. We do have increased budgets in the EvoStar paper where we are analysing the vanilla version and performance does increase - but our goal is to make the search efficient enough within the limited budget.
- Some open room discussion that everyone in the room joined in (slightly less traditional Q&A session, this one), although I can't seem to remember what was the main topic.

Next presentation on RHEA will be at CIG 2017 in August for our latest paper, some very interesting work in there that I'll be happy to present.

<img style="margin:15px;width:250px;float:right" src="{{ site.url }}/assets/images/post3/mepresentgvgai.png" />

For the other item on the list, I joined (or really, he joined me, I should say, since I am the chair of this track!) Diego Perez-Liebana, the big GVGAI boss and my supervisor, to present the results of the competition. The full results can be found [here](http://gvgai.net/gvg_rankings_conf_2p.php?rg=2006).

And these are the winners!

**Winner**: ToVo2 {Tom Vodopivec (University of Ljubljana), Slovenia.}
**1st runner up**: ehauckdo  {Eduardo Hauck (Universidade Federal de Juiz de Fora), Brazil.}
**2nd runner up**: not2048 {Piers Williams, Joseph Walton Rivers (University of Essex), Damien Anderson (University of Strathclyde), UK.}

Congratulations! And thank you to everyone who participated this year, it turned out to be a very close competition. :)

We also made a last minute decision right before presenting the results: someone (*cough* Diego *cough*) forgot about a private Spanish league we had run early this year for a course at Universidad Carlos III de Madrid (UC3M), which included **15** other entries! So we will be running these on the still hidden test set, and select the best from the private league and CEC for a final showdown presented at CIG 2017!

Check [this](https://www.facebook.com/media/set/?set=a.1582491585118341.1073741834.100000725447762&type=1&l=bc504c657b) album for more pictures from the conference, [this](https://www.facebook.com/media/set/?set=a.1582496711784495.1073741835.100000725447762&type=1&l=ab7c83ba9a) and [this](https://www.facebook.com/media/set/?set=a.1582521538448679.1073741836.100000725447762&type=1&l=cea84079ca) for more pictures from my Spain trip (San Sebastian and Madrid) before and after the conference.

