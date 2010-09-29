---
wordpress_id: 14
layout: post
title: Etiquette Algorithms
wordpress_url: http://dave.is/blogging/?p=14
---

[↓][1] **Updated:** September 2nd, 2009.

## Elevator Etiquette

I have spent a fair amount of time in elevators over the course of my life. Elevators are awkward places to be. You look at the ceiling, check your watch, and you _definitely_ don't make eye contact. If you know someone in the elevator it's probably just as bad. Odds are it's someone you don't see often, which means you are forced to make small talk for the remainder of the ride. No fun.

There's another thing that happens on elevators. You move around to maintain your personal space as people get on and off. Its an algorithm that's pretty well defined, and everyone seems to know it, although no one ever talks about it. Because I think about this stuff a lot, I've decided to try and codify it. This is what happens when a person (let's call him `person a`) enters the elevator:


    if (elevator is empty)

        stand anywhere on the perimeter

    else

        if (distance between people along the perimeter > perimeter threshold)

            person a stands on the perimeter

            everyone else moves along the perimeter to equalize distance between people

        else

            person a stands near entrance

            everyone else moves along the perimeter to maximize the approximately

              circular area surrounding them


The algorithm is pretty simple. The idea is to maximize the area that surrounds you with a caveat. That caveat is that it seems desirable to have everyone stand on the perimeter, to a point where that can be more important than maximizing your space. This is done until some threshold distance between each person along the perimeter (let's call it the `perimeter threshold`) is crossed and everyone in the elevator begins to spread out over the entire area. This seems to happen pretty regularly and accurately and everyone just seems to know how its done.

## Urinal Etiquette

There's another etiquette algorithm that I know about. This one is exclusive to men and involves deciding which urinal to use in a row of urinals. Here's how I see it:


    if (bathroom is empty)

        pick a urinal close to the ends of the row

    else if (urinals have dividers)

        if (urinal use ratio < 0.2)

            pick a urinal at least 2 spaces away

        else

            pick any urinal, with preference given to urinals are flanked

              by at least one empty one

    else

        if (urinal use ratio < 0.2)

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


Send me your corrections and comments. I bet the algorithms are a bit more nuanced than this. Are there any other algorithms that we all just know? I can't think of any more off the top of my head, but I'm sure there are some.

**Update:** Randall Munroe of [XKCD][2] fame has a rather thorough [discussion][3] of the urinal problem that is really worth reading. [↑][4]

 [1]: #update

 [2]: http://www.xkcd.com/

 [3]: http://blag.xkcd.com/2009/09/02/urinal-protocol-vulnerability/

 [4]: #update_notice
