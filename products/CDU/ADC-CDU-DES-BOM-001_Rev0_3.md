# ADC-CDU-DES-BOM-001 — Project Deschutes CDU Procurement BOM / Bill of Design

**CONFIDENTIAL — ADC Solutions Internal & Authorized Vendors Only**

| Field | Value |
|---|---|
| Document | ADC-CDU-DES-BOM-001 |
| Title | Project Deschutes Coolant Distribution Unit (CDU) Procurement Bill of Materials / Bill of Design Package |
| Revision | **0.3** — **APPROVED by Scott Tomsu 2026-06-12** |
| Company | ADC Solutions |
| Prepared by | Scott Tomsu — Chief Engineer |
| Rev 0.3 prepared by | Mission Control per ERRATA-for-BOM-v0_3.md — approved as issued |
| Date | 2026-05-19 (Rev 0.3: 2026-06-11) |
| Scope | Deschutes-aligned CDU procurement BOM, including internal CDU subsystems and CDU-side interface allowances |
| Architecture control | No pump resize. No main Deschutes CDU architecture change. Pump size, HX topology, primary valve topology, and 2 MW / 500 GPM design basis are preserved. |
| Status | Procurement / RFQ-level BOM — **not** a released manufacturing BOM |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-05-19 | Initial issue (docx/PDF, "With Four Explanatory Diagrams"). Title page read v0.1 while the released filename said v0.2 — the version-identity discrepancy tracked as CDU-G10. |
| 0.2 | — | Never separately issued: the v0.2 filename and v0.1 title page were the same document. Skipped to keep the trail honest. |
| 0.3 | 2026-06-11 | Errata pack applied (ERRATA-for-BOM-v0_3.md E1–E5): version identity fixed with this revision-history table (E1/CDU-G10); Diablo 400 citation updated v0.5.2 → **v0.7.0 (2026-03-01)** with the bipolar/unipolar sidecar-output change noted (E2/SYS-OI-04); governing numeric values declared — 42.29 in depth / 6,900 lb wet / 15–30 psi facility ΔP (E3/SYS-OI-07); Redfish/AI Reference cited as internal ADC document Rev 1.3 (E4); PLC/RF/NET subsystem now references the **Telemetry** product and MGN-TEL-001 (E5). §7 gate statuses brought current: CDU-G7 (ICD) **closed** by ADC-ICD-001 Rev 0.1 approved 2026-06-11; CDU-G8 SOW issued. Converted to Markdown as the governing format (repo convention); the Rev 0.1/0.2 PDF is retained as history and holds the four explanatory diagrams. |

**Engineering lock statement.** This BOM intentionally preserves the Project Deschutes main CDU architecture: two sealless pumps in N+1 service, three two-pass heat exchangers in parallel, one primary-side control valve, 2 VFDs, 500 GPM IT/secondary flow, 500 GPM facility/primary flow, and 2 MW thermal capacity.

Prepared from reference documents: OCP Project Deschutes v1.0; ADC Modular TCS BoD/RFQ v1; **Deschutes Redfish/AI & Four-Tier Reference — internal ADC document, Rev 1.3 (2026-06-10), repo `products/Telemetry/`** *(Rev 0.3: was "v1.2 (May 2026)" — E4)*; OCP Open Data Center v0.5.0; **OCP Diablo 400 v0.7.0 (2026-03-01)** *(Rev 0.3: was v0.5.2 — E2)*.

## Contents

1. Design basis and architecture locks · 2. Scope boundaries · 3. BOM coding convention · 4. Detailed CDU BOM · 5. Four diagrams (in the Rev 0.1/0.2 PDF) · 6. Vendor deliverables and validation requirements · 7. Open items / release gates · 8. Source references

## §1 Design Basis and Architecture Locks

**Purpose.** This package converts the supplied Project Deschutes and ADC TCS guidance into a CDU procurement BOM. It is a procurement / RFQ-level BOM, not a released manufacturing BOM. Exact fastener counts, spool lengths, cabinet harness lengths, and bracket part numbers shall be reconciled to final supplier CAD and supplier submittals.

| Parameter | Value |
|---|---|
| Thermal capacity | 2,000 kW (2 MW) per CDU |
| Secondary / IT loop flow | 500 GPM design point |
| Facility / primary loop flow | 500 GPM at 0.25 GPM/kW |
| Secondary available pressure | 80–90 psi available at CDU secondary outlet |
| Facility pressure drop basis | **15–30 psi** |
| Operating pressure | 0–130 psig; pressure relief at 130 psi per Deschutes product requirements |
| Operating liquid temperature | 18–55 °C |
| Approach temperature target | 3 °C across the liquid-to-liquid heat exchanger at design load |
| Coolants | DI water and PG25; wetted materials shall be compatible with approved inhibited DI-water coolants and PG25 |
| Wetted material policy | Stainless steel, copper, EPDM; nickel-plated brass not allowed on the secondary side |
| CDU physical basis | Approx. 65.25 in W × 91.44 in H × **42.29 in D**; wet max **6,900 lb**; dry max 5,310 lb. Final rigging data to supplier submittal. |
| Power basis | 380–416 Vac, 3-phase, 50/60 Hz; dual-feed PDU; total CDU power approx. 74 kW |

*Rev 0.3 governing-values note (E3/SYS-OI-07):* the depth (42.29 in), wet weight (6,900 lb), and facility ΔP (15–30 psi) above **govern all ADC documents**. The internal Redfish/AI Reference §8.1 carries 40.29 in / 6,910 lb / 15–27 psi from earlier public Deschutes material — those readings are superseded; final resolution against the OCP drawing package remains open under SYS-OI-07.

Source basis: OCP Project Deschutes v1.0 §3.1, 3.2, 5.1–5.3, 6.1–6.7, 7.1–7.4; ADC Modular TCS BoD/RFQ §2.1–2.2.

**Non-negotiable procurement controls:** 1) Do not substitute or resize the pump without a formal deviation. 2) Do not change from the Deschutes three-HX parallel architecture. 3) Do not move TCS rack-loop safety authority out of the PLC. 4) Do not use nickel-plated brass on the secondary side. 5) Treat all quantities marked "allowance" as CAD-release items rather than architecture changes.

## §2 Scope Boundaries

| Boundary | Included in this CDU BOM | Excluded / handled by separate package |
|---|---|---|
| Inside CDU cabinet | Pumps, HXs, valve, filters, air separator, expansion, internal piping, sensors, PLC/HMI, VFDs, PDU, service hardware. Final production-level spool drawings, harness drawings, and work instructions are supplier CAD deliverables. | — |
| CDU-to-TCS connection | CDU-side connection allowance, secondary-side side-kit interface, instrumentation handoff, leak-zone inputs, TCS data gateway allowance. *Rev 0.3: this boundary is now formally controlled by **ADC-ICD-001** (CDU↔TCS Interface Control Document, approved 2026-06-11).* | Full 6 in TCS header, DN50 branch lines, rack QDs, rack manifolds, cold plates, and row drip trays remain in the modular TCS BoD/RFQ package. |
| Primary / facility side | CDU primary control valve, PCW manifold, primary filter, primary sensors, facility-side connection kit allowance. | Chiller plant, cooling towers/dry coolers, facility pumps, BMS controls, upstream PCW distribution. |
| Power / sidecar | CDU PDU, VFD power, GFCI, local disconnects, control power, grounding. | Diablo 400 sidecar / HVDC power rack BOM and IT-rack power distribution. *Rev 0.3 (E2): Diablo 400 v0.7.0 permits both bipolar (±400 V three-wire) and unipolar (800 V two-wire) sidecar output for 100 kW–1 MW racks — material to sidecar/microgrid interface planning, no change to CDU internals.* |
| Controls | PLC native Modbus/TCP, HMI, sensor I/O, optional Redfish gateway, telemetry mapping. | Enterprise DCIM, workload scheduler, external AI platform, production cybersecurity stack. *Rev 0.3 (E5): the supervisory layer is the **Telemetry** product (ADC-OS-001 / MGN-TEL-001).* |

Source basis: ADC Modular TCS BoD/RFQ §1.1–1.3; Redfish/AI Reference (internal, Rev 1.3) §4.5.

## §3 BOM Coding Convention

| Prefix | Subsystem | Notes |
|---|---|---|
| CDU | Cabinet, frame, manifolds, internal piping | Base CDU mechanical structure and common hardware |
| PMP | Pump train | SPECK TOEMA065200 pumps and service hardware; pump size locked |
| HX | Heat exchanger bank | Alfa Laval CB210-276AH ×3 in parallel; two-pass |
| PV | Primary-side valve and primary piping | Belimo B6500 primary control valve and supporting valves |
| FLT | Filtration / microfiltration | Main filters and 0.2 µm side-stream microfilter |
| AIR | Air removal / deaeration | Spirovent air separator and vents |
| EXP | Expansion / reservoir | Flow-through expansion tank and service kit |
| SEN | Instrumentation | Pressure, temperature, flow, coolant quality |
| LEAK | Leak detection | Three-zone leak rope and controller to PLC |
| PLC | Controls | PLC, HMI, I/O, firmware, Modbus/TCP |
| RF | Redfish / AI bridge | Optional gateway if Redfish is not directly implemented in the controller. *Rev 0.3 (E5): bridge architecture per MGN-TEL-001 / Telemetry product; decision tracked as CDU-G6.* |
| PWR | Electrical power distribution | PDU, disconnects, fuses, wiring, grounding |
| VFD | Variable frequency drives | ABB ACH580 per pump |
| SK | CDU-side TCS interface allowance | Interface only; row TCS header and branches stay in TCS BOM. *Rev 0.3: demarcation per ADC-ICD-001 §3 — TCS package supplies SK hardware; CDU carries connection allowance only.* |
| VAL | Validation / QA / documentation | Pressure, leak, thermal-hydraulic, manufacturing and FRU deliverables |

## §4 Detailed CDU BOM

### §4.1 Cabinet, Frame, Manifolds, and Internal Piping

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| CDU-01 | CDU base frame and enclosure | 1 set | Deschutes CDU form factor; front/rear service access; max packaged height 100 in | Include lifting/rolling provisions, removable service panels, access clearances, labels, safety guards. Final dimensions by supplier CAD. |
| CDU-02 | Secondary rack water supply/return manifolds | 1 set | Stainless/copper/EPDM wetted material policy; 0–130 psig operating; PG25 and DI-water compatible | Manifold names: rack water supply and rack water return. Include pressure/temperature taps. |
| CDU-03 | Primary PCW supply/return manifolds | 1 set | Facility water inlet/outlet manifold set compatible with DI water and approved inhibitors | Include Belimo primary valve integration and facility-side sensor taps. |
| CDU-04 | Internal stainless piping and fittings lot | 1 lot | 304/316/316L stainless; grooved, tri-clamp, welded, or brazed joints per supplier design; pressure-rated for Deschutes system | Polished/passivated stainless practices; verify weld heat-tint acceptance and cleanliness. |
| CDU-05 | Victaulic / tri-clamp coupling and gasket kit | 1 lot | EPDM gaskets; stainless or compatible metallic clamps; optimized mix of Victaulic and tri-clamp fittings | Serviceable joints where FRU removal is required; avoid unnecessary pressure drop. |
| CDU-06 | Internal drip / leak capture provisions | 1 set | Non-corroding containment under leak-prone components; tie into leak detection or inspection path | Coordinate with three-zone leak detection and cabinet service access. |
| CDU-07 | Barcode, nameplate, and safety label set | 1 lot | Component ID, flow direction, voltage, relief pressure, coolant, QR/barcode labels, service labels | Follow Deschutes barcode / component traceability intent and ADC procurement practice. |

### §4.2 Pump Train — Pump Size Locked

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| PMP-01 | Secondary-loop pump | 2 | **SPECK TOEMA065200; 500 GPM at 112 psi; 37 kW / 50 HP; sealless; N+1 operation** | **LOCKED ITEM.** Do not resize, remove, or substitute without formal engineering deviation. |
| PMP-02 | Pump mounting and slide/service hardware | 2 sets | Low-friction pads or service slides allowing pump movement and removal from front/side as Deschutes requires | Coordinate with pillar interference and service access drawings. |
| PMP-03 | Pump inlet/outlet isolation valves | 4 | Full-port, coolant-compatible valves at each pump inlet and outlet | Required to isolate redundant pump during maintenance. |
| PMP-04 | Pump check valves / backflow prevention | 2 | Check valves preventing reverse flow through inactive pump path | Final valve type and Cv per hydraulic model. |
| PMP-05 | Pump drain ports and bleed points | 4 min | Drain/vent hardware at pump inlet/outlet low/high points; stainless/EPDM wetted materials | Supports FRU replacement and commissioning. |
| PMP-06 | Pump power disconnect / connectorized power kit | 2 sets | Finger-safe, serviceable connectorized power or breakout box; interlocked where necessary | Coordinate with VFD, power panel, service procedures. |
| PMP-07 | Pump telemetry integration | 2 sets | Pump speed RPM/percent, pump power kW, fault status, over-temperature alarms | Expose to PLC/HMI and Modbus/Redfish mapping as applicable. |

Source basis: Project Deschutes §5.4, 6.1, 7.2, 7.3, 13.2, 20.13, 23.1.3.

### §4.3 Heat Exchanger Bank and Primary-Side Control

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| HX-01 | Liquid-to-liquid heat exchanger | 3 | **Alfa Laval CB210-276AH; two-pass; three heat exchangers in parallel** | Do not change HX count/topology without deviation. Parallel bank for lower pressure drop and thermal performance. |
| HX-02 | HX parallel manifold kit | 1 set | Primary and secondary distribution manifolds for equal flow across three HXs | Supplier to provide balance/flow distribution basis and dP model. |
| HX-03 | HX service isolation, drains, and vents | 1 set | Isolation and drain/vent provisions for HX bank service and commissioning | Exact quantities per CAD; avoid trapped air and dead legs. |
| PV-01 | Primary-side flow control valve | 1 | **Belimo B6500 with actuator; primary/facility side of CDU** | Controls PCW flow to maintain approach-temperature target. |
| PV-02 | Primary-loop isolation valves | 2 min | Facility supply/return isolation valves rated for operating pressure, temperature, coolant chemistry | Coordinate with facility water pipe kit and AHJ requirements. |
| PV-03 | Primary-loop check/backflow valves | Allowance | Check valves where appropriate to prevent reverse flow | Valve locations per final hydraulic schematic. |
| PV-04 | Primary valve command/feedback wiring | 1 set | ValvePositionPercent / ValvePositionControlPercent feedback to PLC/HMI | Required for controls, Redfish mapping, AI supervisory setpoint model. |

Source basis: Project Deschutes §5.3, 6.2, 6.3, 7.2.1; Redfish/AI Reference (internal, Rev 1.3) §4.4, 8.3.

### §4.4 Filtration, Air Management, Expansion, Fill/Purge, and Coolant Quality

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| FLT-01 | Primary main filter | 1 | Front-serviceable 25–44 µm filter assembly; DI/PG25 compatible | Primary/facility side filter. Include differential-pressure ports/sensor. |
| FLT-02 | Secondary main filter | 1 | Front-serviceable 25–44 µm filter assembly; DI/PG25 compatible | Secondary/IT side filter. Include differential-pressure ports/sensor. |
| FLT-03 | Side-stream microfiltration loop | 1 set | 0.2 µm side-stream/bypass filtration, approx. 3 GPM, front-serviceable | Include isolation valves, service drain, dP monitoring, replacement element allowance. |
| AIR-01 | Air separator | 1 | Spirovent air separator or equivalent; compatible with operating pressure/temp and coolant | Include high-point venting and commissioning purge support. |
| EXP-01 | Flow-through expansion tank | 1 | Front-serviceable; bladder/diaphragm materials compatible with PG25/DI water | Size to supplier hydraulic model; service isolation and pressure monitoring required. |
| EXP-02 | Expansion tank service kit | 1 set | Isolation, drain, pressure gauge/transducer, test fittings | Supports impedance, leak, pressure-cycle, and system functional validation. |
| FILL-01 | Fill and purge port set | 1 set | Fill/purge ports for both loops as required by commissioning procedure | Stainless wetted hardware; caps, chains, labeling. |
| PRV-01 | Pressure relief valve | 1 min | Pressure relief at 130 psi; UL-suitable or ASME/UV-stamped component as applicable | Final quantity and loop placement by safety review and AHJ; coordinate with CDU OEM (CDU-G4; coordinated schedule with the TCS backup PSV per ADC-ICD-001 §5 / RELIEF-01). |
| CQT-01 | Coolant pH/conductivity telemetry | 1 set | pH and electrical-conductivity sensors/analyzer; coolant-compatible wetted materials | Tie to PLC/HMI and telemetry namespace. |

Source basis: Project Deschutes §3.2, 5.2, 8.2, 20.5–20.10; ADC Modular TCS BoD/RFQ §2.2.

### §4.5 Instrumentation, Leak Detection, Controls, and Redfish/AI Interface

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| SEN-01 | Combined pressure and temperature sensors | 4 min | Sensors at rack water supply, rack water return, PCW supply, PCW return; calibrated to datasheet accuracy | Primary feedback for hydraulic and thermal controls. |
| FLOW-01 | Secondary / technical loop flow meter | 1 | ±0.5%-of-reading accuracy; compatible with DI water and PG25 | Front-serviceable; service may require CDU power-off per Deschutes service note. |
| SEN-02 | Filter differential pressure sensors | 2–3 | dP sensors across primary filter, secondary filter, microfilter loop if required | Detects fouling; supports Redfish/TCS coolant-quality view. |
| LEAK-01 | Leak detection sensing cable | 3 zones | Water-sensing rope/cable split into three zones, routed inside CDU and interface areas | Detected through PLC; coordinate with external TCS leak zones. |
| LEAK-02 | Leak detection controller / I/O module | 1 | Controller with dry-contact and/or Modbus/BACnet/PLC I/O outputs | PLC shall validate functionality with leak detection system. |
| PLC-01 | PLC and HMI | 1 | Industrial PLC with HMI; Modbus/TCP; IPv4/IPv6 dual-stack; pump, valve, flowmeter and P/T telemetry | Allen-Bradley CompactLogix 5380 or equivalent acceptable for POC; supplier may propose equivalent production PLC. |
| PLC-02 | Remote I/O and terminal blocks | 1 lot | Analog inputs, discrete I/O, network I/O, safety interlocks, service terminals | Include spare I/O for TCS rack-loop points and coolant-quality telemetry. |
| RF-01 | Redfish bridge / industrial gateway | 1 optional | Industrial PC or embedded service translating Modbus/TCS data to Redfish REST/JSON endpoints | Required if PLC/controller does not expose Redfish directly. **PLC remains safety authority.** *Rev 0.3 (E5): implement per MGN-TEL-001 (D3 domain) and the Telemetry product conformance contract; native-vs-bridge decision is CDU-G6.* |
| NET-01 | Controls Ethernet network kit | 1 set | Industrial Ethernet switch, patching, cybersecurity-ready segmentation provisions | Support Modbus/TCP, Redfish bridge, HMI, monitoring laptop/SCADA handoff. |
| SW-01 | Controls firmware and telemetry map | 1 package | PLC logic, HMI screens, Modbus register map, Redfish/OEM sensor map, backup image | Vendor must provide firmware update procedure and controls validation evidence. |

Source basis: Project Deschutes §6.5, 6.7, 7.2.1–7.2.3, 20.9–20.15, 21.1.4–21.1.6; Redfish/AI Reference (internal, Rev 1.3) §2.2, 3.1–3.2, 4.4–4.5.

### §4.6 Electrical Power, VFDs, Protection, and Grounding

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| PWR-01 | Dual-feed CDU PDU | 1 | Dual-feed 416 Vac-class PDU; 380–416 Vac nominal, 3-phase, 50/60 Hz; 1N minimum feed redundancy, 2N desired | Coordinate with site power scheme and UL/CE listing strategy. |
| VFD-01 | Pump VFD | 2 | **ABB ACH580-31-065A-4 with +B056 NEMA Type 12 option; one VFD per pump; 50 HP / 37.3 kW class** | Matched to locked pump size and Deschutes VFD basis. |
| PWR-02 | VFD fuse/disconnect kit | 2 sets | Initial 80 A fast-acting Class J/gG fuse selection; fuse blocks/disconnects rated to 100 A and SCCR 100 kA | 100 A max backup only if inadvertent tripping occurs, per Deschutes power summary. |
| PWR-03 | Ground-fault protection | 1 set | GFCI/GFPE 10–30 mA as applicable; 20 mA noted in Deschutes safety requirements | Coordinate with UL/CE listing and site power system. |
| PWR-04 | 24 Vdc control power supply and distribution | 1 set | Redundant or protected control power for PLC, sensors, leak controller, HMI, network hardware | Coordinate hold-up behavior and power-loss alarms. |
| PWR-05 | Internal harnesses, cable tray, gland plates | 1 lot | VW-1 cabling; CL2P for water-sense cable where required; IP66 connectors; IP55 pump/motor/drive ingress targets | Maintain power/controls separation. Include EMC/grounding details. |
| PWR-06 | Grounding and bonding kit | 1 lot | Ground continuity per safety standards; bonding jumpers for doors, panels, frames, pipe sections, electrical enclosures | Include test points and final ground-bond test report. |

Source basis: Project Deschutes §7.1–7.4, 8.1–8.2. **Diablo 400 (v0.7.0)** referenced only for data-center sidecar context, not as a CDU internal power architecture change *(Rev 0.3 / E2: v0.7.0 permits bipolar ±400 V and unipolar 800 V sidecar output — re-checked, still context-only for this BOM)*.

### §4.7 CDU-to-TCS Interface Allowances

*Rev 0.3: this section is subordinate to **ADC-ICD-001** (approved 2026-06-11), which controls the demarcation, pressure cascade, and verification at this boundary.*

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| SK-01 | Secondary-side side kit / CDU-to-TCS connection allowance | 1 set | Hoses/fittings/isolation valves/instrumentation between CDU secondary ports and TCS header takeoff | **Interface only.** Full TCS header and branch BOM remains separate; do not alter 6 in header or DN50 branch basis. Hardware supply is TCS-package scope (ADC-ICD-001 §3). |
| SK-02 | Secondary-side interface instrumentation | 1 set | Pressure/temperature ports and optional flow/ΔP points at CDU/TCS handoff | Supports commissioning, balancing, rack-loop telemetry. |
| SK-03 | TCS telemetry gateway allowance | 1 optional | Modbus/TCP, BACnet/IP, MQTT, SCADA, or Redfish/OEM sensor bridge for branch flow, branch ΔP, rack supply/return temperature, balancing valve position, leak zones, coolant quality | Use only if TCS sensors are not directly wired into CDU PLC or site SCADA. |
| SK-04 | Hotswap telemetry quick disconnects | 4 allowance | Parker NSP-251 with ORB6 fitting or equivalent for pressure-telemetry quick disconnects | Final count per pressure sensor/tubing arrangement. |
| SK-05 | TCS leak-zone handoff terminals | 1 set | Terminals or network points for CDU/TCS leak-zone alarms into PLC/BMS | Coordinate leak-response authority with site safety logic. |

Source basis: ADC Modular TCS BoD/RFQ §1.1–1.3, 2.1, 4.6, 5.1–5.3; Redfish/AI Reference (internal, Rev 1.3) §4.5; ADC-ICD-001.

### §4.8 Validation, Quality, Serviceability, and Documentation

| Tag | Item | Qty/CDU | Required spec / first source | Procurement notes / source basis |
|---|---|---|---|---|
| VAL-01 | Hydrostatic / pressure test package | 1 package | Full system pressure testing, component pressure hold/cycle, burst validation where required | Validate with DI water and PG25 as applicable. Include pressure logging. |
| VAL-02 | Helium leak / N2 pressure test package | 1 package | N2 high-pressure test, helium leak test, visual inspection, alignment checks | Coordinate with manufacturing qualification and outgoing QC. |
| VAL-03 | Thermal-hydraulic validation package | 1 package | Hydraulic curves at 25/40/60/80/100% pump speeds; primary valve opening matrix; thermal tests to 2 MW and beyond if available | Include one-pump and two-pump operation; validate with DI water and PG25. |
| VAL-04 | Pump and VFD reliability tests | 1 package | Pump temperature shutoff, motor lock, non-ideal power tests, long-term fluid temperature / PG25 / VFD conditions | Pump performance and energy depend on fluid type and temperature. |
| VAL-05 | PLC/HMI/Modbus functional validation | 1 package | Pump command/feedback, valve command/feedback, flowmeter feedback, P/T telemetry, firmware update, Modbus over IPv4/IPv6 | Demonstrate all functions via HMI and Modbus. |
| VAL-06 | FRU and maintenance procedure package | 1 package | Pump, filter, flowmeter, VFD, expansion tank, control panel service procedures and ergonomic review | Document service steps, interlocks, safe isolation, required tools. |
| VAL-07 | Seismic / shock / vibration / COG package | 1 package | COG analysis, FEA, thermal shock/low-temp exposure, non-operational and operational shock/sine, seismic considerations | **Use site-specific seismic criteria for Louisiana installation; Deschutes West-Coast Sds is conservative reference only** (CDU-G8 — LA-PE SOW issued 2026-06-10, D3). |
| DOC-01 | Supplier submittal package | 1 package | CAD, P&ID, electrical one-line, controls map, wiring diagrams, datasheets, material certs, cleaning/passivation records, FAI/CpK data, OQC data | Release gate for purchase order and factory acceptance. |
| PKG-01 | Packaging and shipping package | 1 package | Packaging height/rigging controls, nitrogen charge retention, shelf-life requirements, protection of clean wetted parts | Ship sealed and clean to minimize jobsite flush burden. |

Source basis: Project Deschutes §19–23; ADC Modular TCS BoD/RFQ §2.5.

## §5 Four Diagrams for the Most Difficult Concepts

The four explanatory diagrams live in the Rev 0.1/0.2 PDF ([ADC_Deschutes_CDU_BOM_v0_2_WITH_DIAGRAMS.docx.pdf](ADC_Deschutes_CDU_BOM_v0_2_WITH_DIAGRAMS.docx.pdf)), retained as the figure source:

- **Figure 1.** Dual-loop CDU architecture: primary/facility loop and secondary/IT loop remain separated by the three-HX bank.
- **Figure 2.** N+1 pump train: two locked-size SPECK TOEMA065200 pumps, one VFD per pump, with isolation and service breaks.
- **Figure 3.** Three-HX parallel bank and 3 °C approach control using the Belimo B6500 primary valve.
- **Figure 4.** PLC safety authority with optional Redfish bridge and TCS rack-loop telemetry integration.

## §6 Vendor Deliverables and Validation Requirements

| Deliverable | Minimum content | Release gate |
|---|---|---|
| P&ID and hydraulic schematic | Primary loop, secondary loop, HX bank, pump train, filters, air separator, expansion, relief, vents/drains, sensor IDs, service isolation | Required before component procurement release |
| Electrical one-line and panel drawings | Dual-feed PDU, VFD feeders, fuses/disconnects, GFCI/GFPE, control power, bonding, SCCR, ingress ratings | Required before electrical fabrication |
| Controls / telemetry register map | PLC I/O, HMI, Modbus/TCP register map, IPv4/IPv6 configuration, Redfish/OEM mapping if included | Required before FAT controls testing |
| Thermal-hydraulic model | Pump curve overlay, HX dP/approach, filter dP, facility valve authority, one-pump and two-pump cases, DI and PG25 cases | Required before factory validation plan approval |
| Material compatibility package | Wetted material list, elastomer certs, coolant compatibility, no nickel-plated brass on secondary, cleaning/passivation records | Required before first article approval |
| Factory acceptance test report | Hydraulic curve, thermal approach, pressure test, helium leak, pump/VFD functional, PLC/HMI, leak detection, flow meter accuracy, sensor calibration | Required before shipment |
| Service / FRU procedure package | Pump, filters, microfilter, flow meter, VFD, expansion tank, control panel service procedures with tools and safe-isolation steps | Required before site acceptance |
| As-built data package | As-built CAD, marked-up P&ID, serial numbers, barcode records, calibration certs, firmware versions, spare-parts list | Required for handover |

## §7 Open Items / Release Gates

*Rev 0.3: registry IDs (ADC-SYS-001) added; statuses current as of 2026-06-11. The registry `open-items.json` governs status.*

| ID (doc) | Registry | Open item | Owner / close condition | Status 2026-06-11 |
|---|---|---|---|---|
| ARCH-01 | CDU-G1 | Confirm every supplier substitution preserves pump model/size, HX count/topology, primary valve function | ADC + CDU supplier; close with deviation log showing no architecture changes | open |
| HYD-01 | CDU-G2 | Confirm final pump curve overlay with rack/TCS pressure-drop curve and CDU internal dP, DI and PG25 | CDU supplier; close with thermal-hydraulic model and factory curve | open |
| HX-01 | CDU-G3 | Confirm final HX manifold balance and approach margin at 2 MW / 500 GPM | CDU supplier; close with HX flow balance calculation and FAT data | open |
| RELIEF-01 | CDU-G4 | Confirm relief valve count/location/setpoint with AHJ and CDU OEM safety reviewer | CDU supplier + ADC/AHJ; close with stamped safety basis | open (coordinate with TCS RELIEF-01 per ADC-ICD-001 §5) |
| MAT-01 | CDU-G5 | Full wetted-material matrix; verify no nickel-plated brass on secondary side | All suppliers; close with material cert package | open |
| CTRL-01 | CDU-G6 | Redfish native in controller vs external bridge | ADC + controls supplier; close with network architecture and cybersecurity review | open |
| TCS-01 | CDU-G7 | Map CDU-side TCS interface points to the ADC TCS package without changing TCS pipe sizing | Close with interface control document | **CLOSED 2026-06-11 — ADC-ICD-001 Rev 0.1 approved** |
| SEIS-01 | CDU-G8 | Replace generic Deschutes seismic basis with site-specific Louisiana parameters and stamped support design | Structural PE; close with stamped analysis | SOW issued 2026-06-10 (ops/rfq/, D3) — awaiting firm selection |
| QA-01 | CDU-G9 | Finalize FAT/validation sample quantities and test fluids | ADC + CDU supplier; close with approved validation plan | open |
| — | CDU-G10 | Version identity (filename v0.2 vs title v0.1) | Close with revision-history table | **CLOSED at this Rev 0.3** (approved 2026-06-12) |

## §8 Source References

| Source document | Sections used | How it was used |
|---|---|---|
| OCP Project Deschutes: Data Center Facilities v1.0.0 (effective 2026-02-26) | §3.1–3.3, 5.1–5.3, 6.1–6.7, 7.1–7.4, 8.1–8.2, 19–23 | Primary CDU design basis, pump/HX/valve/VFD first-source items, product requirements, validation, safety, serviceability, controls |
| ADC Solutions Modular TCS BoD/RFQ v1 (2026-05-19) | §1.1–1.3, 2.1–2.5, 4.6, 5.1–5.3 | CDU-to-rack boundary, secondary-side TCS interface assumptions, material policy, factory cleanliness, pressure ratings, TCS hydraulic context |
| Deschutes Redfish/AI & Four-Tier Reference — **internal ADC document, Rev 1.3 (2026-06-10), repo `products/Telemetry/`** *(Rev 0.3 / E4: was cited as "v1.2, May 2026")* | §2.2, 3.1–3.2, 4.4–4.5, 8.1–8.3 | Telemetry mapping, Redfish bridge concept, TCS rack-loop sensor mapping, PLC safety boundary, AI supervisory control context |
| OCP Datacenter: Next-Generation ML Infrastructure Design Principles v0.5.0 (effective 2026-02-25) | §2, 3, 3.2 | Data-center context; relationship of Deschutes CDU and Diablo sidecar to next-gen ML deployments |
| **OCP Diablo 400 Project: Rack and Power v0.7.0 (2026-03-01)** *(Rev 0.3 / E2: was v0.5.2 of 2025-05-30)* | §6–13 | Sidecar / high-density rack power context only; not used to alter CDU internal power architecture. v0.7.0 adds bipolar ±400 V and unipolar 800 V sidecar output options for 100 kW–1 MW racks. |
| ADC-ICD-001 Rev 0.1 (approved 2026-06-11) *(added at Rev 0.3)* | all | Controls the CDU↔TCS boundary referenced throughout §2/§4.7 |

**Procurement note.** This package is ready for RFQ discussion and supplier response. It should be released as a controlled preliminary BOM. A production BOM requires supplier CAD, P&ID, detailed assembly drawings, exact hose lengths, exact fastener counts, safety review, and validation signoff.
