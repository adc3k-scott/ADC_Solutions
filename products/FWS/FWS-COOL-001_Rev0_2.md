# FWS-COOL-001 — Facility Water System (Cooling Side) Basis of Design
## 5 MW IT Node / 10 MW Microgrid — Trane Equipment Basis, Louisiana Gulf Coast Climate

| | |
|---|---|
| **Document** | FWS-COOL-001 |
| **Revision** | Rev 0.2 (Draft for Review) |
| **Date** | 2026-06-11 |
| **Prepared for** | Scott Tomsu |
| **Reference design** | Johnson Controls 1 GW AI Factory Blueprint, Water-Cooled RDG 402 (scaled and adapted) |
| **Companion documents** | MGN-BOD-002 (10 MW Node BOD), MGN-TEL-001 (Unified Telemetry), ADC-CDU-DES-BOM-001 (ADC CDU), ADC-ICD-001 (CDU–TCS interface) |

## Revision History

| Rev | Date | Description |
|---|---|---|
| 0.1 | 2026-06-11 | Initial draft as dropped (external AI session). Referenced a 2.5 MW CDU model not in the ADC lineup. |
| 0.2 | 2026-06-11 | CDU basis re-cut to the locked ADC lineup per Scott's ruling (decision 0006): **4× ADC CDU (OCP Deschutes basis, 2 MW / 500 GPM each, ADC-CDU-DES-BOM-001), one per 16-rack reference cluster** (ADC-NSTAR-001); non-lineup CDU model references removed; §5.6/§5.8/§7 updated; new open item M-5 (block load reconciliation). Architecture status per decision 0006: this zero-water dry-cooler BOD is **retained as a site-selectable option** alongside the evaporative + chiller-trim basis — neither supersedes the other. |

---

## §1 Purpose and Scope

This document establishes the basis of design for the cooling-side Facility Water System (FWS) serving a 5 MW IT compute node powered by a 10 MW natural-gas microgrid. The architecture adapts the bifurcated-loop, zero-water-consumption thermal chain from the JCI RDG 402 gigawatt blueprint to single-node scale, substituting Trane chilled-water equipment, and hardening the design for Louisiana hot-humid (ASHRAE Climate Zone 2A) conditions.

Scope: facility water loops from CDU/CRAH connections to atmospheric heat rejection, including chillers, heat exchangers, dry coolers, pumps, economizer arrangement, and redundancy. TCS-side internals (rack manifolds, cold plates) and the CDU product itself are covered in ADC-CDU-DES-BOM-001 and ADC-ICD-001 and are referenced only at the interface.

---

## §2 Design Loads

| Parameter | Tag | Value | Basis |
|---|---|---|---|
| IT load, total | L-1 | 5.0 MW | Node design point |
| Liquid-cooled fraction | L-2 | 90% → 4.50 MW | DSX-aligned 90/10 split (RDG 402) |
| Air-cooled fraction | L-3 | 10% → 0.50 MW | CRAH/FCW served |
| HT loop design duty | L-4 | 4.75 MW | L-2 + CDU pump heat + 5% margin |
| MT loop design duty | L-5 | 0.60 MW | L-3 + CRAH fan heat + margin |
| Total heat rejection duty | L-6 | ~6.2 MW | L-4 + L-5 + chiller compressor heat (~0.85 MW at design COPs) |

## §3 Site Design Conditions — Lafayette, LA (Zone 2A)

| Parameter | Tag | Value | Notes |
|---|---|---|---|
| Cooling design dry bulb (0.4%) | W-1 | 35.0°C / 95°F | Verify against ASHRAE 2021 tables at final selection |
| Mean coincident wet bulb | W-2 | 26.1°C / 79°F | High latent climate |
| Extreme max dry bulb | W-3 | 38.9°C / 102°F | N-capacity check condition |
| Design wet bulb (0.4%) | W-4 | 26.7°C / 80°F | Drives DOAS latent design, not dry coolers |
| Winter design (99.6%) | W-5 | −1.7°C / 29°F | Hard-freeze events occur (ref. Feb 2021) — glycol mandatory outdoors |
| Outdoor summer dew point | W-6 | 25–27°C typical | **Above MT supply temp and at HT supply temp — condensation governs insulation design (§9.1)** |
| Wind design | W-7 | 150 mph ultimate | Hurricane region; rooftop/grade-mounted dry coolers |

Key climate takeaway versus the RDG 402 baseline (developed for Albuquerque): the dry-bulb design point is similar, but Louisiana's humidity does **not** penalize the dry-cooler-based zero-water architecture — dry coolers are sensible machines driven by dry bulb only. Humidity instead shows up in (a) data hall latent/makeup-air design and (b) condensation control on every pipe below ~27°C. Both are addressed in §9.

---

## §4 Loop Architecture

Four-loop bifurcated thermal chain per RDG 402, scaled:

| Loop | Fluid | Supply / Return | Serves |
|---|---|---|---|
| Technology Cooling System (TCS) | PG25 | 30°C supply (45°C future-ready) | Liquid-cooled IT via CDU |
| High-Temperature FWS (HT) | Water (indoor) | 26°C / 36°C | CDU primary side |
| Medium-Temperature FWS (MT) | Water (indoor) | 22°C / 32°C | CRAH/FCW |
| Heat Rejection (HR) | PG30 | 54°C / 44°C design | Chiller condensers + economizer HX → dry coolers |

Design intent carried over from RDG 402:

1. **Bifurcated loops maximize tokens per watt.** Serving the liquid load at 26°C instead of a blended 20–22°C plant raises HT chiller COP and shrinks compressor power — the same mechanism JCI quantifies as a 20% → 16% reduction in chiller power as a fraction of IT load.
2. **Elevated HR loop temperature shrinks the dry cooler array.** A 54°C HR supply against 35°C design ambient gives a 19 K ITD — comfortably buildable, with footprint/fan-power savings in the 30–50% range versus a 40–45°C loop.
3. **Trane-specific ceiling:** CVHH/CDHH condenser capability tops out at 60°C / 140°F. Design HR loop at 54°C leaving condenser with the 140°F rating as margin, not as the operating point. (This is the one place the Trane recipe diverges from the YORK YK basis in RDG 402, which advertises 165°F heat rejection. At our scale and ambient, 54°C is sufficient and keeps selections in the catalog sweet spot.)

### §4.1 Operating Modes (per RDG 402, retained)

| Mode | Description | Entry condition |
|---|---|---|
| Normal | HT + MT chillers duty, swing idle, dry coolers reject condenser heat | Ambient > ~18°C |
| Hybrid Economizer | Economizer PHE pre-cools HT return in series; chillers trim | Ambient ~8–18°C |
| Full Economizer | PHE carries 100% of HT loop; HT chillers off; MT chiller may remain | Ambient ≤ ~14°C (26°C supply − 4 K PHE approach − ~8 K dry cooler approach) |
| Swing | Swing chiller substitutes for any HT chiller, or assists MT | Maintenance/failure |

Economizing PHE shall be piped to allow **partial-load economization in series** with the chillers (the RDG 402 parallel depiction is graphical simplification — same note applies here). Lafayette sees roughly 3,500–4,500 hours/year at or below 18°C, so the hybrid mode meaningfully improves annualized PUE even in the Gulf South.

---

## §5 Equipment Recipes (Trane Basis)

### §5.1 High-Temperature Loop Chillers — Trane CVHH CenTraVac

| Attribute | Recipe value |
|---|---|
| Model | Trane CVHH CenTraVac, single-circuit centrifugal, R-1233zd(E) (A1, near-zero GWP) |
| Quantity | 2 duty + 1 swing (see §5.3) = 3 installed |
| Unit capacity | ~750 tons / 2,650 kW each (2 duty units carry L-4 with margin) |
| Evaporator | 26°C leaving / 36°C entering, ΔT 10 K, water |
| Condenser | 44°C entering / 54°C leaving, PG30 |
| Lift | ~28 K — moderate; selection COP target ≥ 6.5 |
| Drive | Adaptive Frequency Drive (AFD), deep turndown for swing/part-load duty |
| Voltage | Medium-voltage option — align with node distribution (E-1, open) |
| Options | RuptureGuard containment, enhanced electrical package, Symbio/Tracer controls with BACnet/IP |

Rationale: CenTraVac direct-drive low-pressure design is the closest Trane analog to the YK in the JCI guide — single rotating shaft, low refrigerant leak rate, heat-recovery-class condenser temperatures, and field history in continuous-duty data center service. CDHH duplex is the step-up path if the node template later scales past ~1,500 tons per unit; at 750 tons, CVHH single-circuit is the right SKU.

### §5.2 Medium-Temperature Loop Chillers — Trane RTWD

| Attribute | Recipe value |
|---|---|
| Model | Trane RTWD water-cooled helical-rotary screw |
| Quantity | 2 × 100% (1 duty + 1 standby) |
| Unit capacity | ~170 tons / 600 kW each |
| Evaporator | 22°C / 32°C, water |
| Condenser | 44°C / 54°C, PG30, common HR header |
| COP target | ≥ 5.5 at design |

Rationale: the MT load (0.6 MW) is too small to justify a centrifugal frame; the screw RTWD holds efficiency at this tonnage and tolerates the elevated condensing condition. RDG 402 uses 2 MT chillers per quadrant for the same reason — the airside loop is the minority load.

### §5.3 Swing Chiller

One CVHH 750-ton unit dual-headered with motorized changeover valves to both HT and MT supply/return headers. Primary role: N+1 for the HT pair. Secondary role: MT backup if both RTWDs are unavailable (AFD turndown covers the 600 kW MT duty). This consolidates loop redundancy exactly as RDG 402's swing concept intends, with one frame instead of a fourth dedicated unit.

### §5.4 Economizer Heat Exchangers — Gasketed Plate-and-Frame

Trane does not manufacture the PHE; specify direct:

| Attribute | Recipe value |
|---|---|
| Type | Gasketed plate-and-frame, Tranter GX-series or Alfa Laval T-series (consistent with prior ADC sourcing) |
| Quantity | 2 × 60% |
| Duty (each) | ~2.9 MW |
| Approach | ≤ 4 K (26°C HT supply from 22°C HR-side fluid) |
| Plates / gaskets | 316L SS / EPDM, PG30 on HR side |
| Arrangement | Series-piped with HT chillers for partial economization |

### §5.5 Dry Cooler Array (non-Trane scope)

| Attribute | Recipe value |
|---|---|
| Type | V-coil dry cooler, EC fans — Güntner GVD/GVW or EVAPCO eco-Air basis |
| Quantity | 10 × ~700 kW (8 duty + 2 redundant, N+2) |
| Fluid | PG30, 54°C in / 44°C out at design |
| Design ambient | 35°C, with N-units verified at 38.9°C extreme |
| Fin protection | E-coat / epoxy fins (Gulf salt + pollen fouling) |
| Sound | EC fans at reduced speed via oversize margin; elevated loop temp per RDG 402 enables low-speed operation |
| Structural | 150 mph wind anchorage; mounted above BFE + 2 ft |
| Option (M-2, open) | Adiabatic pre-cooling pads for peak-day trim — breaks strict zero-water but cuts ~15–20% array capacity; decision deferred |

N+2 rather than N+1 on dry coolers: they are the only outdoor, fouling-exposed, hurricane-exposed element of the chain, and the marginal unit is cheap relative to a chiller.

### §5.6 CDUs (interface only)

4 × ADC CDU (OCP Deschutes basis, 2 MW / 500 GPM facility side each, ADC-CDU-DES-BOM-001), one per 16-rack reference cluster per ADC-NSTAR-001 — no spare CDU frame at block level; redundancy is internal to the CDU per its BOM. 3°C HX approach target per the Deschutes basis; HT FWS 26°C primary → TCS supply per ADC-ICD-001; TCS fluid PG25. Future-state 45°C TCS supported by raising HT setpoint — the chillers' efficiency improves as the setpoint rises, which is the future-proofing lever RDG 402 highlights.

### §5.7 CRAH / FCW

4 × 200 kW (3 duty + 1), MT water 22/32°C, supply air 27°C, return up to 40°C, sensible-only coils. Latent load handled by dedicated DOAS (§9.2), not the CRAHs.

### §5.8 Pumps (all VFD, N+1 minimum)

| Loop | Config | Flow (total) | Notes |
|---|---|---|---|
| HT | 3 × 50% | ~2,000 GPM | 4 × 500 GPM CDU facility side (Deschutes basis); end-suction or vertical inline |
| MT | 2 × 100% | ~230 GPM | |
| HR | 3 × 50% | ~2,400 GPM | PG30 viscosity-corrected selection |

---

## §6 Redundancy Summary

| Element | Scheme |
|---|---|
| HT chillers | 2 + 1 swing (N+1) |
| MT chillers | 1 + 1 (N+1), swing as second backup |
| Economizer PHE | 2 × 60% |
| Dry coolers | N+2 |
| Pumps | N+1 per loop |
| CDUs | N+1 |
| CRAHs | N+1 |
| Controls | 2N supervisory, N+1 plant controllers (per MGN-TEL-001) |
| Headers | Common HT/MT/HR headers with sectionalizing valves — any unit isolable under load |

Concurrent maintainability target: any single chiller, pump, PHE, or dry cooler removable at full IT load on the design day.

---

## §7 Power Budget vs. 10 MW Microgrid

| Consumer | Design-day peak |
|---|---|
| IT load | 5.00 MW |
| HT chillers (COP 6.5) | 0.73 MW |
| MT chiller (COP 5.5) | 0.11 MW |
| Dry cooler fans | 0.20 MW |
| Pumps (all loops) | 0.17 MW |
| CDUs (4 × 74 kW, ADC-CDU-DES-BOM-001) | 0.30 MW |
| CRAH + DOAS | 0.09 MW |
| **Mechanical subtotal** | **1.60 MW** |
| Electrical losses / house | ~0.30 MW |
| **Node total, design-day peak** | **~6.9 MW** |

Mechanical load is ~32% of IT at peak, dropping toward the upper teens annualized with hybrid economizer hours — somewhat above the RDG 402 16–20% band at peak because the CDU fleet draw is carried at the ADC-CDU-DES-BOM-001 rated 74 kW per unit. Against the 10 MW node (5 × G3520H, N+1 firm) this leaves >3 MW headroom for genset parasitics, BESS charging, and future TCS-temperature-driven IT density growth. No conflict with MGN-BOD-002.

BESS note: chiller AFDs are soft-start by nature; coherent motor-start steps are dominated by pump and fan groups and fall well inside the 6 MW / 3 MWh BESS step envelope. Sequence chiller staging through the plant controller to avoid coincident starts regardless.

---

## §8 Controls and Telemetry

The RDG 402 Metasys layer maps to the MGN-TEL-001 unified telemetry architecture as follows:

- Chillers: Trane Symbio/Tracer controllers, **BACnet/IP** to plant controller (do not use proprietary Tracer SC-only integration).
- Dry coolers, pumps, PHE valves: Modbus TCP or hardwired to plant PLC.
- CDU fleet: per ADC-CDU-DES-BOM-001 controls (Deschutes Modbus→Redfish bridge per MGN-TEL-001), multi-unit synchronization, Modbus TCP northbound.
- Plant controllers: N+1; supervisory historians 2N, consistent with TEL-001 five-domain model (this plant is the Thermal domain).
- Dynamic setpoint optimization (HT supply reset upward with IT inlet margin) is the single highest-value control sequence — every degree of HT reset is direct compressor power.

---

## §9 Louisiana-Specific Provisions

### §9.1 Condensation Control
Outdoor summer dew point (25–27°C) sits **above** the MT supply temperature (22°C) and at the HT supply temperature (26°C). All FWS piping, valves, and equipment surfaces in non-dehumidified spaces shall have closed-cell insulation with continuous vapor barrier; CRAH casings and CDU primary-side piping included. This is the most common Gulf Coast failure mode for "warm-water" plants designed to desert-climate references — treat it as a hard requirement, not a detail.

### §9.2 Latent Load / Makeup Air
CRAH coils are sensible-only at 22°C water. A dedicated 2 × 100% DOAS handles all ventilation latent load and hall pressurization, holding hall dew point within the ASHRAE A1 envelope. Without this, infiltration latent load condenses on the coldest available surface — usually MT piping or the IT inlets.

### §9.3 Freeze Protection
PG30 in all outdoor circuits (HR loop, dry coolers), PG25 TCS per platform standard, plain water acceptable only on fully indoor HT/MT loops. Heat-trace dry cooler drain points. February 2021-class events are the design case, not the exception.

### §9.4 Hurricane / Flood
Dry coolers and outdoor electrical anchored to 150 mph ultimate; all rotating equipment and electrical gear above BFE + 2 ft; plant capable of ride-through on microgrid island per MGN-BOD-002.

### §9.5 Fouling
E-coated fins, quarterly coil wash program (potable rinse — not process water consumption), spare fan motors stocked on site.

---

## §10 Decision Ledger

| # | Decision | Status |
|---|---|---|
| D-1 | Bifurcated HT/MT loop architecture per RDG 402 | **Adopted** |
| D-2 | Zero-water dry cooler heat rejection (vs. cooling towers) | **Adopted** — towers would consume ~60k gal/day at this scale (RDG 402: 12.2M gal/day/GW) |
| D-3 | Trane CVHH (HT/swing) + RTWD (MT) chiller basis | **Adopted this rev** |
| D-4 | HR loop design 54°C (not 60°C) | **Adopted** — keeps 5–6 K margin under CVHH 140°F ceiling |
| D-5 | Swing chiller in lieu of dedicated 4th HT unit | **Adopted** |
| D-6 | Adiabatic pre-cool on dry coolers | **Open** (M-2) |

## §11 Open Items

| # | Discipline | Item |
|---|---|---|
| M-1 | Mech | Run Trane TOPSS selections to confirm CVHH COP and capacity at 26/36°C evap, 54°C condenser leaving, PG30 condenser side; confirm RTWD availability at 54°C condensing |
| M-2 | Mech | Adiabatic vs. pure-dry dry cooler decision (water budget vs. array size) |
| M-3 | Mech | PHE vendor selection — Tranter vs. Alfa Laval, leverage existing ADC quotes |
| M-4 | Mech | Confirm Lafayette ASHRAE 2021 design values at final selection (W-1 through W-5 carried as nominal) |
| M-5 | Mech | Reconcile §2 design loads (90/10 RDG 402 split, loop duties) against the actual N★ block: 4× reference cluster = 4,992 kW IT, 4× 2 MW Deschutes CDUs (ADC-CLU-BOM-001 / ADC-NSTAR-001) |
| E-1 | Elec | Chiller voltage — MV vs. 480 V; coordinate with node single-line and genset bus |
| E-2 | Elec | Motor-start coordination study against 6 MW/3 MWh BESS step envelope |
| C-1 | Ctrl | Map chiller/dry cooler/PHE points into MGN-TEL-001 tag schema; confirm Symbio BACnet object coverage |
| C-2 | Ctrl | HT supply reset sequence definition (reset ceiling tied to CDU approach) |
| S-1 | Struct | Dry cooler wind anchorage calc, 150 mph |

---

*Rev 0.2 — issued for review (CDU basis re-cut to ADC lineup per decision 0006; retained as the site-selectable zero-water option). Equipment capacities and COPs are catalog-basis pending vendor selections (M-1).*
