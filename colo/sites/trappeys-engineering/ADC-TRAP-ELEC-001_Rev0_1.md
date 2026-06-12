# ADC-TRAP-ELEC-001 — Node 4.16 kV Bus → Block RPP Distribution (the SYS-OI-09 seam)

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-TRAP-ELEC-001 (prefix [W] pending COMM-001) |
| Title | N★ Block Electrical Seam — MGN-BOD-002 4.16 kV Bus → ADC-CLU-BOM-001 RPP Line Lugs |
| Revision | **0.1** — **APPROVED by Scott Tomsu 2026-06-12** |
| Company | ADC Solutions |
| Discipline | ELEC |
| Prepared by | Mission Control — approved as issued (closes SYS-OI-09) |
| Date | 2026-06-11 |
| Governing inputs | ADC-NSTAR-001 Rev 0.1 §3.1 (SYS-OI-09); MGN-BOD-002 Rev 0.2 §3/§5.1; ADC-CLU-BOM-001 Rev 0.1 §3 |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue. Closes SYS-OI-09: defines the block's one missing electrical drawing — transformation, switchgear, and redundancy topology between the node's 4.16 kV bus and the 16 cluster RPPs. First instance at Trappey's; intended to generalize back into ADC-NSTAR-001 §3.1 once confirmed. |

## §1 Purpose & Scope

ADC-NSTAR-001 §3.1 identifies the seam between the **node's 4.16 kV bus**
(MGN-BOD-002, locked) and the **16 cluster RPPs** (4 clusters × 4 RPPs,
ADC-CLU-BOM-001, locked at 415/240 Vac Wye) as the block's one undefined
electrical drawing. This document defines that seam: step-down
transformation, the switchgear that delivers it, and a redundancy
topology that satisfies the ADC-CLU-BOM-001 §3 upstream rule (source
redundancy ≥ feed redundancy, ELE-OI-02).

Scope is **one N★ block** (1 node, 4 clusters, 16 RPPs). Trappey's Stage
1 (19 blocks, ADC-TRAP-SIZE-001 Rev 0.2) replicates this drawing 19×,
independent stars (decision 0004) — no cross-block ties.

## §2 Boundary [L]

- **Upstream end:** the node's 4.16 kV metal-clad paralleling switchgear
  bus (MGN-BOD-002 §5.1, locked) — the same bus the 5× G3520H gensets,
  the 6 MW BESS PCS, and (provisionally) the sync condenser connect to.
  The block's IT load is served directly off this bus, behind the meter
  — not via the node step-up transformer / campus collection bus
  (MGN-BOD-002 §5.5), which is for grid-parallel/POI scope and does not
  apply to an independent-star block (decision 0004).
- **Downstream end:** the 16 RPP line lugs (4 per cluster, A/B/C/D),
  ADC-CLU-BOM-001 §1 — "electrical starts at the RPP line lugs."
- Everything between these two points is this document's scope:
  step-down transformation (4.16 kV → 415Y/240 V), the switchgear/feeder
  arrangement that distributes it, and primary-side protection.

## §3 Topology [W]

### §3.1 Voltage transformation [W]

- **One dedicated step-down transformer per RPP — 16 per block.**
  4.16 kV primary (delta or wye per vendor standard) → 415Y/240 V
  secondary, matching the cluster's locked white-space voltage
  (ADC-CLU-BOM-001 §3, Table 18.8.1). [W]
- **Sizing [W]:** per-RPP failover load (ADC-CLU-BOM-001 §3.1) is
  416 kW / 578 A at 415 V. RPP-A and RPP-B each carry an additional CDU
  feeder (≈74 kW, 150 A breaker); RPP-C carries the 100 A auxiliary
  panelboard (≈65 kW). Worst-case RPP (A or B): ≈490 kW failover
  ≈ 516 kVA at 0.95 pf. A **750 kVA** unit covers this at ≈69% loaded at
  failover, ≈42% at normal (4-feed) load — headroom consistent with the
  node's own 58–63% loading philosophy (ADC-NSTAR-001 §4).
- **Block transformer capacity:** 16 × 750 kVA = 12 MVA installed
  against ≈5.75–6.25 MW block facility load (PUE 1.15–1.25,
  SYS-OI-10) — ≈48–52% aggregate loading.
- **Secondary voltage confirmation is the open item** (ELE-OI-05,
  §6): 4160–415Y/240 V is not a stock US catalog transformer (stock US
  secondary is 480Y/277 V); this needs the same vendor-catalog
  confirmation step ELE-OI-01 already opened for the 630T5 busway.
  Options are a transformer wound for 415Y/240 V secondary (export/OCP
  catalog) or a stock 4160–480Y unit plus a buck-boost/autotransformer
  stage to 415Y — cost and footprint differ materially.

### §3.2 Switchgear & feeders [W]

- **16 feeder positions, one per transformer**, fed from the node's
  4.16 kV bus. Each feeder ≈104 A at 750 kVA — a 150–200 A breaker
  frame is comfortable.
- **Two architecture options, both [W], pending TRAP-CIVIL-001 layout:**
  - **Option A — integral:** all 16 feeder breakers added directly to
    the node's metal-clad switchgear lineup (alongside the 5 genset, 1
    BESS-PCS, and step-up transformer positions already in
    MGN-BOD-002 §5.1) — single bus, no added single point of failure
    beyond the node bus itself, but a large (~22+ position) lineup.
  - **Option B — block distribution lineup:** one tie breaker off the
    node switchgear feeds a separate 4.16 kV distribution switchgear
    lineup sited in/near the compute hall, with the 16 transformer
    feeders fanning out from there. Shorter 415 V secondary cable runs
    (high-current — 578 A failover per RPP), smaller node-switchgear
    footprint; adds one tie breaker as a node→block single point of
    failure — already accepted at the block level (decision 0004:
    "a block failure strands at most 5 MW IT").
  - **Working basis for this issue: Option B**, with the distribution
    lineup centrally located relative to the 4 cluster rows so each of
    the 4 transformer pads per cluster (16 total) has a short run.
    Confirmed against the hall layout in TRAP-CIVIL-001.
- **Transformer placement:** 4 pads per cluster, adjacent to that
  cluster's 4 RPPs (end of row, per ADC-ICD-001 row layout) — minimizes
  415 V secondary conductor length and ampacity.

### §3.3 Redundancy check against ADC-CLU-BOM-001 §3 [L]

ADC-CLU-BOM-001 §3 locks "4 makes 3": every rack spot takes 4 feeds (one
per RPP A/B/C/D), 3-of-4 sufficient. The upstream rule requires source
redundancy ≥ this feed redundancy.

**1:1 transformer:RPP mapping is the minimum topology that satisfies the
rule** — loss of any single transformer removes exactly one RPP, i.e.
exactly one of the four feeds to every rack spot in that cluster,
landing the cluster in the 3-of-4 state it is already designed (and
rated, §3.1 of ADC-CLU-BOM-001) to run in indefinitely. A shared
transformer feeding 2 RPPs would fail this check (one transformer loss →
2-of-4 feeds, below the "4 makes 3" envelope) and is therefore rejected.
**The 1:1 ratio is [L]; transformer count/size remain [W]** pending
§3.1's catalog confirmation.

The node bus itself (single 4.16 kV bus, MGN-BOD-002 §5.1) is the
block's single source — already the accepted single point of failure
per decision 0004's independent-star topology. This document does not
add a second source; it distributes the one source to 16 RPPs without
narrowing the redundancy already designed into the white space.

## §4 What this seam deliberately excludes

- The node's own generation, paralleling, and BESS — locked,
  MGN-BOD-002 §5.1–§5.3.
- The node step-up transformer / campus collection bus / POI —
  MGN-BOD-002 §5.5, not applicable to an independent-star block.
- Everything downstream of the RPP line lugs — ADC-CLU-BOM-001 (busway,
  tap-boxes, whips, RPP internals).
- Fault-current/AIC ratings for the new feeder breakers and
  transformers — depends on ELEC-002 (node fault-level study), carried
  as ELE-OI-06 below, not assumed here.

## §5 Open items created by this package

| ID | Item | Gates |
|---|---|---|
| ELE-OI-05 | Seam transformer catalog confirmation: 4.16 kV → 415Y/240 V, 750 kVA class, 16/block (1:1 with RPPs) — stock export/OCP unit vs 480Y unit + buck-boost | transformer purchase order |
| ELE-OI-06 | 4.16 kV feeder/breaker AIC ratings for the 16 (or 17, incl. tie) new positions — depends on ELEC-002 node fault-level study | switchgear purchase order |
| ELE-OI-07 | Distribution-switchgear siting (Option A vs B, §3.2) and the 4-pad-per-cluster transformer layout — depends on TRAP-CIVIL-001 hall layout | switchgear + transformer pad release |

These feed SYS-OI-09 (closes on Scott approval of this Rev 0.1) and are
registered in `system/registry/open-items.json`.

## §6 Change Control

Architecture values in §3.3 (1:1 transformer:RPP, redundancy logic) are
[L] — derived directly from the locked ADC-CLU-BOM-001 §3 upstream rule
and do not change without a revision of either document. Sizing,
switchgear architecture (Option A/B), and siting remain [W] until
ELE-OI-05/06/07 close. On approval, ADC-NSTAR-001 §3.1/§6 (SYS-OI-09)
update to point here as the governing seam drawing.
