# ADC-UTIL-001 — Utility Grid Partnership Program (Open-Source Spec)

| | |
|---|---|
| Document | ADC-UTIL-001 |
| Title | Utility Grid Partnership Program — open-source program specification |
| Revision | **Rev 0.1 — APPROVED by Scott 2026-06-12** (decision [0008](../../ops/decisions/0008-utility-grid-partnership-program.md)) |
| Author | ADC Solutions Inc (Mission Control), direction Scott Tomsu |
| Release posture | **Public.** This spec is published openly; the same offer is visible to every utility. Per-utility annexes (A/B/C) are working drafts for each counterparty's session. |
| Companion docs | [MGN-BOD-002 Rev 0.2](../../products/Microgrid/MGN-BOD-002_Rev0_2.md) (the node) · [MGN-TEL-001 Rev 0.2](../../products/Microgrid/MGN-TEL-001_Rev0_2.md) (the telemetry plane) · [ADC-NSTAR-001](../../products/NStar/ADC-NSTAR-001_Rev0_2.md) (aggregation) · Annexes [-A Entergy](ADC-UTIL-001-A_Entergy_CameronStreet_Rev0_1.md), [-B SLEMCO](ADC-UTIL-001-B_SLEMCO_Rev0_1.md), [-C LUS](ADC-UTIL-001-C_LUS_Rev0_1.md) |

Revision history

| Rev | Date | Change |
|---|---|---|
| 0.1 | 2026-06-11 | First issue per decision 0008 (issue-then-approve) |

---

## 1. Program thesis

Louisiana's electric utilities are carrying load growth, storm exposure,
and aging-asset replacement programs simultaneously, with field crews
and capital budgets stretched thin. At the same time, the federal
government has explicitly re-organized grid funding around data-center
demand growth. ADC Solutions — a Louisiana company with an in-house
Louisiana General Contractor License and a locally engineered compute +
power + telemetry platform — offers utilities a **partnership package**
rather than another interconnection request:

> A data-center developer that shows up with its own firm generation,
> a grid-services battery, an autonomous inspection capability that
> covers the utility's surrounding infrastructure, a unified telemetry
> plane the utility can dispatch against, and a documented path to
> federal cost-share for the utility's own modernization.

The evidence that the need is real is public (each annex cites the
specific utility's own record): LUS's capital list includes replacement
of aged 230 kV structures and distribution automation; SLEMCO operates
~10,500+ miles of line and 37 substations with no generation of its
own; and the retail-territory boundary at 2623 Cameron Street in
Lafayette is genuinely uncertain between three utilities
([cameron-street.md](../sites/cameron-street.md), CAM-OI-03).

**Why open source:** the territories of Entergy, SLEMCO, and LUS
interlock street-by-street around Lafayette. Publishing one program
spec means every utility sees the same offer, none is being sold a
proprietary lock-in, and adjacent utilities can adopt the same
interfaces — which makes joint or boundary-spanning deployments
possible instead of contractual dead zones.

## 2. The offer stack (four elements)

### 2.1 Firm BTM generation — the 10 MW block

The unit is the **10 MW AC-MV natural-gas microgrid node** per
MGN-BOD-002 Rev 0.2 (5× lean-burn gensets 4+1, 6 MW / 3 MWh AC-coupled
grid-forming BESS, 4.16 kV bus, SCR + oxidation catalyst, synthetic-
minor permitting posture). Compute scales in N★ blocks (5 MW IT + one
node) per ADC-NSTAR-001. This spec never restates node parameters —
MGN-BOD-002 governs.

What the utility gets from element 1:

- **Load that brings its own steel.** The data-center load arrives with
  its own firm generation behind the meter — it does not consume the
  utility's scarce generation or firm-capacity headroom.
- **Grid services at the POI** (detail in §2.3): black-start capability,
  storm resilience, frequency/VAR support, and reserve from the
  grid-forming BESS, dispatchable by the utility.
- **Non-wires alternative:** a sited node can defer feeder or
  substation upgrades the utility would otherwise capitalize.
- **A redeployable bridge asset:** modular nodes relocate; there is no
  stranded-investment exposure if bulk supply later catches up.

### 2.2 Autonomous inspection coverage — drone-in-a-box

A dock-resident autonomous UAS stationed at the partnership site flies
scheduled visual and radiometric-thermal inspection of:

- the **host/adjacent substation** (thermal anomaly detection on
  bushings, connections, transformers; intrusion/visual security), and
- the **distribution feeders, line hardware, and ROW running through
  the surrounding area** — the lines down the street, within the
  operating radius the governing FAA authorization allows.

Inspection products (imagery, radiometric thermal, 3D scans, change
detection) are delivered to the utility through the telemetry plane
(§2.3) in utility-consumable form.

**Capability class (reference, not commitment):** NDAA-compliant
dock-based platforms of the class documented in ADC's market research
[W — partners/Skydio/Skydio Drones Research Report.pdf, 2026]: ~40 min
endurance, 12 km line-of-sight link (cellular beyond), interchangeable
visual + 640×512 radiometric thermal payloads, onboard-autonomy
obstacle avoidance, browser-based remote operation, public contract
pricing ≈ $36k (dock) / ≈ $50k+ (full docked system before services).
A dock deployment is a program, not a purchase — deployment + training
services run ≈ $35–46k on public contract sheets.

**Operations model — intentionally open [L — Scott 2026-06-11,
decision 0008]:** this spec defines the capability and interfaces
only. Who owns and operates the aircraft — ADC, the utility's own
program, or a local Part 107 operator (Lafayette has an established
drone-services ecosystem, e.g. Drone Institute Lafayette's training
and NDT-inspection dispatch network) — is selected at each utility's
working session (UTIL-OI-03). All options use the same dock siting,
data interfaces, and deliverables defined here.

**Regulatory posture (verified 2026-06-11 — UTIL-OI-02 watch):**

- Operations today run under **14 CFR Part 107** with waivers as
  required (e.g., operations over people, night, limited BVLOS
  waivers). Utility infrastructure inspection is an established
  Part 107 use case.
- **Part 108 (BVLOS) is not yet final.** The FAA published the NPRM
  2025-08-07; comments closed 2025-10-06 with 3,000+ responses; the
  final rule was expected ~spring 2026 and has not been published as
  of 2026-06-11. When Part 108 lands, dock-based coverage radius
  expands materially (full feeder/ROW patrol). The program is designed
  to be valuable under Part 107 today and to scale when 108 finalizes.
  Sources: [FAA BVLOS newsroom](https://www.faa.gov/newsroom/beyond-visual-line-sight-bvlos),
  [FAA NPRM](https://www.faa.gov/newsroom/BVLOS_NPRM_website_version.pdf)
  (accessed 2026-06-11).

### 2.3 The telemetry plane as grid services

Per MGN-TEL-001 Rev 0.2, every ADC site runs one unified telemetry
plane — Redfish data model, one disciplined clock, one store, with
Layer-1 protection authority always local. The utility-facing surface:

- **Dispatch:** BESS grid services (frequency response, VAR/voltage
  support, reserve, black start) dispatched via SCADA with
  **DNP3 / IEC 61850** telemetry to the utility/RTO, per MGN-TEL-001
  and the site's interoperability profile (TEL-PROFILE).
- **POI protection telemetry:** anti-islanding, transfer-trip, and
  SCADA provisions per the utility's interconnection requirements.
- **Inspection data delivery:** drone inspection products (§2.2) ride
  the same plane — thermal anomaly flags and inspection records are
  delivered as utility-consumable events/reports, not a separate
  stovepipe.
- **Supervisory head-end:** fleet supervision is hosted at ADC's
  **Mission Control Node 0 (Marlie Hub, Lafayette)** — the staffed
  operations layer the utility coordinates with.

The plane is built on open standards (Redfish/DMTF, DNP3, IEC 61850) —
consistent with this spec's open-source posture: a utility can verify,
audit, and integrate without proprietary dependence.

### 2.4 Federal funding alignment

The federal government has re-organized grid funding explicitly around
data-center-driven load growth. A utility partnered with a
generation-bearing data-center developer has a stronger qualifying
story for these programs than either party alone. **Status verified
2026-06-11; all rows time-sensitive — refresh per UTIL-OI-01. Nothing
in this table asserts eligibility or award; candidacy is confirmed
jointly with each utility [W].**

| Program | Authority / size | Status as of 2026-06-11 | Eligible / relevant to | Fit with this program |
|---|---|---|---|---|
| **DOE GRIP** (Grid Resilience and Innovation Partnerships) | BIL §40103; $10.5B total | Rounds 1–2: $7.6B to 105 projects. Round 3 = **SPARK** ($1.9B, advanced transmission/reconductoring), full applications closed 2026-05-20 — awards pending; watch further rounds | IOUs, munis, co-ops, states | Grid-enhancing tech, distribution automation, microgrids as resilience assets |
| **DOE Speed to Power** initiative | DOE OE, launched 2025-09-18 (RFI; cites EO 14154, EO 14179) | Active — the explicit federal posture that grid capacity must accelerate for AI/data-center demand | Utilities, RTOs, states, large energy users | The program's thesis in federal print: data-center load growth justifies grid investment |
| **§40101(d)** Grid Resilience Formula Grants | BIL; ~$40M to Louisiana, administered by **LDENR** | Cycle 1: $15.99M (awarded from May 2023); Round 2: ~$18M via competitive RFPs — explicitly including **microgrids** and critical-infrastructure upgrades | Louisiana utilities via LDENR solicitations | Direct: BTM microgrid nodes and resilience hubs are named project classes |
| **USDA New ERA** (RUS) | IRA; $9.7B for electric co-ops | ~90% obligated (~$9B); under administration review/voluntary realignment — future windows uncertain | **Co-ops only** (SLEMCO-class) | Clean-energy procurement/builds for co-ops; watch for de-obligated funds |
| **USDA PACE** (RUS) | $1B partially forgivable loans | Active program of record | Munis, co-ops, IOUs, developers | Renewable + storage financing; pairs with BESS scope |
| **FEMA BRIC** | Hazard-mitigation; reinstated by court order | **Live window:** FY24–25 joint NOFO ($1B) released 2026-03-25; **applications due 2026-07-23** | States/local govts (LCG/LUS-class fit) | Hazard-mitigation framing for microgrids/hardening — near-term deadline is the urgency hook |
| **DOE LPO** | Title 17 loan guarantees | [O — engage if a campus-scale project warrants] | Large projects | Debt-side option only at campus scale |

Sources (accessed 2026-06-11):
[DOE GRIP](https://www.energy.gov/gdo/grid-resilience-and-innovation-partnerships-grip-program) ·
[SPARK $1.9B announcement coverage](https://www.hklaw.com/en/insights/publications/2026/03/doe-releases-1-9-billion-funding-opportunity-for-grid-upgrades) ·
[Speed to Power](https://www.energy.gov/speed-to-power) ·
[Federal Register — Accelerating Speed to Power](https://www.federalregister.gov/documents/2025/09/18/2025-18058/accelerating-speed-to-powerwinning-the-artificial-intelligence-race-federal-action-to-rapidly-expand) ·
[Louisiana 40101(d) — LDENR](https://www.dnr.louisiana.gov/page/40101d) ·
[USDA New ERA](https://www.rd.usda.gov/new-energy-deployment/new-era-project-announcements) ·
[USDA PACE](https://www.rd.usda.gov/programs-services/electric-programs/powering-affordable-clean-energy-pace-program) ·
[BRIC reinstatement (CRS)](https://www.congress.gov/crs-product/IN12609) ·
[BRIC FY24–25 NOFO](https://www.icf.com/insights/disaster-management/fema-bric-restart-nofo)

**What ADC provides under element 4:** project framing and technical
documentation that makes the utility's application credible — measured
telemetry (compliance-grade, immutable historian per MGN-TEL-001),
engineering bases (MGN-BOD-002), and the data-center demand-growth
narrative federal programs now prioritize. ADC does not practice law
or grant-write for the utility; it supplies the engineering substance.

## 3. What ADC asks of the utility

The mirror image of the §5 data-request pattern proven in MGN-PROP-004:

1. **A 60–90 minute working session** (agenda per annex).
2. **Interconnection cooperation** — POI requirements, fault duty,
   protection/telemetry requirements, metering at the BTM boundary.
3. **Standby service terms** for the BTM node.
4. **Site candidates** — utility-adjacent parcels where a node +
   dock + compute deployment serves both parties (the Cameron Street
   pattern: utility land + adjacent substation).
5. **A named technical counterpart** for the TEL-PROFILE
   (telemetry/dispatch interoperability profile) and the inspection
   data-delivery format.

## 4. Program boundaries (what this is not)

- Not a request for the utility's generation or firm capacity — the
  load brings its own (§2.1).
- Not a drone-services vendor pitch — the ops model is selected
  per-utility (§2.2); the spec only fixes interfaces.
- Not a claim of federal award or eligibility — §2.4 is a verified
  candidate matrix with a refresh obligation, confirmed jointly.
- Not exclusive — the spec is public, and the same offer stands for
  every Louisiana utility.

## 5. Open items

| ID | Item | Gates |
|---|---|---|
| UTIL-OI-01 | Federal program matrix refresh (verified 2026-06-11; BRIC window closes **2026-07-23**; SPARK awards pending) | every utility presentation |
| UTIL-OI-02 | FAA Part 108 final-rule watch (NPRM 2025-08-07; not final as of 2026-06-11) | coverage-radius claims; BVLOS scope |
| UTIL-OI-03 | Drone ops/ownership model selection — per utility, at working session (vendor-neutral by decision 0008) | inspection service contract |
| UTIL-OI-04 | Entergy working session (annex A) | annex A execution |
| UTIL-OI-05 | SLEMCO working session (annex B) | annex B execution |
| UTIL-OI-06 | LUS working session (annex C) | annex C execution |
