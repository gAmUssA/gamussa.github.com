---
title: "Tempus Privacy Policy"
layout: "single"
url: "/tempus/privacy/"
summary: "Privacy policy for Tempus, a world clock and time zone converter for iPhone and Apple Watch"
ShowToc: false
ShowBreadCrumbs: false
ShowReadingTime: false
ShowShareButtons: false
comments: false
---

**Effective date:** September 1, 2026
**Developer:** Viktor Gamov (viktor@gamov.io)

Tempus is a world clock and time zone converter for iPhone and Apple Watch. This policy explains what data the app handles and where it goes.

## Summary

- Tempus has **no user accounts**, **no advertising**, **no analytics**, and **no third‑party SDKs**.
- We do not collect, sell, or share personal data. We never see your data.
- Everything you create in Tempus stays on your devices and, if you use iCloud, in your private iCloud database.

## Data the app stores

| Data | Where it is stored | Why |
|------|--------------------|-----|
| Clocks you add (city, time zone, custom name, emoji, color tag, order) | On device (SwiftData) and, when iCloud is enabled on your device, in your **private** iCloud (CloudKit) database | To show your clocks and keep them in sync across your iPhone, Apple Watch and other devices signed into your iCloud account |
| Preferences (12/24‑hour format, analog/digital, weather units, indicator colors, working hours) | On device; some preferences sync via iCloud | To remember how you like Tempus to look and work |
| Cached weather for the cities you added | On device, in the app's container shared with the widget and watch app | To show weather without refetching it every time you open the app |

We (the developer) have no access to your iCloud data. Apple's [iCloud privacy](https://www.apple.com/legal/privacy/) terms apply to data stored in your iCloud account.

## Data sent to Apple services

- **Weather.** When weather is enabled, Tempus asks **Apple Weather (WeatherKit)** for conditions at the coordinates of the *cities you added*. Tempus does not request or use your device location. Apple's [WeatherKit attribution and legal terms](https://weatherkit.apple.com/legal-attribution.html) apply.
- **iCloud.** If iCloud is enabled, your clocks and preferences sync through Apple's CloudKit service in your private database.

No data is sent to the developer or to any other third party.

## Permissions

- **Calendar (write only).** When you export a meeting from the Meeting Finder, Tempus asks for *write‑only* access to add that single event with its time zone information. Tempus never reads your existing events. You can also export an .ics file instead of granting calendar access.

## Apple Watch, widgets and complications

The watch app, complications and Home Screen widgets read the same clock data from the app's shared container or from the watch's own copy synced via Watch Connectivity. No additional data is created.

## Children

Tempus is not directed at children under 13 and does not knowingly collect information from anyone.

## Your choices

- Delete a clock in the app to remove it from your device and iCloud.
- Turn off iCloud for Tempus in iOS Settings › [your name] › iCloud › Apps Using iCloud to stop syncing.
- Delete the app to remove all local data.

## Changes

We will update this page when the policy changes and update the effective date above.

## Contact

Questions about privacy: **viktor@gamov.io**
