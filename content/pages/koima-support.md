---
title: "Koima Support"
layout: "single"
url: "/koima/support/"
summary: "Support, FAQ and known limitations for Koima, a smart nap timer for Apple Watch"
ShowToc: false
ShowBreadCrumbs: false
ShowReadingTime: false
ShowShareButtons: false
comments: false
---

Koima is a nap timer for Apple Watch. Pick a length, rest, and near the end it watches for movement and wakes you as you start to stir.

## Contact

Email **support@gamov.io** with your watchOS version, the app version (Settings › About in the app) and a short description of what happened. We aim to reply within a few business days.

If you are reporting a missed or late wake, it helps enormously to include: the nap length, whether a Focus was on, whether the watch was on silent, and whether the iPhone backup alarm was turned on.

## Frequently asked questions

**How do I start a nap?** Open Koima on your watch and tap a length — 10, 20, 30 or 60 minutes. The countdown ring shows the time remaining and the time you will wake.

**How does the smart wake decide when to wake me?** For the last few minutes before your chosen time, Koima watches wrist motion. Sustained movement reads as you starting to surface, and it wakes you then. If you stay still through that window, it wakes you at the time you picked.

**Can I change the length mid-nap?** Yes. Use the −5 and +5 buttons on the nap screen. Stop asks you to confirm, so you cannot end a nap with a stray tap.

**Do I need my iPhone nearby?** Not for a normal nap. The watch app runs independently. The optional iPhone backup alarm does need your paired iPhone in range.

**What does Koima do with my health data?** With your permission it reads heart rate from Apple Health during the nap, and writes one sleep sample when the nap completes. That data stays on your device and in Apple Health. It is never used for advertising or marketing, never mined, and never shared. See the [privacy policy](/koima/privacy/).

**Does Koima work without Apple Health access?** Yes. You lose the heart-rate readout and the sleep record. The timer and the smart wake are unaffected.

**How do I turn the alarm sound off?** In the app's settings, turn off the alarm sound to get wrist haptics only. Haptics alone are a gentler and less reliable wake — see the limitations below.

## Known limitations

These are real constraints, not bugs. Please read them before you rely on Koima for something that matters.

**Focus and notification settings can suppress the alarm.** Koima's alarm is delivered as a time-sensitive notification. If notifications are turned off for Koima, or if the Focus you are using denies time-sensitive alerts, the alarm can be silenced or delayed. Koima cannot override that, and it cannot always detect it. Check **Settings › Notifications › Koima** on your watch and make sure notifications and Time Sensitive alerts are allowed.

**Silent mode and volume affect the wake.** The alarm tone plays through the watch speaker. Silent mode, a low volume, or audio routed to connected Bluetooth headphones that you are not wearing can all mean you do not hear it.

**Phone Alarm mode needs a paired iPhone in range.** If your iPhone is out of Bluetooth and Wi-Fi range, off, or has not granted alarm permission, the backup alarm may not be scheduled. It is a backup, not a second guarantee.

**The smart wake is a best effort, not a sleep stage measurement.** Koima infers "you are starting to stir" from wrist movement in the final minutes. It is not a clinical sleep tracker and does not measure sleep stages.

**Battery and background limits apply.** watchOS decides how much time an app gets in the background. Low Power Mode, a very low battery, or the system reclaiming resources can affect a nap in progress.

**Do not use Koima as a medical device or as your only alarm for something critical.** It is a nap timer. For anything you must not miss, set a second alarm.

## Privacy

Read the [privacy policy](/koima/privacy/). Koima has no accounts, ads, analytics or tracking, and no server.
