# ESS-BOD-001 — Basis of Design: Energy Storage System
## 5 MW Critical IT Load — 10 MW Grid-Interactive Microgrid

| | |
|---|---|
| **Document** | ESS-BOD-001 |
| **Revision** | 0.3 — **APPROVED by Scott Tomsu 2026-06-12** (closes SYS-OI-13) |
| **Date** | 2026-06-11 |
| **Prepared by** | Scott Tomsu |
| **Governing reference** | OCP White Paper — Requirements for Energy Storage Systems Used in Data Centers, Rev 1.0 (January 2026) — filed as [OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf](OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf) |

> **Governing copy note:** this Markdown is the governing repo copy (converted
> 2026-06-11 from the Rev 0.2 docx, retained alongside as history).
> **Coupling resolved (decision 0007, Scott 2026-06-11):** the BESS is
> **AC-coupled, grid-forming, on the 4.16 kV node bus** per MGN-BOD-002 §5.2/§5.3
> [L]. There is no 800 V DC distribution system for IT generally available yet;
> DC coupling is tracked as a watch item only (D-12).

## Revision History

| Rev | Date | Author | Description |
|---|---|---|---|
| 0.1 | 2026-06-11 | Scott Tomsu | Initial issue for review. Architecture classification, sizing basis, siting, protection, detection, compliance gates, and decision ledger established. |
| 0.2 | 2026-06-11 | Scott Tomsu | Added Appendix A: US Supplier and Procurement Matrix, keyed to procurement packages P-1 through P-5 and compliance gates G-1 through G-5. Open item ledger unchanged. |
| 0.3 | 2026-06-11 | Mission Control (per Scott ruling, decision 0007) | Coupling axis re-stated: **AC-coupled grid-forming at the 4.16 kV node bus** per MGN-BOD-002 §5.2/§5.3 [L], replacing the Rev 0.2 DC-coupled / 800 V-class classification (no 800 V DC system for IT is generally available). W-08, §2, §9, Package 2 scope and E-2 updated; new decision D-12. All safety, siting, detection, gate, and supplier content unchanged. |

Revision control: this document follows §-numbered section conventions. Open items carry discipline prefixes (E = electrical, F = fire/life safety, C = civil/structural, T = telemetry/controls, P = procurement). Decisions are recorded in the §10 Decision Ledger and are binding on downstream deliverables unless superseded by a later revision.

---

## §1 Purpose, Scope, and Design Point

### §1.1 Purpose
This Basis of Design (BOD) establishes the engineering, safety, siting, protection, and compliance requirements for the Energy Storage System (ESS) serving a 5 MW critical IT load within a 10 MW grid-interactive microgrid. The Open Compute Project white paper "Requirements for Energy Storage Systems Used in Data Centers," Revision 1.0 (January 2026), is the governing reference for this document. Where the white paper cites codes, standards, or insurer data sheets, those citations are adopted here as design requirements.

### §1.2 Design Point
The facility design point is defined as follows. Parameters are tagged for traceability into downstream electrical, fire-protection, and controls deliverables.

| Tag | Parameter | Value |
|---|---|---|
| W-01 | Critical IT load | 5.0 MW |
| W-02 | Microgrid total capacity | 10.0 MW (on-site generation island) |
| W-03 | Grid interaction | Grid-interactive (utility interconnection present) |
| W-04 | Worst-case coherent load step | 5.0 MW (full IT block) |
| W-05 | ESS power rating (PCS) | 6.0 MW (W-04 × 1.20 design margin) |
| W-06 | ESS energy rating | 3.0 MWh (30 min at rated power, nominal) |
| W-07 | Primary battery chemistry | Lithium iron phosphate (LFP) |
| W-08 | Electrical coupling / interface | AC-coupled at the 4.16 kV node bus via 4-quadrant grid-forming PCS (MGN-BOD-002 §5.2/§5.3 [L]; decision 0007). Battery-side strings are high-voltage DC within the vendor's listed system. |
| W-09 | BESS deployment model | Outdoor containerized, dedicated yard |

### §1.3 Scope
- Facility-level Battery Energy Storage System (BESS): architecture, sizing, chemistry, siting, separation, fire protection, explosion control, detection, ventilation, and emergency power for safety systems.
- Rack/row-level electrical storage (supercapacitors) for pulse buffering: technology constraints and hazard boundary.
- Compliance, testing, and listing gates required for procurement, permitting, and commissioning.
- Handling, storage, transport, repair, and end-of-life requirements for lithium-ion batteries on site.
- Out of scope: generation island design, IT load design, and utility interconnection studies, except where the ESS imposes requirements on them (charging energy, control coordination, separation distances).

### §1.4 Safety Principle
Per the governing reference, no battery or other ESS technology is inherently safe. NFPA 70E identifies an electric shock hazard above 50 volts; this system operates in the 400–1500 V class with energized DC distribution. All ESS shall be treated as energized equipment unless properly de-energized and tagged. Only trained personnel shall handle, service, or operate ESS, using appropriate PPE and safety supervision. The documented loss history cited in the governing reference (Seoul 2025 property/data loss; Surprise, AZ 2019 injuries; Moss Landing 2021/2025) informs the protection philosophy in §5 and §6.

---

## §2 Architecture Classification and Applicable Codes

Per Table 1 of the governing reference, the ESS architecture is classified explicitly on each axis. Each classification determines the applicable code set. NFPA 855 (2026) is the consensus bellwether standard for all ESS installations and applies across every axis; note its retroactivity provision (Ch. 1, ¶1.4.2) permitting the AHJ to apply any portion of the standard to an existing condition judged an unacceptable risk.

| Topology Axis | Classification | Rationale | Codes / Standards |
|---|---|---|---|
| Electrical coupling | AC-coupled (decision 0007) | ESS connects to the 4.16 kV node bus via a 4-quadrant grid-forming PCS; it forms the island bus and black-starts the node (MGN-BOD-002 §5.2/§5.3 [L]) | NFPA 70, 855; IEC 62933-1; IEC 62933-5-1 |
| System distribution | Distributed | Storage segmented across ≥2 defined fault domains; limits single-unit HMA consequence; preserves load-step duty at N-1 | NFPA 70, 855; IEC TS 62933-2-2 |
| Control architecture | Coordinated / hierarchical | Site EMS dispatches ESS against generator governor response | NFPA 70, 855; IEC 62933-2-1; IEC 61850 |
| Energy vs power orientation | Power-oriented | Load-step bridging and ride-through; short duration at high power | NFPA 70, 855; IEC 62933-1 |
| Hybrid architecture | Hybrid at rack tier only | EDLC supercapacitors (electrical) + LFP BESS (electrochemical); no hybrid supercapacitor devices | NFPA 70, 855; IEC TS 62933-2-2; IEC TR 62933-2-201 |
| Grid interaction | Grid-interactive | Microgrid with utility interconnection; utility/DSO rules apply | NFPA 70, 855; IEC 62933-5-3; IEC 61850; utility rules |

The control-architecture classification interacts with the site-wide protection-relay protocol decision (DNP3 vs IEC 61850). IEC 61850 appears in the governing reference as the standard for BESS automation interoperability (GOOSE, MMS); this is recorded as an input to that open decision in §10 (item T-2).

---

## §3 Tiered Storage Topology and Sizing Basis

### §3.1 Tier 1 — Rack/Row Electrical Storage (Supercapacitors)
Supercapacitor trays at the rack/row tier absorb GPU/TPU power excursions, consistent with the governing reference's deployment-model note on smoothing accelerator power spikes. Per Table 2 of the reference, EDLC supercapacitors offer extremely high cycle life (100k–1M+), very high power density, sub-second response, low fire hazard, and no thermal runaway mechanism.

**Design rule SC-1 (binding):** Standard EDLC devices only. Hybrid supercapacitors incorporating a lithium-ion cell are prohibited at the rack tier, because the governing reference states they retain the inherent thermal runaway risk of the embedded lithium-ion technology. Pure EDLC keeps Tier 1 outside the NFPA 855 electrochemical explosion-control envelope.

**Design rule SC-2:** Supercapacitor banks are monitored for balancing and health per Table 2 maintenance guidance; hazard review per NFPA 855 (2026) Annex B.6.1, IEC 62391, IEC 62933-5-1, and IEC TS 62933-2-2.

### §3.2 Tier 2 — Facility BESS (6 MW / 3 MWh LFP)

**Sizing Basis** — The BESS is a power-oriented asset. Sizing derives from the worst-case coherent load step:
- Worst-case coherent step: full 5.0 MW IT block (W-04).
- Design margin: 1.20 applied to the step → PCS rating 6.0 MW (W-05).
- Duration: 30 minutes at rated power, nominal → 3.0 MWh (W-06). Duration covers generator start/synchronization, step bridging, and controlled load transfer; it is not an energy-shifting allocation.

**Chemistry Selection (per Table 2 of the governing reference)**

| Criterion | LFP (selected) | NMC 811 | VRLA | NiZn |
|---|---|---|---|---|
| Thermal/safety risk | Medium | Medium–high | Low | Not susceptible to thermal runaway |
| Cycle life | High (thousands to 5k+) | Medium–high | Low (hundreds) | — (slow positive-electrode depletion) |
| Lifespan | Long (10–20 yrs) | Medium–long (8–15 yrs) | Short (3–6 yrs) | Long-life alkaline chemistry |
| High-voltage string practicality (battery side) | High | High | High | High |
| Disposition | **Selected** | Rejected on safety margin | Rejected on life/cycle | Tracked as alternative; ecosystem immature at 6 MW class |

LFP is selected on the combination of medium thermal/safety risk (versus medium–high for NMC 811), high cycle life, long lifespan, and high voltage-rating practicality for high-voltage battery strings. NiZn is recorded as the no-thermal-runaway alternative and shall be re-evaluated at the next major revision if vendor offerings mature at this power class. Hazard references: NFPA 855 (2026) Annex B.5.3 and Annex G; IEC 62619; IEC 63056; IEC 62933-5-2; functional safety per IEC TS 62933-2-2.

### §3.3 Tier 3 — Generation Island
The on-site generation island (10 MW) remains the energy source for the microgrid. The BESS bridges steps and transients only. Generator controls and the ESS are coordinated through the hierarchical EMS (§2).

### §3.4 Charging Energy (Binding EMS Constraint)
Per the governing reference, all ESS deployments must plan for charging energy; unmanaged charging load is additive and may exceed equipment or interconnection limits. The following is a hard constraint in the EMS functional specification, not an operational note:

**Constraint CE-1:** IT load + house load + BESS recharge ≤ generation dispatch ceiling at all times. The EMS shall rate-limit BESS recharge (up to 6 MW capability) such that the node never exceeds the 10 MW island rating or the utility interconnection limit, whichever governs in the active operating mode.

**Constraint CE-2:** Recharge at full rate is permitted only when measured headroom exists; recharge sheds first on any approach to the dispatch ceiling.

---

## §4 Siting, Separation, and Civil/Structural Requirements

### §4.1 Location Selection (FM Global DS 5-33 Hierarchy)
FM Global Data Sheet 5-33 establishes an ordered preference hierarchy for lithium-ion ESS locations. This design adopts preference #1: enclosures outside and away from critical buildings or equipment (DS 5-33 §2.3.2). Consequences of this selection:
- No interior battery rooms, no interior cutoff rooms, and no 2-hour-rated battery enclosures within the facility envelope.
- Outdoor containerized BESS in a dedicated yard, separated from the generation island, switchgear, fuel systems, and the facility building per FMDS 1-20 at hazard classification HC-3.
- Containers are treated as unoccupiable structures (DS 5-33; §13 of the governing reference).

### §4.2 Inter-Container Separation
**Design rule SEP-1 (binding):** Assume thermal runaway propagates between containers unless the selected vendor provides an installation-level fire test demonstrating that propagation does not occur. This is the default position of the governing reference where a test report is unavailable or the test resulted in fire beyond the unit of origin. Yard area is sized to the conservative assumption until a UL 9540A (5th Ed.) installation-level result or CSA/ANSI C800:25 LSFT result is in hand (open item E-3).

If any indoor electrochemical storage is ever introduced (not planned): dedicated room, 2-hour fire rating minimum (DS 5-33 §2.3.4.3); 6 ft (1.8 m) separation from accessible rack faces to non-combustibles and adjacent rack faces; 9 ft (2.7 m) to combustibles (DS 5-33 §2.3.5); pre-action dry sprinkler at HC-3, 12 mm/min over 330 m².

### §4.3 Civil and Structural
- Container mass: up to approximately 80,000 lb (36,000 kg) each. Individual foundations per container; geotechnical evaluation required. In soft-soil conditions, assume driven or auger-cast piles until geotechnical investigation demonstrates a pad-on-grade solution (open item C-1).
- Anchoring per BESS manufacturer specification; seismic/wind anchorage per local code and manufacturer certification.
- Transport routes, installation clearances, and crane/SPMT access designed into the yard layout.
- Blast protection walls or barriers carried as an AHJ contingency line item where exposures (roads, buildings, adjacent equipment) warrant (§9 of the governing reference).
- Egress for yard personnel and access for first responders designed to local code in consultation with the fire service.
- Structural exposure review in the HMA: lithium-ion BESS fires can exceed 2200°F (1200°C), sufficient to weaken steel structures to failure (Moss Landing 2025). No load-bearing steel within the assumed fire envelope of the yard without protection.

### §4.4 Penetrations and Enclosure Integrity
- Cable and pipe penetration seals: certified systems (UL, FM Approvals, or CSA recognized), maintaining the rating of the structure or enclosure penetrated.
- Seals rodent-proof, and rated against gas, water, and dust ingress; smoke/toxic-gas sealing considered for fire conditions; watertight against suppression discharge.
- Seal systems selected for flexibility to accommodate future cable/pipe configuration changes.

---

## §5 Fire Protection and Suppression Philosophy

Fire suppression systems related to ESS shall be designed by or in consultation with a Fire Protection Engineer, supported by the ESS-specific Hazard Mitigation Analysis, as required by NFPA 855. Where automatic systems are provided they shall comply with the standards enumerated in NFPA 855 (2026) 4.9.4.1 (NFPA 13, 12, 15, 750, 770, 2001, 2010) unless modified by Chapters 9–17.

### §5.1 Outdoor Containers — No Integrated Water Suppression
- Containers are unoccupiable; integrated water-based suppression is omitted, consistent with typical practice in the governing reference.
- Documented loss history (Vistra Moss Landing, 2021) shows water applied to cells can cause electrical shorts and smoke, producing repeated discharge and equipment-damage cycles.
- First-responder strategy: managed burn-down ("let it burn") — allow thermal runaway to propagate through the affected unit until available fuel is consumed, the approach the governing reference identifies as most likely for outdoor containerized BESS. This strategy is formalized in the Emergency Response Plan (§8), not left implicit.

### §5.2 Clean Agent Exclusion
**Design rule FP-1 (binding):** No gas-based / clean agent suppression in or adjacent to the BESS envelope. The McMicken BESS accident (Surprise, AZ 2019) demonstrated the failure pattern: clean agent requiring closed ventilation, combined with battery offgassing, contributed to a deflagration with serious injuries. Where clean agent exists elsewhere in the facility for non-ESS protection, the HMA shall evaluate the interaction with ESS offgas scenarios to ensure personnel safety.

### §5.3 Explosion Prevention and Control
- All ESS shall be provided with a reliable explosion control and prevention system designed, installed, operated, maintained, and tested in accordance with NFPA 69 (NFPA 855 (2026) 9.7.6.7.3).
- Passive measures: NFPA 68 deflagration vent panels on each container.
- Active measures: emergency exhaust ventilation engineered to keep combustible concentrations below critical levels (§6). The NFPA 69 combustible-concentration-reduction versus NFPA 68 venting allocation per container is an HMA output and AHJ decision (open item F-2).
- Equipment physically attached to a container exterior (HVAC units, monitoring gear) is treated as an explosion hazard and mitigated to protect personnel and adjacent infrastructure.
- ESS fires present an immediate life-safety risk; no portable fire extinguisher exists that is effective on lithium-ion battery fires. Site SOPs reflect this (§8).

---

## §6 Detection, Ventilation, and Early Intervention

### §6.1 Early Intervention — Automatic Electrical Isolation
FM Global DS 5-33 requires an early intervention system to automatically and electrically isolate the LIB-ESS by at least one of two approaches. This design implements **both**:
- **EI-1 Cell temperature monitoring:** the cell manufacturer provides the threshold temperature indicating an abuse condition at 100% SOC; the majority of cells within each module are continuously monitored.
- **EI-2 Off-gas detection:** FM Approved gas detectors capable of detecting the volatile organic compounds associated with the off-gas event that precedes thermal runaway. Off-gassing from a lithium battery is unambiguously a fault indication; detection at this stage enables isolation before catastrophic loss.

### §6.2 Detection Suite (per NFPA 72 and NFPA 855 (2026) Annex G.7.3)

| System | Function / Requirement |
|---|---|
| Battery Management System | First-warning layer; continuous cell/module data; early warnings and critical data feed to first responders per Annex G |
| Off-gas (VOC) detection | FM Approved; precursor detection; triggers automatic electrical isolation (EI-2) |
| Hydrogen detection | Alarms remotely at a constantly attended location (DS 5-28 §2.3.1.4); gas limit 1% of room volume (DS 5-28 §2.3.1.3); 4% vol H₂ is explosive per IEC 62485-2 §7.2 |
| Aspirating smoke detection (VESDA) | Very early smoke detection within enclosures |
| Heat / flame detection | Per chemistry-specific design |
| Thermal imaging | Yard-level monitoring of container exteriors |

Note: gas emission can continue for an hour or more after charging is complete, depending on chemistry; detection and ventilation logic shall not assume hazard clearance at end of charge.

### §6.3 Ventilation
- Continuous circulation: 0.3 m³/min per m² of floor area where the enclosure exceeds 46.5 m² (DS 5-33 §2.3.3.5); may be satisfied by cooling airflow without a dedicated supply/extract system.
- Emergency hot-gas/hot-smoke exhaust: 0.75 m³/min per m², triggered at hydrogen >10% LEL and/or thermal runaway indication (DS 5-33 §2.5.5.3). Where no dedicated battery room exists, floor area is defined as cabinet footprint plus 1 m front and 0.5 m rear.
- Extraction from or near the ceiling (hydrogen accumulates high); discharge outdoors, directed away from air inlets, doorways, and openings to prevent re-entrainment; make-up air inlets on exterior walls remote from exhaust outlets.
- Negative-pressure design preferred (reduces oxygen fed to a fire, per §10 of the governing reference).
- Explosion-proof fans and equipment in the ventilation path, consistent with marine-industry practice cited in the governing reference; released gases span lighter- and heavier-than-air species across a range of temperatures.
- Gas-based suppression interaction: none expected (FP-1 exclusion); if clean agent exists in adjacent non-ESS spaces, ventilation design accounts for it per HMA.

### §6.4 Backup Power for Critical Safety Systems
**Requirement BP-1:** All critical safety subsystems — emergency ventilation, all detection layers, and the BMS — are provisioned with emergency backup power (NFPA 855 4.1), sized for 24–48 hours of active ventilation during an ESS fire event.

**Requirement BP-2:** Backup power for these systems is sourced independently of the BESS being protected (dedicated small UPS plus generator feed).

### §6.5 Temperature, Humidity, and Coolant Monitoring
- Manufacturer temperature/humidity limits are followed across all lifecycle stages; storage limits for non-operational equipment may differ from operational limits and are tracked separately.
- If the selected containers use sealed liquid-cooled battery modules: coolant leak detection is mandatory in the monitoring scope. Coolant leaks leading to electrical shorts are a known source of BESS fires per the governing reference.

### §6.6 Telemetry Integration
BMS state, off-gas, hydrogen, cell/module temperatures, isolation status, exhaust fan status, and door/intrusion status form a safety-instrumented monitoring domain within the site telemetry architecture. The point list includes a read-only external-facing view for first responders, consistent with NFPA 855 (2026) Annex G identifying BMS data as critical information for emergency response. Alarm routing terminates at a constantly attended location (open item T-1 for point-list issue).

---

## §7 Testing, Listing, and Compliance Gates

The following are gates, not guidelines. Procurement and permitting milestones are conditioned on them.

| Gate | Requirement | Basis |
|---|---|---|
| G-1 | Equipment listed to UL 9540 by an NRTL; test data, evaluation information, and calculations submitted to the AHJ | NFPA 855; Annex G1.3.2 |
| G-2 | Large-Scale Fire Test report in hand before vendor shortlisting: UL 9540A 5th Ed. (2025) or CSA/ANSI C800:25 consensus LSFT | NFPA 855 (2026) 9.2.1 now requires LSFT; IEC 62933-5-2 references UL 9540A as an accepted method |
| G-3 | Hazard Mitigation Analysis per NFPA 855 (2026) 4.4.1, evaluating: (1) thermal runaway / mechanical failure in a single unit; (2) failure of energy storage management or protection systems outside the product FMEA; (3) failure of required systems (HVAC, liquid cooling, BMS, communications); (4) AHJ-specified failure modes | NFPA 855 (2026) Art. 4.4 |
| G-4 | HMA demonstrates reliability and survivability of all seven critical safety systems during thermal-runaway propagation or single-failure events: exhaust ventilation, smoke detection, fire detection, fire suppression, CCR system, gas detection, explosion control/prevention | NFPA 855 (2026) 4.4.2.3 |
| G-5 | NFPA 68 / NFPA 69 compliance calculations or modeling data provided to the AHJ | NFPA 855; Annex G1.3.2 |
| G-6 | Emergency Response Plan per Annex G.10 developed jointly with the local fire authority, with pre-incident planning and training, before energization | NFPA 855 (2026) Annex G.10 |
| G-7 | Written decommissioning plan completed at design time | NFPA 855 Chapter 8 |

### §7.1 Jurisdiction Baseline
Design baseline is NFPA 855 (2026) regardless of the locally adopted edition, because it is the consensus bellwether and the AHJ may retroactively apply any portion of it (Ch. 1, ¶1.4.2). The locally adopted IFC and NFPA editions are confirmed during AHJ engagement (open item F-1); the 2024 IFC has begun aligning with NFPA 855, which simplifies dual-track compliance. NFPA 70 (NEC) or the local electrical code applies alongside NFPA 855, with correlated standards NFPA 110, NFPA 111, and NFPA 70E. The future NFPA 800 Battery Safety Code (storage, transport, recycling, disposal) is tracked for applicability at first publication.

---

## §8 Operations: Handling, Emergency Response, Repairs, End-of-Life

### §8.1 Emergency Response Plan and Site SOPs
- ERP developed per NFPA 855 (2026) Annex G.10 framework, jointly with the local fire department; includes pre-incident plan documentation and the first-responder information set (BMS data access, isolation points, yard layout, water supply, managed burn-down strategy).
- **SOP rule OP-1 (binding):** Personnel never approach or attempt to extinguish an ESS in alarm showing visible fault indications — sparks, arcs, flames, or gas plumes. Immediate evacuation, ERP activation, and standby for emergency response. Only facility and manufacturer standard operating procedures are followed.
- First-responder training and preplanning conducted with the fire authority before energization and refreshed on a defined cycle.

### §8.2 Transport, Receiving, and On-Site Storage of Lithium-Ion Batteries
- All lithium battery design types received on site carry UN Manual of Tests and Criteria §38.3 test summaries, available from the distributor on request.
- Shipments of standalone UN3480 lithium-ion batteries (>300 Wh) follow 49 CFR Parts 100–180 (US ground), IMDG (ocean), or IATA DGR (air): UN performance packaging (unless >12 kg with impact-resistant casing per 49 CFR 173.185(b)), Class 9 label, UN3480 mark, regulated shipping papers retained ≥2 years, and signed shipper certification.
- Employees preparing or shipping lithium-ion batteries complete 49 CFR Part 172 Subpart H training with recurrent training at least every three years; records maintained.
- On-site storage of spares per NFPA 855 Chapter 14 (collection areas, indoor/outdoor storage, fire prevention/mitigation, explosion protection) and current IFC §320.

### §8.3 Repairs, Retrofits, Replacement
- Repairs only by trained, qualified personnel with appropriate PPE; documented in maintenance logs.
- A repair using other than identical or equivalent parts is a retrofit (NFPA 855 4.6.2). A retrofit using different ESS technology or chemistry is a replacement and is treated as a new installation for compliance (NFPA 855 4.6.4) — i.e., it re-opens gates G-1 through G-5.

### §8.4 Decommissioning and End-of-Life
- Written decommissioning plan per NFPA 855 Chapter 8 exists from design time (gate G-7). On activation: AHJ notified, execution by trained and qualified personnel, final completion report issued.
- ESS equipment contains environmentally hazardous materials; disposal only via specialist licensed recycling and disposal contractors — never landfill or resource-recovery plants.

---

## §9 Interfaces Imposed on Other Disciplines

| Discipline / Document | Requirement Imposed by This BOD |
|---|---|
| EMS functional specification | Charging-energy constraints CE-1 / CE-2 as hard interlocks; hierarchical dispatch coordination of BESS vs generator governors; recharge shedding priority |
| Telemetry architecture | Safety-instrumented ESS domain (§6.6); first-responder read-only view; alarm routing to constantly attended location; IEC 61850 interoperability input to protocol decision |
| Generation island design | Separation distances to BESS yard per FMDS 1-20 / HC-3; no load-bearing steel in assumed fire envelope without protection |
| Electrical one-line | AC-coupled BESS at the 4.16 kV node bus via grid-forming PCS (decision 0007; MGN-BOD-002 §5.3); ≥2 PCS fault domains; automatic isolation devices actuated by EI-1/EI-2 |
| Site/civil package | BESS yard layout with conservative inter-container spacing (SEP-1); pile-assumed foundations pending geotech (C-1); responder access and egress; blast-barrier contingency |
| Backup power design | Independent 24–48 h safety-system power (BP-1/BP-2), not derived from the protected BESS |
| Procurement | Gates G-1 through G-5 as shortlist/PO conditions; UN 38.3 documentation flow-down; liquid-cooled module leak detection if applicable |

---

## §10 Decision Ledger and Open Items

### §10.1 Decisions Made (binding)

| ID | Decision | Basis |
|---|---|---|
| D-01 | BESS rating 6 MW PCS / 3 MWh, power-oriented | 5 MW worst-case coherent step × 1.20; 30 min bridging duration |
| D-02 | Chemistry: LFP; NMC 811 rejected; NiZn tracked as alternative | Table 2 comparison — safety, cycle life, lifespan, 800 V practicality |
| D-03 | Outdoor containerized, FM DS 5-33 location preference #1; no interior battery rooms | Eliminates cutoff-room burden; best-practice siting |
| D-04 | Distributed PCS across ≥2 fault domains | Limits single-unit HMA consequence; N-1 step coverage |
| D-05 | EDLC-only at rack tier; hybrid supercapacitors prohibited (SC-1) | Hybrids inherit Li-ion thermal runaway risk per governing reference |
| D-06 | No integrated water suppression in containers; managed burn-down ERP strategy | Unoccupiable structures; Moss Landing 2021 loss history |
| D-07 | Clean agent excluded from BESS envelope (FP-1) | McMicken 2019 failure pattern |
| D-08 | Both DS 5-33 early-intervention approaches implemented (EI-1 + EI-2) | Defense in depth; precursor detection before runaway |
| D-09 | Propagation assumed between containers absent installation-level LSFT (SEP-1) | Governing-reference default position |
| D-10 | Safety-system backup power independent of protected BESS, 24–48 h (BP-1/BP-2) | NFPA 855 4.1; ventilation duty during event |
| D-11 | Charging energy as hard EMS interlock (CE-1/CE-2) | Governing-reference charging-energy requirement; 10 MW island ceiling |
| D-12 | Coupling: AC-coupled grid-forming at 4.16 kV per MGN-BOD-002 [L]; DC coupling to an IT DC distribution bus rejected for now — no such system is generally available — and tracked as a watch item for a future major revision | Scott ruling 2026-06-11, decision 0007 |

### §10.2 Open Items

| ID | Item | Owner | Need Date |
|---|---|---|---|
| E-1 | PCS fault-domain split: 2×3 MW vs 3×2 MW. Drives HMA single-unit consequence, yard area, and one-line | Electrical | 30% design |
| E-2 | Battery-DC / PCS integration detail: isolation device class on the battery side and coordination with EI-1/EI-2 trips and PCS protective functions | Electrical | 30% design |
| E-3 | Vendor LSFT status: installation-level non-propagation result sets inter-container spacing; absent that, SEP-1 governs | Procurement | Shortlist |
| F-1 | AHJ engagement: confirm adopted IFC/NFPA editions; brief on NFPA 855 (2026) baseline and managed burn-down ERP | Fire/LS | Pre-permit |
| F-2 | NFPA 69 CCR vs NFPA 68 venting allocation per container — HMA output plus AHJ position | Fire/LS | HMA issue |
| C-1 | Geotechnical investigation: pile vs pad foundations for ~80,000 lb containers | Civil | 30% design |
| T-1 | Safety-instrumented telemetry point list, alarm routing, and first-responder read-only view | Controls | 60% design |
| T-2 | Protection/automation protocol decision (DNP3 vs IEC 61850); governing reference supports IEC 61850 for BESS interoperability — recorded as an input, not a determination | Controls | 60% design |
| P-1 | Vendor liquid-cooling architecture: if sealed liquid-cooled modules, leak detection enters mandatory scope | Procurement | Shortlist |
| P-2 | NiZn market re-scan at next major revision (alternative chemistry, no thermal runaway) | Engineering | Rev 1.0 |

---

## §11 References

Governing reference: Open Compute Project, "White Paper: Requirements for Energy Storage Systems Used in Data Centers," Revision 1.0, Version 1.0, January 2026 (CC BY-SA 4.0).

Codes and Standards (as adopted through the governing reference):
- NFPA 855 (2026) — Standard for the Installation of Stationary Energy Storage Systems, incl. Annex B (hazards by chemistry), Annex G (LIB suppression/safety, G.7.3 detection, G.10 first-responder plans), Chapters 8, 9, 14
- NFPA 70 (NEC); NFPA 70E; NFPA 110; NFPA 111; NFPA 72; NFPA 68; NFPA 69; NFPA 13/12/15/750/770/2001/2010 (per 855 4.9.4.1); future NFPA 800 (tracked)
- ANSI/CAN/UL 9540; ANSI/CAN/UL 9540A 5th Ed. (2025) LSFT; CSA/ANSI C800:25 (consensus LSFT alternative); ANSI/CAN/UL 1973
- IEC 62933 series: -1, -2-1, TS -2-2, TS -2-3, TR -2-201, -4-2, -4-4, -5-1, -5-2, -5-3; IEC 62619; IEC 63056; IEC 62391; IEC 62485-1/-2/-5; IEC 60364-5-57; IEC 61850; IEC 60255; IEC 61000; IEEE 1635
- FM Global Data Sheets: 5-28 (DC Battery Systems), 5-32 (Data Centers and Related Facilities), 5-33 (Lithium-Ion BESS), 1-20, 3-26, 4-9
- International Fire Code (current adopted edition; §320 for storage); UN Manual of Tests and Criteria §38.3; 49 CFR Parts 100–180 and Part 172 Subpart H; IMDG; IATA DGR

---

## Appendix A — US Supplier and Procurement Matrix

This appendix maps United States suppliers to the procurement packages established by this BOD. Inclusion is candidacy, not qualification: every Package 1 candidate must clear gates G-1 through G-5 (§7) before shortlisting, and component-level FM Approval / UL listing status must be verified against the specific model number at RFQ, not the product family. Market status reflects research current as of June 2026 and is re-verified at each RFQ cycle.

### A.1 Procurement Sequencing (binding)
**Sequence rule PS-1:** Package 1 (containerized BESS) is awarded first. Most Package 4/5 hardware arrives integrated within the container vendor's UL 9540 listing; substituting components after listing can void the listing. Packages 4/5 are procured separately only for yard-level systems outside the container listing boundary: thermal imaging, constantly-attended-location alarm head-end, and emergency exhaust.

**Sequence rule PS-2:** The G-2 Large-Scale Fire Test report (UL 9540A 5th Ed. or CSA/ANSI C800:25) is a bid submission requirement for Package 1, not a post-award deliverable. Accredited test labs are booking 3–6 months out; a vendor without the report in hand is a schedule risk as well as a compliance gap.

### A.2 Package 1 — Containerized LFP BESS (Tier 2; D-02, D-03, D-04)

| Supplier | US Manufacturing Base | Notes / RFQ Items |
|---|---|---|
| Tesla Energy | Lathrop, CA (40 GWh); Brookshire, TX (50 GWh, Megapack 3 / Megablock from late 2026); US LFP cell plant online; LG ES Lansing, MI LFP cells from Aug 2027 | ~5 MWh per Megapack 3 unit: a single unit covers 3 MWh but conflicts with D-04 (≥2 fault domains) — two-unit minimum governs. Request unit- and installation-level 9540A 5th Ed. data |
| Fluence | Goodyear, AZ (enclosures, BMS); Utah (modules, since 2024); ~50% of cells from AESC Tennessee | Strongest domestic-content paper trail for ITC adders; only non-Chinese top-10 integrator besides Tesla. Request domestic-content certification with bid |
| LG Energy Solution Vertech | Phoenix, AZ final assembly; Michigan LFP cell lines (>30 GWh by end 2026); ~50 GWh NA ESS manufacturing | Vertically integrated US cells-to-system path. Confirm Vertech (not import) scope at RFQ |
| EnerSys | Reading, PA | Smaller-block diligence quote; confirm LFP container offering at 6 MW class |
| American Battery Solutions | Lake Orion, MI (Komatsu) | Smaller-block diligence quote; module/pack strength; confirm system-level UL 9540 listing |

RFQ flow-downs for all Package 1 bidders: UL 9540 NRTL listing with test data and calculations releasable to the AHJ (G-1); LSFT report with bid (G-2, PS-2); installation-level non-propagation result if claiming reduced inter-container spacing (SEP-1 / E-3); UN 38.3 test summaries (§8.2); declaration of liquid-cooled vs air-cooled modules — liquid-cooled triggers mandatory leak detection scope (P-1, §6.5); NFPA 68/69 design data for the container envelope (G-5); BMS interface specification for the safety-instrumented telemetry domain (§6.6, T-1) including IEC 61850 capability statement (T-2 input).

### A.3 Package 2 — PCS Conversion (AC-coupled grid-forming, 4.16 kV; D-12, E-2)

| Supplier | US Base | Notes / RFQ Items |
|---|---|---|
| EPC Power | Poway, CA | Designs and builds all product in the US; SiC, >99% efficiency; grid-forming capability — directly relevant to the bus-forming/black-start duty (MGN-BOD-002 §5.2) |
| Dynapower (Sensata) | South Burlington, VT | Inverters, converters, rectifiers, custom transformers; confirm 4-quadrant grid-forming offering at 6 MW class |
| GE Vernova | US PCS operations | Utility-scale quote breadth; confirm factory of record |
| Power Electronics USA | Phoenix, AZ manufacturing | US plant of Spanish parent; high-volume utility PCS |

RFQ flow-downs: 4-quadrant **grid-forming** PCS, AC-coupled at the 4.16 kV node bus (forms the island bus, black-starts the node, absorbs full load rejection — MGN-BOD-002 §5.2/§5.3); coordination of PCS protective functions with EI-1/EI-2 automatic isolation trips (§6.1); fault-domain partitioning consistent with the E-1 decision (2×3 MW vs 3×2 MW).

### A.4 Package 3 — Supercapacitors (Tier 1; SC-1)

| Supplier | US Base | Notes / RFQ Items |
|---|---|---|
| UCAP Power | San Diego, CA | Carries the former Maxwell large-cell EDLC line; EDLC-only product satisfies SC-1 by construction |
| Eaton | US electronics operations | XLR/XLM EDLC module families; EDLC-only |

US supply in this segment is thin and shifts; production location is verified with each vendor at RFQ. RFQ flow-downs: certification that no hybrid (lithium-ion-containing) supercapacitor devices are supplied (SC-1); balancing/health monitoring interface (SC-2); hazard documentation per NFPA 855 (2026) Annex B.6.1 and IEC 62391.

### A.5 Package 4 — Detection and Early Intervention (EI-1/EI-2; §6)

| Supplier | Scope | Notes / RFQ Items |
|---|---|---|
| Honeywell / Li-ion Tamer (Nexceris, Lewis Center, OH) | Off-gas VOC detection (EI-2); H₂ detection | De facto EI-2 device: chemistry-agnostic VOC detection, 2–30 min pre-runaway warning. UL 2075 recognized MOS detector + UL 864 listed interface module supports H₂ detection at ≤10% LFL for NFPA 855/69 emergency-ventilation activation (§6.3 trigger). Verify FM Approval on the exact SKU per DS 5-33 |
| Honeywell Xtralis | VESDA aspirating smoke detection | §6.2 suite line item |
| Fike (Blue Springs, MO) | Integrated detection kits; DTS cable; heat/smoke/gas; thermal imaging; flame detection | Single vendor can carry most of the §6.2 table; pre-assembled Li-ion gas detection kits reduce per-unit install time; also offers pre-UL 9540A testing support |

### A.6 Package 5 — Explosion Control (NFPA 68/69; F-2)

| Supplier | Scope | Notes / RFQ Items |
|---|---|---|
| Fike (Blue Springs, MO) | Explosion vent panels; explosion protection engineering | Low-burst-pressure roof vents for controlled pressure/flame relief preventing enclosure rupture |
| BS&B Safety Systems (Tulsa, OK) | Vent-Saf explosion vents; mounting frames, deflectors | Second vent-panel quote |
| Oseco (Broken Arrow, OK) | Vent panels / rupture devices | Third vent-panel quote |

F-2 design input (recorded): Vendor literature notes that deflagration-panel effectiveness is limited by rapid gas generation rates from lithium-ion failures, which is why NFPA 69-compliant designs commonly use flammable gas detection to activate emergency ventilation at ≤10% LFL. This weights the F-2 decision toward NFPA 69 active ventilation as primary with NFPA 68 venting as backup, subject to HMA results and AHJ position.

### A.7 Open-Item Linkage
- E-1 (fault-domain split) → Package 1/2 bid structure.
- E-3 (vendor LSFT / non-propagation) → Package 1 bid requirement (PS-2) and yard layout.
- F-2 (NFPA 69 vs 68 allocation) → Package 5 scope definition; A.6 input recorded.
- P-1 (liquid-cooled module leak detection) → Package 1 declaration; Package 4 scope if triggered.
- T-1 / T-2 (telemetry point list; protocol) → Package 1 BMS interface and Package 2 controls flow-downs.

---

*ESS-BOD-001 Rev 0.3 — issued for review, pending Scott Tomsu approval. Coupling re-stated AC per decision 0007 (Scott ruling 2026-06-11). Rev 0.2 docx retained alongside as history.*
