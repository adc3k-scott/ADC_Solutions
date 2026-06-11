# MGN-BOD-002 — 10 MW AC-MV Natural-Gas Microgrid Node — Basis of Design

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | MGN-BOD-002 |
| Title | 10 MW AC-MV Natural-Gas Microgrid Node — Basis of Design |
| Revision | **0.2** (Working Draft) |
| Company | ADC Solutions |
| Discipline | Multi (ELEC / MECH / ENV / CTRL / CIVIL / FUEL) |
| Prepared by | Scott Tomsu — Chief Engineer |
| Rev 0.2 prepared by | Mission Control per ERRATA-for-MGN-BOD-002-rev0_2.md — **pending Scott Tomsu approval** |
| Date | 2026-06-08 (Rev 0.2: 2026-06-10) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-08 | Initial working draft. Defines the 10 MW AC-MV natural-gas microgrid node: 5× Cat G3520H (4 running + 1 N+1) = 10 MW firm. Prime-mover ratings/efficiency and the Cummins 60 Hz rating verified against OEM data (§4). BESS sized to 6 MW PCS / 3 MWh usable (§5.3). |
| 0.2 | 2026-06-10 | Errata applied: CTRL-001/CTRL-002 deferred to MGN-TEL-001 (§8, §11); COMM-001 product half resolved — platform OS named "Telemetry" (decision 0002), hardware doc-prefix still open; §8 retitled to defer Layers 3–5 to the Telemetry product; OCP/DMTF citations verified current 2026-06-10 (ops/research/2026-06-10-ocp-spec-currency.md). Converted to Markdown as the governing format (repo convention); Rev 0.1 docx retained as history. |

## §1 Purpose & Scope

This document defines the standard 10 MW AC-MV natural-gas microgrid node — the atomic unit the company builds, permits, finances, and replicates. The node aligns with the ≤10 MW platform convention used on other programs and is the natural unit for:

- Single-host deployments (one data-center hall, one industrial process) where 10 MW is the right bite;
- Proof-of-concept / first-article builds that validate the node before scaling; and
- Aggregated campuses, where twenty (20) nodes aggregate to 200 MW under a single minor-source air-permit envelope (ref §7).

The node is a merchant / behind-the-meter power platform: it parallels reciprocating gas gensets at medium voltage, uses an AC-coupled battery energy storage system (BESS) as the transient bridge, and delivers firm power to a point of interconnection (POI) or directly to an on-site load (data center, industrial host, or grid-parallel sale).

This BOD governs the node. Campus-level aggregation, site civil, and POI design are site-specific and carried in separate site documents that reference this node standard.

## §2 Design Basis, Codes & Conventions

### §2.1 Governing codes & standards

- NFPA 37 — stationary combustion engines and gas turbines
- NFPA 70 (NEC) — electrical installation
- NFPA 110 — emergency & standby power systems
- ANSI C84.1 — voltage ranges
- IEEE 1547 — interconnection (where grid-parallel)
- IEEE 519 — harmonic control
- ISO 8528 (esp. Part 5, transient response) — genset performance; target class G3 or better
- UL 9540 / UL 9540A — BESS, thermal-runaway fire test
- 40 CFR 60 subpart JJJJ — NSPS, stationary spark-ignition engines (NOx / CO / VOC)
- 40 CFR 63 subpart ZZZZ — RICE NESHAP (CO / formaldehyde HAP)

*Rev 0.2 note: external citations verified current as of 2026-06-10 — see ops/research/2026-06-10-ocp-spec-currency.md.*

### §2.2 Site reference conditions

Design ambient: [O] per site. Placeholder for Gulf Coast siting: 35 °C / 95 °F, ~sea level, high RH. Firm-MW rating is de-rated to confirmed site ambient before any commercial commitment (ref ELEC-006 / MECH-002). All MW figures herein are net electrical unless noted.

## §3 Node Topology (single-line summary)

Reference drawing: MGN-SLD-002 Rev 0.1 (companion single-line).

```
5× Cat G3520H gensets (2.5 MW, 4.16 kV, each w/ SCR + Ox Cat)
        │  (4 running + 1 N+1)
        ▼
   4.16 kV paralleling switchgear (metal-clad, 5 kV class)
        ├──── AC-coupled BESS — 6 MW PCS (4-quadrant) / 3 MWh usable, LFP
        │     (transient bridge / black-start / ride-through / peak-shave)
        ├──── Synchronous condenser  [O — provisional, per fault study]
        ▼
   Node step-up transformer  4.16 kV → 13.8 / 34.5 kV
        ▼
   Campus collection bus  →  POI / utility step-up (site-specific)
```

## §4 Prime Mover Basis

### §4.1 Primary — Cat G3520H [L]

- Output: ~2.5 MW continuous (1.76–2.52 MW range). OEM-verified: continuous rating 2500 ekW (2519 ekW max) @ 1.0 pf, V20, 4-stroke, lean-burn, 97.5 L displacement.
- Speed: 1500 / 1800 RPM (high-speed)
- Electrical efficiency: ~44–45%. Caterpillar publishes max electrical efficiency 45.3% for the high-efficiency 12.1:1 compression configuration; working figure ~44% net after parasitics. Use the 60 Hz natural-gas data sheet value for the final heat-rate / fuel-burn model (ELEC-006 / MECH-002).
- Generator: 4.16 kV, 3-phase, 60 Hz
- Fuel: dry pipeline natural gas, 31.5–47.2 MJ/Nm³. Note: G3520H also supports up to 25% hydrogen blend by volume (optional; not required, but available for future low-carbon fuel posture).
- Ambient: 40 °C before de-rate (sea level); Louisiana summer sits inside this envelope — de-rate expected small but is a BOD number (ELEC-006)
- Package acoustics: ≤ 75 dB(A) @ 7 m (enclosed) — note: louder than competitor high-pressure-mix platforms; flag for sensitive-receptor siting (CIVIL-002)

### §4.2 Second source — Cummins HSK78G [L]

- Output at the platform's 60 Hz: ~1.6–1.8 MW. OEM-verified: 60 Hz models rate 1600 kWe (C1600N6CD) and 1800 kWe (C1800N6CD). The "up to 2.0 MW" power density is the 50 Hz figure; on a US 60 Hz site the unit is not a 2.5 MW-equivalent swap for the Cat. See the count note below.
- Electrical efficiency: 43.5% @ 60 Hz / 44.2% @ 50 Hz (OEM-confirmed)
- Ambient: rated to 55 °C / 131 °F — best hot-ambient headroom on the platform; preferred for high-design-ambient sites
- Fuel flexibility: pipeline gas down to 70 MN without power derate
- Native NOx: the HSK78G can reach ~250 mg/Nm³ (≈0.5 g/hp-hr) without SCR. This is a useful permitting hedge, but this BOD still locks SCR + oxidation catalyst as the conservative design basis (§6, §7); the native-NOx capability is held in reserve and confirmed against the site PTE calc.
- Qualified as a per-position drop-in second source to de-risk engine allocation. **Count note:** because the HSK78G rates lower at 60 Hz, a node populated predominantly with HSK78G units needs ≈6 running + 1 N+1 = 7 units to hold 10 MW firm (6 × 1.8 ≈ 10.8 MW), versus 4 + 1 = 5 units for the Cat. Node controls and BoP are designed to accept either engine in a genset position (see MGN-TEL-001 §4.1 dual-source abstraction); the engine count per node is set by the engine actually allocated to each position, not assumed identical between the two sources.

### §4.3 Load-acceptance rationale

Both engines are lean-burn gas reciprocating units with staged block-load limits (ISO 8528-5; the HSK78G is rated for a 30% first load step at G1 with four steps to full load). They cannot absorb a hard AI/industrial step without risk of lean-misfire and trip. The node therefore relies on the AC-coupled BESS to buffer the first 1–5 s transient while engines ramp fuel (ref §5.3). The many-small-machine architecture (5 gensets vs ~2 large units for a 10 MW block) also raises distributed inertia per MW and reduces each unit's share of any single step — each of the 4 running gensets picks up only ~1.25 MW of a 5 MW coherent step.

## §5 Electrical Architecture

### §5.1 Generation & paralleling [L]

- 5× 4.16 kV gensets onto common 4.16 kV metal-clad paralleling switchgear (5 kV class).
- Each genset: dedicated breaker, synchronizing, reverse-power and protective relaying.
- 4 running carry 10 MW firm; the 5th is N+1 for maintenance/forced-outage cover.

### §5.2 Grid-forming & control mode [L]

- Microgrid operates grid-forming in island/behind-the-meter mode.
- Grid-former = BESS 4-quadrant grid-forming PCS. The PCS establishes the bus voltage/frequency reference, black-starts the node (energize the 4.16 kV bus, then start and synchronize gensets to the live bus), and provides the cleanest transient response — consistent with the BESS already being the locked transient bridge (§5.3). [L]
- Backup grid-former: a designated lead genset in isochronous mode if the BESS/PCS is unavailable; the remaining gensets droop-share. [L]
- Grid-parallel operation (if/where applicable) per IEEE 1547 with anti-islanding.

### §5.3 BESS — transient bridge [L]

- AC-coupled on the 4.16 kV bus via a 4-quadrant, grid-forming power conversion system (PCS).
- Functions: (1) transient bridge for engine load-acceptance, (2) black-start, (3) ride-through, (4) peak-shaving / grid-services revenue.
- Power rating: 6 MW PCS, 4-quadrant (±P, ±Q). [L]
- Energy rating: 3 MWh usable (~30 min at rated power, ~2C). Chemistry: LFP; fire basis UL 9540A; thermal-runaway separation and suppression per NFPA. [L]
- **Sizing basis (power-binding):** power is the binding constraint. Worst-case coherent load step = 50% of node = 5 MW (synchronized AI training swing between compute and collective-communication phases; conservative — treats the swing as 50% of the whole node, including thermally-slow cooling that does not actually step on the fast edge). PCS = 5 MW × 1.20 margin (reactive headroom during the dip + round-trip loss at the instant + step-growth headroom) = 6 MW.
- 4-quadrant because a load rejection (≈5 MW dropping at once) reverses the problem — the BESS must absorb real power while the engines back down.
- Governing-case check: the load step (5 MW) exceeds the N-1 generation loss (one genset = 2.5 MW); the load step governs.
- Energy is set by secondary duties, not the bridge. The transient-bridge energy itself is negligible (~0.06 MWh delivered across a conservative ~45 s gas block-load ramp, taken flat at 5 MW). The 3 MWh rating covers black-start, ride-through, repeated transient cycles, and a peak-shave / grid-services bite. Dial to 60 min (6 MWh, 1C) if peak-shave arbitrage becomes a primary revenue target.
- Engine protection: the multi-second pickup window is intentional — a gentle, staged genset ramp avoids lean-burn misfire/trip while the BESS bridges the gap.

### §5.4 Synchronous condenser — provisional [O]

Add only if the fault-level / voltage-stiffness study (ELEC-002) shows the gensets alone provide insufficient short-circuit strength or reactive support. Supplement to — not replacement for — the BESS. Note: with only 4 running machines, the node's short-circuit contribution is modest, so the fault study (ELEC-002) carries meaningful weight here.

### §5.5 Step-up & collection [W]

- Node step-up transformer: 4.16 kV → 13.8 / 34.5 kV (collection voltage TBD, ELEC-004); transformer kVA scaled to the 10 MW node (≈12.5–15 MVA class with margin).
- Campus collection bus aggregates nodes to the POI; POI step-up to utility transmission is site-specific.

### §5.6 Power quality [O]

THD within IEEE 519 limits at the POI; harmonic study (ELEC-003) to confirm PCS/VFD content and filtering need.

## §6 Mechanical / Cooling / Balance of Plant

- Engine cooling [O]: remote/roof radiators vs closed-loop to dry/adiabatic coolers — selected per site water and ambient (MECH-001). Jacket-water and aftercooler circuits per engine.
- Exhaust / aftertreatment [L]: per-engine SCR (NOx) + oxidation catalyst (CO / VOC / formaldehyde); urea storage & dosing (ENV-002); stack per dispersion modeling. (HSK78G native-NOx capability per §4.2 does not change this locked basis.)
- Fuel [W]: pipeline delivery, per-node pressure regulation and gas train; gas quality (Wobbe / methane number) confirmed against engine envelope (FUEL-001).
- BoP: lube oil system, starting (electric/air), combustion-air and enclosure ventilation, fire detection & suppression (NFPA 37 / 110).

## §7 Emissions & Permitting Strategy

The core commercial lever. Each node is engineered so that 20 nodes (200 MW) remain below federal PSD / Title V major-source thresholds — a synthetic-minor posture that avoids major-source New Source Review and compresses permitting timeline. This is the same regulatory mechanism a leading competitor markets as "200 MW under a minor-source permit."

- NOx controlled via SCR; CO / VOC / formaldehyde via oxidation catalyst (subpart ZZZZ compliance).
- Caveat [O — ENV-001]: major-source thresholds are site- and attainment-specific. Nonattainment areas (e.g., the Baton Rouge ozone region — relevant to a St. Gabriel / Willow Glen-class site) carry lower NOx thresholds and may force emission offsets, which can break the 20-node/200 MW envelope. Lafayette / Acadiana is in attainment. The node's potential-to-emit (PTE) calc and the per-site threshold must be confirmed with the air consultant before committing the 200 MW envelope at any given site.
- SCR is locked as the design basis (conservative, supports the near-zero / minor-source claim); the actual control level required is set by the site PTE calc.
- **Standby-fleet note — chief-engineer flag:** a 200 MW campus built from 20 nodes carries 20 N+1 standby gensets on top of the ~80 running units (80 × 2.5 MW). If standby units are permitted with run-hours, those units add to campus PTE. ENV-001 must size the PTE on the actual node count and standby run-hour allowance, not on running MW alone.

## §8 Controls / SCADA

*Rev 0.2: retitled from "Mission Control" — that name now belongs to other roles in the company; supervisory Layers 3–5 are owned by the **Telemetry** product (ADC-OS-001, products/Telemetry/), built on MGN-TEL-001.*

- Plant master controller (Layer 1): dispatch, load-share, synchronizing, BESS coordination, engine sequencing for N+1.
- Genset controls: Cat EMCP 4.x / AGC paralleling (G3520H); Cummins PowerCommand (HSK78G) — abstracted behind a common node controller (MGN-TEL-001 TEL-002 / §4.1).
- Merchant-operations layer: remote monitoring & dispatch, grid-services participation (frequency response, demand response, peak-shave), performance/availability telemetry per node and per campus — **carried by the Telemetry product per MGN-TEL-001** (TEL-DISPATCH).

## §9 Capacity & Scaling

| Level | Definition |
|---|---|
| Genset | Cat G3520H, ~2.5 MW (Cummins HSK78G ~1.6–1.8 MW @ 60 Hz alt.) |
| Node | 5× genset (4 running + 1 N+1) = 10 MW firm |
| Campus module | 20 nodes = 200 MW = one minor-source envelope |
| >200 MW | Replicate campus modules; each is its own permit envelope |

Block & redundancy notes:

- This node aligns with the ≤10 MW platform convention used on other programs and is the natural single-host / proof-of-concept node.
- N+1 / redundancy: the node carries 5 units (4 running + 1 N+1) for 10 MW firm. A 4-unit non-redundant variant (10 MW, no on-node spare) is available where utility backup or campus-level redundancy makes on-node N+1 unnecessary — state which variant is being quoted on every commercial commitment.

## §10 Decision Ledger

**Locked [L]:** AC-MV synchronous-genset microgrid topology · primary prime mover Cat G3520H; second source Cummins HSK78G (per-position drop-in) · node = 5× G3520H, 4 running + 1 N+1 = 10 MW firm · AC-coupled BESS as the transient bridge (not battery-free) · BESS rating 6 MW PCS (4-quadrant) / 3 MWh usable, LFP · per-engine SCR + oxidation catalyst · 20 nodes = 200 MW = one minor-source permit envelope · genset terminal / paralleling voltage = 4.16 kV · grid-former = BESS PCS; lead-genset isochronous backup.

**Working [W]:** collection voltage (13.8 vs 34.5 kV) · node step-up scheme / transformer kVA · fuel supply pressure / metering scheme.

**Open [O]:** site design ambient & firm-MW de-rate · fault-level study → synchronous condenser need (carries extra weight on a 4-machine node) · harmonic study (IEEE 519) · engine cooling method · site & POI selection; per-site attainment / PTE confirmation (incl. standby-fleet run-hours).

## §11 Open Items

| ID | Discipline | Item | Gating input |
|---|---|---|---|
| ELEC-002 | ELEC | Fault-level / short-circuit & voltage-stiffness study → sync condenser decision (4-machine node) | Node + campus configuration |
| ELEC-003 | ELEC | Harmonic study (IEEE 519) | PCS / VFD content |
| ELEC-004 | ELEC | Collection voltage selection (13.8 / 34.5 kV) | POI & campus size |
| ELEC-006 | ELEC | Firm-MW de-rate to site ambient | Confirmed site ambient |
| MECH-001 | MECH | Cooling method (remote radiator vs closed-loop cooler) | Site water / ambient |
| MECH-002 | MECH | Heat-rate impact of SCR catalyst ΔP | Aftertreatment selection |
| ENV-001 | ENV | Site PTE calc + minor-source threshold confirmation — must account for the 20-node standby fleet | Site attainment status |
| ENV-002 | ENV | SCR urea logistics & storage | Run-hours / dispatch profile |
| FUEL-001 | FUEL | Gas supply pressure, MN / Wobbe confirmation, metering | Pipeline / supplier data |
| CTRL-001 | CTRL | *Rev 0.2: subsumed into MGN-TEL-001 — tracked there as TEL-DISPATCH* | — |
| CTRL-002 | CTRL | *Rev 0.2: subsumed into MGN-TEL-001 — tracked there as TEL-002 (dual-source Oem dictionary)* | — |
| CIVIL-001 | CIVIL | Node footprint, foundations, transport / crane plan | Site & enclosure layout |
| CIVIL-002 | CIVIL | Acoustic mitigation vs sensitive receptors | Site receptor survey |
| COMM-001 | COMM | *Rev 0.2: product half RESOLVED — platform OS named "Telemetry" (ops/decisions/0002). Remaining: hardware doc-prefix ("MGN") decision* | Business decision |

---

*End MGN-BOD-002 Rev 0.2 — Working Draft. Markdown is the governing
format from this revision (repo convention); the Rev 0.1 docx is
retained as history. Subsequent revisions to carry tracked changes via
git.*
