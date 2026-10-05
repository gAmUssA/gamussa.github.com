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

Koima uses Apple's HealthKit framework on **both** the Apple Watch and the iPhone. Health access is optional, you grant it separately on each device, and you can revoke it at any time.

| Device | Health data | Direction | Why |
|--------|-------------|-----------|-----|
| Apple Watch | Heart rate | **Read** during a nap | To show a live reading on the countdown and an average in the post-nap summary |
| Apple Watch | Sleep analysis | **Written** once, when a nap completes | To record the nap in Apple Health alongside the rest of your sleep |
| iPhone | Sleep analysis | **Read** | To show your nap history in the iPhone app |

Koima records completed naps as sleep samples in Apple Health from the Apple Watch app. On iPhone, Koima reads only the sleep samples created by its Apple Watch app to display your Koima nap history.

### What "only Koima's own records" actually means

We want to be precise here, because the distinction is easy to blur and we would rather state it than let a permission sheet imply it.

**Apple Health's permission is for the whole Sleep category — not for Koima's own records.** iOS provides no way to grant an app access to only the sleep samples that app wrote. So when you allow Koima to read Sleep on your iPhone, you are granting access to sleep data in Apple Health that you permit, which may include sleep recorded by Apple Watch itself or by other apps.

**Koima narrows that itself.** It asks Apple Health only for samples whose source is Koima's own Apple Watch app, and it checks that source again before anything is shown to you. Sleep from any other source is not displayed, not retained by Koima, and not sent anywhere.

That narrowing is a choice in how Koima queries, not a restriction the system places on it. The honest version is: the permission is broad, and we use a narrow slice of it.

Koima also keeps **no copy of your nap history**. The iPhone app reads from Apple Health each time you open the history and holds the results only while you are looking at them. There is no second database of your naps inside Koima.

Your sleep and heart-rate data remain in Apple Health on your devices. Koima does not send Health data to our servers, use it for advertising or marketing, or share it with third parties.

In detail:

- It **stays on your devices and in Apple Health**. It is not transmitted to the developer or to any third party.
- It is **never used for advertising or marketing purposes**.
- It is **never used for data mining**, and never sold or shared with third parties, including data brokers.
- It is used only to provide the nap features described above.

### Revoking Health access

Health permission is **per app, per device**. Koima on Apple Watch and Koima on iPhone hold separate permissions, and changing one does not change the other.

- Revoking on the **Apple Watch** stops the heart-rate reading and stops new naps being written to Apple Health. It does **not** stop the iPhone app reading sleep samples that are already there.
- Revoking on the **iPhone** stops the nap history being read and displayed. It does **not** stop the watch writing new naps to Apple Health.

To stop both, revoke both. Each can be reviewed in the Health app on your iPhone, under **Sharing › Apps**.

The nap timer, the smart wake and the alarm keep working with Health access revoked on either device or both. What you lose is the heart-rate readout, the Health record, and the iPhone nap history.

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

- Revoke Health access in the Health app under Sharing › Apps. Remember it is per app and per device: revoke for the Apple Watch app to stop heart-rate reading and new sleep records, and for the iPhone app to stop the nap history being read. See [Revoking Health access](#revoking-health-access) above.
- Turn off Phone Alarm mode in the app to stop any information leaving the watch.
- Delete a sleep sample in the Health app to remove that record.
- Delete the app to remove all local data.

## Changes

We will update this page when the policy changes and update the effective date above.

## Contact

Questions about privacy: **support@gamov.io**
