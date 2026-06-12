# Cameron Street (Entergy, dual-utility) — Site Record

**Artifacts:** MGN-PROP-004 lives in
[colo/Entergy Cameron Street/](../Entergy%20Cameron%20Street/) —
governing Markdown extracted 2026-06-12 per decision 0012 (docx +
preview retained as history). This record is canonical.

**Filled from MGN-PROP-004 Rev 0.3** (Entergy Louisiana Technical
Proposal, Working Draft, 2026-06-08), imported 2026-06-11 from the
tracked docx in
[colo/Entergy Cameron Street/](../Entergy%20Cameron%20Street/).
The proposal is a Working Draft prepared by Scott, so its facts carry
[W] unless the proposal itself flags them unconfirmed ([O] — it lists
its own threshold confirmations in §5). Source column cites
MGN-PROP-004 sections.

> **MGN-PROP-005 check (SYS-OI-02): NOT subsumed.** MGN-PROP-004 never
> mentions LUS or dual-utility operation — it is a single-utility
> Entergy BTM proposal. The dual-utility fact (Entergy + LUS never tied
> synchronously) remains sourced only to MGN-TEL-001 §4.3 *citing*
> MGN-PROP-005, which is still not in the repo. **SYS-OI-02 stays
> open.** Until PROP-005 lands it is also unconfirmed whether the
> PROP-005 "Cameron Street dual-utility site" is this same parcel
> (2623 Cameron Street is plausible — an Entergy facility inside
> Lafayette/LUS territory — but no repo document says so).

## Identity & status

| Field | Value | Tag | Source |
|---|---|---|---|
| Site name | Cameron Street (Entergy Lafayette/Acadiana regional operations site) | [W] | MGN-PROP-004 header |
| Play | Brownfield repurposing — joint redevelopment of an Entergy-owned utility operations parcel as microgrid + compute | [W] | §1, §2.2 |
| Address / parcel | 2623 Cameron Street, Lafayette, LA 70506 — with **adjacent Entergy substation/switchyard** | [W] | header, §2.2 |
| Site control | None — Entergy is landowner; structure (lease / JV / redevelopment) is proposal §11 agenda item; parcel status is threshold item §5 #1 | [O] | §2.2, §5, §11 |
| Governing proposal doc | **MGN-PROP-004 Rev 0.3** (in repo, docx) — Entergy technical proposal. MGN-PROP-005 (dual-utility) still missing (SYS-OI-02) | [W] | doc header |
| Technical basis | MGN-BOD-002 Rev 0.1 cited — repo now holds Rev 0.2 + errata; re-base at next proposal rev | [W] | header, §3.2 |
| Stage | Proposal — Working Draft; requested next step = 60–90 min Entergy working session (§11) | [W] | §11 |
| Counterparty role | Entergy = interconnection/transmission provider, host landowner, standby-service counterparty — **not** the supplier of primary energy | [W] | §1 |
| Deployment shape | Two-phase: Phase 1 on-prem compute pilot (single pod / few MW); Phase 2 modular BTM nodes in 10 MW increments | [W] | §6 |
| Identity vs Trappey's Compute Center | **Different sites — CONFIRMED by Scott 2026-06-11 (decision 0003). COLO-01 CLOSED;** records stay split. | [L] | ops/decisions/0003 |

## Brownfield qualification checklist (MISSION.md §BL2)

| Criterion | Finding | Tag | Source |
|---|---|---|---|
| Prior large electrical consumption | Utility regional operations site (not a former industrial consumer in the BL2 sense); proposal's thesis is the substation, not load history | [W] | §2.2 |
| Existing transmission access | Adjacent substation/switchyard immediately at the parcel — "the decisive asset"; short, low-cost interconnection | [W] | §2.2, §8.1 |
| Existing substation / switching | Yes, adjacent — ownership (expected Entergy), voltage, capacity, spare bays all to confirm (threshold §5 #2) | [O] | §2.2, §5 |
| Industrial zoning | Likely industrial/utility-zoned as a utility ops site; not documented | [O] | §8.1 |
| On-prem natural gas piping | Unknown — gas supply availability and pressure at the site is data request §5 #9 (FUEL-001) | [O] | §5, §8.2 |
| Local support for industrial use | Entergy itself is the prospective landowner/counterparty; Lafayette/Acadiana in air-quality attainment | [W] | §2.2, §2.3 |

## Power

| Field | Value | Tag | Source |
|---|---|---|---|
| Serving utility / utilities | Entergy Louisiana (interconnection + standby service; primary energy is self-generated BTM). Dual-utility Entergy+LUS claim exists only via MGN-TEL-001 §4.3 / MGN-PROP-005 — **not stated in PROP-004** | [W] / [O] | §1; MGN-TEL-001 §4.3 |
| Dual-utility site? | [O] — per MGN-TEL-001 §4.3 (citing MGN-PROP-005): Entergy and LUS never tied synchronously. PROP-004 silent; resolves with SYS-OI-02 | [O] | MGN-TEL-001 §4.3 |
| Target IT load | Phase 1: single compute pod / a few MW. Phase 2: 10 MW increments; site well-suited to a single 10 MW node, multi-node subject to parcel area (§5 #10) | [W] | §6, §8.1 |
| Node count (MGN-BOD-002, 10 MW firm each) | 1 (+ Phase-1 pilot) on this parcel; multi-node needs confirmed contiguous land here or a companion site | [W] | §8.1 |
| Site ambient for firm-MW de-rate (ELEC-006) | [O] — data request §5 #8 | [O] | §5 |
| POI / interconnection posture | Behind-the-meter, grid-forming, island-capable, black-start; node step-up 4.16 kV → 13.8/34.5 kV matched to adjacent substation (voltage TBC); grid-parallel/export optional per IEEE 1547 + Entergy/MISO process | [W] | §3.1, §4.2, §4.6 |
| Fault/short-circuit posture | Study item — needs Entergy fault duty at the POI (§5 #3); sync condenser provisional on result (ELEC-002) | [O] | §4.3, §4.4 |

Node internals (5× Cat G3520H 4+1, 6 MW/3 MWh grid-forming BESS, SCR +
oxidation catalyst, 20-node/200 MW synthetic-minor campus module) are
platform standards — see MGN-BOD-002; this record does not restate them.

## Natural gas

| Field | Value | Tag | Source |
|---|---|---|---|
| Supply, pressure, MN/Wobbe (FUEL-001) | [O] — pipeline delivery assumed; availability/pressure at Cameron Street = data request §5 #9; gas quality vs engine envelope to confirm | [O] | §5, §8.2 |
| On-prem piping condition | [O] | [O] | — |

## Water

| Field | Value | Tag | Source |
|---|---|---|---|
| Source & capacity (heat rejection) | [O] — cooling selection (remote/roof radiators vs dry/adiabatic coolers) deferred to site water + ambient (MECH-001) | [O] | §8.2 |

## Structure & compute hall

| Field | Value | Tag | Source |
|---|---|---|---|
| Building envelope / floor / clear height vs HAC + 100.5″ plane | [O] — proposal does not address the compute hall structure; Phase-1 pilot is "a single compute pod" | [O] | §6 |
| Reference-bay fit (46 ft rows, racks per products/) | [O] | [O] | — |

## Permitting & environmental

| Field | Value | Tag | Source |
|---|---|---|---|
| Air: PTE calc + minor-source threshold (ENV-001) | Lafayette/Acadiana is in **attainment** — favorable for synthetic-minor posture; PTE must count the standby fleet; SCR locked as conservative basis | [W] | §2.3, §7 |
| Acoustic receptors (CIVIL-002) | **Priority** — in-town site with potential nearby receptors; G3520H ≤ 75 dB(A) @ 7 m enclosed is louder than competitor platforms; utility ops parcel may give buffer | [W] | §8.2 |
| Zoning / local approvals | Likely industrial/utility; lower siting friction than greenfield/commercial — not documented | [O] | §8.1 |
| BESS safety | LFP, UL 9540A fire basis, NFPA separation — with attention to proximity to the substation | [W] | §8.2 |

## Telemetry site-specifics (MGN-TEL-001 §4.3 / TEL-PROFILE)

| Field | Value | Tag | Source |
|---|---|---|---|
| Island-separation monitoring | If dual-utility confirms (SYS-OI-02): surface breaker + synchronizing status for both sources, monitoring/alarm only, interlock in relay/PLC — the platform's canonical site-specific telemetry case; must appear in this site's TEL-PROFILE | [L where applicable] | MGN-TEL-001 §4.3 |
| Grid-services dispatch telemetry | BESS grid services (frequency response, VAR/voltage, reserve, black-start) dispatched via "Mission Control" SCADA with DNP3 / IEC 61850 telemetry to Entergy/MISO | [W] | §9.2 |
| POI protection telemetry | Anti-islanding, transfer-trip, telemetry/SCADA provisions per Entergy and MISO interconnection requirements | [W] | §4.6 |

## Value-adds offered to Entergy (site-specific scope)

§9 of the proposal packages platform capabilities for this counterparty;
the site-specific element is that the Skydio drone-in-a-box dock on this
parcel extends autonomous thermal/visual inspection to **Entergy's
adjacent substation and nearby distribution** at near-zero incremental
cost (and to line/ROW patrol as FAA Part 108 BVLOS matures). Plus: BESS
grid services at an Entergy substation (§9.2), storm
resilience/black-start restoration value (§9.3), non-wires-alternative
T&D deferral (§9.4), redeployable bridge asset — no stranded investment
when Hyperion-class generation energizes (§9.5).

**Utility Grid Partnership annex (2026-06-11):** the §9 value-adds are
now packaged as the Entergy instance of the open-source Utility Grid
Partnership Program —
[ADC-UTIL-001-A](../utility-partnership/ADC-UTIL-001-A_Entergy_CameronStreet_Rev0_1.md)
(Rev 0.1 approved 2026-06-12; decision 0008). The annex
complements MGN-PROP-004 — it does not replace it; CAM-OI-02 stays
open. Working session = UTIL-OI-04.

## Data requested from Entergy (proposal §5 — drives everything [O] above)

Threshold: **#1 parcel status** (ownership/use/availability) and
**#2 adjacent substation** (ownership, voltage, capacity, spare bays).
Then: #3 fault duty at POI (ELEC-002), #4 interconnection
requirements/process, #5 metering at BTM boundary, #6 standby-service
terms, #7 IEEE 1547/export settings, #8 site ambient (ELEC-006),
#9 gas supply/pressure (FUEL-001), #10 parcel area/constraints (§8.1).

## Site open items

| ID | Item | Gates |
|---|---|---|
| SYS-OI-02 | MGN-PROP-005 (dual-utility) still not in repo — **PROP-004 checked 2026-06-11: does NOT subsume it** (no LUS/dual-utility content); also confirms/denies whether PROP-005's site is this parcel | dual-utility fact; island-separation TEL-PROFILE requirement |
| CAM-OI-01 | Entergy §5 data exchange — threshold #1 parcel status + #2 adjacent substation (voltage/capacity/spare bay); then #3–#10 | site control; POI/step-up scheme; every [O] row above |
| CAM-OI-02 | Re-base proposal on MGN-BOD-002 Rev 0.2 (+ errata) at next rev — PROP-004 Rev 0.3 cites Rev 0.1 and the preview.html deck cites Rev 0.3 (does not exist in repo) | next MGN-PROP-004 revision |
| CAM-OI-03 | **Retail-territory check:** the Entergy deep-dive (partners/Entergy/Entergy Info.pdf) flags genuine uncertainty whether 2623 Cameron Street is in Entergy retail territory at all — west Lafayette is heavily SLEMCO/LUS. Resolve at the §5 working session (it reshapes the standby-service and metering asks, #5–#6) | proposal viability; standby/metering structure |
| ~~COLO-01~~ | **CLOSED 2026-06-11** — different sites, confirmed (decision 0003); records stay split | — |

## Source documents

| Document | Location | Status |
|---|---|---|
| MGN-PROP-004 Rev 0.3 — Entergy Technical Proposal (.md.docx + preview.html) | [colo/Entergy Cameron Street/](../Entergy%20Cameron%20Street/) | tracked (commit 2b420f4); **imported into this record 2026-06-11** |
| Entergy corporate / interconnection deep-dive | [partners/Entergy/Entergy Info.pdf](../../partners/Entergy/Entergy%20Info.pdf) | tracked; no text layer — render to read; source of CAM-OI-03 |
| MGN-PROP-005 (Cameron Street dual-utility site proposal) | **not in repo** | SYS-OI-02 — awaiting file drop; PROP-004 does not subsume it |
| MGN-BOD-002 Rev 0.2 | [products/Microgrid/MGN-BOD-002_Rev0_2.md](../../products/Microgrid/MGN-BOD-002_Rev0_2.md) | governing node basis (PROP-004 cites Rev 0.1 — CAM-OI-02) |
| MGN-TEL-001 Rev 0.2 §4.3 | [products/Microgrid/MGN-TEL-001_Rev0_2.md](../../products/Microgrid/MGN-TEL-001_Rev0_2.md) | only source for the dual-utility / island-separation fact |
