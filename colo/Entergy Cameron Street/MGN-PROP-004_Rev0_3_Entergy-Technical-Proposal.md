# MGN-PROP-004 — Entergy Louisiana: Technical Proposal
## Behind-the-Meter Modular Natural-Gas Microgrid for AI Data-Center Load — Engineering Brief

> **Governing copy note:** this Markdown is the governing repo copy
> (extracted 2026-06-12 from
> `MGN-PROP-004_Rev0_3_Entergy-Technical-Proposal.md.docx` per decision
> [0012](../../ops/decisions/0012-repo-file-structure-conformance.md);
> the docx is retained alongside as the as-transmitted artifact).
> Site record: [colo/sites/cameron-street.md](../sites/cameron-street.md).
> Note: cites MGN-BOD-002 **Rev 0.1** as transmitted; the BOD is now at
> Rev 0.2 — re-base tracked as CAM-OI-02.

| Field | Value |
|---|---|
| Document | MGN-PROP-004 |
| Revision | 0.3 (Working Draft) |
| Prepared for | Entergy Louisiana — Large-Load Origination / Transmission & Interconnection Engineering |
| Prepared by | Scott Tomsu — Principal / Developer |
| Contact | scott@adc3k.com · (337) 780-1535 · Lafayette, Louisiana |
| Proposed site | 2623 Cameron Street, Lafayette, LA 70506 — Entergy Louisiana Lafayette/Acadiana regional operations site, with adjacent substation |
| Technical basis | MGN-BOD-002 Rev 0.1 (10 MW AC-MV natural-gas microgrid node — Basis of Design) |
| Platform name | TBD — placeholder prefix "MGN" |
| Date | 2026-06-08 |

**Revision note (0.2 → 0.3):** The proposal is re-based onto the
standard 10 MW node (MGN-BOD-002 Rev 0.1), replacing the earlier node
basis (MGN-BOD-001). Every node-level figure is updated accordingly:
generation is now 5× Cat G3520H (4 running + 1 N+1) = 10 MW firm; the
BESS is 6 MW / 3 MWh; the campus module is 20 nodes = 200 MW under one
synthetic-minor envelope; modular scaling is in 10 MW increments. The
Cummins second-source rating is corrected to its 60 Hz value (§3.1,
Appendix A). A new §9 — Value-added capabilities for Entergy is added,
covering autonomous aerial inspection of electrical assets (Skydio),
grid services, storm resilience, non-wires-alternative value,
redeployability, and future-fuel posture. Roles (§10) and next steps
(§11) updated to match.

**Audience note.** This brief is written for Entergy large-load and
interconnection engineering staff. It leads with system architecture,
dynamic behavior, and the interconnection interface. The
commercial/strategic framing is intentionally brief (§2).

## §1 — Purpose

This document proposes a behind-the-meter (BTM), modular natural-gas
microgrid that serves AI data-center load from its own dispatchable
generation and storage, co-located on Entergy's existing Lafayette
operations site at 2623 Cameron Street and interconnected to the
adjacent substation. Entergy's role is interconnection / transmission
provider, host landowner, and standby-service counterparty — not the
supplier of the data center's primary energy.

For Entergy specifically, the platform is positioned as a complement
and a bridge — not a market-entry tool. Entergy is already the most
data-center-committed utility in Louisiana; this microgrid offers (a)
speed-to-power for prospects that cannot wait on new central generation
and transmission, and (b) a ratepayer-neutral, customer-funded
structure for loads Entergy wants to capture without expanding its
regulated rate base — deployed here on Entergy's own underutilized real
estate, next to an existing point of interconnection.

The proposal is staged: a contained Phase 1 on-prem compute pilot at
the site, followed by Phase 2 modular microgrid deployment.

## §2 — Why this fits Entergy (brief)

### §2.1 Strategic posture — complement, not entry

Entergy Louisiana serves ~1.1 million customers across 58 parishes and
is building unprecedented generation for the Meta "Hyperion" campus in
Richland Parish — now on the order of 7.5 GW across ten gas plants
(three approved in 2025, seven fast-tracked in 2026), funded by Meta,
with the earliest combined-cycle units slated for late 2028. That
program demonstrates Entergy's scale; it also illustrates the two gaps
this platform fills:

- **Speed-to-power.** A multi-year generation-plus-transmission build
  cannot energize a customer quickly. A BTM microgrid can bring a data
  center online in months, bridging the gap until Entergy's grid
  solution is in service — capturing deals that would otherwise go to
  faster markets, and de-risking ramp.
- **Ratepayer neutrality.** The Hyperion approvals drew scrutiny over
  cost allocation and ratepayer impact. A customer-funded,
  behind-the-meter microgrid avoids rate-basing generation and
  sidesteps that cost-shifting concern for the next set of prospects —
  Entergy captures the load, interconnection, and economic development
  without a fresh rate-case exposure.

### §2.2 Proposed site — an Entergy-owned Lafayette site with an adjacent substation

The proposed site, 2623 Cameron Street, is Entergy Louisiana's
Lafayette / Acadiana regional operations site (listed as an Entergy
Louisiana facility; understood to be a longstanding regional
headquarters/operations center), with existing grid infrastructure — a
substation/switchyard — immediately adjacent. This is an unusually
strong siting position for a BTM microgrid:

- **Entergy controls the parcel.** There is no third-party
  retail-territory question; the interconnection counterparty is also
  the landowner, which simplifies site control, access, and commercial
  structuring.
- **The adjacent substation is a ready, short interconnection.**
  Co-locating the microgrid next to an existing Entergy substation
  means minimal interconnection length and cost and a fast energization
  path — directly reinforcing the speed-to-power thesis (§2.1).
- **A utility operations site is already industrial/utility-zoned**
  with existing electrical, security, and access infrastructure —
  materially lower siting friction than a greenfield or commercial lot.
- If the site is being vacated or underutilized ("old" regional HQ), it
  is an even stronger candidate for joint redevelopment as a microgrid
  + compute site that monetizes idle Entergy real estate and an
  existing point of interconnection.

**Confirm (threshold items, see §5):** current ownership, use, and
availability of the parcel; and the adjacent substation's ownership
(expected Entergy), voltage, available capacity, and
spare-bay/interconnection availability.

### §2.3 Permitting context

Lafayette / Acadiana is in an air-quality attainment area, favorable
for the emissions/permitting posture in §7.

## §3 — Proposed architecture

### §3.1 The node

The atomic unit is a 10 MW firm AC-MV natural-gas microgrid node:

```
5× Cat G3520H gensets (≈2.5 MW, 4.16 kV, lean-burn) — 4 running + 1 N+1
        │
        ▼
   4.16 kV paralleling switchgear (metal-clad, 5 kV class)
        ├──── AC-coupled BESS — 6 MW PCS (4-quadrant, grid-forming) / 3 MWh LFP
        ├──── Synchronous condenser  [provisional — per fault study, §4.4]
        ▼
   Node step-up transformer  4.16 kV → 13.8 / 34.5 kV
        ▼
   Customer load (BTM)  +  short interconnect to the ADJACENT Entergy substation
```

- **Generation:** five Cat G3520H lean-burn gas gensets, four running
  to carry 10 MW firm, one as N+1 for maintenance/forced-outage cover.
  The Cummins HSK78G (rated to 55 °C ambient) is a qualified
  per-position drop-in second source for hot-ambient headroom; because
  it rates lower at 60 Hz (≈1.6–1.8 MW), an HSK78G-populated node uses
  more positions to hold the same firm MW (per MGN-BOD-002 §4.2).
- **Storage / grid-former:** a 6 MW / 3 MWh LFP BESS on a 4-quadrant,
  grid-forming PCS. The BESS — not a genset — establishes the bus
  voltage/frequency reference and black-starts the node; a lead genset
  in isochronous mode is the backup grid-former.
- **Emissions:** per-engine SCR (NOx) + oxidation catalyst (CO / VOC /
  formaldehyde).
- **Interconnection advantage:** the node step-up is matched to the
  adjacent substation's voltage (to be confirmed), with a short tie-in
  — a key cost and schedule benefit of this site.
- **Modularity:** the node is a standardized, replicable unit. Twenty
  nodes = 200 MW under a single synthetic-minor air-permit envelope
  (§7), scalable in 10 MW increments. Site-fit for this parcel in §8.1.

### §3.2 Reference drawings / basis

Full electrical, mechanical, controls, emissions, and civil basis is in
MGN-BOD-002 Rev 0.1 and companion single-line MGN-SLD-002. This brief
summarizes; the BOD governs.

## §4 — Dynamic behavior on the interconnected system (engineering detail)

### §4.1 Load-following for AI compute — the design driver

AI training load swings hard and fast (compute vs.
collective-communication phases). Lean-burn gas reciprocating engines
have staged block-load limits (ISO 8528-5) and cannot absorb a hard
step without risk of lean-misfire and trip. The platform is therefore
battery-buffered by design:

- The 4-quadrant grid-forming BESS bridges the transient —
  sourcing/absorbing real and reactive power within sub-cycle while the
  engines ramp fuel over several seconds.
- Sizing basis (MGN-BOD-002 §5.3): worst-case coherent load step
  modeled conservatively at 50% of the node = 5 MW; PCS = 5 MW × 1.20 ≈
  6 MW.
- 4-quadrant is required because a load rejection (≈5 MW dropping at
  once) reverses the problem — the BESS must absorb real power while
  engines back down.
- Governing case: the 5 MW load step exceeds the N-1 generation loss
  (one genset = 2.5 MW); the load step governs.

Net result: the plant is genuinely suited to load-following AI compute,
which a genset-only plant is not.

### §4.2 Grid-forming, islanded, and black-start operation

The microgrid runs grid-forming in island/BTM mode, with the BESS PCS
as the reference, and black-starts independently. It is island-capable
and self-sufficient, so it does not rely on the host grid for primary
energy — a feature that makes it attractive as a speed-to-power bridge
ahead of Entergy's grid solution. Grid-parallel operation with the
adjacent substation, where applicable, is per IEEE 1547 with
anti-islanding, and per Entergy/MISO interconnection requirements.

### §4.3 Fault contribution & short-circuit strength

This is a study item requiring Entergy data. The inverter-based BESS
contributes current-limited fault current (≈1.1–1.2 pu); the
synchronous gensets contribute higher fault current and rotating
inertia. Whether the gensets alone provide sufficient short-circuit
strength, voltage stiffness, and reactive support at the
adjacent-substation POI is determined by a fault-level / short-circuit
study (MGN-BOD-002 ELEC-002) using Entergy's available fault duty at
that substation. Note: with only four running machines on a 10 MW node,
the node's short-circuit contribution is modest, so this study carries
meaningful weight in the synchronous-condenser decision (§4.4).

### §4.4 Synchronous condenser — provisional

Included only if the fault study shows insufficient short-circuit
strength or reactive support. It supplements — never replaces — the
BESS.

### §4.5 Power quality & harmonics

PCS and any VFD content produce harmonics. The design targets IEEE 519
limits at the POI; a harmonic study (MGN-BOD-002 ELEC-003) confirms
filtering need.

### §4.6 Protection & interconnection compliance

Each genset has a dedicated breaker with synchronizing, reverse-power,
and protective relaying. POI protection is coordinated with Entergy at
the adjacent substation, including anti-islanding, transfer-trip, and
telemetry/SCADA provisions per Entergy and MISO interconnection
requirements. For any export/grid-parallel arrangement, the project
complies with the applicable Entergy/MISO interconnection process.

### §4.7 Reliability / availability

Firm output is N+1 at the node (5 gensets carry 10 MW on four). The
BESS provides ride-through. This is dispatchable firm capacity that can
also provide grid services (frequency response, peak-shave, reactive
support) through the "Mission Control" SCADA/merchant-ops layer —
potentially of value to Entergy as a flexible, redeployable resource at
an existing substation (developed further in §9).

## §5 — Interconnection & interface (what we need from Entergy)

The microgrid delivers at 13.8 / 34.5 kV at the node and ties into the
adjacent substation at 2623 Cameron Street. To advance engineering, we
request the following from Entergy:

| # | Data / decision needed | Used for |
|---|---|---|
| 1 | Parcel status — current ownership, use, and availability of the 2623 Cameron Street site for microgrid + compute development | Threshold — site control / redevelopment structure |
| 2 | Adjacent substation — ownership (expected Entergy), operating voltage, available capacity, and spare-bay / interconnection availability | Threshold — defines the POI and step-up scheme |
| 3 | Available 3-phase & 1-phase short-circuit duty at the substation POI | Fault study (ELEC-002), sync-condenser decision |
| 4 | Entergy / MISO interconnection requirements & process (relaying, transfer trip, telemetry, study queue) | Protection coordination, grid-parallel design |
| 5 | Metering requirements at the BTM boundary | Settlement / boundary definition |
| 6 | Standby / backup service terms for the BTM load | Reliability design, commercial structure |
| 7 | For grid-parallel / export: IEEE 1547 settings, anti-islanding, MISO South obligations | Grid-parallel design, if pursued |
| 8 | Site ambient design conditions | Firm-MW de-rate (ELEC-006) |
| 9 | Gas supply availability and pressure at the Cameron Street site | Fuel train (FUEL-001) |
| 10 | Parcel land area and any site constraints (existing structures, easements, setbacks) | Node count / site-fit (§8.1) |

## §6 — Two-phase deployment

**Phase 1 — On-prem compute pilot (wedge / bridge).** A contained
AI-compute deployment (a single compute pod / a few MW) at the Cameron
Street site, powered by the microgrid and tied to the adjacent
substation, proving speed-to-power and establishing the operating and
interconnection relationship — at low capital and minimal regulatory
friction, on land Entergy already controls.

**Phase 2 — Modular BTM microgrid (scale / bridge).** Behind-the-meter
microgrid nodes serve the larger load, deployable in 10 MW increments
far faster than central generation. For Entergy this functions as a
bridge: the microgrid carries the load now, and can be drawn down,
redeployed, or run in parallel as Entergy's grid solution comes online.
Indicative sequencing (to be refined against parcel and gas supply):

| Stage | Indicative duration |
|---|---|
| Parcel status + adjacent-substation capacity confirmation (§5 #1–2) | Days–weeks |
| Phase-1 pilot scoping + interconnection data exchange | Weeks |
| Phase-1 pilot energized at the site | Near-term |
| Phase-2 fault/harmonic studies, permit PTE, MISO process (if applicable) | In parallel |
| First 10 MW node commissioned | Months (vs. multi-year central generation) |
| Additional nodes | Modular, subject to site-fit (§8.1) |

## §7 — Emissions & permitting mechanics

Each engine carries SCR + oxidation catalyst, addressing NOx, CO, VOC,
and formaldehyde per 40 CFR 60 subpart JJJJ and 40 CFR 63 subpart ZZZZ.
The commercial lever is the synthetic-minor posture: twenty nodes
(200 MW) engineered to remain below federal PSD / Title V major-source
thresholds, compressing the permitting timeline.

Attainment matters, and Lafayette is favorable. Acadiana is in
air-quality attainment, supporting the minor-source posture. The
per-site potential-to-emit (PTE) calculation and the applicable
threshold are confirmed with the air consultant before committing a
200 MW envelope (MGN-BOD-002 §7 / ENV-001) — and the PTE must account
for the standby fleet, not running MW alone. SCR is locked as the
conservative design basis.

## §8 — Civil, siting & balance-of-plant notes

### §8.1 Site-fit for 2623 Cameron Street

As an Entergy utility operations site, this parcel is more likely than
a typical urban lot to carry industrial/utility zoning and to have
usable land, existing electrical infrastructure, security, and access —
favorable for siting. The 10 MW node has a compact footprint that fits
a constrained urban operations parcel and the Phase-1 pilot
comfortably. Node count still depends on confirmed parcel area (§5
#10): the site is well-suited to a single 10 MW node and/or the Phase-1
pilot, with multi-node scale subject to available contiguous land at
this site or a companion site. The adjacent substation is the decisive
asset regardless of node count — it is what makes this an exceptional
interconnection location.

### §8.2 Balance-of-plant

- **Acoustics:** the G3520H package is ≤ 75 dB(A) @ 7 m enclosed —
  louder than high-pressure-mix competitor platforms. For an in-town
  site with potential nearby receptors, acoustic mitigation and
  setbacks are a priority (CIVIL-002); a utility operations parcel may
  offer more buffer than a commercial lot.
- **Cooling:** remote/roof radiators vs. closed-loop dry/adiabatic
  coolers, selected per site water and ambient (MECH-001).
- **BESS safety:** LFP chemistry; fire basis UL 9540A; thermal-runaway
  separation and suppression per NFPA — with attention to separation
  distances and proximity to the substation.
- **Fuel:** pipeline delivery with per-node pressure regulation and gas
  train; gas quality (Wobbe / methane number) confirmed against the
  engine envelope (FUEL-001); confirm gas service capacity at Cameron
  Street.

## §9 — Value-added capabilities for Entergy (beyond firm power)

Beyond serving the data-center load, the platform is engineered to
deliver capabilities an electric utility values directly. These are
part of the package, not afterthoughts — and several convert the
microgrid from "a customer's BTM plant" into a controllable, beneficial
resource sitting next to an Entergy substation.

### §9.1 Autonomous aerial inspection of electrical assets (Skydio)

For energized electrical equipment, vision-autonomous drones are the
safest and most repeatable way to inspect, full stop — closer access
than a person can safely reach, an identical flight every cycle, no
outage required, and a thermal-plus-visual record that turns reactive
failures into scheduled, low-cost repairs. The platform includes a
permanently sited autonomous drone-in-a-box inspection capability
standardized on Skydio (U.S.-designed and assembled; NDAA-compliant;
the X10D variant is on the U.S. DoD Blue UAS cleared list). Why this
matters specifically for electrical gear:

- **Magnetometer-independent, EMI-resistant navigation.** Conventional
  drones lean on magnetometers and GPS that are disturbed by the strong
  magnetic and electric fields around energized conductors. Skydio's
  vision-based autonomy is not — it can fly in close to live
  switchgear, bus, transformers, and lines without the interference
  that grounds other platforms. This is the single reason many
  utilities will only operate Skydio inside an energized substation.
- **Radiometric thermal + high-resolution visual.** A Teledyne FLIR
  Boson+ thermal sensor (640×512, sensitivity ≤30 mK) alongside
  50/64 MP cameras catches the electrical failure modes that matter
  before they cascade: hot connections and clamps, overloaded
  conductors, failing bushings and arresters, loose or corroded
  terminations, partial-discharge heating, and BESS cell/rack thermal
  anomalies.
- **Condition-based maintenance, not calendar-based.** A docked drone
  repeats the same mission on a schedule (daily/weekly) and trends
  every joint, gauge, and switch over time. The industry results are
  concrete: a major U.S. utility (American Electric Power) credits its
  Skydio program with avoiding on the order of 30 million
  customer-minutes of interruption over ~2.5 years, and reports
  catching an energized-switch hot spot — a defect that conventional
  practice would only surface at an annual thermal inspection — early
  enough to ground and repair it in about a day, rather than suffer an
  in-service failure and a full switch replacement.
- **People out of the hazard.** Inspectors stay on the ground or in the
  control room. No routine de-energizing, no bucket trucks or
  scaffolding just to look. Confined-space and elevated inspections
  that took days of rigging take minutes.
- **Secure and compliant for a regulated operator.** NDAA-compliant
  U.S. manufacture, AES-256 encrypted links, secure boot / hardware
  root-of-trust, optional fully-offline operation, FAA Remote ID, and
  tamper-evident watermarked imagery — the security and data-provenance
  posture a utility compliance group needs. AI defect-analytics
  integrations (e.g., Buzz Solutions PowerAI, MEPPI Power-I) can
  auto-detect and prioritize flagged components.
- **Operated by a credentialed team.** The developer brings established
  FAA Part 107 commercial UAS operations today, and is positioned for
  routine beyond-visual-line-of-sight (BVLOS) operation under the FAA's
  emerging Part 108 framework (NPRM August 2025; final rule expected in
  2026, implementation phasing in over the following 6–12 months) —
  enabling line and right-of-way patrol beyond the substation fence as
  the rule takes effect.

Two scopes, one capability:

1. **The microgrid's own gear.** The gensets, 4.16 kV paralleling
   switchgear, node step-up transformer, BESS enclosures, and
   SCR/exhaust stacks all go on the autonomous inspection roster —
   directly reinforcing the firm-/dispatchable-capacity and
   availability claims in §4.7.
2. **Entergy's co-located assets.** Because the dock lives on the
   parcel next to Entergy's substation, the same capability extends at
   near-zero incremental cost to the adjacent substation and nearby
   distribution — switches, gauges, bus, transformers, arresters — and,
   as BVLOS matures, to line and vegetation/right-of-way patrol,
   feeding Entergy's own reliability and vegetation-management
   programs.

### §9.2 Grid services from the BESS

The 6 MW, 4-quadrant grid-forming PCS is a controllable resource that
does more than buffer the data center. Depending on interconnection
terms and MISO market access, it can provide fast frequency response /
regulation, dynamic reactive-power (VAR) and voltage support at the
POI, operating reserve, and black-start capability — the node
black-starts itself, and a black-start-capable resource sitting at an
Entergy substation has genuine system-restoration value. Dispatch is
coordinated through the "Mission Control" SCADA layer with telemetry to
Entergy/MISO (DNP3 / IEC 61850).

### §9.3 Storm resilience & restoration value (Gulf Coast)

An island-capable, black-start microgrid on an Entergy operations
parcel is a tangible hurricane-resilience asset, not a slide. During a
storm-driven grid outage it keeps the on-site compute — and Entergy's
own co-located operations — energized, and can serve as a local,
dispatchable resource to help support restoration of adjacent critical
load.

### §9.4 Non-wires alternative / T&D deferral

A firm, dispatchable resource at a known node can defer or avoid the
distribution/transmission upgrades the new load would otherwise trigger
— a non-wires-alternative that lets Entergy add load without, or ahead
of, capital reinforcement.

### §9.5 Redeployable bridge asset — no stranded investment

The nodes are modular and standardized. When Entergy's permanent
generation (Hyperion-class) energizes, the microgrid can be drawn down,
run in parallel, or redeployed to the next speed-to-power site. Entergy
gets the bridge without being left holding a stranded asset — which
de-risks the relationship for both sides.

### §9.6 Future-fuel posture

The Cat G3520H accepts up to a 25% hydrogen blend by volume, and the
platform is RNG-capable — a credible lower-carbon trajectory that helps
the regulatory and ESG optics around adding new gas-fired load.

## §10 — Roles & responsibilities (indicative)

| Function | Developer (Scott Tomsu / platform) | Entergy |
|---|---|---|
| Microgrid generation, BESS, controls | ✔ Design, build, own/operate (or per SPV) | — |
| Site / parcel | Coordinate use | ✔ Landowner (lease / JV / redevelopment) |
| Adjacent substation interconnection | ✔ Design tie-in, fund | ✔ Owner; provide capacity, approve |
| Fuel (gas) procurement & train | ✔ | Coordinate supply availability |
| Interconnection design & studies | ✔ Lead, fund | ✔ Provide data, run study process, approve |
| POI protection coordination | ✔ Propose | ✔ Set requirements, approve |
| Standby / backup service | Coordinate | ✔ Provide / tariff |
| MISO interconnection process (if applicable) | ✔ Support | ✔ Lead interface |
| Air permit / PTE | ✔ Lead with air consultant | Support |
| Autonomous asset inspection (drone) | ✔ Provide & operate (Skydio dock, Part 107 crew) | Optional — extend to adjacent substation / feeders |
| Grid services (frequency, VAR, reserve, black-start) | ✔ Provide via BESS / "Mission Control" SCADA | ✔ Define & value; dispatch via MISO |
| Data-center customer relationship | ✔ / joint | Joint origination |

## §11 — Requested next step

A 60–90 minute working session with Entergy large-load, real-estate,
and interconnection engineering to: (1) confirm parcel status and the
adjacent substation's voltage and available capacity (§5 #1–2); (2)
frame site control (lease / JV / redevelopment) for an Entergy-owned
site; (3) exchange the §5 data; (4) scope a Phase-1 pilot / single-node
deployment with the bridge-to-power framing, leveraging the short
interconnection to the adjacent substation; and (5) review the
value-added capabilities in §9 — autonomous substation inspection, grid
services, storm resilience, and non-wires-alternative deferral — for
inclusion in the commercial structure.

## Appendix A — Spec recap & codes

| Item | Value |
|---|---|
| Node firm output | 10 MW (4 running + 1 N+1) |
| Primary prime mover | 5× Cat G3520H, ≈2.5 MW, 4.16 kV, lean-burn gas |
| Second source (drop-in) | Cummins HSK78G, ≈1.6–1.8 MW @ 60 Hz, rated to 55 °C (more positions per node at 60 Hz; see §3.1) |
| BESS | 6 MW / 3 MWh usable, LFP, 4-quadrant grid-forming PCS |
| Grid-former | BESS PCS (lead-genset isochronous backup) |
| Emissions control | Per-engine SCR + oxidation catalyst |
| Paralleling / step-up | 4.16 kV metal-clad → 13.8 / 34.5 kV (matched to adjacent substation) |
| Interconnection | Short tie to adjacent Entergy substation at the site |
| Campus module | 20 nodes = 200 MW under one synthetic-minor permit (attainment-dependent; site-fit per §8.1) |
| Mode | BTM / merchant; grid-forming, island-capable, N+1 self-sufficient |
| Controls | "Mission Control" SCADA + merchant-ops |
| Value-adds (§9) | Autonomous Skydio inspection · BESS grid services · storm resilience · NWA / T&D deferral · redeployable · 25% H₂-blend-capable |
| Codes | NFPA 37/70/110 · IEEE 1547/519 · ISO 8528-5 · UL 9540/9540A · 40 CFR 60 JJJJ / 63 ZZZZ · ANSI C84.1 |

---

*End MGN-PROP-004 Rev 0.3 — Working Draft. Technical basis:
MGN-BOD-002 Rev 0.1.*
