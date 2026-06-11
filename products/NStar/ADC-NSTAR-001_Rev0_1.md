# ADC-NSTAR-001 — The N★ Block — Governing Definition

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-NSTAR-001 |
| Title | N★ Block — Governing Definition (block boundary, interfaces, scaling rules) |
| Revision | **0.1** (Issued for approval) |
| Company | ADC Solutions |
| Prepared by | Mission Control — **pending Scott Tomsu approval** (SYS-OI-08) |
| Date | 2026-06-11 |
| Authority | Decisions [0004](../../ops/decisions/0004-n-star-block-topology.md) (topology) + [0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md) (fill rule, current lineup only) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue. Codifies decisions 0004 + 0005: block = 5 MW IT (4× reference cluster) + one 10 MW MGN-BOD-002 node; independent-star scaling; boundary and interface definitions; pairing-ratio confirmation method. First applied site sizing: ADC-TRAP-SIZE-001 Rev 0.2 (19 blocks). |

## §1 Purpose & scope

This document is the **governing definition of the N★ block** — the
repeating unit ADC engineers, permits, finances, and replicates at
every site. Decision 0004 set the topology; decision 0005 locked the
IT fill. Until superseded, every site record, sizing study, and
proposal derives capacity from this block — node counts and IT
capacity are never ad hoc.

This document defines the block and its boundaries. It does not
restate the component products — it references their governing docs
(MGN-BOD-002, ADC-CLU-BOM-001, ADC-MOD-TCS-001, ADC-CDU-DES-BOM-001,
ADC-ICD-001, MGN-TEL-001/TEL-PROFILE).

## §2 Block definition [L]

One N★ block =

| Half | Content | Governing doc |
|---|---|---|
| **IT: 5 MW heat load** | **4× reference cluster** (16 racks @ 78 kW avg, 1,248 kW each) = **4,992 kW** · 64 racks · 16 HAC bays · 4 rows × 46 ft · 4× 2 MW end-fed CDUs | ADC-CLU-BOM-001 Rev 0.1; ADC-MOD-TCS-001 §2 |
| **Power: one 10 MW node** | MGN-BOD-002 node: 5× Cat G3520H @ 4.16 kV, 4 running + 1 N+1 = 10 MW firm; node-internal 6 MW / 3 MWh grid-forming BESS | MGN-BOD-002 Rev 0.2 |

- **Fill rule [L] (decision 0005):** the reference cluster is the only
  IT packaging. 4 × 1,248 kW fills the 5 MW block with 0.16 % slack.
- **Independence [L] (decision 0004):** blocks are independent stars —
  one node serves one block; no campus MV ring, no shared plant. A
  block failure strands at most 5 MW IT.
- The block is **deliberately under-loaded** (§4): safety margin is a
  design feature, not waste.

## §3 Block boundary & interfaces

### §3.1 Electrical

- **Upstream of the block:** everything inside the node (gensets,
  BESS, node bus, gas train) = MGN-BOD-002 scope.
- **White space:** governed by ADC-CLU-BOM-001 unmodified — 415/240
  Vac Wye, 8× 600 A busducts per row, "4 makes 3", scope starting at
  the RPP line lugs.
- **The seam [O — SYS-OI-09]:** distribution from the node's 4.16 kV
  bus to the 16 cluster RPPs (4 clusters × 4 RPPs) — transformation,
  switchgear, and the redundancy topology satisfying the
  ADC-CLU-BOM-001 §3 upstream rule (source redundancy ≥ feed
  redundancy) is **not yet defined**. This is the block's one missing
  electrical drawing; first instance = ADC-TRAP-ELEC-001.

### §3.2 Cooling

- In-block: CDU↔TCS per ADC-ICD-001; rack branches per
  ADC-MOD-TCS-001.
- Heat rejection per block: **≈ 1,422 tons · 1,700–1,950 GPM**,
  W32/W40 closed-circuit evaporative fluid coolers + 15–25 % chiller
  trim, basis Lafayette design wet-bulb 80.7 °F
  (colo/Heat_Rejection_5MW_IT.pdf). [W] — re-derive at each site's
  wet-bulb; tower/cooler vendor = procurement.
- Hall humidity control: site/hall scope, not block scope [O].

### §3.3 Telemetry

- One **TEL-PROFILE instance per block**; node points per MGN-TEL-001;
  site-specific requirements per MGN-TEL-001 §4.3. The block is the
  natural telemetry aggregation boundary — block dashboards roll up to
  site, never sideways across blocks.

## §4 Pairing ratio — why 10 MW carries 5 MW IT [W]

| Quantity | Value |
|---|---|
| Block IT load | 4,992 kW |
| Block facility load @ PUE 1.15–1.25 [O] | ≈ 5.75–6.25 MW |
| Node firm rating (before site derate) | 10 MW |
| Node loading | **58–63 %** |

The headroom absorbs, in order of size: site-ambient firm-MW de-rate
(ELEC-006 — Gulf Coast summers), genset transient response under AI
load steps (the dominant island-mode risk), house/auxiliary loads, and
future rack-density growth within the same block. **Confirmation
[O — SYS-OI-10]:** the PUE band is asserted, not derived — confirm
against reference-bay (TCS/HAC) cooling overheads + W32/W40 fan/pump
power, and reconcile the 78 kW avg rack basis against NVL72 actuals.

## §5 Scaling rules

- A site = **N independent blocks**; site records and proposals state
  capacity as N★ counts (e.g., Trappey's Stage 1 = 19 blocks [L],
  ADC-TRAP-SIZE-001 Rev 0.2).
- **Permitting envelope:** MGN-BOD-002 §7 claims up to 20 nodes /
  200 MW under one minor-source air-permit envelope, subject to
  site-specific PTE math (ENV-001). Sites above 20 blocks need a
  multi-envelope or Title V strategy *before* commitment.
- **Partial blocks:** a site may deploy sub-block (1–3 clusters on
  utility AC, no node) only as POC/validation scale — MARLIE 1
  pattern. Production commitments are whole blocks.
- Every commercial commitment re-derives: firm MW at site ambient
  (ELEC-006), heat rejection at site wet-bulb, PTE at site stack
  count.

## §6 Open items (registered in ADC-SYS-001)

| ID | Item | Gates |
|---|---|---|
| SYS-OI-08 | ADC-NSTAR-001 Rev 0.1 approval by Scott | all N★ capacity claims in proposals |
| SYS-OI-09 | Block electrical seam: node 4.16 kV bus → cluster RPPs (transformation, switchgear, redundancy per ADC-CLU-BOM-001 §3 upstream rule) | ADC-TRAP-ELEC-001; any block construction |
| SYS-OI-10 | Pairing-ratio confirmation: derive block PUE from reference-bay overheads + heat-rejection auxiliary power; reconcile 78 kW avg vs NVL72 actuals | firm per-block facility load; genset dispatch basis |
