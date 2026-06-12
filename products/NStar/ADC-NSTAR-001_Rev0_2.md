# ADC-NSTAR-001 — The N★ Block — Governing Definition

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-NSTAR-001 |
| Title | N★ Block — Governing Definition (block boundary, interfaces, scaling rules) |
| Revision | **0.2** (Issued for approval) |
| Company | ADC Solutions |
| Prepared by | Mission Control — **pending Scott Tomsu approval** (SYS-OI-08) |
| Date | 2026-06-11 |
| Authority | Decisions [0004](../../ops/decisions/0004-n-star-block-topology.md) (topology) + [0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md) (fill rule, current lineup only) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue. Codifies decisions 0004 + 0005: block = 5 MW IT (4× reference cluster) + one 10 MW MGN-BOD-002 node; independent-star scaling; boundary and interface definitions; pairing-ratio confirmation method. First applied site sizing: ADC-TRAP-SIZE-001 Rev 0.2 (19 blocks). |
| 0.2 | 2026-06-11 | §4 rewritten: derives the SYS-OI-10 mechanical+CDU PUE (≈1.10–1.14 [W]) from `colo/Heat_Rejection_5MW_IT.pdf` (W32/W40 evaporative + chiller-trim hybrid) and ADC-CDU-DES-BOM-001 §1 CDU power, decomposing the asserted 1.15–1.25 facility-PUE band; reconciles the locked 78 kW/rack reference-cluster basis against NVL72 actuals (new open item SYS-OI-11). |

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

### §4.1 Mechanical + CDU overhead derivation (SYS-OI-10) [W]

Block IT load = 4,992 kW ≈ 1,419 tons of heat to reject (TCS sized to
~100% of rack electrical load, cold-plate only — ADC-MOD-TCS-001
§2.1). Per the Lafayette heat-rejection study
(`colo/Heat_Rejection_5MW_IT.pdf`), the recommended W32/W40
architecture for this site is a closed-circuit evaporative
fluid-cooler primary (partial PUE ≈1.04 — fans + spray pump) plus a
water-cooled magnetic-bearing chiller trim sized to 15–25% of load for
the few hundred hottest hours/year.

| Regime | Mechanical overhead | Basis |
|---|---|---|
| Most hours — evaporative only | ≈200 kW | 0.04 × 4,992 kW (fluid-cooler partial PUE 1.04) |
| Design day — chiller trim engaged (15–25% of 1,419 tons) | ≈279–385 kW | chiller compressor 106–177 kW (0.5 kW/ton, mag-bearing) + trim-share tower fans/pumps 23–38 kW (scaled from ≈150 kW @ 1,419 tons) + remaining 75–85% via fluid coolers ≈150–170 kW |

CDU electrical draw (constant in both regimes): 4 CDUs/block × ≈74 kW
(ADC-CDU-DES-BOM-001 §1, "total CDU power") = **296 kW**.

| Quantity | Typical (evaporative) | Design day (chiller trim) |
|---|---|---|
| Mechanical overhead | ≈200 kW | ≈279–385 kW |
| CDU overhead | 296 kW | 296 kW |
| Total facility overhead | ≈496 kW | ≈575–681 kW |
| Block facility load | ≈5,488 kW | ≈5,567–5,673 kW |
| **Mechanical+CDU PUE** | **≈1.10** | **≈1.12–1.14** |
| Node loading (÷10 MW) | ≈54.9% | ≈55.7–56.7% |

### §4.2 Reconciling against the asserted 1.15–1.25 band [W]

The derived mechanical+CDU PUE (≈1.10–1.14) sits at or just below the
asserted facility-PUE band's lower bound. **The 1.15–1.25 band is
retained**, now decomposed:

- **Mechanical (cooling) + CDU: ≈1.10–1.14 [W]** — derived above; the
  dominant component, now confirmed rather than asserted.
- **House/auxiliary loads + site-ambient de-rate margin: ≈0.01–0.11
  (≈50–550 kW) [O]** — the residual headroom in the asserted band, not
  yet itemized (lighting, fire pumps, BESS thermal management,
  controls/telemetry racks, ELEC-006 de-rate). Itemizing this residual
  is the remaining piece of SYS-OI-10.

Block facility load remains bracketed by **≈5,488–6,250 kW**
(mechanical+CDU floor to the original 1.25×IT ceiling); node loading
**≈55–63%**. The pairing ratio holds — SYS-OI-10's mechanical-overhead
component is now derived rather than asserted.

### §4.3 Rack-density reconciliation: 78 kW avg vs NVL72 actuals [O]

The **78 kW/rack average** (decision 2026-06-11, ADC-CLU-BOM-001 §2)
is a **CDU/TCS hydraulic-capacity figure**, not a GPU-platform power
spec: it is the locked Deschutes 2 MW / 500 GPM CDU's secondary flow
(500 GPM ÷ 16 racks = 31.25 GPM/rack) evaluated at ITE ΔT = 10 °C
(ADC-MOD-TCS-001 §2.1/§3.2).

NVIDIA GB200/GB300 NVL72 racks run materially higher — commonly cited
in the 120–140 kW range. ADC-MOD-TCS-001 §4.4.1 already flags the
consequence: 125 kW/rack requires ~50 GPM/rack, and 16 racks
simultaneous at that flow would need ~804 GPM — well above the locked
500 GPM CDU basis (the CDU BOM "no pump resize" lock does not permit
changing this without a formal deviation).

At 50 GPM/rack, the locked 500 GPM CDU supports **≈10 NVL72-density
racks**, not 16. The reference cluster (16 racks @ 78 kW avg = 1,248
kW) and a full-NVL72 cluster (≈10 racks @ 120–140 kW ≈
1,200–1,400 kW) land at similar **aggregate** cluster power, but
**rack count and per-rack density differ** — a proposal that equates
"16-rack reference cluster" with "16× full-density NVL72 racks"
overstates per-rack density by ~1.5–1.8×.

**This does not change decision 0005** — the 78 kW reference cluster
remains the locked IT fill unit for the 5 MW block, and the block's
aggregate IT capacity (4,992 kW) is unaffected. It does mean any
commercial proposal stating a *rack count* of full-density NVL72
within a reference cluster needs this reconciliation. New open item
**SYS-OI-11** tracks this.

## §5 Scaling rules

- A site = **N independent blocks**; site records and proposals state
  capacity as N★ counts (e.g., Trappey's Stage 1 = 19 blocks [L],
  ADC-TRAP-SIZE-001 Rev 0.2).
- **Permitting envelope:** MGN-BOD-002 §7 claims up to 20 nodes /
  200 MW under one minor-source air-permit envelope, subject to
  site-specific PTE math (ENV-001). Sites above 20 blocks need a
  multi-envelope or Title V strategy *before* commitment.
- **Partial blocks:** a site may deploy sub-block (1–3 clusters on
  utility AC, no node) only as POC/validation scale — the Marlie Hub
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
| SYS-OI-11 | Rack-density reconciliation: 78 kW/rack (locked 2 MW/500 GPM CDU hydraulic basis) vs full-density NVL72 (120–140 kW/rack, ~50 GPM/rack) — locked CDU supports ≈10 NVL72-density racks/CDU, not 16 | any proposal stating an NVL72 rack count per reference cluster |
