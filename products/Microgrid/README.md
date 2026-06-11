# ADC 10 MW NG Microgrid Node + Unified Telemetry — AI Compute on Gas

Spec sheet for ADC Solutions' power product: the **10 MW AC-MV
natural-gas microgrid node** — the atomic unit the company builds,
permits, finances, and replicates — and the **unified telemetry plane**
that fuses the node with the [CDU](../CDU/README.md),
[TCS](../TCS/README.md), [HAC structure](../HAC/README.md), and the IT
racks into one closed-loop, AI-operable machine. The telemetry document
is the spine of ADC's AI-autonomy claim: generation and compute are not
two systems that share a site — a synchronized AI training step starts
in a GPU, is absorbed by the BESS, answered by the gensets, and lands
seconds later as a thermal transient in the CDU/TCS. One data model, one
clock, one store is what makes that loop visible, optimizable, and
defensible.

## Source of truth

The two documents in this folder are authoritative. This page is a
Markdown view of them — if they disagree, the documents win.

| Document | File | Status |
|---|---|---|
| MGN-BOD-002 — 10 MW AC-MV Natural-Gas Microgrid Node, Basis of Design, **Rev 0.2** (2026-06-10) | [MGN-BOD-002_Rev0_2.md](MGN-BOD-002_Rev0_2.md) | **Governing** (Markdown, errata applied — pending Scott's approval); Rev 0.1 docx retained as history |
| MGN-TEL-001 — Unified Telemetry & Observability Architecture, Basis of Design, **Rev 0.2** (2026-06-10) | [MGN-TEL-001_Rev0_2.md](MGN-TEL-001_Rev0_2.md) | **Governing** (Markdown, errata applied — pending Scott's approval); Rev 0.1 docx retained as history |
| Rev 0.1 history | [MGN-BOD-002_10MW_Rev0_1.md.docx](MGN-BOD-002_10MW_Rev0_1.md.docx) · [MGN-TEL-001_Unified_Telemetry_Rev0_1.md (1).docx](MGN-TEL-001_Unified_Telemetry_Rev0_1.md%20(1).docx) | Superseded 2026-06-10 |

## The node (MGN-BOD-002)

| Parameter | Value |
|---|---|
| Firm output | **10 MW net** — 5× Cat G3520H (2.5 MW, 4.16 kV, lean-burn, ~44–45% electrical), 4 running + 1 N+1 [L] |
| Second source | Cummins HSK78G, per-position drop-in [L] — but ~1.6–1.8 MW at 60 Hz, so an HSK78G-populated node needs ≈6+1 = 7 units; best hot-ambient headroom (rated to 55 °C) |
| BESS | AC-coupled, **6 MW 4-quadrant grid-forming PCS / 3 MWh usable**, LFP, UL 9540A [L] — transient bridge, black start, ride-through, peak-shave |
| BESS sizing logic | Worst case = 5 MW coherent AI-training step (50% of node) × 1.20 margin = 6 MW; the load step governs over N-1 generation loss (2.5 MW); bridge energy itself ~0.06 MWh — the 3 MWh covers secondary duties |
| Grid-forming | BESS PCS forms the bus and black-starts the node; lead genset isochronous as backup [L] |
| Topology | 5× gensets → 4.16 kV metal-clad paralleling switchgear → step-up to 13.8 / 34.5 kV [W] → campus collection → POI; synchronous condenser provisional pending fault study [O] |
| Aftertreatment | Per-engine SCR + oxidation catalyst locked (conservative basis; HSK78G native-NOx ≈0.5 g/hp-hr held in reserve as a permitting hedge) |
| Codes | NFPA 37/70/110, ANSI C84.1, IEEE 1547/519, ISO 8528-5 (G3 target), UL 9540/9540A, 40 CFR 60 JJJJ + 63 ZZZZ |

**Why the BESS exists:** lean-burn gas engines take staged block loads
(~30% first step) and cannot absorb a hard AI swing without misfire risk.
The BESS bridges the first 1–5 s while the engines ramp (~45 s); five
small machines instead of two big ones also spread any step thinner —
each running genset sees only ~1.25 MW of a 5 MW coherent step.

**The permitting lever (§7):** each node is engineered so **20 nodes =
200 MW stay under one synthetic-minor air permit** — avoiding
major-source New Source Review. Lafayette / Acadiana is in attainment;
the Baton Rouge ozone nonattainment region can break the envelope
(lower NOx thresholds, possible offsets), so the per-site PTE calc gates
every 200 MW commitment — and must count standby-fleet run-hours (20 N+1
units on top of ~80 running), per the chief-engineer flag.

## The unified telemetry plane (MGN-TEL-001)

**Redfish (DMTF 2026.1 bundle, Specification v1.24.0) is the single
north-bound data model for the entire stack** [L]. The Deschutes
Modbus→Redfish bridge pattern, already proven on the CDU, is extended to
the power island — so gensets and GPUs live in one namespace, on one
PTP/NTP-disciplined clock [L], in one store.

| Domain | Assets | Brought into Redfish by |
|---|---|---|
| D1 Power island | Gensets, BESS PCS, 4.16 kV switchgear + relays, SCR, step-up | Modbus/J1939/DNP3-61850/SunSpec → Redfish bridge (the new work) |
| D2 Compute | NVL72 racks — GPU, memory, UALink fabric, NVMe, cold plates | Native Redfish (BMC / rack manager) |
| D3 Cooling | [Deschutes CDU](../CDU/README.md) + [TCS rack loop](../TCS/README.md) | Modbus→Redfish bridge per Deschutes reference v1.2; TCS is Tier-2 (CDU layer) |
| D4 Facility | PDU, UPS, BMS, chiller/HRS, utility meter | BACnet/SNMP/Modbus collectors |
| D5 External | Weather (wet-bulb is the heat-rejection floor), grid status, water | REST collectors (Open-Meteo baseline) |

**Authority boundary [L]:** Layer-1 controllers — EMCP/PowerCommand,
protective relays, BESS PCS, CDU PLC, rack BMCs — keep deterministic
control and safety authority, always. Bridges translate; the AI/ops
layer is supervisory only, and telemetry loss can never block a
protection action. This extends the CDU's "safety stays in the PLC"
rule across the whole platform.

**Cadence classes [L]:** P protection (<20 ms, stays local; event
capture only) · A control (100 ms–1 s, PLC/governor) · B supervisory
(1–5 s — GPU power/temp, BESS ±P/±Q + SoC, genset kW/V/Hz, TCS branches;
with Sensor v1.12.0 peak/dip interval capture so the transient extremes
between samples are never lost) · C contextual (30–60 s) · D
compliance/billing (1 min–1 h, immutable historian).

**The payoff — cross-domain correlation (§10):** one AI training step
traced on one clock: GPU utilization climbs (t−30 s, D2) → coherent
~5 MW step (t0, the cause) → BESS injects +P (t+0–1 s, the bridge) →
gensets ramp (t+1–45 s, the response) → CDU/TCS thermal transient
(t+5–120 s, the follower). That timeline verifies the BESS sizing
against reality, lets the AI pre-position pump ΔP before the heat
arrives, confirms the engines stay inside lean-burn block-load limits,
and enables merchant demand-shaping. None of it is possible on two
islands with two clocks.

**Compliance telemetry is commercial survival [L]:** the
synthetic-minor permit rests on measured run-hours and emissions per
genset (including standby units). These flow as Redfish Oem properties
(no native emissions schema — honest gap, EMIS-OEM) into a dedicated
immutable historian from day one.

## How the four products sync (AI-autonomy map)

| Product | Role in the closed loop | Telemetry plane |
|---|---|---|
| Microgrid node | Generates; BESS bridges the compute transient | D1 — bridged into Redfish (this product, new work) |
| CDU | Rejects the heat; PLC holds safety authority | D3 Tier-2 — Modbus→Redfish per Deschutes ref; ~24 s TCS + ~40–50 s system ride-through is the thermal analog of the BESS bridge |
| TCS | Delivers coolant to racks; leak/flow/ΔT per branch | D3 Tier-2 under the CDU; pair-reversal + dew-point events (Environmental registry v1.5.0) |
| HAC structure | Physically carries the plane — Levels 2–4 cable trays route the telemetry/fabric network; hot-aisle busducts feed the racks the node powers | D2/D4 pathways; rack power-limit events close the loop back to D1 |

## Status

**Both documents Rev 0.1 working drafts** (2026-06-08), decision-ledger
driven. Locked: topology, engine selections, BESS rating, SCR basis,
20-node permit envelope, 4.16 kV, Redfish 2026.1 as the single model,
Layer-1 safety authority, cadence classes, common time base, compliance
historian. Key open items: node BoD — ELEC-002 fault study (sync
condenser), ELEC-004 collection voltage, ENV-001 site PTE (gates every
200 MW commitment), MECH-001 cooling method, FUEL-001 gas quality,
CIVIL-001/002, COMM-001 product naming; telemetry — TEL-001 pin 2026.1
schemas, TEL-002 genset Oem dictionary, RELAY-PROTO (DNP3 vs IEC 61850),
TEL-TIME (PTP method), TEL-BESS/TEL-BMC vendor maps, EMIS-OEM,
TEL-PROFILE site interop profile, TEL-STORE, TEL-AGG, TEL-DISPATCH.
A 6-phase POC (§14) reuses the Deschutes POC hardware and ends with 30+
days of unified data, trained models, and a sample PTE extract.

## Roadmap

Node → campus module (20 nodes = 200 MW, one permit envelope) → replicate
campus modules, each its own envelope (see
[MISSION.md](../../MISSION.md)). The telemetry plane is the product
feature that makes the platform AI-native rather than AI-adjacent.
