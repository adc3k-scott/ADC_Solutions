# ADC Hot Aisle Containment (HAC) Structure — OCP Redmond Interface

Spec sheet for ADC Solutions' HAC structure product: a factory-fabricated,
modular implementation of the **Redmond** HAC interface defined in OCP
Project Deschutes v1.0 §18 — the free-standing steel structure that frames
the hot aisle and carries the wall manifold, cable trays, and busducts for
a row of high-density liquid-cooled IT racks. One repeatable bay serves
4 racks per side; the 46 ft Reference Bay row is 4 bays plus an end-fed
[ADC 2 MW CDU](../CDU/README.md) and the
[ADC Modular TCS](../TCS/README.md) header it supports at Level 1.

## Source of truth

The authoritative spec is **OCP Project Deschutes v1.0 §18 "Redmond: Hot
Aisle Containment (HAC) Interface"** (pages 52–61), in
[../CDU/OCP-Specification-Deschutes v1_0.pdf](../CDU/OCP-Specification-Deschutes%20v1_0.pdf)
— a public OCP document. The images in this folder are working captures
from it plus ADC detail drawings; if they disagree, the OCP PDF wins.

| Image | Maps to |
|---|---|
| [Screenshot ...63534](Screenshot_19-5-2026_63534_www.opencompute.org.jpeg) | Figure 18.3.1 — floor layout (all dimensions critical) |
| [Screenshot ...63619](Screenshot_19-5-2026_63619_www.opencompute.org.jpeg) | Figure 18.4 — elevations (all AFF dimensions critical) |
| [Screenshot ...63650](Screenshot_19-5-2026_63650_www.opencompute.org.jpeg) | Figure 18.5 — Detail A, hanger/basket elevations (both sides) |
| [Screenshot ...63722](Screenshot_19-5-2026_63722_www.opencompute.org.jpeg) | Figure 18.5.1 — Redmond structure (posts, X-beams, hangers, unistrut) |
| [Screenshot ...63755](Screenshot_19-5-2026_63755_www.opencompute.org.jpeg) | §18.7 / Figure 18.7 — busduct placement (fungible) |
| [Cable tray hanger detail](Deschutes_Redmond_CableTrayHanger_Detail.jpg) | ADC detail drawing — cantilever arm section, derived from Figure 18.5 |
| [Racks and CDU](Racks%20and%20CDU.jpg) | ADC render — 4-bay / 16-rack Reference Bay row with end CDU |

## Scope (what ADC supplies vs what stays with the owner)

Per Deschutes §18, the Redmond interface fixes the **hard** dimensions
(keepouts, elevations, connection points) and leaves the rest **fungible**.
ADC's product is the structure kit:

- **In scope:** vertical posts, base plates, lateral X-beams, cross-aisle
  beams, cable tray hangers, wire baskets, WMF unistrut — factory-cut,
  pre-drilled, barcoded, site-bolted (no field welding).
- **Owner / fungible (per OCP):** containment panels (§18.6), busduct
  selection and attachment (§18.7), RDHx units and their containment
  (§18.9), PCW piping above Level 4.
- **Excluded by OCP, picked up by ADC as a service:** structural
  qualification for static, dynamic, and seismic loads — requires a
  Louisiana-PE-stamped site-specific analysis (see Status).

## IT rack envelope (§18.1)

| Parameter | Value |
|---|---|
| Rack width | 28″ (711 mm) |
| Rack depth | 50″ (1,270 mm) max, front-justified (depth differences absorbed by containment plenums) |
| Rack height | 80.7″ (2,050 mm) min — 90.55″ (2,300 mm) max, shoulder-to-shoulder |
| Packaged height | 100″ (2,540 mm) |
| Rack-to-rack gap | 5 mm |

## Redmond interface requirements (Table 18.2.1)

| Interface | Requirement |
|---|---|
| Cold aisle width | 54″ (1,372 mm) minimum |
| Hot aisle width | 68.4″ (1,737 mm) minimum with RDHx (between rear RDHx faces); 102″ maximum without RDHx (between rear rack faces) |
| Min bay width | 121″ (3,073.36 mm) |
| Min row length | 46 ft (14.02 m) |
| Transport aisle width | 6 ft (1,800 mm) clearance in at least 1 transport row; 10 ft (3.048 m) in the other |
| Min ceiling height | 14 ft (4.26 m) |

> Note: the OCP table prints "102″ (2210 mm)" — 102″ is 2,590.91 mm per
> Figure 18.3.1. Treat the metric value in the table as a typo; the figure
> governs (HAC-OI-02).

## Floor layout — one repeatable bay (Figure 18.3.1, all critical)

Four 28″ racks per side of the hot aisle, bounded by four vertical posts.

| Dimension | in [mm] |
|---|---|
| Post centers, across aisle | 90 [2,286.11] |
| Base plate outer faces, across aisle | 102 [2,590.91] |
| Hot aisle between RDHx rear faces | 68.41 [1,737.55] |
| Available width between base plates (4 racks) | 114 [2,895.56] |
| Bay width, post centers along row | 121 [3,073.36] |
| Bay pitch envelope | 126 [3,200.36] |
| Rack width | 27.99 [711.00] |
| Rack-to-rack gap | 0.2 [5.05] |
| Cold aisle each side | 54 [1,371.60] |
| Rack group width per side | 64.8 [1,645.88] |
| RDHx depth allowance | 10.8 [274.28] |
| Cross-row references | 95 [2,413.11], 86.5 [2,197.21], 27.99 [711.00] |

## Elevations and loads (Figures 18.4 / 18.5, Table 18.4.1 — all AFF dims critical)

Overall structure height **168″ (14 ft) above finished floor** (slab or
raised; on raised floor, extension columns go below — figure shows 48.25″
below finished floor, owner's domain). Four supported levels per cold
aisle side; **all four elevations are critical and cannot be changed**:

| Level | Item | Elevation AFF | Wire basket | Cable wt | Basket wt | Design wt |
|---|---|---|---|---|---|---|
| 1 | "Project Deschutes" Wall Manifold (WMF) | **100.5″** | — | 0 | 31.66 lbs/ft | 31.7 lbs/ft |
| 2 | Cabling | 115.5″ | 24×4 | 27 lbs/ft | 2.95 lbs/ft | 29.9 lbs/ft |
| 3 | Cabling | 127.5″ | 24×4 | 27 lbs/ft | 2.95 lbs/ft | 29.9 lbs/ft |
| 4-(1) | Cabling | 139.5″ | 24×4 | 10.8 lbs/ft | 2.95 lbs/ft | 13.8 lbs/ft |
| 4-(2) | Cabling | 139.5″ | 4×4 | 13.4 lbs/ft | 1.12 lbs/ft | 14.5 lbs/ft |

Space above 139.5″ belongs to the Colo provider (e.g., RDHx PCW piping).
The gap between RDHx units can never be less than 68.4″. Level 1 at
100.5″ is the same critical elevation as the
[TCS header](../TCS/README.md) — the WMF and the ADC TCS supply/return
headers are the same interface plane. Secondary elevations from
Figure 18.4: cross-beam top 168.00 / 165.50; tray detail points 108.19,
96.25, 94.00; rack max 90.55; tray projections 49.05 / 48.00 / 32.90.

## Structure members (Figure 18.5.1 + ADC hanger detail)

| Member | Spec |
|---|---|
| Vertical posts | HSS 5″ × 5″ × ¼″, four per bay |
| Base plates | 12″ W × 8.5″ D × 5/8″, 4× 5/8″ anchor bolts each |
| Lateral X-beams | Carry the WMF via unistrut (Level 1) |
| Cross-aisle beams | Span the hot aisle at top; rigidity + busduct mounting |
| Cable tray hangers | Cantilever arm, 3¼″ × 3¼″ box (2× deep strut, welded), bolted end plate to post web, 49.05″ projection, hold-down clip; typ. 3 hangers per post (Levels 2–4) |
| Wire baskets | 24″ × 4″ (Levels 2, 3, 4-1) and 4″ × 4″ (Level 4-2); basket sits 4.00″ proud, arms on 3.25″ box height per Detail A |
| WMF mounting | Unistrut on X-beams; WMF pipe pair at 2× 3.00″ with 8.62″ / 5.25″ / 45.25″ detail offsets (Figure 18.5) |

## Power interface carried by the structure (§18.7 / §18.8)

Eight **600 A busducts** live inside the hot aisle — four per side —
giving every rack a 4-feed, 3+1-redundant **"4 makes 3"** supply
(placement fungible, owner's choice). Table 18.8.1 requirements the
structure must facilitate: IEC 60309 5-pin 30/32 A 230/240 Vac
connectors; three-phase 230/240 Vac Wye; 32 A 3-phase tap-box protection
per outlet; two outlets per rack spot per feed; **90 kW per rack spot**
(1-second timescale, 3 of 4 feeds operational); per-rack-spot swap to
single-phase tap boxes for legacy racks; UPS and generator redundancy
each ≥ feed redundancy.

## Fusion 360 modeling plan

Target: one fully parametric **repeatable bay**, patterned ×4 for the
46 ft Reference Bay row, with the CDU and rack envelopes as reference
bodies. Model in **inches** (OCP dimensions are inch-primary).

- **Fixed (critical) user parameters — never change:** post centers 90 /
  121; base-plate envelope 102; aisle 68.41; between-plates 114; levels
  100.5 / 115.5 / 127.5 / 139.5; overall 168; rack envelope 28 × 50 ×
  90.55.
- **Fungible parameters:** busduct positions, containment panel
  geometry, PCW routing above 139.5, below-floor extension length
  (48.25 default).
- **Components:** post (HSS 5×5×¼ + base plate), cross-aisle beam,
  lateral X-beam, cantilever hanger arm (Detail A section), wire baskets
  (24×4, 4×4), WMF unistrut set; joints at bolted end plates.
- Validate every critical dimension against Figure 18.3.1 / 18.4 before
  releasing drawings; the figures, not the prose, carry the mm values.

## Status

**Pre-design, interface-locked.** The OCP interface is fully defined and
public; ADC open items before fabrication drawings:

- **HAC-OI-01** — Louisiana-PE-stamped structural analysis (static,
  dynamic, seismic). OCP explicitly excludes this; Lafayette sites are
  SDC B, far milder than the West-Coast assumptions elsewhere in the
  stack (see TCS SUP-01).
- **HAC-OI-02** — confirm the 102″ metric typo (2,210 vs 2,590.91 mm)
  against the OCP source before any metric drawing is issued.
- **HAC-OI-03** — steel sourcing: HSS, plate, and strut from Gulf Coast
  suppliers (Stuart Steel, Baton Rouge; Continental Steel, Houston),
  consistent with the TCS Louisiana sourcing strategy.
- **HAC-OI-04** — containment panel offering: decide whether ADC sells
  panels as an option or leaves them owner-supplied per OCP §18.6.
- **HAC-OI-05** — Fusion 360 parametric model per the plan above.

## Roadmap

The bay structure scales with the same deployment families as the TCS:
Small ≤ 20 MW (2026/27) at 46 ft rows, Large at 46/96 ft, and Late
2027/28+ at 96 ft / 2.4 MW-per-row (see [MISSION.md](../../MISSION.md)).
