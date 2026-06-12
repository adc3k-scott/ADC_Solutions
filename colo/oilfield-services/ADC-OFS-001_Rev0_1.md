# ADC-OFS-001 — Oilfield Services Compute Program
## AI Enterprise for Louisiana Oilfield Service Companies — US-90 Corridor

| Field | Value |
|---|---|
| Document | ADC-OFS-001 |
| Revision | **0.1 — issued 2026-06-12, APPROVED by Scott 2026-06-12** |
| Decision | [0010](../../ops/decisions/0010-oilfield-services-compute-program.md) |
| Owner | Scott Tomsu, President |
| Audience | Oilfield service company principals — **presented by Scott only; nothing is sent from this repo** |

## Revision history

| Rev | Date | Change |
|---|---|---|
| 0.1 | 2026-06-12 | First issue per decision 0010: corridor thesis, tier ladder (0/1/2/n), ADC fleet model, yard qualification checklist, working-session ask, boundaries, OFS-OI-01..04. Generic target profile — per-prospect annexes follow as companies are named. |

## §1 Thesis — they're sitting on compute sites and don't know it yet

Louisiana oilfield service companies along the **US-90 corridor
(Lafayette → New Iberia → Morgan City)** hold exactly the assets the
AI compute buildout is short of: **large industrial yards, on-prem
natural gas, and high-voltage electrical service** — plus crews who
work energy for a living. These yards already satisfy the brownfield
qualification criteria in [colo/README](../README.md): prior
industrial use, gas piping, HV service, industrial zoning, and local
support for continued industrial use. The corridor also overlaps
ADC's Business-Line-1 logistics base (Port of Iberia, rail, I-49/I-10
— MISSION.md).

Three reasons this audience, specifically:

1. **They are energy-literate.** They will understand what these
   computers consume faster than any other commercial audience — and
   they will sanity-check our generation numbers, which is welcome:
   the node offer is supplier-grade (MGN-BOD-002).
2. **Renting idle assets is already their business model.** Tools,
   pumps, equipment, crews — oilfield services monetizes capacity by
   the day. GPU rental is not a new concept to sell them; it is their
   own model applied to a new asset class.
3. **Diversification is live.** A compute tier on the yard is revenue
   that does not track the rig count.

The play (MISSION.md Business Line 2, play #2): introduce enterprise
compute small — edge GPUs serving **their own operations first** —
then grow into renting/allocating capacity to other businesses, with
ADC providing the knowledge, the tools, and the operating layer on an
ongoing basis.

## §2 The tier ladder — fungible by design

The offer scales up or down without re-engineering, because every
tier is an existing governed ADC configuration (each tier
**references** its governing doc, never restates it):

| Tier | What it is | Scale | Governing basis |
|---|---|---|---|
| **0 — Edge enterprise** | Racks in their shop on existing utility AC service; their own AI workloads (dispatch, maintenance prediction, document/compliance work) first | Sub-cluster | ADC-NSTAR-001 §5 partial-block pattern (utility AC, no microgrid node) |
| **1 — Reference cluster** | 8 racks scalable in place to 16 — row infrastructure built for 16 on day one, scaling is populate-only | up to 1,248 kW IT | SCALE-1 design rule; ADC-CLU-BOM-001; the pattern being validated at Marlie Hub (ADC-MHUB-001) |
| **2 — N★ block** | Full block on **their gas**: 5 MW IT + 10 MW NG genset node behind the meter | 5 MW IT | ADC-NSTAR-001; MGN-BOD-002; heat rejection site-selectable per decision 0006 |
| **n — Multi-block** | N independent stars on the yard | n × 5 MW IT | ADC-NSTAR-001 (campus = n× blocks; ENV-001 air-permit envelope applies) |

Every job will be different — the ladder is what makes that a feature
instead of a custom-engineering bill.

## §3 The fleet model — ADC operates, the fleet is the product

**[L — Scott 2026-06-12, decision 0010]:** every yard node reports to
**Mission Control Node 0 (Marlie Hub)**. ADC operates the deployment
through Telemetry (one Redfish namespace, per-site TEL-PROFILE), and
**brokers/allocates spare GPU capacity across the fleet**. The owner
gets the tools, the knowledge transfer, and a revenue share on
brokered capacity.

This is the structural answer to the single-yard problem: a few GPUs
in one shop with only local demand is a stranded asset. Aggregated
through Node 0, **no yard depends on its own demand** — capacity is
sold against the whole corridor's pipeline, and each owner's edge
workloads always take priority on their own iron.

Financial layer: the Ornn overlay (compute-capacity instruments) is a
**candidate** on the aggregated fleet — overlay not offtake, framing
per decision 0005 [W — CAP-OI-04 thread; no commitment exists].

## §4 Yard qualification checklist (per prospect — feeds the annex)

| Item | What we need | Tag |
|---|---|---|
| Yard | Acreage, laydown area, slab/foundation condition | [O] per yard |
| Gas | Service size/pressure at the yard; pipeline interconnect distance | [O] per yard |
| Electrical | HV service voltage/capacity; utility; meter structure | [O] per yard |
| Connectivity | Fiber availability/bandwidth at the yard — industrial yards are not lit buildings | [O] — corridor survey OFS-OI-02 |
| Heat rejection | Site selection per decision [0006](../../ops/decisions/0006-heat-rejection-architecture.md) (evaporative vs zero-water dry, Lafayette-class ambient) — applies down-ladder to Tier 0/1 | per site |
| Tier-0/1 site standard | Power quality, containment, physical security, fire — minimum standard for a shop install | OFS-OI-03 gates any install |
| Workloads | Their AI-relevant work inventory: dispatch/logistics, predictive maintenance, HSE/compliance documents, bidding | [O] per prospect |

## §5 What ADC asks of a prospect

1. A **60–90 minute working session** at the yard — Scott presents
   the ladder; we walk the site against the §4 checklist.
2. Yard data per §4 (utility bills, gas service, fiber status).
3. A first workload conversation: where their hours actually go, so
   Tier 0 lands on something that pays its way in their own
   operation before any rental conversation starts.

## §6 Boundaries (what this program is NOT)

- **No rental-return promises.** Economics are modeled per prospect
  with their numbers — never asserted, no invented prices.
- **No named prospects in this public spec** — companies appear only
  in their own annex, written when Scott names them (OFS-OI-01).
- **No GPU supply commitment** — the NVIDIA relationship is a
  separate thread; allocation is a gating variable, not a given.
- **No revenue-share percentages** — the fleet commercial model is
  OFS-OI-04, settled before any prospect presentation.
- Nothing is sent to any prospect from this repo — Scott approves and
  presents.

## §7 Open items

| ID | Item | Gates |
|---|---|---|
| OFS-OI-01 | Corridor prospect list — named companies + yard facts (the "six large yards" prospect first when Scott names it) | per-prospect annexes |
| OFS-OI-02 | Fiber/connectivity survey of the US-90 corridor (providers, lit buildings, build costs) | Tier selection per yard |
| OFS-OI-03 | Tier-0/1 minimum site standard (power quality, containment, security, fire) | any shop install |
| OFS-OI-04 | Fleet commercial model — revenue share + brokered-capacity terms (no invented prices; Ornn overlay candidacy resolved here) | any prospect presentation |
