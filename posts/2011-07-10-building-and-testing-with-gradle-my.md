---
layout: post
title: 'Building and Testing with Gradle - My Book Review'
date: 2011-07-10 20:57
comments: true
author: Viktor Gamov
categories: 
---
    

[![][1]][1]

Last month I participated in JAXConf conference on San Jose, CA. There was many talks related to agile development and code quality stuff. And after that event I started looking to [Gradle][2] - next generation build tool. Couple weeks later I found a [Building and Testing with Gradle][3] written by git evangelists Tim Berglundand ( [@tlberglund][4]) and Matthew McCullough ([@matthewmccull][5]).  
  
Book very focused and easy to read. I got[ my dirty cheap ebook version][6] on thursday night, read this book during my commute to work and now come up with this review.  
[][7]  
Looking at the [table of contents][8], you can see the book covers big part of questions.  
What this book is about:  
  

1. How to configure your first build
2. Building Java and Groovy projects
3. Protect you investments and reuse you ant and maven scripts.
4. Integrate code quality routines and popular testing frameworks with gradle build
5. Modularize your project

  
What this books isn't about:  
  

* It's not a cookbook. 

  
  
This books gives you great overview of gradle infrastructure, but there isn't ready-to-use solutions. If you want to have Problem-Solution reading please take a look on [Gradle cookbook ][9]on official wiki. But still, this book is very practical.  
  

* Plugin development

  
Gradle provides lot of functionality for customizing you gradle build. But it's imposible to cover each and every aspects of building process on particular company or project. This book doesn't contain information about developing custom plugins for non-java applications. But is you want to start building your own gradle stuff - [welcome to wiki][10]  
  
**Summary:**  
If you suffered enough from Ant and Maven XML-configs and custom workarounds, want improve you productivity while developing build files for your app and passionate about DSL and Groovy, I encourage you to take a look at gradle and Book will help you kick-off your gradle journey.  
  
**After reading - go code!**  
After you done with book, go to [GitHub repository][11] and get I book's source code. Then go to [another GitHub repo][12] and get gradle sources and start to participate and contribute to Gradle project.

[1]: http://covers.oreilly.com/images/0636920019909/lrg.jpg
[2]: http://www.gradle.org/
[3]: http://oreilly.com/catalog/0636920019909/
[4]: http://twitter.com/tlberglund
[5]: http://twitter.com/matthewmccull
[6]: https://twitter.com/gamussa/status/89181037036449792
[7]: 
[8]: http://oreilly.com/catalog/0636920019909#toc
[9]: http://wiki.gradle.org/display/GRADLE/Cookbook
[10]: http://gradle.codehaus.org/Plugins#Plugins-WritingCustomPlugins
[11]: https://github.com/gradleware/oreilly-gradle-book-examples
[12]: https://github.com/gradle/gradle