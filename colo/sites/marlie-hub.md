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
| Role | **Home office that supports compute** — the ADC Solutions team office is physically located here | [L] | Scott 2026-06-11 |
| Address | **1201 SE Evangeline Thruway, Lafayette, LA** | [L] | Scott 2026-06-11 |
| Site control | Established — ADC team office on site | [W] | Scott 2026-06-11 (instrument/lease form not documented) |
| Governing doc | None yet — compute scope doc is COLO-03 | [O] | — |
| Stage | Operating home office; compute build-out pre-engineering | [W] | Scott 2026-06-11 |

Not to be confused with the **Evangeline Distribution Hub** at 1016 **SW**
Evangeline Thruway ([evangeline-distribution-hub.md](evangeline-distribution-hub.md))
— different address, different site, different play.

## Compute role (current-lineup terms)

- Marlie Hub supports compute at sub-block scale on utility AC service
  — the ADC-NSTAR-001 §5 partial-block/POC pattern (1–3 reference
  clusters, no microgrid node). Production commitments are whole N★
  blocks at other sites. [W] — ADC-NSTAR-001 Rev 0.2 §5.
- The deployment unit is the **16-rack reference cluster**
  (ADC-CLU-BOM-001, 1,248 kW), the N★ IT fill unit per decisions
  0004/0005. Cluster count here is open ([O], 1–4 bounded by the
  partial-block rule).
- Seed funding intent (infrastructure before GPUs) is carried in the
  partner layer; all equipment line-items derive from the current
  product lineup only — no legacy plans. [W] — COLO-03 re-derives the
  budget.

## Power / engineering

| Field | Value | Tag | Source |
|---|---|---|---|
| Target IT load | n× reference cluster @ 1,248 kW (n [O]); actual initial load likely far lower (validation, not production density) | [O] | ADC-CLU-BOM-001 |
| Serving utility | [O] — 1201 SE Evangeline Thruway, Lafayette (LUS or SLEMCO by territory; confirm) | [O] | — |
| N★ relation | Sub-block scale: validates the reference cluster, not the 5 MW + 10 MW pairing | [W] | ADC-NSTAR-001 §5 |

Everything else (gas, water, structure, permitting): [O] — premature.

## Site open items

| ID | Item | Gates |
|---|---|---|
| COLO-03 | **Marlie Hub compute scope document** in current-lineup terms: utility service at 1201 SE Evangeline Thruway, electrical capacity for n× reference clusters, building fit, validation test plan, seed budget derived from the current lineup | seed deployment; product claims |
| MAR-OI-01 | Building suitability for an **indoor cluster row** (46 ft row, HAC bays, CDU; clear height + slab + power entry) at the home office — may need addition/alternate structure on site | COLO-03 |

## Source documents

| Document | Location | Status |
|---|---|---|
| Scott ruling (name, role, address) | this record, 2026-06-11 | [L] |
| marlie-building.jpg | [colo/Marlie Hub/](../Marlie%20Hub/) | tracked |
