# ELE-OI-03 — Published Starline T5 busway + tap-box weights (LA-PE structural input)

**Date:** 2026-06-11 · **Item:** ELE-OI-03 (busduct + tap-box weights as
load input to the LA-PE HAC structural analysis) · **Output:** the
busway load line added to
[ops/rfq/2026-06-10-SOW-louisiana-pe-structural.md](../rfq/2026-06-10-SOW-louisiana-pe-structural.md) §D1.

## Finding 1 — there is no "600T5"; the 600 A class is the 630T5 Global

The cluster BOM's first-source pick reads "Starline T5 600 A"
(ADC-CLU-BOM-001 E1). The published T5 selection guides list no 600 A
frame:

- US guide (Track Busway Product Selection Guide, REV2): T5 = 250 /
  400 / 800 A.
- Global & Metric guide (2023): T5 = 250 / 400 / **630** / 800 / 1000 /
  1250 A.

The 600 A-class catalog unit is the **630T5, Global system, rated
415 V, 4-pole + 100 % protective earth** — the 415 V rating matches the
cluster's 415/240 Vac Wye architecture directly (the US frames are
600 V-class). Feeds ELE-OI-01 (vendor/catalog confirmation): the
catalog number to confirm is a 630T5 Global frame, not a "600T5".

## Finding 2 — published straight-section weights

| Frame (4-pole w/ ground) | Published | lbs/ft |
|---|---|---|
| 250T5 (US) | 46 lbs / 10 ft | 4.6 |
| 400T5 (US) | 100 lbs / 10 ft | 10.0 |
| **630T5 (Global)** | **54.4 kg / 3 m** | **12.2** |
| 630T5 (Metric housing) | 69 kg / 3 m | 15.5 |
| 800T5 (US, w/ ground & 200 % N) | 152 lbs / 10 ft | 15.2 |

(The metric 630T5 and US 800T5 housings are the same ~69 kg-per-3 m
extrusion — the two guides cross-check.) **Design envelope for the
structural input: 15.5 lbs/ft** — covers the expected 630T5 Global
(12.2), every published T5 configuration of the class, and leaves the
Vertiv PowerBar iMPB alternate bounded until ELE-OI-01 locks the vendor.

## Finding 3 — published tap-box (plug-in unit) weights

Starline catalog, T5 Series Plug-Ins: **TBxxxT5 tap boxes — 25 lbs,
every published variant** (4-pole, /IG, /oversized-N, left/right).
Smaller CBM breaker-module units publish at 12 lbs; large E27
breaker units 31–35 lbs. **Design value: 25 lbs per box** for the
Deschutes-pattern box (32 A 3-phase protection, 2× IEC 60309 outlets —
TB-class enclosure). The Legrand Global Tap-Off Box brochure publishes
dimensions only (largest EB9 enclosure 459 × 230 × 67 mm — consistent
with a ~25 lb steel box).

## Finding 4 — support interface

Starline 630T5G installation manual: busway supports by others,
**maximum hanger spacing 3 m**; hangers slide in the housing top
channel (rod-hanger or bracket, GBHC-series couplers at joints). The
cluster plan (E1-04: ~10 hanger sets per 46 ft run ≈ 5 ft spacing) is
well inside the limit. End-feed unit weight is not published per frame —
carried as an 85 lb [W] allowance per run end, vendor to confirm with
the E1 quote.

## Sources (retrieved 2026-06-11, text-extracted from vendor PDFs)

- [Starline Track Busway Product Selection Guide REV2 (US)](https://www.sps-sales.com/wp-content/uploads/2016/12/Starline-Track-Busway-Product-Selection-Guide_web_REV2.pdf) — T5 §4: straight-section weights, plug-in chapter (TB/CBM weights)
- [Starline Track Busway PSG, T3–T5 Metric & Global systems (2023)](https://www.legrand.com/datacenter/sites/g/files/ocwmcr716/files/2023-07/buswayT3-T5_psg-TOC-hyperlinks-FINAL.pdf) — 630T5 ratings + weights
- [Starline critical-power catalog (full PSG incl. Plug-In Units §12)](https://www.upsssi.com/ressources/fichiers/5a535c14e4cb.pdf) — TBxxxT5 25 lbs table
- [Legrand Global Tap-Off Box brochure](https://www.konect-dcs.com/hubfs/Literature/Brochures/BUS_Starline_Global-Legrand-Tapoff-Box_Brochure_R8.pdf) — EB5/EB6/EB9 enclosure dimensions
- [Starline 630T5G installation manual](https://starlinepower.com/sites/default/files/files/DPC_BUS_Starline_Busway630T5G_Manual_V4_0.pdf) — 3 m max hanger spacing, support-by-others
- [Legrand US T5 product page](https://www.legrand.us/critical-power-and-infrastructure/track-busway/250-1250-amp) — series overview (250–1250 A)
