# ADC 2 MW Coolant Distribution Unit (CDU) — Project Deschutes Aligned

Spec sheet for ADC Solutions' first CDU product: a 2 MW liquid-to-liquid
coolant distribution unit built to the OCP **Project Deschutes** v1.0
specification (Google's fifth-generation CDU design, contributed to the
Open Compute Project, effective 2026-02-26).

## Source of truth

| Document | File | Status |
|---|---|---|
| OCP Project Deschutes: Data Center Facilities v1.0.0 (Google, 2026-02-26) | [OCP-Specification-Deschutes v1_0.pdf](OCP-Specification-Deschutes%20v1_0.pdf) | Public OCP specification — design basis |
| ADC Project Deschutes CDU Procurement BOM/BoD, Doc. ADC-CDU-DES-BOM-001 **Rev 0.3** (2026-06-11) | [ADC-CDU-DES-BOM-001_Rev0_3.md](ADC-CDU-DES-BOM-001_Rev0_3.md) | **Governing Markdown issue, pending Scott approval** — errata E1–E5 applied (CDU-G10, SYS-OI-04/07, internal-reference citation, Telemetry forward-refs). RFQ-level procurement BOM — **not** a released manufacturing BOM. |
| — Rev 0.1/0.2 PDF (2026-05-19) | [ADC_Deschutes_CDU_BOM_v0_2_WITH_DIAGRAMS.docx.pdf](ADC_Deschutes_CDU_BOM_v0_2_WITH_DIAGRAMS.docx.pdf) | History + figure source (the four explanatory diagrams). Until Rev 0.3 is approved, this PDF remains authoritative. |
| ADC CDU ↔ TCS Interface Control Document, Doc. ADC-ICD-001 Rev 0.1 (2026-06-11) | [ADC-ICD-001_CDU-TCS_Rev0_1.md](ADC-ICD-001_CDU-TCS_Rev0_1.md) | Controls the CDU↔TCS boundary (demarcation, pressure cascade, materials, transients, telemetry). **Approved 2026-06-11** — CDU-G7 closed. |

The ADC BOM also draws on: ADC Modular TCS BoD/RFQ v1 (2026-05-19),
Deschutes Redfish/AI/TCS Reference v1.2 (May 2026), OCP Next-Generation ML
Infrastructure Design Principles v0.5.0, and OCP Diablo 400 Rack & Power
v0.5.2 (sidecar power context only). *Currency note (2026-06-10,
[spec check](../../ops/research/2026-06-10-ocp-spec-currency.md)):
Diablo 400 v0.5.2 is superseded by v0.7.0 (2026-03-01) — update at next
BOM revision (SYS-OI-04); the Redfish/AI Reference v1.2 is an internal
ADC document, not an OCP publication — pending addition to the repo
(SYS-OI-01).*

## Design basis (Deschutes section 3.1)

| Parameter | Value |
|---|---|
| Thermal capacity | 2,000 kW (2 MW) per CDU |
| IT / secondary loop flow | 500 GPM design point |
| Facility / primary loop flow | 500 GPM at 0.25 GPM/kW |
| IT dP available | 80–90 psi at CDU secondary outlet |
| Facility dP basis | 15–30 psi |
| Operating pressure | 0–130 psig; pressure relief at 130 psi |
| Operating liquid temperature | 18–55 °C |
| Approach temperature | 3 °C across the liquid-to-liquid HX at design load |
| Coolants | DI water and PG25 |
| Wetted materials | Stainless steel, copper, EPDM — **no nickel-plated brass on the secondary side** |
| Heat exchanger | Liquid-to-liquid, two-pass |
| Dimensions (W × H × D) | 65.25 × 91.44 × 42.29 in (max packaged height 100 in) |
| Weight | 6,900 lb wet max / 5,310 lb dry max |
| Power | 380–416 Vac, 3-phase, 50/60 Hz; dual-feed PDU; ~74 kW total |

## Locked architecture

The ADC BOM preserves the Deschutes main CDU architecture. These items are
**engineering-locked** — no substitution or resizing without a formal
deviation:

- **Pump train:** 2× SPECK TOEMA065200 sealless pumps in N+1 service —
  500 GPM @ 112 psi, 37 kW (50 HP) each, one ABB ACH580 VFD per pump.
- **Heat exchanger bank:** 3× Alfa Laval CB210-276AH two-pass plate HXs in
  parallel (lower pressure drop, thermal margin).
- **Primary control:** 1× Belimo B6500 valve with actuator on the
  facility side, modulating PCW flow to hold the 3 °C approach target.
- **Safety authority:** rack-loop / leak-response safety logic stays in the
  CDU PLC — never moved to an external gateway or AI layer.

## Subsystems (BOM coding)

| Prefix | Subsystem | Highlights |
|---|---|---|
| CDU | Cabinet, frame, manifolds, internal piping | Deschutes form factor; 304/316 stainless; Victaulic/tri-clamp serviceable joints; front/rear service access |
| PMP | Pump train | Locked SPECK pumps, isolation/check valves, service slides, telemetry |
| HX | Heat exchanger bank | Locked 3× parallel CB210-276AH with balance manifolds |
| PV | Primary-side valve & piping | Locked Belimo B6500, isolation, position feedback to PLC |
| FLT | Filtration | 25–44 µm main filters both loops + 0.2 µm side-stream (~3 GPM), all front-serviceable, dP-monitored |
| AIR / EXP | Air & expansion | Spirovent air separator; flow-through expansion tank, front-serviceable |
| SEN / LEAK | Instrumentation & leak detection | P/T at all four ports, ±0.5%-of-reading flow meter, coolant pH/conductivity, 3-zone leak rope into PLC |
| PLC / RF / NET | Controls | Industrial PLC + HMI, Modbus/TCP, IPv4/IPv6; optional Redfish bridge for REST/JSON telemetry |
| PWR / VFD | Power | Dual-feed 416 Vac PDU, 2× ABB ACH580-31-065A-4, Class J fusing, GFPE, 24 Vdc control power |
| SK | CDU-to-TCS interface | Connection allowance only — TCS 6 in header / DN50 branches live in the separate Modular TCS package |
| VAL / DOC / PKG | Validation & delivery | Hydro/helium/N2 tests, thermal-hydraulic curves at 25–100% speed, FAT, FRU procedures, as-built package, clean sealed shipping |

## Scope boundary

Inside this product: everything within the CDU cabinet plus CDU-side
interface allowances. Outside it (separate packages): the modular TCS
header/branch/rack loop, chiller plant and facility water, Diablo 400
sidecar power, and enterprise DCIM/AI platform.

## Status

**RFQ-ready, preliminary.** A production BOM requires supplier CAD, P&ID,
final spool/harness drawings, safety review, and validation signoff. Open
release gates tracked in the BOM section 7: architecture-preservation
audit, pump-curve overlay (DI and PG25), HX balance at 2 MW / 500 GPM,
relief valve basis with AHJ, wetted-material certs, native-Redfish vs
bridge decision, Louisiana site-specific seismic basis (stamped), and
validation plan. The TCS interface control document gate is **closed** —
[ADC-ICD-001 Rev 0.1](ADC-ICD-001_CDU-TCS_Rev0_1.md) approved 2026-06-11.

## Unified telemetry (MGN-TEL-001)

The CDU is telemetry domain **D3 (cooling, Tier 2)** of the platform-wide
unified telemetry plane — its PLC is bridged Modbus→Redfish per the
Deschutes reference and federated with the gensets, BESS, TCS, and IT
racks into one Redfish namespace on one clock. The PLC retains safety
authority; the plane is supervisory only. See
[Microgrid + Unified Telemetry](../Microgrid/README.md).

## Roadmap

A 5 MW-class CDU is in development as the follow-on product
(see [MISSION.md](../../MISSION.md)).
