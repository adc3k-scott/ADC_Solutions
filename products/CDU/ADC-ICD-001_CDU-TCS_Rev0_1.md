# ADC-ICD-001 — CDU ↔ TCS Interface Control Document

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-ICD-001 |
| Title | CDU ↔ TCS Interface Control Document (2 MW CDU secondary loop ↔ Modular TCS header) |
| Revision | **0.1** (Approved) |
| Company | ADC Solutions |
| Discipline | MECH / HYDR / CTRL |
| Prepared by | Mission Control — **approved by Scott Tomsu 2026-06-11** |
| Date | 2026-06-11 |
| Parameter tags | [L] Locked · [W] Working · [O] Open |
| Closes | CDU-G7 — "TCS interface control document", a CDU production-BOM release gate — **CLOSED 2026-06-11** |
| Registry record | `system/registry/interfaces/cdu-tcs-hydraulic.json` (machine index of this ICD) |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue. Formalizes the CDU↔TCS interface from ADC-SYS-001 record `cdu-tcs-hydraulic`, OCP Deschutes v1.0 §3.1, and ADC-MOD-TCS-001 §2–§5. No new engineering values — every parameter traces to a governing document. |

## §1 Purpose & Scope

This ICD controls the interface between two separately procured ADC packages:

- **CDU package** — ADC 2 MW CDU per ADC-CDU-DES-BOM-001 (Deschutes-aligned), and
- **TCS package** — ADC Modular TCS per ADC-MOD-TCS-001 Version 1.

It defines the physical demarcation, the supply/install responsibility split, the hydraulic / thermal / pressure / materials requirements each side must satisfy at the boundary, the controls and telemetry crossing it, and the verification that closes it. One end-fed 2 MW CDU serves one 46 ft TCS row: the CDU provides flow and pressure; the TCS spends a small fraction of it and returns the heat.

Out of scope: the TCS↔rack quick-disconnect interface (registry `tcs-rack-branch`), the 100.5″ WMF plane (registry `wmf-plane`), facility/primary water, and sidecar power.

## §2 Governing Documents & Precedence

| Precedence | Document | Role |
|---|---|---|
| 1 | OCP Project Deschutes v1.0.0 §3.1 (2026-02-26) | CDU-side design basis |
| 2 | ADC-MOD-TCS-001 Version 1 §2–§5 (2026-05-19) | TCS-side design basis |
| 3 | ADC-CDU-DES-BOM-001 (2026-05-19) | CDU procurement BOM, SK connection allowance |
| 4 | **This ICD** | Interface agreement — selects and coordinates values from 1–3 |
| 5 | ADC-SYS-001 `cdu-tcs-hydraulic` | Machine-readable index of this ICD |

If this ICD disagrees with a governing document above it, the governing document wins and the ICD is in error (change rule: governing doc → registry → product README).

## §3 Demarcation & Responsibility Split

**The interface plane is the CDU cabinet secondary-loop supply and return port connections** (two connections: one supply, one return).

| Scope | Package | Content |
|---|---|---|
| CDU side of the plane | CDU package | Everything inside the CDU cabinet up to and including the secondary port connections. The CDU BOM carries the SK line as **connection allowance only** — no TCS hardware. |
| TCS side of the plane | TCS package (SK "Side Kit" subsystem) | 6″ EPDM/SS-braid flex hoses, lug butterfly isolation valves (slow-close if automated), backup PSV, P/T transmitters, air vent, drains, Victaulic Style 77 adapters — then header, branches, and all downstream TCS scope. |

This split is deliberate and must be preserved: the SK appears in both BOMs, but hardware supply is **TCS-package scope only**. A double-supply or gap at the SK is an ICD violation.

[O] CDU secondary port size/end-prep is taken as 6″ Victaulic grooved (consistent with the SK 6″ hoses and Style 77 adapters); confirm against the final OCP Deschutes drawing package (same verification thread as SYS-OI-07).

[O] Reference layout is **end-fed** (one CDU at the row end). LAYOUT-01 (end-fed vs center-fed confirmation) gates header fabrication drawings; a center-fed decision changes SK routing but not the values in this ICD.

## §4 Hydraulic Interface

| Parameter | Value | Tag | Source |
|---|---|---|---|
| Design flow | **500 GPM** | [L] critical | Deschutes §3.1; ADC-MOD-TCS-001 §2 |
| Thermal capacity | **2,000 kW** | [L] critical | Deschutes §3.1 |
| dP available at CDU secondary outlet | 80–90 psi | [L] | Deschutes §3.1 |
| TCS pressure-drop budget | ≈ 9.4 psi total (incl. ~5 psi flow-control authority) | [W] | ADC-MOD-TCS-001 §3 |
| Per-rack flow allocation (context) | 31.25 GPM avg (500 GPM / 16 racks) | [L] | ADC-MOD-TCS-001 §2 |

The TCS budget consumes ≈ 10–12% of available head; the margin is CDU pump turndown room, not TCS allocation. FLOW-01 (flow setters vs PICVs) governs how the ~5 psi control authority is spent — it changes the budget split, not the interface totals.

## §5 Pressure Coordination

The protection cascade across the interface, lowest setting first:

| Setting | Value | Owner | Tag | Source |
|---|---|---|---|---|
| TCS normal operating | 0–115 psig | TCS | [L] | ADC-MOD-TCS-001 §2 |
| TCS high-pressure alarm | 130 psig | TCS | [L] | ADC-MOD-TCS-001 §2 |
| **CDU relief (system relief)** | **130 psig** | CDU | [L] | Deschutes §3.1 (operating 0–130 psig) |
| TCS backup PSV (SK) | 145 psig — **preliminary** | TCS | [O] | ADC-MOD-TCS-001 (RELIEF-01) |
| TCS design working pressure | 150 psig | TCS | [L] | ADC-MOD-TCS-001 §2 |
| TCS burst | ≥ 450 psig | TCS | [L] | ADC-MOD-TCS-001 §2 |

The TCS is designed above the CDU relief setting — consistent as drawn. **The CDU relief at 130 psig is the primary system relief; the SK PSV at 145 psig is backup only.** Two open items gate final settings: RELIEF-01 (coordinated relief setpoint schedule — gates the SK side-kit order) and CDU-G4 (relief valve basis with the AHJ — gates CDU production BOM release). Neither side may change a relief setting unilaterally; any change re-opens this section.

## §6 Thermal Interface

| Parameter | Value | Tag | Source |
|---|---|---|---|
| Operating temperature range at the boundary | 18–55 °C | [L] | Deschutes §3.1; ADC-MOD-TCS-001 §2 |
| CDU approach (facility↔secondary, context) | 3 °C at design load | [L] | Deschutes §3.1 |
| Thermal ride-through (context) | ≈ 24 s at 2 MW from TCS fluid mass alone; ~40–50 s with CDU buffer | [W] | ADC-MOD-TCS-001 Appendix C |

## §7 Coolant & Wetted Materials

| Parameter | Value | Tag | Source |
|---|---|---|---|
| Interface coolant | **PG25** — DowFrost LC25 first source; ChemTreat CL2002, Garratt-Callahan FM5666-LT, Veolia SV5520 approved alternates | [L] | ADC-MOD-TCS-001 §2; Deschutes §3.1 |
| CDU dual-coolant capability | CDU is also DI-water capable; **the deployed interface coolant is PG25**. Any DI deployment first requires MAT-01 (dual-coolant elastomer qualification) | [O] | Deschutes §3.1; ADC-MOD-TCS-001 (MAT-01) |
| Materials rule | **No nickel-plated brass anywhere on the secondary loop. EPDM peroxide-cured only; NBR/silicone prohibited.** 304/316/316L stainless, PTFE where specified | [L] critical | Deschutes §3.1; ADC-MOD-TCS-001 §2 |

The materials rule binds **both** packages and every wetted component crossing or touching the boundary, including SK adapters, gaskets, and instruments. CDU-G5 (wetted-material certs) and HOSE-01 (EPDM vs PTFE liner) verify it.

## §8 Hydraulic Transients (HYDR-01 — mandatory gate)

Joukowsky first-order estimate for instantaneous DN50 closure at the 170 kW branch cap: **≈ 326 psi — above the 150 psig TCS working pressure.** Transient behavior is a shared-loop phenomenon: CDU pump trips/starts and TCS valve actuation each excite the other side of this interface. Both packages are bound by:

- Slow-close actuation: ≥ 30 s for 6″ butterflies (incl. SK isolation valves if automated), ≥ 5 s for 2″ ball valves [L]
- Hydropneumatic accumulators at far-end caps and automated valves [L]
- Staged valve-sequencing MOPs [L]
- **Mandatory pre-commissioning surge analysis** of the combined CDU+TCS loop — SOW issued 2026-06-10 (`ops/rfq/2026-06-10-SOW-hydraulic-surge-analysis.md`), firm selection pending [O]

HYDR-01 gates the B3a/B3b valve, actuator, and accumulator purchase orders. The surge model shall include the CDU pump train (2× SPECK TOEMA065200, N+1, VFD) as the upstream boundary condition.

## §9 Controls, Leak Detection & Telemetry

| Item | Requirement | Tag | Source |
|---|---|---|---|
| Safety authority | Rack-loop / leak-response logic stays in the **CDU PLC (CompactLogix 5380)** — never an external gateway or AI layer | [L] critical | ADC BOM locked architecture; MGN-TEL-001 §3.2 |
| Leak detection | TCS 3-zone leak rope (TraceTek/RLE) and drip-tray monitoring terminate in the CDU PLC | [L] | ADC-MOD-TCS-001 §5 (DT) |
| SK instrumentation | SK P/T transmitters land on the CDU PLC | [L] | ADC-MOD-TCS-001 §5 (SK) |
| Telemetry plane | TCS rides domain **D3 as Tier 2 under the CDU** — Redfish via the CDU bridge as `Oem/TCSInterface/*` and `SecondaryCoolantConnectors/{rack}`; the plane is supervisory only | [L] | MGN-TEL-001; registry `telemetry-northbound` |
| Bridge architecture | CDU-G6 (native-Redfish vs bridge for the CDU PLC) may change the transport, never the safety authority | [O] | ADC-CDU-DES-BOM-001 §7 |

## §10 Commissioning & Flushing

- TCS target site flush: **≤ 24 h** (factory-cleaned modular sections; vs 6–8 weeks stick-built). [L] — ADC-MOD-TCS-001 §1/§6
- Flushing rig: **CDU-as-flushing-rig approval is pending (CDU-01)** and gates the ≤ 24 h claim. Until approved, the flush method is unresolved at this interface. [O]
- Fill fluid at handover: PG25 per §7; N2-purged, capped tamper-evident TCS sections opened only at connection time. [L] — ADC-MOD-TCS-001 §6

## §11 Verification Matrix

| # | Requirement (§) | Method | Gate / open item |
|---|---|---|---|
| V1 | 500 GPM / 2 MW / 80–90 psi delivery (§4) | CDU FAT thermal-hydraulic curves at 25–100% speed, DI and PG25 pump-curve overlay | CDU-G9, CDU-G2 |
| V2 | TCS ≈ 9.4 psi budget (§4) | Header/branch hydraulic calc at fabrication-drawing release; confirm at commissioning balance | FLOW-01, LAYOUT-01 |
| V3 | Pressure cascade (§5) | Coordinated relief setpoint schedule; AHJ relief basis | RELIEF-01, CDU-G4 |
| V4 | Strength/integrity at the boundary | Factory hydro 1.3–1.5× WP all TCS sections; helium ≤ 1×10⁻⁵ atm·cc/s on hoses | TCS factory program (§6 of BoD) |
| V5 | Materials rule (§7) | Wetted-material certs both packages; elastomer qualification if DI ever deployed | CDU-G5, HOSE-01, MAT-01 |
| V6 | Transient limits (§8) | Pre-commissioning surge analysis of combined loop; actuator close-time FAT checks | HYDR-01 |
| V7 | Controls/telemetry (§9) | Leak-rope zone test into CDU PLC; point-to-point of SK P/T; Redfish `Oem/TCSInterface/*` conformance vs site interop profile | TEL-PROFILE, CDU-G6 |
| V8 | Port size/end-prep (§3) | Check against final OCP Deschutes drawing package | SYS-OI-07 thread |
| V9 | Flush method (§10) | CDU-as-flushing-rig approval or alternate flush plan | CDU-01 |

## §12 Open Items Affecting This Interface

From ADC-SYS-001 `open-items.json` — this section is an index, the register governs: **HYDR-01** (mandatory surge gate), **RELIEF-01** (relief schedule), CDU-G4 (AHJ relief basis), FLOW-01 (flow-control selection), CDU-01 (flushing-rig approval), LAYOUT-01 (end-fed confirmation), MAT-01 (dual-coolant elastomers), HOSE-01 (hose liner), PIPE-02 (joint method), CDU-G5 (material certs), CDU-G6 (Redfish bridge), CDU-G9 (validation plan), SYS-OI-07 (CDU dimension reconciliation).

## §13 Change Control

Interface values change in their governing document first (§2 precedence), then in registry record `cdu-tcs-hydraulic`, then here, then in the product READMEs — and the registry validator must pass after every step. Neither package may change a boundary-visible parameter (flow, pressure settings, coolant, materials, actuation times, port configuration) without a revision of this ICD. Critical [L] parameters require a formal deviation.
