# Google Data Manager API Conversion Events — PowerClick

Server-side Google Tag Manager tag that sends your conversions to Google Ads (Data Manager API), plus [PowerClick](https://powerclick.io) reporting:
after each send it posts Google Ads (Data Manager API)'s response to PowerClick with the click ID and PowerClick's spore ID, so PowerClick
can show delivery health and tie each conversion back to the ad click.

## Based on Stape's template

A modified version of [stape-io/google-conversion-events-tag](https://github.com/stape-io/google-conversion-events-tag) by [Stape](https://stape.io), licensed under the
Apache License 2.0, at commit `ee54d37` (2026-07-23). Stape's settings and behaviour are unchanged; see Stape's
documentation for the Google Ads (Data Manager API) setup. Changes:

- A **PowerClick** field group: **PowerClick Tenant ID**, **PowerClick Event Name (optional)**.
- After the Google Ads (Data Manager API) request, one POST of the response to `https://ingest.powerclick.io` for your account.
- Permissions: *Sends HTTP requests* adds `https://ingest.powerclick.io/*`; *Reads cookies* adds `__spore_id`.
- Name and brand: PowerClick. Stape's tests are not included (they assert Stape's exact requests).

## Setup

1. Server container: add the template from the Community Template Gallery.
2. Configure the Google Ads (Data Manager API) fields exactly as with Stape's template.
3. In the **PowerClick** group, enter your **PowerClick Tenant ID**.

Problems with Google Ads (Data Manager API) delivery itself: compare with Stape's template. Problems with PowerClick reporting: open an
issue here.
