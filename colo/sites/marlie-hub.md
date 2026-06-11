# Marlie Hub (MARLIE 1) — Site Record

**Created 2026-06-11.** Sources: `colo/Marlie Hub/marlie-building.jpg`
and the Ornn email thread "Update — The Moat Just Got a Lot Wider"
(`partners/Ornn/previous emails.pdf`, 2026-04-10/14). This is the
**smallest site in the register and the first one scheduled to run
production workloads** — the seed-round proof-of-concept site.

> **Name lineage:** the "Marlie-pattern block" cited in the legacy
> Trappey's engineering set (ST-TRAP-BOD-001 §E, gpu-learning-lab)
> takes its name from this site — Marlie is the origin/prototype of
> the independent-block pattern that decision 0004 generalizes as the
> N★ block. Capture: legacy §E block pattern → named after Marlie →
> now ADC-native as N★.

## Identity & status

| Field | Value | Tag | Source |
|---|---|---|---|
| Site name | Marlie Hub / "MARLIE 1" (deployment designator in the Ornn thread) | [W] | Ornn email 2026-04-10 |
| Play | POC / first-deployment site — seed round builds the **first three Pure-DC cassettes** here; once running production workloads, the cassette is a factory-tested product that ships anywhere | [W] | Ornn email 2026-04-10 |
| Address / parcel | [O] — Lafayette, LA; photo shows a small metal shop building (motorcycle dyno shop signage) on a road frontage | [O] | marlie-building.jpg |
| Site control | [O] — presumed Scott-controlled/accessible; not documented | [O] | — |
| Governing doc | None yet — seed plan exists only in the Ornn thread + white paper | [O] | — |
| Stage | Committed intent (seed scope), pre-engineering | [W] | Ornn email |

## What MARLIE 1 carries (from the Ornn thread)

- Seed (~$5M) funds **cassette infrastructure, not GPUs**: Boyd/Eaton
  CDU, Munters desiccant system, 800 V DC power distribution,
  validation instrumentation, gensets, and the POC build. GPU rack
  hardware (Rubin) is Series A, after the architecture is validated
  and a customer is signed. [W] — Scott→Jack Minor 2026-04-14.
- Cassettes still accept AC at the site level (converted to DC before
  the cassette) — MARLIE 1 does not require a microgrid node day one.
  [W] — Ornn email 2026-04-10.
- Manufacturing partner: Fibrebond, Minden LA (production-scale
  cassette build; acquired Boyd → liquid cooling in-house). [W].

## Power / engineering

| Field | Value | Tag | Source |
|---|---|---|---|
| Target IT load | 3 cassettes × 2.3 MW IT nameplate; actual POC load likely far lower (validation, not production density) | [O] | white paper; inference flagged |
| Serving utility | [O] — Lafayette (LUS or SLEMCO by location; unknown) | [O] | — |
| N★ relation | Sub-block scale: MARLIE 1 validates the cassette (the IT fill), not the 5 MW + 10 MW pairing | [W] | decision 0004 |

Everything else (gas, water, structure, permitting): [O] — premature.

## Site open items

| ID | Item | Gates |
|---|---|---|
| COLO-03 | Define MARLIE 1 POC scope as a document: address/parcel, utility service, electrical capacity for 1–3 cassettes, validation test plan — currently the plan exists only in an email thread | seed deployment; cassette product claims |
| MAR-OI-01 | Confirm site control + suitability of the existing building (photo shows a small shop — cassettes are outdoor 40-ft ISO units; yard space?) | COLO-03 |

## Source documents

| Document | Location | Status |
|---|---|---|
| Ornn thread "The Moat Just Got a Lot Wider" | [partners/Ornn/previous emails.pdf](../../partners/Ornn/previous%20emails.pdf) | tracked; no text layer — render to read |
| ADC Pure DC AI Factory white paper | [website/white_papers/](../../website/white_papers/) | tracked; cassette = the product MARLIE 1 validates |
| marlie-building.jpg | [colo/Marlie Hub/](../Marlie%20Hub/) | tracked |
