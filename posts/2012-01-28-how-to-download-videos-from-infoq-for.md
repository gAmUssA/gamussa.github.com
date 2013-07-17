---
layout: post
title: 'How to download videos from InfoQ for offline viewing'
date: 2012-01-28 06:15
comments: true
author: Viktor Gamov
categories: 
---

[![][1]][1]

From my humble opinion, [InfoQ][2] is one of best resources for developers nowadays. You can find lot of IT related stuff - interviews, articles, presentations slides and videos. And today I would like to talk about videos from InfoQ in particular. Is always good to have offline version to watch it during long commute, for instance. Unfortunately, InfoQ administration for some reasons not allow to download videos.   
However, I found very elegant solution how to do that. I did it on my MacOS X with Safari, probably it will work with Safari for Windows as well.

* Go to Safari Preferences, Advanced tab and activate Develop menu item

[![][4]][4]

* Change browser User Agent to iOS (iPad or iPhone)

[![][5]][5]

* Go to page that contains desired movie. For example, I tool this video [http://www.infoq.com/presentations/JVM-Performance-Tuning-twitter ][6]
* Thanks to InfoQ developers for providing HTML5 interface with video tag support. Now you can open page source (Right click → View Source) and search for that tag. In source tag you can find full url to desired movie

[![][7]][7]

* Use _curl -O_ or simply paste link to address bar of Safari and download video
* Enjoy! 



[1]: http://cdn4.infoq.com/styles/i/logo-infoq.gif
[2]: http://www.infoq.com/
[4]: https://img.skitch.com/20120128-83adqeb8wr6c67dbdhmduh93e2.jpg
[5]: https://img.skitch.com/20120128-x5fg6rsj7cwmpnj2qscu8t2431.jpg
[6]: http://www.infoq.com/presentations/JVM-Performance-Tuning-twitter
[7]: https://img.skitch.com/20120128-x9nf7y47136yd3ry28du53s1ec.jpg