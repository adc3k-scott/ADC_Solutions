# Marlie Hub (MARLIE 1) — Site Record

**Created 2026-06-11.** Sources: `colo/Marlie Hub/marlie-building.jpg`
and the Ornn email thread "Update — The Moat Just Got a Lot Wider"
(`partners/Ornn/previous emails.pdf`, 2026-04-10/14). This is the
**smallest site in the register and the first one scheduled to run
production workloads** — the seed-round proof-of-concept site.

> **Re-scoped 2026-06-11 by decision
> [0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md):**
> the seed plan in the Ornn thread was framed around the Pure-DC
> cassette (3 units). The cassette is dropped from the product set —
> **the MARLIE 1 POC unit is now the 16-rack reference cluster**
> (ADC-CLU-BOM-001, 1,248 kW), the quarter-N★-block. The seed budget
> line-items re-derive in cluster terms in the COLO-03 scope doc.

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
| Play | POC / first-deployment site — seed round builds the **first reference cluster(s)** here (count [O], was "3 units" under the superseded plan); once running production workloads, the cluster is a validated product pattern that replicates anywhere | [W] | Ornn email 2026-04-10; decision 0005 |
| Address / parcel | [O] — Lafayette, LA; photo shows a small metal shop building (motorcycle dyno shop signage) on a road frontage | [O] | marlie-building.jpg |
| Site control | [O] — presumed Scott-controlled/accessible; not documented | [O] | — |
| Governing doc | None yet — seed plan exists only in the Ornn thread (now superseded in platform terms by decision 0005) | [O] | — |
| Stage | Committed intent (seed scope), pre-engineering — **scope re-derivation required (COLO-03)** | [W] | Ornn email; decision 0005 |

## What MARLIE 1 carries (from the Ornn thread — platform terms superseded)

- Seed (~$5M) funds **infrastructure, not GPUs**: CDU, cooling,
  power distribution, validation instrumentation, gensets, and the
  POC build. GPU rack hardware (Rubin) is Series A, after the
  architecture is validated and a customer is signed. [W] —
  Scott→Jack Minor 2026-04-14. *Specific line-items in the thread
  (Boyd/Eaton CDU, Munters, 800 VDC distribution, Fibrebond
  container manufacturing) were cassette-anchored and re-derive
  against the current product lineup — decision 0005.*
- MARLIE 1 does not require a microgrid node day one — utility AC
  service for a sub-block POC; node pairing is the N★ full-block
  pattern. [W] — Ornn email 2026-04-10 (re-read per 0005).

## Power / engineering

| Field | Value | Tag | Source |
|---|---|---|---|
| Target IT load | n× reference cluster @ 1,248 kW (n = 1–4 [O]; superseded plan was ~6.9 MW nameplate); actual POC load likely far lower (validation, not production density) | [O] | ADC-CLU-BOM-001; decision 0005 |
| Serving utility | [O] — Lafayette (LUS or SLEMCO by location; unknown) | [O] | — |
| N★ relation | Sub-block scale: MARLIE 1 validates the reference cluster (the N★ IT fill unit, 4/block per decision 0005), not the 5 MW + 10 MW pairing | [W] | decisions 0004 + 0005 |

Everything else (gas, water, structure, permitting): [O] — premature.

## Site open items

| ID | Item | Gates |
|---|---|---|
| COLO-03 | Define MARLIE 1 POC scope as a document **in current-lineup terms (decision 0005)**: address/parcel, utility service, electrical capacity for n× reference clusters, hall/building fit, validation test plan, re-derived seed budget — the email-thread plan is superseded | seed deployment; product claims |
| MAR-OI-01 | Confirm site control + building suitability for an **indoor cluster row** (46 ft row, HAC bays, CDU; clear height + slab + power entry) — photo shows a small shop; may need addition/alternate structure | COLO-03 |

## Source documents

| Document | Location | Status |
|---|---|---|
| Ornn thread "The Moat Just Got a Lot Wider" | [partners/Ornn/previous emails.pdf](../../partners/Ornn/previous%20emails.pdf) | tracked; no text layer — render to read; **platform terms superseded by decision 0005** |
| ADC Pure DC AI Factory white paper | [website/white_papers/](../../website/white_papers/) | tracked; **no longer describes the product (decision 0005)** — marketing refresh flagged |
| marlie-building.jpg | [colo/Marlie Hub/](../Marlie%20Hub/) | tracked |
