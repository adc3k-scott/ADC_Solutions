# ADC-TRAP-SIZE-001 — Trappey's N★ Sizing Study + Hall Concept

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-TRAP-SIZE-001 (prefix [W] pending COMM-001) |
| Title | Trappey's Compute Center — N★ Block Sizing Study & Hall Concept |
| Revision | **0.1** (Issued for approval — phase 1 skeleton, NOT deep-engineered) |
| Company | ADC Solutions |
| Prepared by | Mission Control — awaiting Scott Tomsu review |
| Date | 2026-06-11 |
| Governing inputs | Decision 0004 (N★ block); MGN-BOD-002 Rev 0.2; ADC-CLU-BOM-001 Rev 0.1; ADC-MOD-TCS-001; colo/Heat_Rejection_5MW_IT.pdf; legacy targets per ST-TRAP-BOD-001 Rev 0.6 (reference only) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue. TRAP-OI-03 phase 1: block-count arithmetic, candidate fill rule (4× reference cluster), first-order hall/cooling/permitting consequences. All numbers first-order; nothing below is construction-grade. |

## §1 Purpose

Size the ADC-native Trappey's facility in **N★ blocks** (5 MW IT +
10 MW MGN-BOD-002 node, decision 0004) against the legacy load targets
(Stage 1: 91.1 MW IT; Full Build: 182.2 MW IT — carried as targets per
scan §C). Replaces the legacy 44-cassette / 11×4-genset arithmetic.

## §2 The N★ block applied to Trappey's [W]

One block = **5 MW IT + one MGN-BOD-002 node** (10 MW firm, 5× Cat
G3520H 4-of-5 @ 4.16 kV, node-internal 6 MW / 3 MWh grid-forming
BESS). Blocks are independent stars — no campus MV ring, consistent
with the block-independence the legacy set already proved (its
"Marlie-pattern block").

**Candidate fill rule [O → TRAP-OI-07]:** one block = **4× reference
cluster** (ADC-CLU-BOM-001: 16 racks @ 78 kW = 1,248 kW each):
4 × 1,248 kW = **4,992 kW ≈ 5 MW exact**. The cluster packaging fills
the N★ block with 0.16 % slack — the 2.3 MW cassette does not divide
into 5 MW (2.17×). This study proceeds on the 4-cluster fill but the
rule is decided in the governing N★ doc, not here.

Per-block roll-up at the 4-cluster fill:

| Per block | Value | Source |
|---|---|---|
| IT load | 4,992 kW (64 racks @ 78 kW avg) | ADC-CLU-BOM-001 §2 |
| Rows / bays / CDUs | 4 rows × 46 ft · 16 HAC bays · 4× 2 MW end-fed CDUs | ADC-MOD-TCS-001 §2 |
| Heat rejection | ≈ 1,422 tons · 1,700–1,950 GPM (W32/W40 closed-circuit evap + 15–25 % chiller trim; Lafayette WB 80.7 °F) | Heat_Rejection_5MW_IT.pdf |
| Power | 10 MW firm node; block electrical boundary = RPP line lugs (upstream = node scope) | MGN-BOD-002; ADC-CLU-BOM-001 §1 |

## §3 Block count [O → TRAP-OI-04]

| Quantity | Stage 1 | Full Build |
|---|---|---|
| Legacy IT target | 91.1 MW | 182.2 MW |
| **N★ blocks (recommended)** | **19 → 95.0 MW IT** | **37 → 184.7 MW IT** |
| Alternative (under target) | 18 → 89.9 MW IT (98.7 % of target) | 36 → 179.7 MW IT |
| MGN-BOD-002 nodes (1:1) | 19 | 37 |
| Firm generation | 190 MW | 370 MW |
| G3520H engines (5/node) | 95 | 185 |
| Reference clusters / racks | 76 / 1,216 | 148 / 2,368 |
| Heat rejection (aggregate) | ≈ 27,000 tons · 32,300–37,050 GPM | ≈ 52,600 tons · 62,900–72,150 GPM |

**Recommendation: 19 blocks Stage 1** — meets the 91.1 MW target with
margin and lands one block under the MGN-BOD-002 §7 twenty-node
campus envelope. 18 is the cost-minimal read if 91.1 MW is a ceiling
rather than a floor. Scott rules (TRAP-OI-04).

**Margin note [W]:** at PUE 1.15–1.25 (evap-cooled hall, [O] pending
ADC-TRAP-THERM-001), block facility load ≈ 5.75–6.25 MW on a 10 MW
firm node — 58–63 % loading. That headroom is the point of the safe
block: it absorbs the Gulf-ambient firm-MW de-rate (ELEC-006), genset
transient response under AI dispatch (the legacy set's biggest flagged
risk), and house loads, without inter-block dependence. The pairing
ratio is confirmed in the governing N★ doc per decision 0004.

## §4 What changes vs the legacy plant [W]

- **44 → 95 engines (Stage 1), 13.8 kV → 4.16 kV, ~4.5 MW → ~2.5 MW
  units.** More, smaller engines; redundancy moves from N+1-per-4-pack
  to N+1-per-node (4-of-5). Air-permit consequence in §6.
- **No campus 480 V block bus, no 15 MVA step-downs** — node POI to
  cluster RPPs per ADC-TRAP-ELEC-001 (TBD); white space governed by
  ADC-CLU-BOM-001 unmodified.
- **BESS moves inside the node** (19× 6 MW/3 MWh grid-forming) —
  replaces 11× 3.6 MWh AC-coupled Hitachi blocks; aggregate energy
  57 MWh vs legacy 39.6 MWh working.
- **Solar (2.05 MW B1/B2 rooftop) [O]:** coupling point must re-derive
  against node architecture (scan §B); carried to ADC-TRAP-ELEC-001.

## §5 Hall concept [O → TRAP-OI-06]

Repeating unit = the **reference cluster row** (46 ft, 16 racks,
4 HAC bays, end-fed 2 MW CDU); one block = 4 rows. Legacy assigned
compute to **B3 (20 cassettes) and B4 (24 cassettes)** plus 42,000 +
28,000 sq ft yards — but cassettes are NEMA 3R outdoor units; an ADC
hall is conditioned indoor space, so the legacy building math does not
transfer. Open until ADC-TRAP-CIVIL-001:

1. B3/B4 floor plans + clear heights vs 4-row block footprint (46 ft
   rows + service aisles + CDU placement per ADC-ICD-001) — **no
   structural assessment exists for any building (legacy B-07)**;
2. whether 19 blocks of hall even fit the 22-acre footprint indoors,
   or the package needs purpose-built hall structures on the yards
   with B1/B2 kept to NOC/partner-hub use as planned;
3. hall humidity control — the cassette-coupled Munters/CHP regen path
   dies with the cassette (scan §A); re-derive (with CHP heat use
   question) in ADC-TRAP-THERM-001.

## §6 First-order consequences carried to TBD docs

- **Air permitting (ADC-TRAP-ENV-001):** legacy hit Title V at 44
  engines; ADC plan is 95 (Stage 1) / 185 (Full Build). MGN-BOD-002 §7
  claims 20 nodes under one minor-source envelope — Stage 1 (19) fits
  the claim *if it survives site-specific PTE math (ENV-001)*; Full
  Build (37 nodes) **cannot** — two envelopes, phased entities, or
  accept Title V. TRAP-OI-05.
- **Water (ADC-TRAP-THERM-001):** ~32–37 k GPM circulating Stage 1;
  makeup source still OPEN (legacy T-09 analog); LPDES blowdown
  pre-application carries over (R-03, C1).
- **Gas (ADC-TRAP-GAS-001):** supply/metering/storage still gates
  first-block energization (legacy C1); demand profile re-derives from
  G3520H heat rate × 95 engines.
- **Compute payload [O]:** NVL72 allocation remains the gating
  variable (legacy C1); rack-level arithmetic (78 kW avg vs NVL72
  actual) reconciles in the cluster fill check, governing N★ doc.

## §7 What this study is NOT

No electrical one-lines, no thermal balances, no civil layouts, no
schedules, no costs. Those are the TBD docs in the
[package README](README.md) and start only after Scott approves this
skeleton (decision 0003 issue-then-approve).
