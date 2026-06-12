# ESS-RFQ-001 — Request for Quotation
## Package 1 — Containerized LFP Battery Energy Storage System
### 6 MW / 3 MWh — Outdoor Containerized — AC-Coupled Microgrid (grid-forming PCS by others)

| | |
|---|---|
| **Document** | ESS-RFQ-001 |
| **Revision** | 0.2 — **APPROVED by Scott Tomsu 2026-06-12** |
| **Date** | 2026-06-11 |
| **Issued by** | Scott Tomsu — scott@adc3k.com — (337) 780-1535 |
| **Governing engineering document** | [ESS-BOD-001 Rev 0.3](ESS-BOD-001_Rev0_3.md) — Energy Storage System Basis of Design |

> **Release status:** approved by Scott 2026-06-12. Coupling conflict resolved
> at Rev 0.2 (decision 0007 — AC-coupled per MGN-BOD-002). Releasable to
> bidders once **Attachment A is filled** from the selected site record —
> the only remaining release gate.

## Revision History

| Rev | Date | Author | Description |
|---|---|---|---|
| 0.1 | 2026-06-11 | Scott Tomsu | Initial issue for bid. Scope, technical requirements, compliance gates, submittal list, evaluation criteria, and bidder compliance matrix. DC-coupled framing (superseded). |
| 0.2 | 2026-06-11 | Mission Control (per Scott ruling, decision 0007) | Coupling re-stated AC per ESS-BOD-001 Rev 0.3: Package 2 = 4-quadrant grid-forming PCS at the 4.16 kV node bus; battery-side DC window still required from bidders for PCS selection. Technical/safety/gate content otherwise unchanged. |

---

## §1 Introduction and Project Overview

The Buyer is procuring a containerized lithium iron phosphate (LFP) Battery Energy Storage System for a grid-interactive microgrid serving a critical IT load. This Request for Quotation covers Package 1 as defined in ESS-BOD-001 Rev 0.3 (the "BOD"): the complete containerized BESS, including batteries, battery management system, container enclosures, integrated thermal management, integrated detection and explosion control within the listing boundary, and all engineering data required for permitting.

The BOD is the governing engineering document for this procurement. Requirement identifiers cited in this RFQ (G-#, D-#, SEP-1, EI-#, CE-#, PS-#, etc.) refer to the BOD. The Open Compute Project white paper "Requirements for Energy Storage Systems Used in Data Centers," Rev 1.0 (January 2026), is the governing industry reference adopted by the BOD.

### §1.1 Application Summary

| Parameter | Value |
|---|---|
| Critical IT load | 5.0 MW |
| Microgrid capacity | 10.0 MW on-site generation island, grid-interactive |
| BESS function | Power-oriented: load-step bridging, generator-start ride-through, controlled transfer. Not energy shifting. |
| BESS rating | 6.0 MW PCS-side / 3.0 MWh usable (30 min at rated power, nominal) |
| Worst-case coherent load step | 5.0 MW (full IT block); BESS rating = step × 1.20 |
| Electrical coupling | AC-coupled at the 4.16 kV microgrid bus via 4-quadrant grid-forming PCS (procured under separate Package 2, by others); Bidder shall state battery-side DC voltage window for PCS selection |
| Fault domains | Minimum two independent battery/PCS groups (BOD D-04) |
| Deployment | Outdoor containerized, dedicated yard; unoccupiable enclosures (BOD D-03) |
| Site | US Gulf Coast region. Site-specific data sheet (wind, seismic, flood, ambient design temperatures, geotechnical) issued as RFQ Attachment A upon execution of NDA. |

## §2 Scope of Supply

### §2.1 Included in Bidder Scope
- LFP battery containers, modules, racks, and cells, delivering 3.0 MWh usable at beginning of life under the duty cycle of §3.2, partitioned into ≥2 fault domains.
- Battery Management System with all monitoring, protection, and control hardware/firmware, including external communications interface per §3.5.
- Integrated thermal management (HVAC or liquid cooling). If liquid-cooled: coolant leak detection is mandatory in scope (BOD P-1).
- All detection and explosion-control equipment within the UL 9540 listing boundary: off-gas/VOC detection, hydrogen detection, smoke/heat detection, deflagration vent panels, and emergency ventilation as applicable to the listed design.
- Automatic electrical isolation implementing both BOD early-intervention approaches: EI-1 (cell temperature, majority of cells per module monitored, manufacturer abuse threshold at 100% SOC) and EI-2 (FM Approved off-gas detection).
- Container-mounted DC disconnect/isolation devices and battery-side protection coordinated with Package 2 PCS.
- Anchoring design and foundation loading data; lifting/rigging plan; delivery to site.
- Commissioning, site acceptance testing, and operator training.
- Complete engineering data package for AHJ permitting per §4.

### §2.2 Excluded from Bidder Scope (by Others)
- PCS conversion (Package 2, 4-quadrant grid-forming, AC-coupled); supercapacitors (Package 3); yard-level detection head-end, thermal imaging, and constantly-attended-location alarm integration (Package 4); yard-level emergency exhaust outside the listing boundary (Package 5).
- Foundations, civil works, MV interconnection, and the site EMS. Bidder provides interface data for each.

### §2.3 Options to be Priced Separately
1. Long-term service agreement (LTSA), 10- and 20-year terms, including capacity maintenance schedule.
2. Extended capacity warranty / augmentation plan to sustain 3.0 MWh usable for 20 years.
3. Installation-level UL 9540A test program (if not already complete) to support reduced inter-container spacing per BOD SEP-1 / E-3.
4. Spare parts package: modules, BMS boards, sensors, vent panels.

## §3 Technical Requirements

### §3.1 Chemistry and Architecture
- Cell chemistry: lithium iron phosphate (LFP) only (BOD D-02). State cell manufacturer, factory location, and form factor. Identify domestic (US) content percentage at cell, module, and system level for ITC domestic-content evaluation.
- Battery-side electrical interface (BOD §2, W-08): state battery-side DC voltage window, permissible ripple, and any constraints on external PCS selection (Package 2 is an AC-coupled 4-quadrant grid-forming PCS at the 4.16 kV bus).
- Minimum two fully independent fault domains (BOD D-04): independent BMS, isolation, and detection per domain. Bidder shall propose domain split (e.g., 2 × 3 MW / 1.5 MWh) with rationale; this informs Buyer decision E-1.

### §3.2 Duty Cycle and Performance
- Rated discharge: 6.0 MW for 30 minutes (3.0 MWh usable), beginning of life, at site design ambient.
- Step response: support a 0-to-6.0 MW discharge step; state response time from dispatch signal to rated power.
- Cycling: approximately 50–150 equivalent full cycles per year (bridging/transfer duty). State calendar and cycle degradation curves and end-of-life capacity at years 10, 15, 20.
- Recharge: capability up to 6.0 MW, externally rate-limited by site EMS per BOD CE-1/CE-2. State minimum and maximum recharge rates and any SOC-dependent limits.
- Round-trip efficiency at the DC terminals: state at 25°C and at site design ambient.
- Standby/auxiliary load: state HVAC and auxiliary consumption at site design conditions (feeds Buyer microgrid load model).

### §3.3 Environmental and Site
- Outdoor rating for US Gulf Coast service: high ambient temperature and humidity, wind-borne debris regions, and corrosive coastal atmosphere. State enclosure ratings (NEMA/IP), wind design basis, and corrosion protection system.
- Container mass and footprint with foundation loading diagram (BOD C-1 input); anchoring specification per manufacturer (BOD §4.3).
- Flood/elevation constraints to be confirmed against Attachment A; state minimum mounting elevation requirements.

### §3.4 Safety Systems (within listing boundary)
- Off-gas/VOC detection: FM Approved devices; identify make/model and approval listing (BOD EI-2).
- Hydrogen detection supporting emergency-ventilation activation at ≤10% LFL (BOD §6.3); identify make/model and listing (UL 2075 or equivalent).
- Deflagration venting per NFPA 68 and/or combustible concentration reduction per NFPA 69 (BOD F-2): state which approach(es) the listed design uses, with sizing basis and the UL 9540A gas-generation data supporting it.
- No clean agent suppression within the BESS envelope (BOD FP-1). No integrated water suppression expected for unoccupiable outdoor containers (BOD D-06); state the listed design's suppression approach if any.
- Thermal runaway non-propagation: state demonstrated behavior at cell, module, unit, and (if tested) installation level.

### §3.5 Controls and Telemetry Interface
- BMS external interface: Modbus TCP required; IEC 61850 capability shall be stated (supported / roadmap / not supported) as input to Buyer decision T-2.
- Point list: all safety-instrumented points (cell/module temperatures, off-gas, H₂, isolation status, fan status, door/intrusion) available to the site telemetry system, including a read-only subset suitable for first-responder display (BOD §6.6, NFPA 855 Annex G).
- All critical safety subsystems powered from an external emergency source provided by Buyer (BOD BP-1/BP-2); state auxiliary power requirements (voltage, load, redundancy) for 24–48 h event-mode operation.

## §4 Compliance and Certification Requirements (Gates)

The following are pass/fail bid requirements keyed to BOD §7. Bids that cannot satisfy G-2 at submission will be set aside unpriced (BOD PS-2).

| Gate | Requirement | Bid Evidence |
|---|---|---|
| G-1 | System listed to ANSI/CAN/UL 9540 by an NRTL | Listing certificate; permission to release test data and calculations to the AHJ |
| G-2 | Large-Scale Fire Test completed: UL 9540A 5th Ed. (2025) or CSA/ANSI C800:25 | Full LSFT report submitted with bid (NDA acceptable) |
| G-2a | Installation-level non-propagation result (if claimed) | Installation-level test report; absent this, Buyer assumes propagation between containers and sizes yard spacing accordingly (BOD SEP-1 / E-3) |
| G-3/G-4 | Data supporting Buyer Hazard Mitigation Analysis per NFPA 855 (2026) 4.4, including product FMEA scope and critical-safety-system survivability data | FMEA summary; failure-mode data; safety-system specifications |
| G-5 | NFPA 68/69 design data for the container envelope | Gas generation rates from 9540A; vent sizing and/or CCR design calculations |
| — | UN 38.3 transport test summaries for all cell/battery design types | Test summary documents (BOD §8.2) |
| — | Seismic/wind certification per site code | Certification statement; anchoring calculations on receipt of Attachment A |

## §5 Bid Submittal Requirements

Bidders shall submit the following, organized by the numbering below. Incomplete submittals may be rejected without clarification.

1. Completed Bidder Compliance Matrix (Appendix A of this RFQ) with Comply / Exception / Alternate for every line, and a narrative for each exception.
2. Technical proposal: system description, single-line diagram (battery side), container GA drawings, mass/footprint/foundation loading, thermal management description, BMS architecture, and fault-domain partitioning proposal with rationale (§3.1).
3. Compliance evidence package per §4 (G-1 through G-5, UN 38.3, seismic/wind).
4. Performance data: capacity/degradation curves, efficiency, step response, auxiliary loads, recharge limits (§3.2).
5. Safety systems data: detection make/model/listings, isolation logic description, vent/CCR design basis (§3.4).
6. Controls interface: protocol statement (Modbus TCP / IEC 61850), preliminary point list, first-responder read-only subset (§3.5).
7. Domestic content: cell/module/system manufacturing locations and US content percentages, with the certification basis the Bidder will support for ITC domestic-content adder documentation.
8. Commercial: firm pricing per §6, delivery schedule from PO to site delivery and to commercial operation, warranty terms, and the separately priced options of §2.3.
9. Reference list: ≥3 comparable US deployments (size, application, COD, contactable reference).
10. Exceptions to Buyer terms, if any, as a single consolidated list.

### §5.1 Schedule of This RFQ

| Milestone | Date |
|---|---|
| RFQ issue | [ISSUE DATE] |
| Intent to bid + NDA execution (Attachment A released) | Issue + 1 week |
| Bidder questions due | Issue + 2 weeks |
| Buyer responses to questions | Issue + 3 weeks |
| Bids due | Issue + 5 weeks |
| Clarifications / shortlist | Issue + 7 weeks |
| Award target | Issue + 9 weeks |

## §6 Pricing Structure and Evaluation

### §6.1 Pricing Breakdown (firm, USD)
- Base supply: containers, batteries, BMS, integrated safety systems, delivered DDP site.
- Commissioning, SAT, and training.
- Options per §2.3, each priced separately.
- Unit rates: per-module replacement, field service day rate, annual preventive maintenance.

### §6.2 Evaluation Criteria

| Criterion | Weight |
|---|---|
| Compliance with gates G-1 through G-5 (pass/fail screen) | Gate |
| Technical conformance to §3 and exception count/severity | 30% |
| Lifecycle cost: base price + 20-yr capacity maintenance + auxiliary energy | 30% |
| Schedule: delivery and COD commitment with liquidated-damages backing | 15% |
| Safety evidence quality: installation-level LSFT, FM Approved detection, non-propagation data | 15% |
| Domestic content and references | 10% |

Award, if any, will be to the responsive, responsible bidder representing best overall value. The Buyer reserves the right to reject any or all bids, to waive informalities, and to negotiate with one or more bidders.

## Appendix A — Bidder Compliance Matrix

Complete every row: C = Comply, E = Exception (attach narrative), A = Alternate proposed (attach description). Cite the bid section providing evidence.

| Ref | Requirement | C / E / A | Evidence § |
|---|---|---|---|
| §3.1-1 | LFP chemistry; cell maker, factory, form factor, US content declared | | |
| §3.1-2 | Battery-side DC window stated; compatible with AC-coupled grid-forming PCS (Package 2) | | |
| §3.1-3 | ≥2 independent fault domains; split proposal provided | | |
| §3.2-1 | 6.0 MW / 30 min / 3.0 MWh usable at BOL, site ambient | | |
| §3.2-2 | 0→6 MW step; response time stated | | |
| §3.2-3 | Degradation curves; EOL capacity at yr 10/15/20 | | |
| §3.2-4 | Recharge limits stated; external EMS rate-limit accepted (CE-1/CE-2) | | |
| §3.2-5 | RTE and auxiliary loads stated | | |
| §3.3-1 | Gulf Coast outdoor rating; NEMA/IP, wind, corrosion stated | | |
| §3.3-2 | Mass/footprint/foundation loading and anchoring spec provided | | |
| §3.4-1 | FM Approved off-gas detection (EI-2); make/model/listing | | |
| §3.4-2 | H₂ detection ≤10% LFL ventilation activation; make/model/listing | | |
| §3.4-3 | NFPA 68/69 approach stated with 9540A gas data basis | | |
| §3.4-4 | No clean agent in BESS envelope (FP-1); suppression approach stated | | |
| §3.4-5 | EI-1 cell-temperature isolation; abuse threshold at 100% SOC | | |
| §3.5-1 | Modbus TCP; IEC 61850 status stated | | |
| §3.5-2 | Safety point list incl. first-responder read-only subset | | |
| §3.5-3 | External emergency aux power accepted; 24–48 h loads stated (BP-1/2) | | |
| §4 G-1 | UL 9540 NRTL listing; AHJ data release | | |
| §4 G-2 | LSFT report (UL 9540A 5th Ed. or CSA C800:25) with bid | | |
| §4 G-2a | Installation-level non-propagation report (if claimed) | | |
| §4 G-3/4 | HMA support data: FMEA, safety-system survivability | | |
| §4 G-5 | NFPA 68/69 calculations for container envelope | | |
| §4 UN38.3 | Transport test summaries, all design types | | |
| §2.1 P-1 | Liquid-cooled? If yes, leak detection in scope | | |
| §2.3 | Options 1–4 priced separately | | |

---

*ESS-RFQ-001 Rev 0.2 — coupling re-cut AC per decision 0007; releasable once Attachment A is filled and Scott approves. Attachment A site data sheet: [ESS-RFQ-001_AttachmentA_SiteDataSheet.md](ESS-RFQ-001_AttachmentA_SiteDataSheet.md).*
