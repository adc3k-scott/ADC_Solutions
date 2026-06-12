# FWS-RFQ-M-001 — Request for Quotation
## Water-Cooled Chillers — 5 MW IT Compute Facility, Lafayette, Louisiana Area

| | |
|---|---|
| **Document** | FWS-RFQ-M-001 |
| **Revision** | Rev 0.2 — Multi-Vendor Issue (supersedes Rev 0.1) |
| **Issue date** | 2026-06-11 |
| **Issued by** | Scott Tomsu — Louisiana Licensed General Contractor |
| **Contact** | scott@adc3k.com · (337) 780-1535 |
| **Quotation due** | [DATE — 3 weeks from issue suggested] |
| **Project reference** | Confidential — 5 MW IT compute facility with on-site power generation, Lafayette, LA area |

**Rev 0.2 changes:** Converted to performance-based multi-vendor specification; added approved manufacturers list (§2.0); added condensing-envelope demonstration requirement (§2.3); added power-interruption ride-through/restart requirements (§3.1); added modular chiller alternate for Line Item 2 (§7, A-6); genericized controls and containment language.

---

## §1 Purpose

The Owner requests budgetary-to-firm quotations for water-cooled chillers serving the facility water system of a 5 MW IT-load compute facility. This RFQ covers chiller equipment, factory options, selection engineering, factory performance testing, freight, startup, and warranty. The project follows a bifurcated chilled-water architecture with two facility loops (high-temperature liquid-cooling loop and medium-temperature airside loop) rejecting heat through a common glycol loop to dry coolers.

This is a performance-based specification. Named models define the quality and configuration basis; equivalent products meeting all stated conditions will be evaluated on equal footing. ROM pricing with stated validity is acceptable at this stage; identify any line items quoted firm.

## §2 Equipment Specification

### §2.0 Approved Manufacturers

| Manufacturer | Basis models | Status |
|---|---|---|
| Trane | CVHH / CDHH CenTraVac centrifugal; RTWD screw | Approved |
| Johnson Controls / YORK | YK / YZ centrifugal; YVWA screw | Approved |
| Daikin Applied | Magnitude WME-family magnetic-bearing centrifugal | Approved |
| Carrier | AquaEdge 19DV centrifugal; 30XW screw | Conditional — see §2.3 |
| Smardt | Oil-free Turbocor-based, high-lift configuration | Conditional — see §2.3 |
| Multistack | Modular water-cooled bank | Line Item 2 alternate only (A-6) |

Other manufacturers may submit subject to prior written approval and full compliance with §2.3 and §4.

### §2.1 Line Item 1 — High-Temperature Loop Chillers

| Attribute | Requirement |
|---|---|
| Type | Water-cooled centrifugal (conventional drive or magnetic-bearing oil-free) |
| Refrigerant | Low-GWP (GWP < 10 preferred, GWP < 750 maximum), ASHRAE A1 classification required |
| Quantity | 3 (two duty + one swing) |
| Capacity, each | ~750 tons / 2,650 kW — vendor to optimize frame size at conditions below |
| Evaporator | 26°C leaving / 36°C entering chilled water (78.8°F / 96.8°F), water, fouling 0.0001 h·ft²·°F/Btu |
| Condenser | 44°C entering / **54°C leaving** (111.2°F / 129.2°F), **30% propylene glycol**, fouling 0.00025 |
| Drive | Variable-speed drive required, unit-mounted preferred |
| Turndown | State minimum stable capacity; swing unit must hold ~600 kW duty stably without hot-gas bypass where possible |
| Controls | Manufacturer's unit controller with **native BACnet/IP**; full points list and PICS required with quotation |
| Containment | Refrigerant relief/containment per ASHRAE 15; low-pressure machines shall include rupture-disk containment or equal |

### §2.2 Line Item 2 — Medium-Temperature Loop Chillers

| Attribute | Requirement |
|---|---|
| Type | Water-cooled screw, small-frame centrifugal, or modular bank (see A-6) |
| Quantity | 2 × 100% (one duty + one standby), or modular N+1 equivalent under A-6 |
| Capacity | ~170 tons / 600 kW firm capacity |
| Evaporator | 22°C leaving / 32°C entering (71.6°F / 89.6°F), water |
| Condenser | 44°C entering / 54°C leaving, 30% propylene glycol |
| Drive | VFD preferred; state options |
| Controls | Native BACnet/IP |

### §2.3 Condensing Envelope Demonstration — Mandatory

The 54°C (129.2°F) leaving condenser fluid temperature on PG30 is a hard design condition tied to the heat rejection system sizing. Every bidder shall, with their quotation:

1. Provide selection-software output demonstrating stable full-load and part-load operation at the §2.1/§2.2 conditions **within the published application envelope** — not as a special-engineering exception, unless explicitly stated and warranted as such; **or**
2. If the offered product cannot meet 54°C leaving condenser, state the **maximum continuous leaving condenser fluid temperature** the product is warranted for at these evaporator conditions, and quote at that condition. The Owner will assess the resulting dry cooler area, fan power, and footprint penalty in the bid evaluation. Bidders are advised that each degree Celsius of reduction in the heat rejection loop design temperature materially increases heat rejection plant cost; submissions below approximately 50°C leaving condenser are unlikely to be competitive on a total-installed-cost basis.

Conditional manufacturers (§2.0) must satisfy item 1 or 2 to be evaluated.

## §3 Site and Application Conditions

| Parameter | Value |
|---|---|
| Location | Lafayette, Louisiana area (ASHRAE Climate Zone 2A) |
| Installation | Indoor central plant, slab on grade |
| Elevation | < 50 ft ASL |
| Electrical service | Quote both: (a) 480 V / 3 / 60 Hz, and (b) medium-voltage option — state available MV ratings per frame |
| Duty | Continuous mission-critical operation, 8,760 h/yr; concurrent maintainability via N+1 plant design |
| Application note | Elevated chilled-water setpoints are intentional (liquid-cooled IT). Selections must not assume comfort-cooling defaults. |

### §3.1 Power Quality, Ride-Through, and Restart — Required Data

The facility is served by an on-site generation microgrid with battery energy storage. With the quotation, provide for each line item:

1. VFD/starter inrush and soft-start current profile (for motor-start coordination study).
2. Voltage sag ride-through capability: depth and duration the unit tolerates without trip.
3. Behavior on momentary power interruption: auto-restart capability, and **time from power restoration to full cooling capacity** (state separately: time to compressor restart, time to full load).
4. Any fast-restart or ride-through product options (e.g., drive DC-bus support, control-power UPS provisions), priced as adders.

Restart performance will be weighted in evaluation; thermal storage in the facility loops is limited and minutes matter.

## §4 Required Selection Runs

Vendor shall provide selection-software reports for each line item including:

1. Full-load performance at §2 design conditions: capacity, kW, COP, evaporator/condenser flow and pressure drop.
2. Part-load performance: NPLV.IP and point data at 75/50/25% at design condenser conditions.
3. Off-design run, Line Item 1: evaporator reset to 30°C leaving (future higher-temperature operation) — state capacity and COP gain.
4. Off-design run, both items: condenser at 48°C leaving (economizer-season trim duty).
5. Minimum entering condenser fluid temperature and any low-lift limitations (hybrid economizer operation); state whether inverted-condition starting is supported.
6. Sound power data per AHRI 575 at full and part load.
7. Physical data: dimensions, operating/shipping weights, service clearances, rigging requirements.
8. Country of manufacture and AHRI 550/590 certification status for the offered selections.

## §5 Scope of Supply — Include in Quotation

- Equipment per §2 with stated options itemized separately
- Variable-speed drive, unit-mounted where available
- Factory performance test, AHRI 550/590 certified; witnessed-test adder priced separately for one unit of each line item
- Marine/indoor storage packaging; freight to Lafayette, LA (FOB jobsite)
- Factory startup, commissioning support, and first-year service
- Standard warranty plus pricing for extended 5-year compressor/drive warranty
- Spare parts recommendation (2-year operating spares list with pricing)
- Lead time from PO to ship, stated per line item, with current production slot availability
- Local service coverage statement: nearest factory-authorized service location to Lafayette, LA, staffing, and guaranteed response time

## §6 Exclusions (By Others)

- Coolant distribution units, computer room air handlers, dry coolers, heat exchangers, pumps
- Field piping, insulation, rigging and setting, electrical installation
- Plant supervisory controls integration (vendor provides BACnet points list and protocol documentation)

## §7 Alternates — Price Separately

| Alt | Description |
|---|---|
| A-1 | Larger-frame duplex/dual-compressor configuration in lieu of three Line Item 1 units (two frames), with redundancy narrative |
| A-2 | Heat recovery condenser configuration on Line Item 1 (future heat reuse provision) — state maximum heat recovery leaving water temperature |
| A-3 | Free cooling / refrigerant migration option, Line Item 1, where offered |
| A-4 | Extended warranty per §5 |
| A-5 | Witnessed factory test per §5 |
| A-6 | Line Item 2 as modular water-cooled chiller bank: ≥ 600 kW firm with one module redundant (N+1 within the bank); state module size, count, and bank controls |
| A-7 | Fast-restart / ride-through package per §3.1 item 4 |

## §8 Submittal Requirements

Quotations shall include: completed selection reports per §4, envelope demonstration per §2.3, power-quality data per §3.1, itemized pricing per §5/§7, payment terms, pricing validity period, lead times, warranty terms, drawings (GA, electrical), and BACnet PICS. Submit electronically to the contact above.

## §9 Evaluation Criteria

Selections will be evaluated on: conformance to design conditions (particularly the 54°C PG30 condensing condition per §2.3), full- and part-load COP, ride-through/restart performance (§3.1), lead time, total installed cost implications (footprint, electrical, and any heat-rejection-plant penalty from reduced condensing temperature), and lifecycle service support in the Acadiana region. The Owner reserves the right to award by line item, in whole or in part, to different manufacturers per line item, or not at all.

## §10 Confidentiality

All project information contained in or disclosed through this RFQ is confidential and shall not be disclosed to third parties or used for any purpose other than preparing a quotation.

---

*FWS-RFQ-M-001 Rev 0.2 — issued for quotation to approved manufacturers per §2.0. Design conditions per FWS-COOL-001 Rev 0.1.*
