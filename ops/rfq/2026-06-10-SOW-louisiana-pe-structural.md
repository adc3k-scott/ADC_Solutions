# Scope of Work — Louisiana PE Structural & Seismic Engineering Services

**ADC Solutions Inc · PO Box 2224, Lafayette, LA 70502 · scott@adc3k.com · 337-780-1535**
Issued 2026-06-10 · Single engagement closing three open engineering items:
TCS **SUP-01**, HAC **HAC-OI-01**, CDU **CDU-G8** (ADC-SYS-001 registry).

## 1. Background

ADC Solutions manufactures modular AI-datacenter infrastructure built to
the OCP Project Deschutes v1.0 specification: a 2 MW coolant
distribution unit (CDU), a factory-built technology cooling system (TCS)
header/branch package, and the "Redmond" hot-aisle-containment (HAC)
steel structure. The OCP specification **explicitly excludes** structural
qualification — the deploying owner must engage qualified structural
engineers. ADC requires a Louisiana-licensed PE to produce stamped,
site-class-appropriate structural and seismic design for Louisiana
deployments (Lafayette/Acadiana reference site, **Seismic Design
Category B** — the OCP-referenced West-Coast basis of Sds = 2.273 is far
more severe than required and must be re-derived for Louisiana).

## 2. Scope — three deliverables, one engagement

### D1 — HAC structure qualification (HAC-OI-01)
Static, dynamic, and seismic analysis of the Redmond repeatable bay:
- Vertical posts HSS 5×5×¼; base plates 12″ × 8.5″ × 5/8″ with 4× 5/8″
  anchor bolts; lateral X-beams; cross-aisle beams; cantilever tray
  hangers (49.05″ projection, 3¼″ × 3¼″ double-deep-strut box, typ. 3
  per post).
- Design loads per OCP Deschutes Table 18.4.1: Level 1 wall manifold
  31.7 lbs/ft at 100.5″ AFF; Levels 2/3 cabling 29.9 lbs/ft at
  115.5″/127.5″; Level 4 13.8 + 14.5 lbs/ft at 139.5″; overall height
  168″.
- **Busway load on the cross-aisle beams** (added 2026-06-11, published
  vendor data — sources:
  [ops/research/2026-06-11-starline-t5-busway-weights.md](../research/2026-06-11-starline-t5-busway-weights.md)):
  **8 runs of 600 A-class track busway** suspended from the cross-aisle
  beams (4 per side of the hot aisle), ~46 ft per run (~368 ft total):
  - Busway distributed load: **15.5 lbs/ft per run design envelope**
    (heaviest published Starline T5 configuration; expected selection
    630T5 Global publishes 12.2 lbs/ft — design to the envelope until
    vendor lock, which also bounds the Vertiv iMPB alternate).
  - Tap boxes: **64 × 25 lbs** (published Starline TB-series T5 plug-in
    weight) — 8 point loads per run, one per rack spot.
  - End feeds: 8 × 85 lbs allowance at run ends [W] — vendor to confirm
    with the busway quote (ELE-OI-01).
  - Combined design line: **≈ 20 lbs/ft per run** (busway + tap boxes
    smeared) → ~7,300 lbs total on the cross-aisle beam system.
  - Hanger interface: vendor max support spacing 3 m (10 ft); ADC plan
    ~10 hanger sets per run (≈ 5 ft spacing) to HSS cross-aisle beams,
    placement fungible per Deschutes §18.7.
- Anchor design for slab-on-grade AND raised-floor (extension columns
  below finished floor, 48.25″ reference) cases.
- **Critical constraint:** all interface dimensions (post centers 90″,
  bay width 121″, aisle 68.41″, the four elevations) are unalterable —
  member sizing may not change the OCP envelope.

### D2 — TCS pipe-support & seismic bracing detail (SUP-01)
- 6″ Sch 10S 304L header at 100.5″ AFF, hangers 8 ft o.c.; 2″ branch
  hose catenary supports (32 per 46 ft row); V-pattern seismic bracing
  detail; SS304 drip tray on independent hangers.
- Operating: PG25 coolant, 150 psig design WP, 18–55 °C; ASME B31.9
  support spacing baseline already >2× margin — confirm and stamp.

### D3 — CDU site seismic basis (CDU-G8)
- Anchorage and overturning check for the CDU cabinet: 65.25″ W ×
  91.44″ H × 42.29″ D, 6,900 lb wet; dual-feed utility connections.

## 3. Codes
ASCE 7-16 (site-specific Ss/S1 for Lafayette), IBC + Louisiana State
Uniform Construction Code, AISC 360, ASME B31.9 (D2), ACI 318 anchorage.

## 4. Deliverables & schedule
Louisiana-PE-stamped calculation packages and detail drawings for D1–D3
(electronic, PDF + native CAD); one revision cycle included. Requested
proposal within 10 business days; target completion 6 weeks from NTP.
These deliverables gate ADC purchase orders (TCS supports bundle B7,
HAC fabrication drawings) and the production CDU BOM release.

## 5. Reference documents (provided under NDA on request)
ADC-MOD-TCS-001 Version 1 (TCS BoD/RFQ); ADC HAC spec sheet + OCP
Deschutes v1.0 §18 (public); ADC-CDU-DES-BOM-001; ADC-SYS-001 system
registry extract (machine-readable dimension/load tables).

*Candidate firms: Lafayette/Baton Rouge structural practices with
industrial/seismic portfolio; ADC GC license in-house — engagement is
design-only.*
