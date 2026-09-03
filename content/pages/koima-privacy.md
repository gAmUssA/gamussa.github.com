---
title: "Koima Privacy Policy"
layout: "single"
url: "/koima/privacy/"
summary: "Privacy policy for Koima, a smart nap timer for Apple Watch"
ShowToc: false
ShowBreadCrumbs: false
ShowReadingTime: false
ShowShareButtons: false
comments: false
---

**Effective date:** September 3, 2026
**Developer:** Viktor Gamov (support@gamov.io)

Koima is a nap timer for Apple Watch, distributed as an iPhone app that embeds the watch app. This policy explains what data the app handles and where it goes.

## Summary

- Koima has **no user accounts**, **no advertising**, **no analytics**, and **no third-party SDKs**.
- We do not collect, sell, or share personal data. We never see your data.
- Health data read from and written to Apple Health stays on your device and in Apple Health.
- There is no Koima server. Nothing is uploaded to us, because there is nowhere to upload it to.

## Health data

Koima uses Apple's HealthKit framework. Health access is optional — you grant it, and you can revoke it at any time in the Health app under Sharing › Apps.

| Health data | Direction | Why |
|-------------|-----------|-----|
| Heart rate | **Read** during a nap | To show a live reading on the countdown and an average in the post-nap summary |
| Sleep analysis | **Written** once, when a nap completes | To record the nap in Apple Health alongside the rest of your sleep |

How that health data is treated:

- It **stays on your device and in Apple Health**. It is not transmitted to the developer or to any third party.
- It is **never used for advertising or marketing purposes**.
- It is **never used for data mining**, and never sold or shared with third parties, including data brokers.
- It is used only to provide the nap features described above.
- Revoking Health access stops both the reading and the writing. The timer and the smart wake continue to work.

## Motion data

During the last minutes of a nap, Koima reads the watch's accelerometer to detect when you begin to stir. Those motion readings are used in the moment, on the device, to decide when to wake you. They are not stored beyond the nap, and never leave the watch.

## Phone Alarm mode

Phone Alarm mode is optional and off unless you turn it on. When it is on, Koima sends the alarm's **identifier and its fire time** from the watch to your **own paired iPhone**, over Apple's Watch Connectivity, so the iPhone can schedule a backup alarm. That information goes to your iPhone and nowhere else. No nap content, health data or personal information is included, and nothing is sent over the internet.

## Data the app stores on your device

| Data | Where it is stored | Why |
|------|--------------------|-----|
| The current nap (start time, wake time, chosen length) | On device, in the app's own container shared with the watch complication | To keep the countdown, the alarm and the complication in agreement, and to restore a nap if the app is relaunched |
| Preferences (wake style, alarm sound, backup-alarm mode, onboarding state) | On device | To remember how you like Koima to work |
| Nap summary values (duration, average heart rate, time to settle) | On device, for the nap you just finished | To show the summary screen |

## Notifications

Koima schedules local notifications on your own device as the nap's alarm. They are created and delivered locally by iOS and watchOS. There are no push notifications and no notification server.

## Subscriptions

Koima Plus is an auto-renewing subscription sold through the App Store. **Purchases are processed by Apple.** We receive no payment details — no card number, no billing address, no Apple Account identity. Apple's [privacy policy](https://www.apple.com/legal/privacy/) covers the purchase itself.

## What we do not do

- No accounts, sign-in or user profiles.
- No analytics, telemetry, crash-reporting SDKs or advertising SDKs.
- No tracking across apps or websites, and no data shared for tracking purposes.
- No location collection.
- No servers operated by the developer.

## Children

Koima is not directed at children under 13 and does not knowingly collect information from anyone.

## Your choices

- Revoke Health access in the Health app under Sharing › Apps to stop all reading and writing of health data.
- Turn off Phone Alarm mode in the app to stop any information leaving the watch.
- Delete a sleep sample in the Health app to remove that record.
- Delete the app to remove all local data.

## Changes

We will update this page when the policy changes and update the effective date above.

## Contact

Questions about privacy: **support@gamov.io**
