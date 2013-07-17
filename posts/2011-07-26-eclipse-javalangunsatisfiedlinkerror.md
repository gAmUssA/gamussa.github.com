---
layout: post
title: 'Eclipse: java.lang.UnsatisfiedLinkError: Cannot load 32-bit SWT libraries on 64-bit JVM'
date: 2011-07-26 04:22
comments: true
author: Viktor Gamov
categories: 
---

[![][1]][1]

Last weekend spend in setup of environment for eclipse plug-in development. I have task to fix and update one plugin. This is add-on to Flash Builder.  But before adding something, it's good to run that plugin before. My environment is Mac OS X 10.7 Lion, Eclipse 3.6 (32bit because FB not supported 64bit version of Eclipse) and Flash Builder 4.5. But I faced with odd exception

    !SESSION 2011-07-25 23:59:39.350
    -----------------------------------------------

    eclipse.buildId=M20110210-1200

    java.version=1.6.0_26

    java.vendor=Apple Inc.

    BootLoader constants: OS=macosx, ARCH=x86, WS=cocoa, NL=en_US

    Framework arguments:  -product org.eclipse.epp.package.jee.product

    Command-line arguments:  -product org.eclipse.epp.package.jee.product -data
    /Users/apple/Workspaces/work/../runtime-EclipseApplication -dev file:/Users/apple/Workspaces/work/.metadata/.plugins/org.eclipse.pde.core/Eclipse
    Application/dev.properties -os macosx -ws cocoa -arch x86 -consoleLog



    !ENTRY org.eclipse.osgi 4 0 2011-07-25 23:59:57.129

    !MESSAGE Application error

    !STACK 1

    java.lang.UnsatisfiedLinkError: Cannot load 32-bit SWT libraries on 64-bit
    JVM

     at org.eclipse.swt.internal.Library.loadLibrary(Library.java:197)

     at org.eclipse.swt.internal.Library.loadLibrary(Library.java:174)

     at org.eclipse.swt.internal.C.(C.java:21)

     at org.eclipse.swt.internal.cocoa.NSThread.isMainThread(NSThread.java:33)

     at org.eclipse.swt.graphics.Device.(Device.java:116)

     at org.eclipse.swt.widgets.Display.(Display.java:671)

     at org.eclipse.swt.widgets.Display.(Display.java:662)

     at org.eclipse.ui.internal.Workbench.createDisplay(Workbench.java:708)

     at org.eclipse.ui.PlatformUI.createDisplay(PlatformUI.java:161)

     at org.eclipse.ui.internal.ide.application.IDEApplication.createDisplay(IDEApplication.java:145)

     at org.eclipse.ui.internal.ide.application.IDEApplication.start(IDEApplication.java:88)

     at org.eclipse.equinox.internal.app.EclipseAppHandle.run(EclipseAppHandle.java:196)

     at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.runApplication(EclipseAppLauncher.java:110)

     at org.eclipse.core.runtime.internal.adaptor.EclipseAppLauncher.start(EclipseAppLauncher.java:79)

     at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:369)

     at org.eclipse.core.runtime.adaptor.EclipseStarter.run(EclipseStarter.java:179)

     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)

     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)

     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)

     at java.lang.reflect.Method.invoke(Method.java:597)

     at org.eclipse.equinox.launcher.Main.invokeFramework(Main.java:620)

     at org.eclipse.equinox.launcher.Main.basicRun(Main.java:575)

     at org.eclipse.equinox.launcher.Main.run(Main.java:1408)

     at org.eclipse.equinox.launcher.Main.main(Main.java:1384)

    An error has occurred. See the log file

    /Users/apple/Workspaces/runtime-EclipseApplication/.metadata/.log.

  

Mac OS X shipped with 2 versions of JVM - 32 bit and 64 bit accordingly. So, 
First I tried to change order of JVM preference from /Application/Utilities/Java 
Preferences but it didn't work.

[![][3]][4]

After consulting with colleagues and googling I come up with solution. I went 
to Eclipse→Preferences→Java→Installed JRE and add default JVM argument **-d32 
**(must be small d)

[![][5]][6]

This command forces to use 32bit JVM. Happy coding!


[1]: http://4.bp.blogspot.com/-9dnzyV85GIY/Ti5AjeUNXJI/AAAAAAAAA0A/o07suDvhURw/s1600/1311653968_eclipse.png
[3]: http://3.bp.blogspot.com/-isacmmvTbSE/Ti4-JJeYuwI/AAAAAAAAAzw/W_U-0Xap5L8/s640/Screen+Shot+2011-07-26+at+12.08.30+AM.png
[4]: http://3.bp.blogspot.com/-isacmmvTbSE/Ti4-JJeYuwI/AAAAAAAAAzw/W_U-0Xap5L8/s1600/Screen+Shot+2011-07-26+at+12.08.30+AM.png
[5]: http://2.bp.blogspot.com/-e49-TQlstWw/Ti4_nvylakI/AAAAAAAAAz4/EKfU03X9lxE/s400/Screen+Shot+2011-07-26+at+12.16.05+AM.png
[6]: http://2.bp.blogspot.com/-e49-TQlstWw/Ti4_nvylakI/AAAAAAAAAz4/EKfU03X9lxE/s1600/Screen+Shot+2011-07-26+at+12.16.05+AM.png