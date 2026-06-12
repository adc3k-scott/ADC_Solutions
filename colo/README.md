# Louisiana Colocation Solutions Provider (CSP) — Business Line 2

The colocation side of ADC Solutions: developing and operating
mission-critical AI compute sites in Louisiana, built from our own
product stack (CDU, Modular TCS, HAC, 10 MW Microgrid Node, Telemetry)
and our in-house Louisiana General Contractor License. Mission context:
[MISSION.md](../MISSION.md) §Business line 2.

## The three plays

| # | Play | Profile |
|---|---|---|
| 1 | **Brownfield repurposing** | Older commercial/industrial locations that previously consumed large amounts of electricity, with on-prem natural gas, that can host 5–10 MW IT compute clusters (NVIDIA GPUs or Google TPUs). Ideal because they already have transmission, substations, switching infrastructure, industrial zoning, natural gas piping, and local support for continued industrial use. |
| 2 | **AI Enterprise for oilfield services** | Introduce AI enterprise compute — and its resale value — to Louisiana oilfield service companies. |
| 3 | **Greenfield development** | Projects with large amounts of on-prem natural gas and water. |

## How a site becomes real

A site is the unit of this business line, the way the 10 MW node
(MGN-BOD-002) is the unit of the power platform. Every site gets one
record in [sites/](sites/) built from the
[site-record template](sites/_TEMPLATE.md). The record is the canonical
index of site facts — utilities, gas, water, structure, zoning,
permitting — each tagged [L]/[W]/[O] with a source, same convention as
the product registry.

Site records **reference, never restate,** the platform standards:

- **Power:** nodes per MGN-BOD-002 (10 MW AC-MV NG node; campus = n×nodes
  under one minor-source air-permit envelope — ENV-001 applies to every
  campus commitment).
- **Telemetry:** site-specific requirements per MGN-TEL-001 §4.3 (e.g.,
  dual-utility island-separation monitoring) and the site Redfish
  interoperability profile (TEL-PROFILE).
- **Compute hall:** CDU + TCS + HAC reference bay per `products/`.

## Site register

Sites scale in **N★ blocks** (5 MW IT = 4× reference cluster + 10 MW
MGN-BOD-002 node — the safe building block; decisions
[0004](../ops/decisions/0004-n-star-block-topology.md) +
[0005](../ops/decisions/0005-no-cassettes-current-product-lineup.md);
governing definition
[ADC-NSTAR-001](../products/NStar/ADC-NSTAR-001_Rev0_2.md), Rev 0.2
pending approval — SYS-OI-08).

| Site | Record | Status |
|---|---|---|
| Trappey's Compute Center | [sites/trappeys-compute-center.md](sites/trappeys-compute-center.md) | **Filled 2026-06-11 from ST-TRAP-BOD-001 Rev 0.6** (legacy reference, external) — 22-acre cannery, Vermilion River; 91.1 MW Stage 1 BTM island. **ADC-native re-engineering decided ([0003](../ops/decisions/0003-trappeys-adc-native-reengineering.md)); TRAP-OI-03 phase-1 sizing APPROVED 2026-06-11** ([sites/trappeys-engineering/](sites/trappeys-engineering/): **19 N★ blocks Stage 1 [L]**, 37 Full Build, fill = 4× reference cluster per decision [0005](../ops/decisions/0005-no-cassettes-current-product-lineup.md)) |
| Cameron Street (Entergy, dual-utility) | [sites/cameron-street.md](sites/cameron-street.md) | **Filled 2026-06-11 from MGN-PROP-004 Rev 0.3** (Entergy BTM proposal; 2623 Cameron St, Entergy ops site + adjacent substation; Phase-1 pilot + single 10 MW node). PROP-004 does **not** subsume MGN-PROP-005 — **SYS-OI-02 stays open**; retail-territory check = CAM-OI-03 |
| Willow Glen Compute Campus | [sites/willow-glen.md](sites/willow-glen.md) | **Created 2026-06-11** — retired riverfront power station (WGT campus, Zydeco/Yorktown); deal playbook = ground lease/option, gated on independent Entergy/MISO load inquiry (COLO-02). Comp: Hut 8 River Bend 25 mi north |
| Marlie Hub (MARLIE 1) | [sites/marlie-hub.md](sites/marlie-hub.md) | **Created 2026-06-11; re-scoped per decision [0005](../ops/decisions/0005-no-cassettes-current-product-lineup.md)** — seed-round POC site: first reference cluster(s), the N★ IT fill unit. Origin of the legacy "Marlie-pattern block" name. Scope doc needed (COLO-03) |
| Evangeline Distribution Hub | [sites/evangeline-distribution-hub.md](sites/evangeline-distribution-hub.md) | **Created 2026-06-11** — 1016 SW Evangeline Thruway: $6M leasehold-only offer (land = Union Pacific), 173 kSF warehouse / 12.26 ac; likely BL1 distribution hub; ground-lease diligence = COLO-04 |

**COLO-01 CLOSED 2026-06-11:** Trappey's and Cameron Street are
**different sites**, confirmed by Scott (decision 0003). Records stay
split.

## Reference documents (folder root)

| Document | Role |
|---|---|
| [OCP_Ready_v1_Site_Assessment_v1.0_rev1.4.xlsx](OCP_Ready_v1_Site_Assessment_v1.0_rev1.4.xlsx) | Official OCP Ready™ v1 site-assessment workbook (checklist + self-assessment, dropped 2026-06-11) — the certification instrument for the CSP OCP Ready play; requires OCP membership + Solution Provider Agreement, reviewed every 12 months |
| [Open Data center Spec Version 0.5.0.pdf](Open%20Data%20center%20Spec%20Version%200.5.0.pdf) | OCP ODS draft — feeds the SYS-OI-06 spec watch |
| [Heat_Rejection_5MW_IT.pdf](Heat_Rejection_5MW_IT.pdf) | 5 MW heat-rejection study (evaporative + chiller trim) — the NSTAR Rev 0.2 PUE basis; architecture now subject to decision [0006](../ops/decisions/0006-heat-rejection-architecture.md) |

## Open items

Colo-relevant items live in the unified register
(`system/registry/open-items.json`): SYS-OI-02 (MGN-PROP-005 file
drop), COLO-02 (Willow Glen site control), COLO-03 (MARLIE 1 POC
scope), COLO-04 (Evangeline use decision + ground-lease diligence),
ENV-001 (PTE / minor-source — gates every 200 MW campus commitment),
ELEC-006 (firm-MW de-rate to site ambient — gates every commercial
commitment), CIVIL-001/002 (footprint, acoustics — gate site
layout/selection). Site-local items (CAM-/WG-/MAR-/EVA-/TRAP-OI-xx)
live in their site records. Drop survey:
[ops/research/2026-06-11-colo-drops-survey.md](../ops/research/2026-06-11-colo-drops-survey.md).
