# Telemetry — The AI-Native Operating System (ADC-OS-001)

**Product name: Telemetry** — decided 2026-06-10
([decision 0002](../../ops/decisions/0002-telemetry-product-name.md)),
resolving OS-01 and the platform half of COMM-001.

Spec sheet for ADC Solutions' fifth product: the platform layer that
operates the other four as **one machine**. The
[CDU](../CDU/README.md), [TCS](../TCS/README.md),
[HAC structure](../HAC/README.md), and
[10 MW microgrid node](../Microgrid/README.md) are the body; this is
the nervous system and the operator. It is the productized form of
MGN-TEL-001's Layers 3–5, with a defined autonomy ladder and a
conformance contract.

## Source of truth

| Document | Where | Status |
|---|---|---|
| MGN-TEL-001 Unified Telemetry & Observability BoD Rev 0.1 | [products/Microgrid/](../Microgrid/README.md) | Parent — defines the substrate (Layers 0–5, five domains, cadences, security) |
| ADC-SYS-001 system registry | [system/](../../system/README.md) | The machine-readable model this OS reads — implemented, validated |
| Executable twin (POC Phase 1) | [system/twin/](../../system/twin/README.md) | The first running implementation — implemented |
| Deschutes Redfish/AI & Four-Tier Reference (internal ADC teaching doc) | [Rev 1.3 in this folder](Deschutes_Redfish_AI_Control_Reference_TCS_Technology_Cooling_System.docx.md) | Parent of MGN-TEL-001 — updated 2026-06-10 to the 2026.1 baseline (SYS-OI-01 closed); its four tiers map to domains D2–D5 |

## What the product is

A supervisory intelligence that reads the entire platform through one
Redfish namespace on one clock and operates it within hard safety
bounds. It is sold with the hardware — the thing that makes an ADC
deployment AI-native rather than AI-adjacent — and it is the same
intelligence that runs the company's own colo sites (business line 2).

**It is not a controller.** Layer-1 devices — protective relays, engine
governors, the BESS PCS, the CDU PLC, rack BMCs — keep deterministic
control and safety authority, always (MGN-TEL-001 §3.2/§13). The OS
observes everything and requests setpoints; every request is bounded by
Layer-1 limits; telemetry loss degrades optimization, never protection.

## The autonomy ladder

| Level | Name | What the OS does | Gate to advance |
|---|---|---|---|
| A0 | Observe | Unified dashboards, §10 cross-domain correlation, alarms, compliance historian | Conformance-validated bridges (TEL-PROFILE) |
| A1 | Advise | Recommends dispatch, cooling pre-position, maintenance windows; human executes | 30+ days unified data; advisory accuracy reviewed (POC Phase 6) |
| A2 | Supervise | Closed-loop *supervisory* setpoints — pump ΔP pre-positioning, BESS charge schedule, peak-shave dispatch — inside Layer-1 bounds | Per-function sign-off; rule → PID → ML progression per function |
| A3 | Coordinate | Campus-level: shapes controllable compute load against grid services, weather, and gas economics across nodes | Merchant-ops requirements (TEL-DISPATCH); per-site approval |

Each function climbs the ladder independently — cooling pre-position
can run A2 while generation dispatch is still A1. Control sophistication
follows the Deschutes progression: deterministic rules first, then PID,
then learned models (LSTM/anomaly/RL) only where data has earned it.

## Flagship capability — the double bridge

The platform's defining transient, choreographed end to end: a coherent
AI training step (up to 5 MW, 50% of a node) is carried **electrically**
by the BESS for 1–45 seconds while the gensets ramp, and **thermally**
by the TCS fluid mass for ~24 seconds (40–50 s with CDU buffer) while
cooling responds — with the OS watching the cause in the GPUs 30 seconds
before either bridge engages, and pre-positioning pump ΔP before the
heat arrives. Demonstrated in simulation today by the
[executable twin](../../system/twin/README.md); POC Phases 2–5 replace
simulated series with bridged hardware data without changing the
contract.

## The conformance contract

What makes this saleable rather than bespoke: every asset class
(genset, BESS, CDU, rack) ships with a Redfish Interoperability Profile
(DSP0272 1.10.0) declaring its mandatory resources, and every bridge
endpoint passes the DMTF Service/Protocol/Interop validators against
the pinned 2026.1 bundle before the OS trusts it. Pass/fail conformance
artifacts are deliverables for customers and lenders (TEL-PROFILE,
MGN-TEL-001 §2.4). Compliance telemetry (run-hours, emissions, DEF,
energy — including the standby fleet) flows to an immutable historian
from day one, because the synthetic-minor permit economics depend on it.

## What exists today

| Layer | Status |
|---|---|
| System model (ADC-SYS-001 registry) | **Running** — 6 assets, 6 interfaces, 90 parameters, 60 open items, validated |
| §10 correlation (executable twin) | **Running** — simulation from registry constants, POC Phase 1 |
| Bridges (D3 cooling, D1 power) | Designed (MGN-TEL-001 §4/§6); build = POC Phases 2–3 |
| Data plane, dashboards, ML | Stack selected (§12); deploy = POC Phases 4–6 |
| Autonomy A1+ | Gated on 30+ days of unified data |

## Open items

- ~~**OS-01** — name the product~~ — **resolved 2026-06-10: Telemetry**
  (decision 0002). COMM-001's hardware-doc-prefix half remains open.
- **OS-02** — per-function A2 authorization matrix: which setpoints the
  OS may request, with what Layer-1 bounds, signed off per function.
- **OS-03** — commercial packaging: sold license vs operated service vs
  bundled with hardware (interacts with business line 2).
- Inherited gates: TEL-001 (pin schemas), TEL-PROFILE, TEL-TIME,
  TEL-STORE, TEL-DISPATCH, EMIS-OEM — see the
  [unified register](../../system/registry/open-items.json).

## Roadmap

Twin (now) → bridged POC on Deschutes hardware (Phases 2–5) → 30 days
unified data → A1 advisory → per-function A2 → campus A3 with merchant
ops. The OS scales with the same families as the hardware: node →
20-node campus → replicated campuses (see
[MISSION.md](../../MISSION.md)).
