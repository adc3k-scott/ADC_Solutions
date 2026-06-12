# Marlie Hub — Site Record

**Created 2026-06-11; re-founded 2026-06-11 per Scott's naming/scope
ruling.** The site name is **Marlie Hub** — exclusively; no other
designators, and no older topology framings are used for this site.
Marlie Hub is engineered in **current-lineup terms only** (ADC CDU,
Modular TCS, HAC, reference cluster, Telemetry).

> **Naming rule (Scott, 2026-06-11, binding):** use only "Marlie Hub."
> Superseded designators and the legacy block topologies historically
> associated with them are not used in any forward document. Historical
> decision records retain their text as history.

## Identity & status

| Field | Value | Tag | Source |
|---|---|---|---|
| Site name | **Marlie Hub** | [L] | Scott 2026-06-11 |
| Designation | **Mission Control Node 0** — zeroth node of the ADC fleet; hosts Mission Control (team + AI ops layer) and the Telemetry supervisory head-end; every future node reports here | [L] | Scott 2026-06-11 |
| Role | **Home office that supports compute** — the ADC Solutions team office is physically located here | [L] | Scott 2026-06-11 |
| Address | **1201 SE Evangeline Thruway, Lafayette, LA** | [L] | Scott 2026-06-11 |
| Site control | Established — ADC team office on site; **only ~$15k remains owed** — payoff + title/instrument documentation tracked as CAP-OI-03 (decision [0009](../../ops/decisions/0009-three-property-acquisition-seed-capital.md)) | [W] | Scott 2026-06-11 |
| Governing doc | [ADC-MHUB-001 Rev 0.2](marlie-hub-engineering/ADC-MHUB-001_Rev0_2.md) — compute scope, **APPROVED by Scott 2026-06-12** (COLO-03 closed) | [L] | marlie-hub-engineering/ |
| Stage | Operating home office; compute scope approved — **Phase 0 open** (utility inquiry MHUB-OI-01, building survey MAR-OI-01, heat-rejection selection MHUB-OI-02) | [W] | ADC-MHUB-001 §3 |

Not to be confused with the **Evangeline Distribution Hub** at 1016 **SW**
Evangeline Thruway ([evangeline-distribution-hub.md](evangeline-distribution-hub.md))
— different address, different site, different play.

## Compute role (current-lineup terms)

- Marlie Hub supports compute at sub-block scale on utility AC service
  — the ADC-NSTAR-001 §5 partial-block/POC pattern (no microgrid
  node). Production commitments are whole N★ blocks at other sites.
  [W] — ADC-NSTAR-001 Rev 0.2 §5.
- **Seed/POC = 8 racks (2 HAC bays, 624 kW IT), scalable in place to
  the full 16-rack reference cluster** (ADC-CLU-BOM-001, 1,248 kW) —
  all row infrastructure (TCS headers, 2 MW CDU, busway, RPPs) built
  for 16 at seed; scaling is populate-only (design rule SCALE-1).
  [L] — Scott 2026-06-11; ADC-MHUB-001 §3.
- Seed funding intent (infrastructure before GPUs) is carried in the
  partner layer; all equipment line-items derive from the current
  product lineup only — no legacy plans. [W] — COLO-03 re-derives the
  budget.

## Power / engineering

| Field | Value | Tag | Source |
|---|---|---|---|
| Target IT load | Seed: 8 racks = 624 kW design (validation load staged from ~300 kW class); scale: 16 racks = 1,248 kW | [L] | Scott 2026-06-11; ADC-MHUB-001 §3/§4.1 |
| Service envelope | ~0.9–1.1 MVA Phase 1 → ~1.6–1.8 MVA at 16 racks | [W] | ADC-MHUB-001 §4.1 |
| Serving utility | [O] — 1201 SE Evangeline Thruway, Lafayette (LUS presumed; confirm — MHUB-OI-01) | [O] | — |
| N★ relation | Sub-block scale: validates the reference cluster, not the 5 MW + 10 MW pairing | [W] | ADC-NSTAR-001 §5 |

Everything else (gas, water, structure, permitting): [O] — premature.

## Site open items

| ID | Item | Gates |
|---|---|---|
| COLO-03 | **CLOSED 2026-06-12** — ADC-MHUB-001 Rev 0.2 approved by Scott | seed deployment; product claims |
| MAR-OI-01 | Building-fit survey per ADC-MHUB-001 §6 checklist (46-ft row + CDU, clear height, slab/LA-PE input, power entry, heat-rejection siting, water, office coexistence) — may need addition/alternate structure on site | Phase 1 start |
| MHUB-OI-01 | Utility territory + service inquiry (LUS presumed; ~1.6–1.8 MVA envelope) | Phase 1 start |
| MHUB-OI-02 | Heat-rejection selection per decision 0006 at single-cluster scale | B3 procurement |
| MHUB-OI-03 | Validation rig spec (78 kW heater skids at QD interface, load banks, rental-vs-buy) | Phase 2 execution |
| MHUB-OI-04 | Redundancy posture for any future production IT here (re-opens ELE-OI-02 at this site) | production IT commitment |

## Source documents

| Document | Location | Status |
|---|---|---|
| Scott ruling (name, role, address) | this record, 2026-06-11 | [L] |
| marlie-building.jpg | [colo/Marlie Hub/](../Marlie%20Hub/) | tracked |
