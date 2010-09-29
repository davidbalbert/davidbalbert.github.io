--- 
wordpress_id: 14
layout: post
title: Etiquette Algorithms
wordpress_url: http://dave.is/blogging/?p=14
---
<p><a href="#update" name="update_notice">&darr;</a> <strong>Updated:</strong> September 2<sup>nd</sup>, 2009.</p>

<h2 id="elevator_etiquette">Elevator Etiquette</h2>

<p>I have spent a fair amount of time in elevators over the course of my life. Elevators are awkward places to be. You look at the ceiling, check your watch, and you <em>definitely</em> don&#8217;t make eye contact. If you know someone in the elevator it&#8217;s probably just as bad. Odds are it&#8217;s someone you don&#8217;t see often, which means you are forced to make small talk for the remainder of the ride. No fun.</p>

<p>There&#8217;s another thing that happens on elevators. You move around to maintain your personal space as people get on and off. Its an algorithm that&#8217;s pretty well defined, and everyone seems to know it, although no one ever talks about it. Because I think about this stuff a lot, I&#8217;ve decided to try and codify it. This is what happens when a person (let&#8217;s call him <code class="inline">person a</code>) enters the elevator:</p>

<pre><code>if (elevator is empty)
    stand anywhere on the perimeter
else
    if (distance between people along the perimeter > perimeter threshold)
        person a stands on the perimeter
        everyone else moves along the perimeter to equalize distance between people
    else
        person a stands near entrance
        everyone else moves along the perimeter to maximize the approximately
          circular area surrounding them
</code></pre>

<p>The algorithm is pretty simple. The idea is to maximize the area that surrounds you with a caveat. That caveat is that it seems desirable to have everyone stand on the perimeter, to a point where that can be more important than maximizing your space. This is done until some threshold distance between each person along the perimeter (let&#8217;s call it the <code class="inline">perimeter threshold</code>) is crossed and everyone in the elevator begins to spread out over the entire area. This seems to happen pretty regularly and accurately and everyone just seems to know how its done.</p>

<h2 id="urinal_etiquette">Urinal Etiquette</h2>

<p>There&#8217;s another etiquette algorithm that I know about. This one is exclusive to men and involves deciding which urinal to use in a row of urinals. Here&#8217;s how I see it:</p>

<pre><code>if (bathroom is empty)
    pick a urinal close to the ends of the row
else if (urinals have dividers)
    if (urinal use ratio &lt; 0.2)
        pick a urinal at least 2 spaces away
    else
        pick any urinal, with preference given to urinals are flanked
          by at least one empty one
else
    if (urinal use ratio &lt; 0.2)
        pick  a urinal at least 6 spaces away
    else
        if (there are urinals that are flanked by two empty ones)
            pick one
        else
            if (you really have to go or you have little shame)
                pick any urinal
            else
                wait it out until there is a urinal available that is flanked by two
                  empty ones and then use it
</code></pre>

<p>Send me your corrections and comments. I bet the algorithms are a bit more nuanced than this. Are there any other algorithms that we all just know? I can&#8217;t think of any more off the top of my head, but I&#8217;m sure there are some.</p>

<p><a name="update"></a><strong>Update:</strong> Randall Munroe of <a href="http://www.xkcd.com/">XKCD</a> fame has a rather thorough <a href="http://blag.xkcd.com/2009/09/02/urinal-protocol-vulnerability/">discussion</a> of the urinal problem that is really worth reading. <a href="#update_notice">&uarr;</a></p>
