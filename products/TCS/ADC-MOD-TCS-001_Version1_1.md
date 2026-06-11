# ADC-MOD-TCS-001 — Modular Technology Cooling System (TCS) — CDU-to-Rack Header & Branch Line BoD / RFQ Package

**CONFIDENTIAL — ADC Solutions Internal & Authorized Vendors Only**

| Field | Value |
|---|---|
| Document No. | ADC-MOD-TCS-001 |
| Version | **1.1** (Working Draft) |
| Date | 2026-05-19 (Version 1.1: 2026-06-11) |
| Supersedes | ADC-MOD-TCS-001 Version 1 (2026-05-19), which superseded Rev 0.3 (2026-05-15) |
| Principal Engineer | Scott Tomsu — scott@adc3k.com — +1-337-780-1535 |
| Version 1.1 prepared by | Mission Control per ERRATA-for-BoD-next-rev.md — **pending Scott Tomsu approval** |
| Reference specs | OCP Project Deschutes v1.0 (2026-02); OCP Open Data Center Spec v0.5.0 (2026-02); OCP Diablo 400 v0.7.0 (2026-03); OCP Modular TCS WP Rev 1.0 (2025-08) |
| Parameter tags | W = working/nominal at design point · L = limit/not-to-exceed · O = objective/target |

## Version History

| Version | Date | Author | Description |
|---|---|---|---|
| 1 | 2026-05-19 | S. Tomsu | Clean procurement issue. Reference Bay basis remains 46 ft / 16 racks / 4 Bays, with 6″ Sch 10S headers on the 2 MW / 500 GPM CDU basis. Added DN50 branch-flow comparison at ITE design ΔT = 10 °C / 18 °F: released maximum branch basis is 170 kW at 6 fps / 1.8 m/s; 7 fps and 2 m/s are comparison points only. No pipe sizes changed. |
| 1.1 | 2026-06-11 | Mission Control (pending S. Tomsu approval) | Errata applied (ERRATA-for-BoD-next-rev.md): **E1/SYS-OI-05** — removed the unsourced "with 2026 patches" qualifier on the OCP Modular TCS WP citation; Rev 1.0 (2025-08-25) is the latest published revision, and the announced OCP "Update to Modular TCS" WP is on standing watch (SYS-OI-06). **E2** — external citations verified current 2026-06-10 (ops/research/2026-06-10-ocp-spec-currency.md): Deschutes v1.0 final, Diablo 400 v0.7.0 already correctly cited, ODS v0.5.0 with 1.0 in progress. **E3** — RELIEF-01 now coordinates through the approved **ADC-ICD-001** pressure cascade (CDU relief 130 psig primary / SK PSV 145 preliminary backup); TCS telemetry points forward-referenced to the **Telemetry** product and the draft site Interoperability Profile. Status currency: SUP-01 and HYDR-01 SOWs issued 2026-06-10 (ops/rfq/). Converted to Markdown as the governing format (repo convention); the Version 1 PDF is retained as history, holds Appendix D figures, and is the arbiter of any glyph-level conversion question (unit symbols were restored during conversion). |

## §1 Document Information

### §1.1 Purpose

This document defines the procurement Bill of Design (BoD) for the modular Technology Cooling System (TCS) header and branch-line piping that interfaces an ADC Solutions liquid-to-liquid Coolant Distribution Unit (CDU) secondary loop to a 46 ft row of high-density liquid-cooled IT racks. The system is designed and procured as a modular TCS in the sense established by the OCP Modular TCS Working Paper Rev 1.0 (August 2025): pre-cleaned, factory-passivated, pressure-tested, and sealed off-site for short-duration jobsite assembly and water-only flush, rather than stick-built jobsite fabrication. *(V1.1 / E1: Rev 1.0 is the latest published revision; OCP's announced "Update to Modular TCS, Design & Delivery Best Practices" is unpublished — standing watch SYS-OI-06.)*

It is written as a Request for Quotation (RFQ) package: every component is specified with both a vendor-named first source (as called out in the referenced OCP specifications) and a derived performance specification so equivalent product from alternate vendors — particularly Gulf Coast and Louisiana-local suppliers — can be solicited.

### §1.2 Terminology Alignment with OCP

| Legacy term | Current / OCP term | Tag prefix change |
|---|---|---|
| CDU-to-HAC Header System | Modular Technology Cooling System (TCS) | — |
| Wall Manifold (WMF) Supply | TCS Header, Supply | WS → HS |
| Wall Manifold (WMF) Return | TCS Header, Return | WR → HR |
| Drop Hose Assembly | Branch Line | DH → BL |
| Quick Disconnect at Rack | IT Rack Connection (QD) | QD (unchanged) |
| Side Kit (RSSKT/LSSKT) | CDU Secondary-Side Interface (Side Kit) | SK (unchanged) |
| Drip Tray + Leak Rope | Drip Tray + Leak Rope | DT (unchanged) |
| Pipe Supports & Seismic | Pipe Supports & Seismic | PS (unchanged) |

NOTE: "HAC" (Hot Aisle Containment) remains valid as a deployment-configuration descriptor but is no longer used as the system name. The system is the TCS; HAC is the room layout in which it is installed.

### §1.3 Scope and Boundaries

**IN SCOPE:** CDU secondary-side Side Kit (hoses, fittings, isolation valves, instrumentation between the CDU shell and the TCS Header takeoff); TCS Header (supply and return) running over the cold aisle at the OCP Redmond critical elevation of 100.5″ (2,553 mm) AFF; branch lines from the TCS Header to each IT rack (branch tees, isolation valves, flow control devices, flexible drop sections, IT Rack Connection (QD) at the rack interface); drip tray, slope, drain point, and rope-style leak detection under the full header run; pipe supports (Unistrut/strut), hangers, and seismic bracing per ASCE 7-16 / IBC; header instrumentation (pressure, temperature, optional flow); air vents at high points, drain ports at low points, expansion / pressure-relief / hydropneumatic surge mitigation provisions; factory cleanliness and pre-commissioning specification (§2.5).

**OUT OF SCOPE:** primary / facility cooling water (PCW) piping between the chiller plant and the CDU primary side; CDU internal components (pumps, plate heat exchangers, internal piping, PLC, VFDs); IT-rack internal manifolding (RMFLD), cold plates, intra-rack hose kits; Rear Door Heat Exchangers (RDHx) and their PCW supply; structural steel, base plates, vertical posts, and bay framing of the Redmond HAC; hot-aisle containment panels, sealing, curtains; power, controls, networking, fiber, busduct.

*(V1.1: the CDU↔TCS boundary is formally controlled by **ADC-ICD-001** Rev 0.1, approved 2026-06-11 — products/CDU/.)*

### §1.4 How to Read This Document

Each component table lists: a tag identifier, the function the component performs, the calculated ADC Solutions performance spec (size, pressure rating, material, certifications), the OCP-named first-source vendor or equivalent reference, an equivalent specification suitable for sourcing alternates, and the quantity required for one Reference Bay (defined in §3). Open engineering decisions are flagged with discipline-prefixed Open Item IDs (PIPE-XX, HOSE-XX, HYDR-XX, FLOW-XX, AIR-XX, QAQC-XX, etc.) and consolidated in §8. Parameter tags: W = working/nominal value at design operating point; L = limit/not-to-exceed value (safety or compliance bound); O = objective/target subject to design optimization.

## §2 Reference Design Basis

### §2.1 Thermal-Hydraulic Inputs (from OCP Project Deschutes v1.0 §5)

| Parameter | Value |
|---|---|
| Thermal load per CDU | 2,000 kW (2 MW) per CDU; 46 ft Reference Bay uses one end-fed CDU serving 16 racks / 4 Bays. DN50 branch/drop/QD hardware is capacity-checked for a released maximum of 170 kW/rack at 6 fps (1.8 m/s rounded) and ITE ΔT = 10 °C / 18 °F. This branch capacity is not multiplied into the main-header sizing. |
| Secondary (IT) loop flow, W | 500 GPM at design point (113.6 m³/h) for the CDU secondary loop. Average row allocation 31.25 GPM/rack over 16 racks. ITE ΔT = 10 °C comparison: 31.25 GPM is 78 kW/rack with PG25; 125 kW/rack requires ~50 GPM/rack; 170 kW branch cap requires 68.3 GPM/rack. No pipe sizes are changed by this comparison. |
| Secondary loop coolant, L | PG25 (25% propylene glycol, 75% DI water) — first source DowFrost LC25 or equivalent. ChemTreat CL2002, Garratt-Callahan FM5666-LT, and Veolia SV5520 also approved per Deschutes §5.2. |
| Operating pressure range, W | 0–115 psig typical normal; high-pressure alarm/limit at 130 psig unless CDU OEM specifies otherwise |
| Design / working pressure rating, L | 150 psig (1,034 kPa) for all wetted hardware |
| Burst / proof pressure rating, L | ≥450 psig (3× working pressure per Deschutes §23.1) |
| Available secondary loop dP, W | 80–90 psi at CDU secondary outlet (Deschutes §5); final pump curve and rack pressure-drop curve to be confirmed before FLOW-01 release |
| Operating coolant temperature, W | 18–55 °C (64.4–131 °F) |
| Approach temperature target, O | 3 °C across CDU plate heat exchanger at 2 MW / 500 GPM. ITE rack heat-transfer comparison uses ΔT = 10 °C / 18 °F and caps DN50 branch flow at 170 kW/rack at 6 fps / 1.8 m/s; see §4.4.1. |
| Pressure relief setpoint, O | CDU internal PSV: 130 psig nominal. Field/header backup PSV: preliminary 145 psig, staged above normal operating/alarm limit and below 150 psig design WP; final setpoints per RELIEF-01 and AHJ/CDU OEM review. *(V1.1 / E3: the full protection cascade — TCS normal 115 / alarm 130 / CDU relief 130 primary / SK PSV 145 backup / WP 150 / burst ≥450 — is tabulated in ADC-ICD-001 §5; neither side changes a relief setting unilaterally.)* |
| Electrical-to-cooling ratio, O | TCS capacity sized at ~100% of rack electrical load (cold-plate-only; no air-side capture assumed). Aligns with OCP Modular TCS §3.6 conservative cold-plate sizing. |

### §2.2 Materials and Wetted-Surface Policy

Per Deschutes §5.2 / §3.3 and OCP Modular TCS §3.3. Suppliers of valves, flow-control devices, air vents, QDs, and accumulators shall certify process-wetted part compliance with this section and PG25/SV5520 compatibility:

- **Allowed wetted materials:** 304 / 316 / 316L stainless steel; copper (limited, primarily inside CDU); EPDM peroxide-cured elastomer; PTFE where explicitly specified for valve seats or hose liners.
- **Prohibited:** nickel-plated brass shall NOT be used anywhere on the secondary loop.
- **Avoid in wetted contact:** carbon steel, galvanized steel, yellow brass (galvanic / corrosion risk with PG25 at 55 °C). Carbon-steel accumulator shells acceptable only when isolated from process fluid by an EPDM bladder and stainless process connection.
- **Brass exceptions:** where unavoidable in small fittings, alloys with zinc content ≤15% or verified dezincification-resistant per ISO 6509 (e.g., UNS C87850, UNS C95500, AMETAL).
- **Gasket material:** EPDM peroxide-cured (Class A), compatible with PG25 to 60 °C continuous. NBR/Buna and silicone are NOT compatible with PG25 at elevated temperature.
- **Thread sealants:** PTFE tape and Loctite 567 (low-strength) acceptable on stainless threaded joints. Pipe dope containing petroleum or zinc-bearing fillers is not permitted.

**Embodied-carbon selection rationale.** 304L SS Sch 10S at ~30.8 kg CO₂/lm (with recycled content per US mill EPDs) is comparable on a per-internal-diameter basis to SDR 11 HDPE (~32.5) and SDR 11 PPR (~24.9) at equivalent flow capacity, per OCP Modular TCS WP §3.5 Table 4. The recycled-content advantage of stainless, combined with longer service life, dimensional stability at 70 °C, full passivation/repassivation tolerance, and end-of-life recyclability, makes the embodied-carbon argument for non-metallic pipe at TCS temperatures and pressures inconclusive at best. Stainless is retained as the standard.

### §2.3 Hose Rating Requirement (Deschutes §23.1)

All flexible hoses in this scope shall satisfy: (a) continuous working pressure rating ≥150 psi at 55 °C; (b) burst pressure ≥3× rated working pressure = 450 psi minimum; (c) compatibility with PG25 and the approved DI-water-based corrosion-inhibited coolants in §2.1; (d) wetted liner of EPDM or PTFE; (e) braided or wire-helix reinforced as required for the rated pressure.

### §2.4 Codes, Standards, and Certifications

Most stringent governs where conflicts exist: ASME B31.9 (building services piping — allowable stress, hanger spacing, joint qualification); ASME B16.5 / B16.9 / B16.11; ASME BPVC Section IX (where any field welding occurs); ASTM A312 / A778 (SS pipe); ASTM A380 (cleaning/descaling/passivation); ASTM A967 (chemical passivation); ASTM B912 (electropolishing alternate); AWWA C606 (grooved joints); AWS D10.18 (austenitic SS pipe welding); ASCE 7-16 (seismic — per Deschutes §19.4.5, Sds = 2.273, Av = 0.45g, equivalent static lateral V = 0.9g; **confirm actual Sds for Louisiana site** — SUP-01); NFPA 70 (NEC) Article 645 where applicable; IBC + Louisiana State Uniform Construction Code; OCP Modular TCS Working Paper Rev 1.0 (design and delivery guidance; informed industry consensus, not binding standard).

*(V1.1 / E2: all external citations verified current as of 2026-06-10 — ops/research/2026-06-10-ocp-spec-currency.md.)*

### §2.5 Factory Cleanliness & Pre-Commissioning Specification

Codifies the off-site fabrication, cleaning, passivation, testing, and sealed-delivery practices that distinguish a modular TCS from jobsite stick-built piping, aligned to OCP Modular TCS WP §3.5 surface quality, Appendix C filtration/air-removal, and Appendix G commissioning. Objective: a system that arrives on-site "dusty but not dirty," capable of being brought to OCP Cold Plate fluid-quality specification with a single short-duration water or PG25 flush.

**2.5.1 Off-site fabrication cleanliness.** Internal pipe surfaces visually inspected per CGA G-4.1, ASTM G93, or IEST-STD-CC1246 Annex D before delivery ("go/no-go" qualitative methods acceptable for this duty class). Welds deburred, dressed, pickled; welding per AWS D10.18; TIG or automated orbital preferred to minimize internal spatter — less-controlled processes require supplemental mechanical polishing or chemical pickling. Passivation chemistry matches welding method: orbital-welded tubing may use citric or nitric acid per ASTM A967; non-orbital-welded pipe may require harsher pickling per ASTM A380. All passivation residue fully removed before sealing (residue causes foaming and inhibitor reaction per OCP Appendix G). T-Drill cold-formed branch outlets acceptable as an alternative to welded branch tees (PIPE-02 sub-option) — eliminates a weld and reduces contamination points.

**2.5.2 Pre-shipment testing.** Hydrostatic test per ASME B31.9 at 1.3–1.5× design WP, held minimum 10 minutes with no measurable decay (195–225 psig for 150 psig WP service). Helium leak test per Deschutes §23.7 on all flexible hose assemblies — leak rate ≤1×10⁻⁵ atm·cc/sec, per-assembly certificate. Copper sulfate test (ASTM A967) on representative surfaces to confirm free-iron removal post-passivation. Pre-commissioning transient/surge analysis required per HYDR-01 before specifying actuator closure rates and finalizing accumulator sizing (HS-12/HR-12).

**2.5.3 Clean delivery.** Each modular section drained, dried, sealed with dry-nitrogen purge immediately after passivation/testing; tamper-evident caps on all open ends until installation. Permanent barcode per Deschutes §17 / OCP §17: ADC Manufacturer ID + manufacturing date (YYWW) + 6-digit sequence (TRACE-01). Documentation travels with each section: MTRs, passivation log, hydrotest cert, copper-sulfate cert, helium cert (hoses), installer/inspector traceability log placeholder.

**2.5.4 Site installation, flush, verification.** Clean-handling protocol (gloves; caps removed only at joint makeup; open ends never left exposed). Target site flush ≤24 hours using water or PG25, vs 6–8 weeks typical stick-built (OCP Appendix G Table 3.1). Flush path established before any QD is mated; branches flushed sequentially after header verified clean. CDU-as-flushing-rig permitted only with inlet protection (50 µm bag filter/strainer during commissioning, stepped to 25 µm cartridge before declaring commissioned) **and** CDU manufacturer approval (CDU-01). Particulate target at closeout: ≤25 µm per OCP Cold Plate guidance, verified by turbidity testing and, where SLA demands, particle counter. Air removal: vacuum-assisted fill or active venting before rack connection; controlled CDU pump start; sequential high-point venting; minimum 24-hour stabilization circulation before baseline ΔP/flow measurements.

**2.5.5 Installation traceability (QAQC-01).** Per OCP Modular TCS Appendix A: welded joints — welder ID stamp or signed weld-map entry; grooved couplings — installer initials on bolt-pad witness label plus visual confirmation of metal-to-metal bolt-pad contact and gasket presence; flanges — bolt-torque log with technician ID and tool calibration ID; QDs — engagement-confirmation log with serial match; hose assemblies — per-assembly barcode plus install location, hose ID logged against rack ID. Traceability log delivered in the commissioning closeout package.

## §3 Reference Bay Geometry

### §3.1 Three Deployment Families

| Parameter | Small (≤20 MW DC) | Large 2026/2027 (≥20 MW) | Late 2027/2028+ |
|---|---|---|---|
| Reference application | Constrained / colo retrofit | Greenfield large DC, baseline | Future high-density TPU/GPU |
| Row length, W | 46 ft | 46 or 96 ft | 96 ft preferred |
| IT-rack width | 28″ (711 mm) | 28″ (711 mm) | 28″ (711 mm) |
| IT-rack depth, L | 48″ (1,219 mm) | 52″ (1,321 mm) | 71″ (1,804 mm) |
| Cold aisle width | 54″ min | 60″ min | 82″ preferred (54″ tolerable) |
| Hot aisle width (with RDHx) | 48″ min | 54″ min | 54″ min |
| Min ceiling height | 14 ft | 18 ft | 18 ft (for 2N busway) |
| Row power (target) | 750 kW min/row | 1 MW min/row | 2.4 MW min/row |
| TCS Header elevation AFF, L | 100.5″ (Redmond) | 100.5″ (Redmond) | 100.5″ (Redmond) |

NOTE: the 100.5″ TCS Header elevation is a critical dimension in OCP Redmond HAC §18.4 and cannot be altered without invalidating compatibility with Deschutes-spec IT racks and side kits. The cabling levels at 115.5″, 127.5″, and 139.5″ above the header are also critical.

### §3.2 Reference Bay for Quantity Take-Off

| Parameter | Value |
|---|---|
| Row length, W | 46 ft — small 2026/2027 baseline |
| IT racks per row, W | 16 racks = 4 Bays served by one 2 MW end-fed CDU |
| Average IT load per rack, W | 125 kW/rack average on one 2 MW CDU. DN50 branch/drop/QD hardware released maximum: 170 kW/rack at 6 fps (1.8 m/s rounded) and ITE ΔT = 10 °C / 18 °F through one 2″/DN50 branch. 7 fps / 2 m/s values are comparison only. |
| Secondary flow per rack, W | 31.25 GPM/rack average at the 2 MW / 500 GPM row hydraulic design point. ITE ΔT = 10 °C comparison: 125 kW/rack requires ~50 GPM/rack; 170 kW branch cap requires 68.3 GPM/rack. Do not use comparison rows to multiply header flow unless CDU capacity and pump curve are increased. |
| CDUs per row, O | 1 per row, end-fed (single 2 MW CDU at row end serving 16 racks = 4 Bays) — LAYOUT-01 |
| Branch line length, O | Average 126″ (10.5 ft) per branch (drop + horizontal traverse to rack TCS inlet/outlet) |
| Total branches per row, W | 32 (16 supply + 16 return) for 16 racks |
| Future-density headroom, O | 2″/DN50 branch/drop hardware selected around 170 kW/rack max at 6 fps and ITE ΔT = 10 °C / 18 °F. 2 m/s and 7 fps show theoretical headroom only; released branch maximum remains 170 kW/rack unless FLOW-01 explicitly changes it. |

NOTE: the released DN50 branch/drop/QD maximum is 170 kW per branch at 6 fps using the ITE design ΔT = 10 °C / 18 °F comparison. The 7 fps and 2 m/s values are comparison points only — not a pipe-size change and not a new released operating limit. Header sizing and the §4 take-off remain based on one end-fed 2 MW / 500 GPM CDU; 16 × 170 kW = 2.72 MW, which exceeds one 2 MW CDU and cannot be assumed simultaneous without added CDU/pump capacity.

NOTE: HS-06b and HS-12 remain gated engineering items tied to FLOW-01 and HYDR-01 respectively. HS-12 quantity is intentionally TBD pending the transient/surge analysis; one accumulator near the far-end cap is the minimum starting assumption.

## §4 Bill of Design by Subsystem

### §4.1 CDU Secondary-Side Interface (Side Kit)

The Side Kit is the flexible interface connecting the CDU's secondary-side supply and return Victaulic flanges (top of CDU shell, per Deschutes §4) to the TCS Header takeoff. It absorbs CDU thermal growth and small misalignment and provides isolation valves for CDU service without dropping the entire header. Where automated isolation is specified (optional per leak-zone strategy), actuators must comply with the slow-close requirement of HYDR-01. *(V1.1: SK demarcation per ADC-ICD-001 §3 — the SK is TCS-package supply scope; the CDU BOM carries connection allowance only.)*

| Tag | Component | Function | ADC Solutions spec | OCP ref / equivalent | Qty/CDU |
|---|---|---|---|---|---|
| SK-01 | Flexible hose, supply | Absorb misalignment + thermal growth, CDU outlet to header takeoff | 6″ ID × ~36″ long, EPDM peroxide-cured liner, SS304 braided cover, fixed flange × fixed flange, 150 psi WP at 55 °C, 450 psi burst, ASME B31.9 listed. Final CDU nozzle/adaptor size per CDU OEM data sheet. | Parker 7026 or equivalent (Continental ContiTech Steam-Master, Goodyear Plicord) | 1 |
| SK-02 | Flexible hose, return | Mirror of SK-01 | Same as SK-01 | Same as SK-01 | 1 |
| SK-03 | Isolation butterfly valve, supply | Manual isolation of CDU from header; optional automated actuator for leak-zone response | 6″ lug-style, SS body, EPDM seat, SS304 disc, 150 psi CWP, lever or gear operator. If automated: slow-close pneumatic/electric actuator, closure time ≥30 s, per HYDR-01. Position-indicator switch optional. | Bray Series 31/32 + slow-close actuator (Bray S70/S92); alternates Milwaukee, Keystone, Apollo | 1 |
| SK-04 | Isolation butterfly valve, return | Mirror of SK-03 | Same as SK-03 | Same as SK-03 | 1 |
| SK-05 | Pressure relief valve (PSV) | Field-mounted backup PSV (CDU has internal PSV); staged above max normal pressure to avoid nuisance lifting | 1.5″ NPT inlet preliminary only; final inlet size, setpoint, capacity by RELIEF-01 for the selected CDU pump curve and AHJ basis. SS body & trim, ASME UV stamped, EPDM seat; preliminary set 145 psig unless CDU OEM/AHJ directs otherwise. | Kunkle 6010 SS, Watts 174A SS, or equivalent | 1 (supply) |
| SK-06 | Pressure transmitter | Header-side pressure telemetry to PLC | 0–200 psig range, 4–20 mA or Modbus output, SS316L wetted, NPT process connection, Class A indoor | Rosemount 2088, Endress+Hauser PMC21, WIKA S-20 | 2 |
| SK-07 | RTD temperature element + transmitter | Header temperature telemetry to PLC | Pt100 Class A 3-wire, SS316L thermowell NPT, 4–20 mA head transmitter, ±0.3 °C at 25 °C | WIKA TR10-C, Rosemount 0065 | 2 |
| SK-08 | Air vent, automatic | Vent entrained air at side-kit high point during fill/operation | NPT, SS316 body, EPDM seat/seal, 150 psi rated; no brass wetted parts | Spirotherm Spirovent Jr. SS or equivalent | 1 |
| SK-09 | Drain valve + cap | Drain side kit for CDU removal | Ball valve, SS body, blow-off cap, lockable handle | Apollo 76F SS or equivalent | 2 |
| SK-10 | Victaulic grooved coupling, CDU adapter | Mates SS304 Sch 10S pipe to CDU's Victaulic flanges | 6″ Style 77 flexible coupling, SS304/SS316 housing where specified, Grade E EPDM gasket, 300 psi rated. Include 6″ CDU-outlet reducer/flange adapter if the CDU ships with smaller Victaulic, NPT, tri-clamp, or ANSI flange outlets. | Victaulic Style 77 + reducer/flange adapter as required; alternate ANVIL Gruvlok 7001SS | 4 |

NOTE: if the CDU vendor delivers NPT or ANSI 150# flange outlets rather than Victaulic grooves, substitute SK-10 with ANSI 150# class flange adapters and gaskets (EPDM Grade E, full-face). Confirm CDU outlet termination on the vendor data sheet before placing the SK-10 order. See PIPE-02.

### §4.2 TCS Header, Supply

Single-diameter 6″ Sch 10S stainless run traversing the full cold-aisle length at the Redmond critical elevation 100.5″ AFF, sized for 500 GPM at low velocity (≤6 ft/s) to minimize friction, noise, erosion. Joints use Victaulic grooved couplings (preferred per OCP Modular TCS §3.7 / Appendix A reliability data: ≥9.2 billion-hour MTBF across 150,088 couplings in 18 hyperscale projects over 15 years with zero recorded leakage failures).

**§4.2.1 Pipe sizing calculation** — 500 GPM at ≤6 ft/s per ASHRAE/ASPE noise and erosion guidance:

| Nom. size | Schedule | Actual ID | Velocity @ 500 GPM | ΔP per 100 ft (PG25 @ 30 °C) | Verdict |
|---|---|---|---|---|---|
| 4″ | 10S | 4.260″ | 11.3 ft/s | 8.2 psi | FAIL — velocity too high; Deschutes §23.2.2 sets 4″ ID minimum only |
| 5″ | 10S | 5.345″ | 7.15 ft/s | 3.4 psi | MARGINAL — borderline velocity; 5″ not a common SS stocking size |
| **6″** | **10S** | **6.357″** | **5.05 ft/s** | **1.4 psi** | **RECOMMENDED — comfortable margin, common stocking size, low ΔP** |
| 8″ | 10S | 8.329″ | 2.94 ft/s | 0.36 psi | OVERSIZED — cost & weight without proportional benefit |

**Selection: 6″ Sch 10S 304L stainless TCS Header (supply and return).**

**§4.2.2 TCS Header Supply BOM**

| Tag | Component | Function | ADC Solutions spec | OCP ref / equivalent | Qty / 46 ft Reference Bay |
|---|---|---|---|---|---|
| HS-01 | 6″ Sch 10S 304L SS pipe, grooved-end | Main supply header | ASTM A312/A778 304L, Sch 10S (0.134″ wall), Victaulic-grooved both ends, MTR required, polished interior not required. T-Drill collared branches acceptable per PIPE-02 sub-option. | Bull Moose, Allied, Wheatland, or any A312 mill — distributed by Continental Steel (Houston), Stuart Steel (Baton Rouge) | 46 ft installed / 60 ft purchase |
| HS-02 | 6″ Victaulic Style 77 flexible coupling | 2 stick-to-stick joints + 1 far-end cap/interface coupling (CDU/header transitions covered by SK-10) | SS304/SS316 housing where specified, Grade E EPDM gasket (PG25-compatible to 60 °C), 300 psi rated | Victaulic Style 77; alternate ANVIL Gruvlok 7001SS | 3 |
| HS-03 | 6″ × 2″ branch tee, Victaulic / T-Drill | Branch outlet to each rack | Stub tee with 2″ Victaulic-grooved branch, SS304 body, machined groove, 300 psi rated. T-Drill cold-formed branch acceptable alternate. | Victaulic No. 25 "Vic-O-Let", Gruvlok 7072 reducing tee, or T-Drill collared outlet. Local fab OK if AWS D1.6 qualified. | 16 |
| HS-04 | 6″ × 4″ reducing coupling | If center-fed split, reduce after midpoint where load drops | Victaulic Style 750 concentric reducer, SS304 | Victaulic 750; alternate Gruvlok | 0 end-fed / 2 if center-fed (LAYOUT-01) |
| HS-05 | 6″ end cap, grooved | Dead-end termination at far end | SS304 grooved cap, blank face, 300 psi rated | Victaulic 60 Cap; alternate Gruvlok | 1 |
| HS-06 | 2″ isolation ball valve at branch | Per-rack isolation; rack removal without header shutdown | Two-piece full-port, SS316 body and ball, PTFE seats acceptable, lever handle with lockout tab, 150 psi CWP at 55 °C, Victaulic-grooved or threaded ends. Supplier certifies PG25/SV5520 compatibility, no brass wetted parts. | Apollo 76F-200, Conbraco 76F-200, Jamesbury 4A, Danfoss FD-83 (2″ called out in Deschutes §23.2.3) | 16 |
| HS-06b | Flow control device, per branch | Maintain per-rack flow in target band; prevent under-flow (cold-plate damage) and over-flow (channel erosion) per FLOW-01 | Starting selection: 2″ flow setter/PICV, field-settable or cartridge-selectable. Setpoint by FLOW-01: 31.25 GPM/rack at the 2 MW / 500 GPM basis; ~50 GPM/rack for 125 kW at ITE ΔT = 10 °C if CDU capacity increased; cap 68.3 GPM/rack (170 kW at 6 fps). Body/Cv shall not limit the DN50 branch cap. Wetted metallics 304/316/316L or approved low-zinc/DZR by exception; elastomers PG25/SV5520-compatible. | Griswold Flow-Set; Caleffi 121 series; or Belimo / Caleffi 145 / Danfoss MSV PICV | 16 |
| HS-07 | Automatic air vent, high point | Continuous air removal | 1″ NPT, SS316 body, EPDM seat/seal, 150 psi rated, integral isolation cock; no brass wetted parts | Spirotherm Spirovent Air Eliminator (small), or Watts FV-4M1 SS | 1 |
| HS-08 | 1″ drain valve + cap, low point | Fill, flush, drain | 1″ SS ball valve, blow-off cap, lockable | Apollo 76F-100 SS | 1 |
| HS-09 | PSV, redundant | Header backup overpressure protection coordinated with CDU internal PSV per RELIEF-01 | 1.5″ inlet, preliminary set 145 psig (above 130 psig alarm/limit; final per RELIEF-01), SS body, ASME UV, EPDM seat | Kunkle 6010 SS or Watts 174A SS | 1 |
| HS-10 | Pressure gauge, dial, glycerin-filled | Local visual indication for operator walkdown | 4″ dial, 0–200 psig, SS316 wetted, glycerin-filled, NPT back connection, 1% accuracy | WIKA 233.54 or Ashcroft 1009 | 2 |
| HS-11 | Test ports / pet cocks | Commissioning + maintenance pressure/temp checks | NPT SS needle valve with cap, body rated 600 psi | Anderson Greenwood, Whitey/Swagelok | 2 (supply, per row) |
| HS-12 | Hydropneumatic surge accumulator | Absorb pressure transient (water hammer) from rapid valve actuation or pump trip; protect joints per HYDR-01 | Bladder-type, EPDM bladder (PG25-compatible), SS shell preferred (carbon steel acceptable only if isolated by bladder). Process port and fluid-contacting parts SS316, 150 psi WP / 450 psi burst, to 1″ NPT process connection, nitrogen pre-charge. Size by HYDR-01. Placement: near far-end blank cap (worst wave-reflection node) and near any automated isolation valve. | Wilkens Industries WSI series; Flo-Tek HSA-150; Cla-Val. Local rep via Setpoint Integrated Solutions. | Qty TBD pending HYDR-01 |

### §4.3 TCS Header, Return

Mirror of the supply header — quantities and specs identical; purchased in practice as a single "Header Kit" containing both runs.

| Tag | Component | Spec | Qty / 46 ft Reference Bay |
|---|---|---|---|
| HR-01 | 6″ Sch 10S 304L SS pipe, grooved-end | Identical to HS-01 | 46 ft installed / 60 ft purchase |
| HR-02 | 6″ Victaulic Style 77 coupling | Identical to HS-02 | 3 |
| HR-03 | 6″ × 2″ branch tee | Identical to HS-03 | 16 |
| HR-04 | 6″ × 4″ reducing coupling | Identical to HS-04; center-fed return reducer option if LAYOUT-01 selects center-fed | 0 end-fed / 2 if center-fed |
| HR-05 | 6″ end cap, grooved | Identical to HS-05 | 1 |
| HR-06 | 2″ isolation ball valve at branch | Identical to HS-06 | 16 |
| HR-06b | Flow control device, per branch | Identical to HS-06b. Flow control on supply or return is acceptable — typically return for accessibility; final placement per FLOW-01. | 16 (or 0 if HS-06b fitted — do not double-fit) |
| HR-07 | Automatic air vent, high point | Identical to HS-07 | 1 |
| HR-08 | 1″ drain valve + cap, low point | Identical to HS-08 | 1 |
| HR-10 | Pressure gauge | Identical to HS-10 | 2 |
| HR-11 | Test ports / pet cocks | Identical to HS-11 | 2 |
| HR-12 | Hydropneumatic surge accumulator | Identical to HS-12; sizing and qty per HYDR-01 | Qty TBD pending HYDR-01 |

### §4.4 Branch Lines (Header to IT Rack Connection)

Branch lines connect the TCS Header branch isolation valve at 100.5″ AFF down to the IT rack's TCS supply/return ports (typically near rack top, ~85″ AFF). The branch line absorbs thermal growth, vibration, and small lateral position differences, and is the field-replaceable element if a leak develops. Per OCP Modular TCS §3.7, the branch line is the assembly including header isolation, flow control, flexible drop section, and IT Rack Connection (QD).

**§4.4.1 Branch line sizing** — maximum branch heat removal 170 kW at 6 fps (1.8 m/s rounded) with ITE design ΔT = 10 °C / 18 °F. The 7 fps and 2 m/s values are comparison points only. Average operating allocation on one 2 MW / 500 GPM CDU remains 31.25 GPM/rack (78 kW/rack at ΔT = 10 °C); 125 kW/rack requires ~50 GPM/rack and CDU/pump review.

| Branch nom. | Effective ID basis | Velocity @ 170 kW / 10 °C | ΔP per 10.5 ft (PG25 @ 30 °C) | Verdict |
|---|---|---|---|---|
| 1.25″ | 1.25″ | 17.9 ft/s | 14 psi | FAIL — exceeds 6 fps cap; excessive friction |
| 1.5″ | 1.5″ | 12.4 ft/s | 5.8 psi | FAIL — above 6 fps cap; lower-duty only |
| **2″/DN50** | **2.157″ hydraulic ID basis** | **6.0 ft/s** | **1.4 psi** | **REQUIRED/RECOMMENDED — matches 170 kW cap at 6 fps / 1.8 m/s** |

ITE design ΔT = 10 °C / 18 °F branch-flow comparison (2″/DN50; no pipe-size change):

| Condition | Velocity | DN50 branch flow | Heat removal @ 10 °C / 18 °F | Status / RFQ use |
|---|---|---|---|---|
| 500 GPM CDU equal share | 2.74 ft/s (0.84 m/s) | 31.25 GPM | 78 kW at 10 °C (125 kW would need 16 °C / 29 °F) | Current 500 GPM hydraulic share; not max |
| 125 kW/rack at ITE ΔT | 4.41 ft/s (1.34 m/s) | 50.2 GPM | 125 kW | Requires 804 GPM total for 16 racks if simultaneous |
| **Released branch max sanity cap** | **6.00 ft/s (1.83 m/s; rounded 1.8)** | **68.3 GPM** | **170 kW** | **MAX branch basis for RFQ / FLOW-01** |
| 2.0 m/s comparison | 6.56 ft/s (2.00 m/s) | 74.7 GPM | 186 kW | Comparison only; above 170 kW cap |
| 7.0 ft/s comparison | 7.00 ft/s (2.13 m/s) | 79.7 GPM | 198 kW | Comparison only; above 170 kW cap |

Calculation basis: DN50 full-bore hydraulic basis uses 2.157″ ID (2″ Sch 10S equivalent), PG25 at 30 °C with ρ = 1,030 kg/m³ and cp ≈ 3,840 J/kg·K, ITE ΔT = 10 K. If a selected hose or QD has a smaller actual bore (e.g., 2.000″ ID), 170 kW at 10 °C occurs near 7 fps; vendor data sheets shall verify effective bore and Cv under FLOW-01. **Selection: 2″/DN50 branch line, both supply and return.**

**§4.4.2 Branch Line BOM**

| Tag | Component | Function | ADC Solutions spec | OCP ref / equivalent | Qty/Row |
|---|---|---|---|---|---|
| BL-01 | 2″/DN50 EPDM-lined flexible hose assembly | Flexible drop section, header branch to QD body | 2″/DN50 full-bore, 126″ (10.5 ft) length, EPDM peroxide-cured liner, two-wire-braid SS304 reinforcement, EPDM cover, 2″ Victaulic grooved at header end, 2″ male QD coupler half at rack end (furnished from QD-01 and swaged by hose fabricator — do not quote separately). Vendor states actual hose/QD effective bore for FLOW-01. 150 psi WP at 55 °C, 450 psi burst min, hydrotest cert per assembly, helium leak ≤1×10⁻⁵ atm·cc/sec, PG25 compatibility certified, per-assembly barcode per §2.5.3. | Continental ContiTech Plicord Hi-Per Blue or Parker 7287 jacketed; assemblies fabbed by Singer Industrial (Lafayette) or Industrial Hose Inc. | 32 (16 supply + 16 return) |
| BL-02 | Hose-end fitting, header side | Crimp/swage hose end to 2″ Victaulic stub | 2″ Victaulic-grooved nipple, SS304, swaged/crimped per manufacturer spec, helium-tested ≤1×10⁻⁵ | Continental 1IMV or Parker 30182; specified by hose fabricator | Integral to BL-01 |
| BL-03 | Hose-end fitting, rack side | QD coupler half furnished from QD-01 (§4.5); do not double-order | Mating coupler half of the QD selected in §4.5, issued from QD-01 inventory and swaged to hose | Integral to BL-01 | Integral to BL-01 |
| BL-04 | Hose support (catenary saddle) | Prevent hose self-weight from loading the QD or branch valve | SS316 strap-type saddle, EPDM rub liner, hung from cable-tray-level steel above the rack | Eaton B-Line BCH, Cooper Series 14, or shop-fabbed from Unistrut P5500 + neoprene | 32 |

NOTE: per Deschutes §17 / OCP §17, every flexible hose assembly above 1″ ID carries a permanent barcode (manufacturer ID + YYWW + 6-digit sequence). ADC Manufacturer ID assigned per TRACE-01.

### §4.5 IT Rack Connection (Quick Disconnect)

Lets a rack be hot-swapped without draining the header or shutting down the row. Priorities: (1) automatic dry-disconnect (no spill on uncouple); (2) Cv high enough to add no appreciable ΔP at the released branch cap of 68.3 GPM; (3) wetted materials per §2.2. Per OCP Modular TCS §3.7, DN50 (2″) is the maximum commercially available QD size as of 2026 and supports ~170 kW per connection at ITE ΔT = 10 °C / 18 °F.

| Tag | Component | Function | ADC Solutions spec | OCP ref / equivalent | Qty/Row |
|---|---|---|---|---|---|
| QD-01 | 2″ dry-break quick disconnect, full set (body + coupler) | Spill-free hot connect/disconnect of branch line at rack TCS port | 2″ nominal, SS316L body, EPDM seals, dry-break, Cv ≥100 minimum at the 6 fps / 170 kW cap (≤0.5 psi at 68.3 GPM); Cv ≥140 preferred. 150 psi WP, 600 psi burst, IP67 sealed when disconnected, one-handed actuation with locking sleeve, dual-valve isolation with mechanical interlock. Purchase 32 full sets; coupler half to hose fabricator (BL-01/BL-03), body half rack-side. | Stäubli RBE2-2400 or RBE2-3000; Parker FF series 2″; CEJN X65; Eaton FD89 | 32 sets |
| QD-02 | Dust caps (body + coupler halves) | Protect open QD halves during rack removal | SS or anodized aluminum, integral lanyard, EPDM seal | Supplied with QD-01 as kit | 32 pairs |

Local sourcing: Stäubli US distribution via Stäubli Corp (Duncan, SC); Parker FF stocked by Motion Industries (Lafayette/BR/NOLA); CEJN carried by Womack Machine Supply (Houma, Lake Charles). NOTE: QD-01 is the "drip-less without vent/drain" type per OCP Modular TCS Table G-8 — air mitigation per OCP Appendix G (pre-fill rack with vacuum degassing/purging; clean mating surfaces; monitor for air/particulate ingress). No field sampling port at this connection.

### §4.6 Drip Tray and Leak Detection

Per Deschutes §23.2 / §18.12 and OCP Modular TCS Appendix A, a drip tray with integral leak detection is mandatory under any horizontal coolant piping in the data hall. *(V1.1 / E3: leak zones, branch flow/ΔT, and pair-reversal/dew-point event coverage ride the **Telemetry** product — MGN-TEL-001 D3 domain and the draft site Interoperability Profile, `system/twin/profile/` — no re-specification here.)*

| Tag | Component | Function | ADC Solutions spec | Reference / equivalent | Qty/Row |
|---|---|---|---|---|---|
| DT-01 | Drip tray, modular section | Catch any leak from TCS Header supply + return | SS304, 16 ga (0.060″ wall), 24″ wide × 4″ deep, modular 8 ft sections, overlapping slip joints, EPDM gasket between sections, sloped toward drain per DWG-DT-001 | Custom fab; ADC standard drawing DWG-DT-001. Acme Refrigeration (Lafayette) capable sub. | 7 |
| DT-02 | Drip tray drain assembly | Collect liquid for inspection/sample/disposal | 1.5″ NPT bulkhead drain at low point, SS strainer basket, NPT ball valve, sight glass, 5 gal capture pan with high-level float switch wired to PLC | Local fab; instruments per Setpoint Integrated Solutions (Houma) | 1 |
| DT-03 | Leak detection rope, sensing | Continuous water-presence detection along entire header length | Conductivity/impedance leak rope, 8 ft modular lengths, daisy-chained, zone-able into 3 zones per Deschutes §3.3 item 10 | TraceTek TT1000 or RLE SeaHawk SC-Z + SD-Z | 7 |
| DT-04 | Leak detection zone controller | Latch zone alarms; communicate to PLC via Modbus RTU or BACnet | Wall-mount, 3-zone min, 24 VDC, dry-contact + Modbus RTU output, NEMA 1 (indoor) | TraceTek TTSIM-1A or RLE Falcon FMS-1000 | 1 |
| DT-05 | Drip tray support hangers | Suspend tray on independent hangers (do NOT hang from header — Deschutes §23.2 requires independent support) | Unistrut P1000 SS or P3000 HDG, all-thread rod from cable-tray steel above, 4 ft on center | Eaton B-Line / Unistrut; Border States, Wesco, HD Supply | ~14 |

### §4.7 Pipe Supports, Hangers, and Seismic Bracing

Header mounted on Unistrut horizontal beams supported by the Redmond bay structure (by others). Hangers at standard ASME B31.9 spacing for 6″ SS pipe; seismic bracing per ASCE 7-16 with Deschutes §19.4.5 parameters (Sds = 2.273, Av = 0.45g, V = 0.9g) **pending Louisiana site-specific Sds confirmation** (SUP-01).

**§4.7.1 Support span calculation.** 6″ Sch 10S 304L weighs ~9.29 lb/ft empty; filled with PG25 at 64.3 lb/ft³, pipe + fluid ≈ 19.4 lb/ft. ASME B31.9 max hanger spacing for 6″ water service ≈ 17 ft. **Recommendation: hangers at 8 ft on center** — safety factor >2, aligned with the 8 ft pipe-section / drip-tray modularity.

| Tag | Component | Function | ADC Solutions spec | Reference / equivalent | Qty/Row |
|---|---|---|---|---|---|
| PS-01 | Pipe clamp, 6″, EPDM-lined | Vertical pipe support; isolates pipe from steel (vibration + galvanic) | 6″ heavy-duty 2-bolt clamp, HDG or SS304, EPDM rub liner, rod connection | Cooper B-Line B3373CT-6, Anvil Fig. 295, Erico Caddy | 14 |
| PS-02 | Threaded rod (12″+) and hex nuts | Hanger rod from overhead steel to pipe clamp | ASTM A193 B7 or A36 zinc-plated, length cut to suit; longer rods (24–36″) for raised-floor configurations | Local hardware: Border States, Stuart Steel, Wurth | 14 |
| PS-03 | Beam clamp or unistrut tee | Attach hanger rod to overhead steel (post tops or cable-tray bridge) | Cooper B-Line B3033/B3034 or Unistrut P2785, SS or galvanized to match | B-Line / Unistrut catalog | 14 |
| PS-04 | Seismic transverse brace, V-pattern | Resist lateral seismic force per ASCE 7-16 | Unistrut P1000 with cross-bracing every 40 ft (transverse) and 80 ft (longitudinal); seismic-rated swivel brackets at each connection. **Design-build by qualified Louisiana PE.** | Tolco Fig. 1000 series, ISAT, or shop-fab to PE-stamped detail | 2 transverse + 1 longitudinal per 46 ft row |
| PS-05 | Cushioned U-bolt at offsets | Restrain pipe at changes of direction (elbows, tees) | 6″ U-bolt, SS304, EPDM cushioned | Cooper B-Line, Anvil Fig. 137 | 8 |

NOTE: seismic bracing layout must be designed and stamped by a Louisiana-licensed PE — quantities above are budget/pre-order starting points. The Louisiana State Uniform Construction Code adopts the IBC; St. Gabriel / Iberville Parish are Seismic Design Category B — verify actual site Sds; Sds = 2.273 from Deschutes is a conservative West-Coast assumption. *(V1.1: LA-PE SOW issued 2026-06-10 — ops/rfq/2026-06-10-SOW-louisiana-pe-structural.md D2 — awaiting firm selection.)*

## §5 Hydraulic Validation

### §5.1 Total System ΔP Estimate (Reference Bay)

Conservative budget for the 46 ft end-fed Reference Bay at design flow (500 GPM main, 31.25 GPM avg/branch), PG25 at 30 °C, Darcy-Weisbach with ε = 0.0007 for new stainless plus standard K-factors:

| Element | Size | Flow | Length / equivalent | ΔP (psi) |
|---|---|---|---|---|
| Side-kit hose ×2 (supply + return) | 6″ | 500 GPM | 2 × 3 ft + 2 × 90° bends | 0.4 |
| Side-kit isolation valves ×2 | 6″ butterfly | 500 GPM | K = 0.86 each | 0.5 |
| Header pipe, longest path (one way) | 6″ | 500→31.25 GPM (tapering) | 46 ft equivalent (avg 270 GPM) | 0.25 |
| Branch tee ×1 (worst case) | 6″ × 2″ | 31.25 GPM | K = 1.0 (branch) | 0.2 |
| Branch isolation ball valve ×1 | 2″ | 31.25 GPM | K = 0.05 full-open | ≤0.05 |
| Flow control device (PICV/setter) ×1 | 2″ | 31.25 GPM | typical 5 psi authority | 5.0 |
| Branch line ×1 | 2″ | 31.25 GPM | 10.5 ft + 2 × 90° elbows | 0.4 |
| Quick disconnect ×1 | 2″, Cv ≥100 (≥140 pref.) | 31.25 GPM | ΔP = (Q/Cv)² | ≤0.1 |
| **Subtotal supply side (CDU → rack inlet)** | | | | **6.9** |
| Return-side mirror (without flow-control duplication) | | | | 2.2 |
| **TOTAL TCS ΔP (CDU outlet → rack → CDU inlet)** | | | | **≈9.1 psi** |

Available secondary dP at the CDU outlet is 80–90 psi (Deschutes §5). The recalculated TCS budget is ≈9.4 psi including ~5 psi authority for the PICV/flow setter. The 6″ header / 2″ branch sizing remains appropriate at the 2 MW / 500 GPM design point. Final flow-control selection and actuator strategy shall not be released until the actual CDU pump curve and rack pressure-drop curve are confirmed.

### §5.2 Velocity Check Summary

| Element | Velocity at design flow | Limit / guidance | Status |
|---|---|---|---|
| 6″ TCS Header | 5.05 ft/s at 500 GPM | ≤6 ft/s long-run header guidance | PASS |
| 2″/DN50 branch at tee | 2.74 ft/s avg at 31.25 GPM; 6.0 ft/s cap at 68.3 GPM | Released branch max 6 fps / 1.8 m/s = 170 kW at ITE ΔT 10 °C; 2 m/s and 7 fps comparison only | PASS |
| 2″/DN50 branch line/drop | 2.74 ft/s avg; 6.0 ft/s cap | Released cap 6 fps / 1.8 m/s; vendor effective bore and QD Cv verified by FLOW-01 | PASS |
| 6″ side-kit hose | 5.31 ft/s at 500 GPM | ≤10 ft/s flexible hose guidance | PASS |

### §5.3 Transient & Surge Analysis (HYDR-01)

Per OCP Modular TCS Appendix A, TCS networks with 6″ headers and DN50 branches at the 6 fps cap are subject to hydraulic transients (water hammer) from: rapid actuation of branch isolation valves (HS-06/HR-06); automated leak-detection-triggered isolation of SK-03/SK-04; emergency CDU pump trips; rapid modulation of automated flow-control valves.

Joukowsky first-order estimate: ΔP = ρ·a·ΔV, with ρ = fluid density, a ≈ 1,200 m/s wave speed in PG25/SS Sch 10S pipe. For instantaneous full closure of a 2″/DN50 branch valve at the released cap (68.3 GPM, 1.83 m/s): **ΔP = 1,026 × 1,200 × 1.83 = 2.25 MPa ≈ 326 psi** — above the 150 psi WP and too close to the 450 psi burst margin. Mandatory mitigations:

- **Slow-close actuators** on automated isolation valves (SK-03/04 and any automated HS-06/HR-06): closure ≥30 s for 6″ butterflies, ≥5 s for 2″ ball valves; final values from the HYDR-01 transient model.
- **Hydropneumatic accumulators** (HS-12/HR-12): minimum one near each far-end blank cap (worst reflection node); additional near any automated isolation valve; sizing/pre-charge/placement by HYDR-01.
- **Operational sequencing:** MOPs prohibit rapid simultaneous valve actuation across adjacent branches; staged sequencing required.
- **Flexible sections retained:** flex hoses (SK-01/02, BL-01) and Victaulic grooved couplings provide residual shock-energy absorption.
- **Pre-commissioning surge analysis is a contractually required commissioning deliverable** — performed before the system is wetted; defines safe closure rates, identifies vulnerable nodes, validates connection integrity under dynamic loading.

NOTE: HYDR-01 remains a mandatory Version 1 engineering gate (estimated 2–3 weeks with a qualified hydraulic modeling firm) before SK-03/04 actuator type, HS-12/HR-12 accumulator sizing, and final closure-rate specs can be released to purchasing. *(V1.1: SOW issued 2026-06-10 — ops/rfq/2026-06-10-SOW-hydraulic-surge-analysis.md — awaiting firm selection.)*

## §6 Local Louisiana Sourcing Strategy

Preferred posture: source from Louisiana and Gulf Coast distributors wherever specifications allow — minimizing lead time and leveraging the Lafayette industrial base. OCP-named first source retained as fallback.

| Category | Primary local supplier (LA / Gulf Coast) | Backup local | OCP first source / reference |
|---|---|---|---|
| 304L SS pipe (Sch 10S) | Continental Steel (Houston); Stuart Steel Supply (Baton Rouge) | Triple-S Steel (Houston) | Bull Moose Tube, Allied Tube |
| Victaulic grooved couplings, tees, caps | Wallace Industrial Supplies (Lafayette); Acme Refrigeration (Lafayette) | MORSCO/Reece (BR, NOLA) | Victaulic Corp (Easton, PA) |
| Butterfly + ball isolation valves (SS) | Setpoint Integrated Solutions (Houma); Cajun Industries (BR) MRO arm | Industrial Specialty Services (Houston) | Bray, Apollo, Jamesbury, Conbraco |
| Flow setters & PICVs | Setpoint (Houma); Cross Company (multiple LA) | MORSCO/Reece | Griswold, Caleffi, Belimo, Danfoss |
| Hydropneumatic accumulators | Setpoint (Houma); Cross Company Industrial Hydraulics (Lafayette) | — | Wilkens, Flo-Tek, Cla-Val |
| EPDM-lined flexible hose assemblies | Singer Industrial (Lafayette); Industrial Hose Inc. (Harahan) | Texas Hose Pro (Houston); Womack (Houma) | Continental ContiTech, Parker Parflex, Goodyear |
| Quick disconnects (2″, dry-break) | Motion Industries (Lafayette/BR/NOLA — Parker channel) | Womack Machine Supply (Houma — CEJN channel) | Stäubli Corp (Duncan, SC); CEJN Industrial |
| Pressure/temperature instruments | Setpoint (Houma); Industrial Controls Distributors (Lafayette) | Cross Company (E+H channel) | Rosemount, WIKA, E+H |
| Leak detection (rope + controller) | RLE Technologies direct; ECC International (Houston rep) | TraceTek via TE Connectivity rep | TraceTek (TE), RLE SeaHawk |
| Coalescing air separator (deferred, AIR-01) | Setpoint (Houma) | Cross Company | Spirotherm Spirovent, Wessels, Taco |
| Sheet-metal drip tray fabrication | Cajun Industries fab shop (BR); Bayou Steel (LaPlace) | Acme Refrigeration sheet-metal (Lafayette) | Custom — no OCP-named vendor |
| Unistrut, B-Line, hangers, beam clamps | Border States (Lafayette); Wesco/Anixter | HD Supply (BR, NOLA); Industrial Hardware (Lafayette) | Eaton B-Line, Unistrut, Cooper |
| Transient/surge modeling (HYDR-01 service) | BCI Engineers (Lakeland, FL); Aquanex (Houston) | Local consultant via LSU College of Engineering | Bentley HAMMER, KYpipe, Innovyze InfoSurge |

## §7 RFQ Package and Action Items

### §7.1 Quote Request Bundles

| Bundle | Contents (tag refs) | Target supplier type | Target quote turnaround |
|---|---|---|---|
| B1 — SS Pipe & Victaulic | HS-01..05, HR-01..05, SK-10 | Industrial pipe/fittings distributor | 5 business days |
| B2 — Hose Assemblies | SK-01, SK-02, BL-01 (incl. ends BL-02/03; QD coupler halves furnished under B4) | Hose fabricator with hydrotest & helium cert capability | 7 business days |
| B3 — Valves & Air Vents | SK-03, SK-04, SK-05, SK-08, SK-09, HS-06..09, HR-06..08 | Industrial valve distributor, SS sanitary background | 5 business days |
| B3a — Slow-Close Actuators (HYDR-01) | Actuator portion of SK-03/04 if automated | Valve OEM with slow-close catalog (Bray, Rotork, Auma) | 7 business days; depends on HYDR-01 |
| B3b — Hydropneumatic Accumulators (HYDR-01) | HS-12, HR-12 | Industrial hydraulics distributor; sizing per HYDR-01 model | 10 business days; quote held pending HYDR-01 |
| B3c — Flow Control Devices (FLOW-01) | HS-06b OR HR-06b — 16 total only; placement per FLOW-01. Do not quote both sides as 32. | Hydronic balancing distributor (Setpoint, Cross) | 7 business days |
| B4 — Quick Disconnects | QD-01, QD-02 (32 full sets; coupler halves to B2, body halves rack-side) | OEM direct (Stäubli, CEJN) or Parker distributor | 10 business days (typical 6–8 week OEM lead) |
| B5 — Instrumentation | SK-06, SK-07, HS-10/11, HR-10/11 | Process-instrument distributor | 5 business days |
| B6 — Leak Detection | DT-03, DT-04 (and BOS wiring) | OEM direct or local rep | 10 business days |
| B7 — Drip Tray Fabrication | DT-01, DT-02 (shop drawing required) | Local sheet-metal fabricator | 10 business days |
| B8 — Supports & Bracing | DT-05, PS-01..05, BL-04 | Construction supply / Unistrut distributor + seismic PE for PS-04 | 7 business days; PS-04 needs 2–3 weeks PE design |
| B9 — HYDR-01 Modeling Service | Transient/surge analysis | Specialty hydraulic engineering firm | 2–3 weeks (analysis duration) |

### §7.2 Information to Request With Each Quote

Manufacturer, model, country of origin per line; lead time to Lafayette, LA ("in stock" or "weeks ARO"); unit + extended price, freight terms, taxes; material certifications (MTR for pressure-containing, PG25 compatibility for elastomers, ASME UV for PSVs, UL for electrical); hose assemblies — per-assembly hydrotest cert at 1.5× WP (225 psi / 10 min) and helium cert per Deschutes §23.7 (≤1×10⁻⁵ atm·cc/sec), barcode label per §2.5.3; factory cleanliness deliverables per §2.5 (passivation log, copper-sulfate result, N2 purge + sealed delivery confirmation, cap photos); installer-traceability commitment (QAQC-01); spares/consumables price list; warranty (target ≥12 months in-service / 18 months from shipment); drawings and 3D models (STEP/IGES/native) for shop-drawn items.

### §7.3 Pre-Quote Engineering Confirmations

Confirm internally before issuing RFQs: CDU outlet termination type and centerline coordinates (SK-10 selection) *(V1.1: see ADC-ICD-001 §3 / V8 verification)*; relief setpoint/alarm schedule per RELIEF-01 (SK-05/HS-09 settings) *(V1.1: cascade per ADC-ICD-001 §5)*; final row length and rack count (HS-01/HR-01 footage); center-fed vs end-fed (LAYOUT-01); site Sds from the structural engineer (PS-04); actual overhead steel elevation (PS-02 rod and DT-05 hanger lengths); HYDR-01 kickoff (gates B3a/B3b); FLOW-01 device selection (gates B3c); CDU flushing-rig approval (CDU-01).

## §8 Open Items

Owner is Scott Tomsu unless re-assigned. *(V1.1: these items are mirrored in the ADC-SYS-001 registry `open-items.json`, which carries current status.)*

| ID | Open item | Impact if unresolved | Recommended resolution path |
|---|---|---|---|
| LAYOUT-01 | End-fed vs center-fed CDU placement | Affects pipe quantity, hose lengths, side-kit configuration | Hydraulic modeling both cases; decision matrix on operability vs cost. Recommend center-fed for any row ≥60 ft. |
| PIPE-01 | 6″ Sch 10S vs Sch 40S | Sch 40S adds substantial weight/cost; Sch 10S adequate for 150 psig WP when HYDR-01 validates transients | Sch 10S recommended for Version 1; confirm against insurer/AHJ. Sch 40S only if higher-pressure future-proofing explicitly required. |
| PIPE-02 | Victaulic vs tri-clamp vs flanged vs T-Drill branches | Speed/service/contamination trade | Victaulic for main header joints; T-Drill cold-formed branches acceptable alternate for HS-03/HR-03; tri-clamp at side-kit-to-CDU transition only if CDU has tri-clamp outlets. Deschutes §3.3.4 endorses all. |
| HOSE-01 | EPDM-lined vs PTFE-lined branch line | PTFE more robust and higher-temp (150 °C); EPDM half the cost, well within 55 °C service | EPDM adequate per Deschutes §23.7 / DowFrost LC25. Reserve PTFE for future hi-temp variant. |
| QD-01 | Stäubli RBE2 vs Parker FF vs CEJN X65 | Functionally equivalent; stocking/lead/price differ | RFQ all three (B4); lowest landed cost + best stock position. Stäubli is OCP first source. |
| INST-01 | Add Coriolis flowmeter to header? | CDU internal meter makes header meter redundant but informative | Defer to commissioning; temp clamp-on ultrasonic at startup; permanent only if persistent imbalance. |
| TRACE-01 | ADC Manufacturer ID per OCP §17 | Hoses not traceable per OCP barcode requirement | Assign 3-character ADC Manufacturer ID, register internally, communicate to hose fabricator (hot-stamp or laser-etch). |
| SUP-01 | Final seismic bracing per LA-PE | Without stamped detail, install cannot pass AHJ inspection | Engage LA-licensed structural PE for PS-04 detail; provide actual site Sds. *(V1.1: SOW issued 2026-06-10, ops/rfq/ — D2.)* |
| DT-01-OI | Drip tray local fab vs catalog | Catalog options length-limited | Custom fab preferred for 46 ft modular run; release DWG-DT-001 with B7 RFQ. |
| MAT-01 | Dual-coolant elastomer qualification | Per Deschutes §23.1, suppliers must qualify for BOTH Veolia SV5520 and PG25 | Confirm with each elastomer-bearing supplier; reject PG25-only or SV5520-only substitutions. |
| HYDR-01 | Hydraulic transient/surge analysis | Closure rates, accumulator sizing, MOPs undefined; spikes can exceed 150 psi WP | Engage hydraulic modeling firm (BCI, Aquanex, or equivalent); deliverables: peak pressure map, closure rates, accumulator sizing/placement, MOP sequencing. Required before B3a/B3b. 2–3 weeks. *(V1.1: SOW issued 2026-06-10, ops/rfq/.)* |
| FLOW-01 | Per-rack flow control selection | Under-flow risks cold-plate damage; over-flow risks channel erosion; CDU pressure control alone cannot guarantee per-rack flow | Flow setter vs PICV vs PICV+Smart; start field-selectable/replaceable. Set 31.25 GPM/rack at reference basis; ~50 GPM/rack for 125 kW at ΔT 10 °C if CDU capacity increased; cap 68.3 GPM/rack. Body/Cv shall not restrict the DN50 cap. |
| AIR-01 | Campus-scale coalescing air separator (deferred) | Single-row: automatic vents likely sufficient; multi-CDU campuses ≥100 MW per OCP App. C.3 recommend dedicated separator | Deferred to multi-CDU site design. When triggered: Spirovent-class near CDU pump discharge; PG25-verified bladder/diaphragm; full-flow; SS 304/316 wetted. |
| QAQC-01 | Installer traceability | Improper installation is the leading connection-failure cause (OCP App. A); without traceability, MTBF analysis is meaningless | Installer-stamp / inspector-sign per coupling, flange, weld, QD, hose. Build into B1–B8 deliverables; closeout includes complete log. |
| CDU-01 | CDU manufacturer approval for use-as-flushing-rig | Some OEMs prohibit; without approval, temporary rig adds cost/schedule | Written OEM authorization. If approved: inlet protection (50 µm bag → 25 µm cartridge) per §2.5.4. If not: budget temporary rig per OCP App. G. |
| RELIEF-01 | Relief setpoint and high-pressure alarm coordination | Uncoordinated setpoints overlap normal operating pressure or conflict with CDU relief — nuisance lift/chatter or unclear protection | Confirm CDU internal PSV, max normal, alarm/limit, and backup PSV setpoints with CDU OEM and AHJ before B3 purchase. Preliminary schedule: normal 115 / alarm 130 / field backup 145 psig, subject to code review. *(V1.1: cascade governed by ADC-ICD-001 §5.)* |

## Appendix A — Vendor Contact List

Confirm contact freshness at issue; starting point, not exhaustive.

| Vendor | Channel / specialty | LA contact | Bundles |
|---|---|---|---|
| Singer Industrial | Hose & gasket fabrication | Lafayette branch — singerindustrial.com locator | B2 |
| Wallace Industrial Supplies | Pipe, valves, fittings (Victaulic, Apollo, Bray) | Lafayette — wallaceind.com | B1, B3 |
| Acme Refrigeration | HVAC/mechanical supply, sheet-metal sub-fab | Lafayette — acmerefrigeration.com | B1, B7 |
| Setpoint Integrated Solutions | Instrumentation, control valves, MRO, flow control, accumulators | Houma branch | B3, B3b, B3c, B5 |
| Motion Industries | Parker channel (hoses, QDs, fittings) | Lafayette, BR, NOLA — motionindustries.com | B2, B4 |
| Womack Machine Supply | CEJN, hydraulic fittings, accumulators | Houma, Lake Charles — womack.com | B4, B3b |
| Cross Company | E+H instrumentation channel; flow control | Multiple LA — crossco.com | B3c, B5 |
| Border States | Electrical/construction supply, Unistrut, B-Line | Lafayette — borderstates.com | B6, B8 |
| Stuart Steel Supply | SS pipe, structural steel | Baton Rouge branch | B1 |
| Continental Steel | SS pipe (mill direct) | Houston HQ, ships into LA | B1 |
| BCI Engineers / Aquanex | Hydraulic transient/surge modeling | Lakeland FL / Houston TX — engaged remotely | B9 |
| G Squared Industrial Sales | Magnatex pump rep (CDU internals — NOT in this BoD scope) | Houston, TX | Out-of-scope reference |

## Appendix B — Reference-Bay Quantity Take-Off Summary

Single-sheet summary for one 46 ft Reference Bay (1 CDU position, 16 IT racks, 4 Bays, end-fed). Order-of-magnitude check before detailed RFQs.

| Tag | Component | Qty | Unit |
|---|---|---|---|
| SK-01 / SK-02 | 6″ EPDM flex hose, fabbed | 2 | ea |
| SK-03 / SK-04 | 6″ SS butterfly valve (slow-close actuator if automated, per HYDR-01) | 2 | ea |
| SK-05 | 1.5″ PSV, ASME UV, preliminary set 145 psig | 1 | ea |
| SK-06 | Pressure transmitter, 0–200 psig | 2 | ea |
| SK-07 | RTD + transmitter, Pt100 | 2 | ea |
| SK-08 | Auto air vent, SS | 1 | ea |
| SK-09 | Drain valve, SS | 2 | ea |
| SK-10 | 6″ Victaulic Style 77 coupling (CDU/header transitions) | 4 | ea |
| HS-01 / HR-01 | 6″ Sch 10S 304L SS pipe | 120 ft purchase (92 ft installed) | ft |
| HS-02 / HR-02 | 6″ Victaulic Style 77 coupling (4 stick-to-stick + 2 far-end cap/interface) | 6 | ea |
| HS-03 / HR-03 | 6″ × 2″ Victaulic / T-Drill branch tee | 32 | ea |
| HS-04 / HR-04 | 6″ × 4″ reducing coupling (center-fed option) | 0 end-fed / 4 center-fed | ea |
| HS-05 / HR-05 | 6″ Victaulic end cap | 2 | ea |
| HS-06 / HR-06 | 2″ SS ball valve at branch | 32 | ea |
| HS-06b / HR-06b | 2″ flow control device (16 total; supply OR return, not both), setpoint per FLOW-01 | 16 | ea |
| HS-07 / HR-07 | Auto air vent at high point | 2 | ea |
| HS-08 / HR-08 | 1″ drain valve at low point | 2 | ea |
| HS-09 | Redundant PSV, preliminary 145 psig (final per RELIEF-01) | 1 | ea |
| HS-10 / HR-10 | Pressure gauge, dial, glycerin-filled | 4 | ea |
| HS-11 / HR-11 | Test ports / pet cocks | 4 | ea |
| HS-12 / HR-12 | Hydropneumatic surge accumulator (per HYDR-01) | TBD | ea |
| BL-01 | 2″ EPDM branch line, 126″ fabbed assembly with QD coupler half (under QD-01) | 32 | ea |
| BL-04 | Hose catenary support | 32 | ea |
| QD-01 | 2″ dry-break QD full set (coupler half to BL-01 fabrication) | 32 | sets |
| QD-02 | QD dust caps | 32 | pairs |
| DT-01 | Drip tray section, 8 ft | 7 | ea |
| DT-02 | Drip tray drain assembly | 1 | ea |
| DT-03 | Leak rope, 8 ft section | 7 | ea |
| DT-04 | Leak controller, 3-zone | 1 | ea |
| DT-05 | Drip tray hanger set | 14 | sets |
| PS-01 | 6″ pipe clamp, EPDM-lined | 14 | ea |
| PS-02 | Threaded rod, 12″+ | 14 | ea |
| PS-03 | Beam clamp / unistrut tee | 14 | ea |
| PS-04 | Seismic transverse brace, V-pattern | 3 | sets (PE-stamped detail) |
| PS-05 | 6″ cushioned U-bolt at offsets | 8 | ea |

HS-12/HR-12 quantity intentionally TBD pending HYDR-01 transient analysis output.

## Appendix C — Thermal Ride-Through Calculation (Reference Bay)

Ride-through = time the TCS maintains IT equipment within safe temperature limits after power loss or active-cooling failure (CDU pump trip, chiller loss). Resiliency metric for UPS hold-up sizing and customer SLA conversations. Method per OCP Modular TCS Appendix H.

**C.1 Heat balance:** t = M·C·(T_critical − T_initial) / Q.

**C.2 Inputs:** header ID (6″ Sch 10S) 0.5298 ft (6.357″); installed header length (supply + return) 92 ft; header volume 20.3 ft³ = 152 gal = 574 L; branch volume (32 × 2″ × 10.5 ft) 7.3 ft³ = 55 gal = 208 L; side-kit hose volume (~6″ × 6 ft total) 1.2 ft³ = 9 gal = 33 L; **total TCS fluid 215 gal = 815 L**; PG25 density at 30 °C 1,030 kg/m³ → mass M ≈ 840 kg; cp ≈ 3,840 J/kg·K; T_initial 30 °C; T_critical 45 °C (conservative ITE protection limit, below 55 °C max); margin 15 K; Q = 2,000,000 W.

**C.3 Result:** t = 840 × 3,840 × 15 / 2,000,000 = **≈24 seconds** from TCS fluid mass alone at 2 MW. Excludes: CDU internal buffer tank (50–200 gal typical — with an assumed 100 gal, ride-through extends to ≈35 s); cold-plate / CDU / silicon thermal inertia (typically 5–15 s more — total system roughly **40–50 seconds** at 2 MW); structural mass and passive rejection (minor). This is the Version 1 design assumption for UPS hold-up and CDU pump redundancy conversations.

**C.4 Sensitivity:** scales linearly with temperature margin and inversely with load. At 1 MW partial load: ~48 s fluid-only, ~70 s with buffer. T_critical relaxed to 50 °C (+33%): ~32 s fluid-only. Supply at 25 °C instead of 30 °C: +33% — the case for running cooler than Deschutes minimum in resiliency-critical sites. NOTE: first-order, well-mixed assumption — real systems form hot spots faster than bulk ride-through suggests; treat 24 s as an upper bound for the header-only contribution, not a guarantee.

## Appendix D — Engineering Concept Diagrams

The four figures live in the Version 1 PDF ([ADC_Solutions_Modular_TCS_BOM_Version_1_WITH_DIAGRAMS.docx.pdf](ADC_Solutions_Modular_TCS_BOM_Version_1_WITH_DIAGRAMS.docx.pdf)), retained as the figure source. They are diagrammatic only — they do not change pipe sizes, quantities, or released hydraulic limits:

- **D-1 — TCS system boundary and flow path:** in-scope path from CDU secondary-side interface through 6″ supply/return headers, DN50 branch drops, rack QDs, drip tray/leak detection. Keeps scope discussions separated from CDU internals and rack internals.
- **D-2 — Header sizing vs branch capacity:** why the 6″ header is sized by CDU secondary design flow while the DN50 branch limit is a per-rack capacity check. Do not multiply branch maximum by rack count to resize the header.
- **D-3 — DN50 branch 7 fps / 2 m/s / 6 fps comparison at ITE ΔT:** the 10 °C / 18 °F heat-balance comparison; locks the released branch maximum at ≈170 kW at 6 fps / 1.8 m/s.
- **D-4 — HYDR-01 transient/surge mitigation concept:** water-hammer mechanism, far-end reflection, slow-close actuator requirement, accumulator placement.
