# ADC Modular Technology Cooling System (TCS) — CDU-to-Rack Header & Branch Lines

Spec sheet for ADC Solutions' modular TCS product: the factory-built,
pre-cleaned, passivated, pressure-tested, and sealed header-and-branch
piping system that connects a 2 MW ADC CDU secondary loop to a 46 ft row
of high-density liquid-cooled IT racks. Built to the OCP **Modular TCS
Working Paper** Rev 1.0 model — short-duration jobsite assembly and a
single water-only flush instead of stick-built jobsite fabrication.

## Source of truth

The PDF in this folder is the authoritative engineering document. This
page is a Markdown view of it — if they disagree, the PDF wins.

| Document | File | Status |
|---|---|---|
| ADC Modular TCS BoD/RFQ Package, Doc. ADC-MOD-TCS-001 Version 1 (2026-05-19, supersedes Rev 0.3 of 2026-05-15) | [ADC_Solutions_Modular_TCS_BOM_Version_1_WITH_DIAGRAMS.docx.pdf](ADC_Solutions_Modular_TCS_BOM_Version_1_WITH_DIAGRAMS.docx.pdf) | Clean procurement issue — RFQ-ready Bill of Design, **not** a released manufacturing BOM |

Reference specs: OCP Project Deschutes v1.0 (Feb 2026), OCP Open Data
Center Spec v0.5.0 (Feb 2026), OCP Diablo 400 v0.7.0 (Mar 2026), and OCP
Modular TCS Working Paper Rev 1.0 (Aug 2025, with 2026 patches).
Companion product: the [ADC 2 MW CDU](../CDU/README.md) this TCS serves —
the CDU↔TCS boundary is controlled by
[ADC-ICD-001](../CDU/ADC-ICD-001_CDU-TCS_Rev0_1.md) (Rev 0.1, pending
approval).

## What "modular" buys

Every section ships factory-passivated (ASTM A380/A967), hydrotested at
1.3–1.5× working pressure, helium-leak-certified on hoses
(≤ 1×10⁻⁵ atm·cc/sec per Deschutes §23.7), copper-sulfate verified,
nitrogen-purged, capped tamper-evident, and barcoded per OCP §17. Target
site flush is **≤ 24 hours** versus the 6–8 weeks typical of stick-built
piping. Every connection is installer-traceable (welder ID, Victaulic
bolt-pad witness, flange torque log, QD engagement log).

## Design basis (BoD §2–§3, from Deschutes §5)

| Parameter | Value |
|---|---|
| Reference Bay | 46 ft row, 16 racks / 4 Bays, one end-fed 2 MW / 500 GPM CDU |
| Average rack allocation | 31.25 GPM/rack (≈78 kW/rack at ITE ΔT = 10 °C with PG25) |
| Released branch maximum | **170 kW per DN50 branch at 6 fps (1.8 m/s)** — 7 fps / 2 m/s figures are comparison points only, not released limits |
| Header | 6″ Sch 10S 304L stainless, 5.05 ft/s at 500 GPM (≤ 6 ft/s guidance), Victaulic grooved joints |
| Branch lines | 2″/DN50, 32 per row (16 supply + 16 return), avg 126″ drop |
| Header elevation | 100.5″ (2,553 mm) AFF — critical OCP Redmond dimension, not alterable |
| Coolant | PG25 (DowFrost LC25 first source; ChemTreat CL2002, Garratt-Callahan FM5666-LT, Veolia SV5520 approved) |
| Pressure | 0–115 psig normal; 130 psig alarm; **150 psig design WP**; ≥ 450 psig burst; backup PSV preliminary 145 psig (RELIEF-01) |
| Temperature | 18–55 °C operating |
| TCS pressure-drop budget | ≈ 9.4 psi total (incl. ~5 psi flow-control authority) against 80–90 psi available at CDU outlet |
| Wetted materials | 304/316/316L stainless, EPDM peroxide-cured, PTFE where specified — **no nickel-plated brass anywhere on the secondary loop**; NBR/silicone gaskets prohibited |
| Codes | ASME B31.9, B16.x, BPVC IX; ASTM A312/A778/A380/A967; AWWA C606; ASCE 7-16 seismic; IBC + Louisiana State Uniform Construction Code |

## Subsystems (tag prefixes)

| Prefix | Subsystem | Highlights |
|---|---|---|
| SK | CDU secondary-side interface (Side Kit) | 6″ EPDM/SS-braid flex hoses, lug butterfly isolation valves (slow-close if automated), backup PSV, P/T transmitters, air vent, drains, Victaulic Style 77 adapters |
| HS / HR | TCS Header, supply / return | 6″ Sch 10S 304L grooved pipe, 6″×2″ branch tees (Victaulic or T-Drill), per-branch 2″ SS ball valves, flow setters/PICVs (FLOW-01), air vents, drains, redundant PSV, surge accumulators (HYDR-01) |
| BL | Branch lines | 2″ EPDM-lined SS-braided hose assemblies, 126″, per-assembly hydro + helium certs and barcodes, catenary supports |
| QD | IT Rack Connection | 2″ dry-break quick disconnects (Stäubli RBE2 first source; Parker FF, CEJN X65 alternates), Cv ≥ 100, spill-free rack hot-swap |
| DT | Drip tray & leak detection | SS304 modular tray with independent hangers, sloped to drain, 3-zone leak rope (TraceTek/RLE) into the CDU PLC |
| PS | Supports & seismic | Hangers at 8 ft o.c. (>2× ASME B31.9 margin), V-pattern seismic bracing — Louisiana-PE-stamped detail required (SUP-01) |

## Hydraulic safety: transients (HYDR-01)

Joukowsky first-order estimate for instantaneous closure of a DN50 branch
valve at the 170 kW cap: **≈ 326 psi** — above the 150 psi working
pressure. Mandatory mitigations: slow-close actuators (≥ 30 s for 6″
butterflies, ≥ 5 s for 2″ ball valves), hydropneumatic accumulators at
far-end caps and automated valves, staged valve-sequencing MOPs, and a
contractually required pre-commissioning surge analysis (2–3 weeks with a
qualified hydraulic modeling firm). HYDR-01 gates the actuator and
accumulator purchase orders.

## Thermal ride-through (BoD Appendix C)

≈ 24 seconds at 2 MW from TCS fluid mass alone (815 L PG25, 15 K margin);
roughly 40–50 seconds total system with CDU buffer tank and cold-plate
inertia. Version 1 design assumption for UPS hold-up and customer SLA
conversations. Scales linearly with temperature margin and inversely with
load.

## Louisiana sourcing strategy

Every component carries an OCP-named first source **and** a derived
performance spec so Gulf Coast / Louisiana-local alternates can be
solicited — Singer Industrial (Lafayette) for hose fab, Wallace
Industrial and Acme Refrigeration (Lafayette) for pipe and Victaulic,
Setpoint Integrated Solutions (Houma) for valves and instruments, Motion
Industries and Womack for QDs, Stuart Steel (Baton Rouge) and Continental
Steel (Houston) for pipe. RFQs are grouped into bundles B1–B9 with
5–10 business-day quote targets (BoD §7).

## Status

**Version 1 clean procurement issue — RFQ-ready.** Open engineering items
(BoD §8) before final purchase orders: LAYOUT-01 (end-fed vs center-fed),
PIPE-01 (Sch 10S confirmation), PIPE-02 (joint method), HOSE-01
(EPDM vs PTFE), QD-01 (vendor selection), INST-01 (header flowmeter),
TRACE-01 (ADC manufacturer ID), SUP-01 (LA-PE seismic detail), DT-01-OI
(tray fab), MAT-01 (dual-coolant elastomer qualification), **HYDR-01
(mandatory transient-analysis gate)**, **FLOW-01 (per-rack flow-control
selection)**, AIR-01 (deferred campus air separator), QAQC-01 (installer
traceability), CDU-01 (CDU-as-flushing-rig approval), RELIEF-01 (relief
setpoint schedule).

## Unified telemetry (MGN-TEL-001)

TCS telemetry — per-branch flow and ΔT, end-of-line ΔP, balancing-valve
position, filter ΔP, coolant quality, and the 3-zone leak ropes — rides
the platform-wide unified telemetry plane as **Tier 2 under the CDU**
(domain D3), reaching Redfish via the CDU bridge as `Oem/TCSInterface/*`
and `SecondaryCoolantConnectors/{rack}`. Environmental registry v1.5.0
pair-reversal events catch supply/return cross-connection at
commissioning; dew-point events flag condensation risk. See
[Microgrid + Unified Telemetry](../Microgrid/README.md).

## Roadmap

The Reference Bay is the "small" 2026/2027 deployment family (≤ 20 MW
sites). The BoD also defines Large 2026/2027 (46/96 ft rows) and Late
2027/2028+ (96 ft, 2.4 MW/row) families for greenfield and future
high-density TPU/GPU builds (see [MISSION.md](../../MISSION.md)).
