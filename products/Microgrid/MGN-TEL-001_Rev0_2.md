# MGN-TEL-001 — Unified Telemetry & Observability Architecture (Power + Compute) — Basis of Design

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | MGN-TEL-001 |
| Title | Unified Telemetry & Observability Architecture (Power + Compute) — Basis of Design |
| Revision | **0.2** (Working Draft) |
| Company | ADC Solutions |
| Discipline | Multi (CTRL / ELEC / MECH / IT / ENV / CYBER) |
| Prepared by | Scott Tomsu — Chief Engineer |
| Rev 0.2 prepared by | Mission Control per ERRATA-for-MGN-TEL-001-rev0_2.md — **pending Scott Tomsu approval** |
| Date | 2026-06-08 (Rev 0.2: 2026-06-10) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |
| Governs | The single telemetry plane that spans generation (MGN node), compute (NVL72 racks), cooling (Deschutes CDU + TCS), and facility/external context. **Productized as "Telemetry"** (ADC-OS-001, `products/Telemetry/`, ops/decisions/0002). |
| Parents | MGN-BOD-002 Rev 0.2 (10 MW node — power) · **Deschutes Redfish, AI Control & Four-Tier Reference, internal ADC document, Rev 1.3 (2026-06-10), `products/Telemetry/`** (compute + cooling) |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-08 | Initial working draft. Establishes Redfish (DMTF 2026.1 bundle, Specification v1.24.0) as the single north-bound data model for the whole stack. Extends the Deschutes Modbus→Redfish bridge pattern from the CDU to the power island. Five telemetry domains, four-class cadence model, cross-domain load-step correlation use case, compliance/run-hour telemetry. |
| 0.2 | 2026-06-10 | Errata applied: Redfish 2026.1 official date corrected to 2026-04-02; parent citation corrected to the internal ADC Rev 1.3 reference (not an OCP publication); architecture productized as "Telemetry" (decision 0002); §14 Phase 1 recorded as IMPLEMENTED (ADC-SYS-001 registry, executable twin, /redfish/v1 mockup, draft interop profile); TEL-001 pin instruction made unambiguous. Converted to Markdown as the governing format; Rev 0.1 docx retained as history. |

## §1 Purpose & Scope

This BOD defines one telemetry and observability plane for the company's AI-compute-on-gas platform. Today the program runs two monitoring worlds that do not talk to each other:

1. **Power** — the MGN node (MGN-BOD-002): Cat G3520H gensets, a grid-forming BESS, 4.16 kV paralleling switchgear, SCR/aftertreatment, step-up. These speak genset-controller, protection-relay, and PCS protocols.
2. **Compute + cooling** — the Deschutes CDU, the TCS rack loop, and the NVL72 racks (Deschutes reference). The CDU speaks Modbus; the racks speak Redfish natively.

**The thesis of this document:** these are not two systems that happen to share a site — they are one closed-loop machine. The reason the BESS exists at all (MGN-BOD-002 §5.3) is that a synchronized AI training swing throws a multi-megawatt coherent step at the bus faster than a lean-burn engine can take fuel; the BESS bridges the gap while the gensets ramp. That event starts in a GPU (compute domain), is absorbed by the BESS (power domain), is answered by the gensets (power domain), and shows up seconds later as a thermal transient in the CDU/TCS (cooling domain). You cannot see that event — let alone optimize or defend it — if generation telemetry and compute telemetry live on separate islands with unsynchronized clocks.

So the scope is the unifying layer: a common model (Redfish), a common time base, a common store, and a common analytics/ops surface, spanning generation → storage → distribution → compute → cooling → facility → external context.

**In scope:** node-level telemetry architecture and the campus rollup pattern; the protocol/normalization bridges; the Redfish service model; telemetry cadence classes; the cross-domain correlation requirement; compliance/merchant-ops telemetry; the open-source stack; OT/IT segmentation.

**Out of scope (carried elsewhere):** deterministic real-time control and protection logic (stays in the genset controllers, protection relays, BESS PCS, and CDU PLC — this document sits above those and never replaces them); detailed point lists / register maps (site CTRL packages); the compute block's internal cassette controls (cassette CTRL docs).

This BOD aligns the prior CTRL-001 (plant-master / dispatch platform) and CTRL-002 (dual-source engine controller abstraction) open items from MGN-BOD-002 into a single observability architecture; those items are subsumed here and tracked in §16. *(Rev 0.2: MGN-BOD-002 Rev 0.2 §11 now points here rather than carrying parallel copies.)*

## §2 Design Basis — Standards, Protocols & Redfish Currency

### §2.1 Redfish baseline — current as of this revision [L]

The previous bundle on hand was Redfish 2025.4 (January 2026). It has been superseded. This design is built on the current public release:

| Artifact | Identifier / Version | Notes |
|---|---|---|
| Redfish Specification | DSP0266 v1.24.0 | Adds push-based boot-image support; adds clientcontext query parameter (incremental collection reads). |
| Redfish Schema Bundle | DSP8010 2026.1 | 35 schema updates; cumulative — contains all current schema versions. |
| Redfish Message Registry Bundle | DSP8011 2026.1 | All standard registries. |
| Redfish Data Model Specification | DSP0268 2026.1 | Normative LongDescription + informative text in one document. |
| Redfish Resource & Schema Guide | DSP2046 2026.1 | Human-readable schema guide (the terminology basis for the Deschutes liquid-cooling map). |
| Redfish Interoperability Profiles Spec | DSP0272 1.10.0 | Profiles now carry a Priority term and ErrorResponse protocol requirements — used in §2.4. |

Release official document date **2026-04-02** *(Rev 0.2 correction — 2026-05-20 in Rev 0.1 was the announcement/download date)*; verified still latest as of 2026-06-10 (ops/research/2026-06-10-ocp-spec-currency.md); 2026.2 expected ~Aug 2026. **Action (TEL-001):** re-sync the schema/registry copies from the DMTF Redfish-Publications GitHub repo (/csdl, /json-schema, /openapi, /registries) to 2026.1 before any bridge or validator work; **pin = the commit hash or release tag of DMTF/Redfish-Publications at 2026.1** so a future release does not silently move the target.

### §2.2 Schema versions this design depends on (and why)

| Schema / registry | Version | What it gives us | Where used |
|---|---|---|---|
| Circuit | v1.9.0 | NominalVoltageType now includes DC400V and DC800V | Models the compute-block 800 VDC bus as a first-class circuit — §5, §6 |
| PowerDistribution | v1.6.0 | PowerDistributionRedundancy | The 4.16 kV paralleling bus and BESS-fed distribution — §4 |
| Redundancy | v1.7.0 | MinNumNeededForFaultTolerance (separate from group-minimum) | Encodes N+1 correctly: 4-running-of-5 gensets, N+1 pumps — §4, §6, §9 |
| PowerSupplyMetrics | v1.2.0 | PolyPhaseVoltage / CurrentAmps / PowerWatts / EnergykWh | 3-phase genset output and switchgear metering — §4 |
| CoolingUnit | v1.5.0 | CoolingUnitRedundancy | CDU and campus cooling redundancy — §6 |
| Sensor | v1.12.0 | PeakIntervalReading, LowestIntervalReading | Captures the transient peak/dip between polls during a load step — §9, §10 |
| LeakDetector | v1.6.0 | Voltage, CurrentAmps | Richer leak-zone telemetry on the TCS — §6 |
| Processor / Port | Proc v1.22.0, Port v1.18.0 | UALink support (scale-up GPU fabric) | NVL72 fabric health — §5 |
| Drive / Storage | Drive v1.22.0, Storage v1.21.0 | NVMe ActivePersonalities + freeze/unfreeze/revert | Rack-local NVMe state — §5 |
| Environmental (registry) | v1.5.0 | Dew point + coolant-connector pair-reversal messages | Condensation risk + supply/return cross-connect detection — §6, §7 |
| Power (registry) | v1.3.0 | Chassis power-limit messages | Power-cap / throttle events tied to thermal — §5, §10 |
| ManagerEvent (registry) | v1.0.0 | Manager state-change/alert messages | EMCP / PLC / BMC / plant-master health — §8 |
| TelemetryService / TelemetryData | (2025.2 line) | Metric-report definitions; bulk telemetry retrieval | The streaming mechanism — §8 |
| Aggregation (AggregationSource) | (2025.2) | Modbus support | Redfish federates Modbus sources directly — reduces custom bridge code, §4, §6, §12 |
| ResourceEvent | v1.5.0 | ResourceUnavailable / ResourceAvailable | Device drop/restore on the bus — §8 |

### §2.3 Field, control & compliance standards [L]

- **Field/control protocols:** Modbus/TCP (CDU PLC, genset controllers, BESS PCS — native); SAE J1939 (engine CAN: RPM, oil/coolant/exhaust, fault codes); DNP3 and/or IEC 61850 (protective relays, switchgear) — selection open (§16 RELAY-PROTO); SunSpec Modbus (BESS / any PV); BACnet/IP (BMS, HRS); MQTT / Sparkplug B (lightweight OT transport / store-and-forward).
- **IT-side observability:** OpenTelemetry / Prometheus for software and orchestration metrics — parallel to Redfish hardware telemetry; correlated, not merged.
- **Time synchronization:** IEEE 1588 PTP on the OT/telemetry LAN where transient correlation matters (target sub-millisecond); NTP-disciplined elsewhere. Without a common time base the §10 correlation is meaningless — requirement [L], method [O] (§16 TEL-TIME).
- **Power/interconnect:** IEEE 1547 (grid-parallel), IEEE 519 (harmonics), IEEE C37.118 (synchrophasor — optional, only if a fault/stability study calls for PMU-grade capture).
- **Compliance (drives §11):** 40 CFR 60 subpart JJJJ and 40 CFR 63 subpart ZZZZ. The air-permit envelope (MGN-BOD-002 §7) depends on measured run-hours and emissions per genset — compliance telemetry is a hard requirement, not a reporting convenience.
- **Security:** DMTF SPDM (device attestation, optional); Redfish HTTPS + role-based access control as the mandatory north-bound posture (§13).

### §2.4 Conformance posture [W]

Every bridge endpoint is validated against the 2026.1 schemas with the DMTF Redfish-Service-Validator (payloads) and Redfish-Protocol-Validator (HTTP behavior) before it is trusted by the AI/ops layer. A site Interoperability Profile (DSP0272 1.10.0) is authored to declare the mandatory resources/properties per asset class (genset, BESS, CDU, rack) and run via the Redfish-Interop-Validator — this turns "the bridge looks right" into a pass/fail gate and gives us a product-conformance artifact for customers and lenders. *(Rev 0.2: draft profile v0.1.0 exists — `system/twin/profile/adc-site-interop-profile-draft.json`.)*

## §3 Architecture Overview — One Plane, Five Domains, Six Layers

### §3.1 The five telemetry domains

| # | Domain | Assets | Native language | Brought into Redfish by |
|---|---|---|---|---|
| D1 | Power island (the gap this doc closes) | Gensets (G3520H / HSK78G), BESS PCS, 4.16 kV switchgear + relays, SCR/aftertreatment, step-up | Modbus, J1939, DNP3/61850, SunSpec | Modbus→Redfish bridge (extended) |
| D2 | Compute | NVL72 racks: GPU, mem, fabric, NVMe, cold-plate | Redfish (native) | BMC / rack manager |
| D3 | Cooling | Deschutes CDU, TCS rack loop, pumps/VFD/HX/valve/leak | Modbus (PLC) + TCS sensor gateway | Modbus→Redfish bridge (per Deschutes ref) |
| D4 | Facility | PDU, UPS, BMS, chiller/HRS, utility meter | BACnet, SNMP, Modbus, Redfish | Facility collectors |
| D5 | External | Weather, wet-bulb/dew-point, grid status, water | REST APIs / station feeds | Context collectors |

The unifying move: D2 is already Redfish. The Deschutes reference already bridges D3. This document applies the same bridge pattern to D1 — so the gensets and the GPUs end up in one Redfish namespace, on one clock, in one store. There is one bridge architecture, not two.

### §3.2 The six layers (single-line)

```
LAYER 5  ANALYTICS / OPS / COMPLIANCE   ["Telemetry" product, ADC-OS-001]
         AI engine (rule → PID → ML) · Grafana dashboards · Alerting
         Merchant-ops & grid-services · Compliance/run-hour historian · Digital twin
                    ▲ reads MetricReports / events     │ supervisory setpoints (PATCH) ▼
LAYER 4  DATA PLANE
         Time-series store (InfluxDB / TimescaleDB) · Stream bus (MQTT/Sparkplug B, optional Kafka)
LAYER 3  REDFISH SERVICE MODEL  ── the single north-bound API ──
         AggregationSource (federates nodes; Modbus-capable) · TelemetryService
         EventService (subscriptions) · one resource tree (§8)
                    ▲ HTTPS + RBAC
LAYER 2  PROTOCOL / NORMALIZATION  (the bridges — the controlled OT/IT boundary)
         Modbus·J1939·DNP3/61850·SunSpec·BACnet → Redfish │ BMCs pass through
                    ❰ bridges translate; they do NOT control ❱
LAYER 1  DEVICE CONTROLLERS / PROTECTION ── real-time control & SAFETY AUTHORITY (never usurped) ──
         Cat EMCP 4.x / AGC · Cummins PowerCommand · protective relays · BESS PCS
         CDU PLC (CompactLogix 5380) · rack BMCs
LAYER 0  PHYSICAL
         Engines · alternators · breakers · BESS cells · pumps · valves · HX · GPUs
         cold plates · towers · meters · weather
```

**Authority boundary (carried from the Deschutes reference and extended to power) [L]:** Layer 1 owns deterministic control and protection. Layer 2 bridges translate and expose. Layers 3–5 are supervisory — they read telemetry and may request setpoints, but every command is bounded by Layer-1 safety logic (relay protection, governor limits, PCS limits, PLC interlocks). Telemetry latency or loss must never be on the critical path of a protection action.

## §4 Domain D1 — Power-Island Telemetry (the new work)

This is the half the Deschutes reference did not cover. The honest engineering reality: Redfish's electrical schemas were designed for IT power distribution, not for prime-mover generation. So a reciprocating genset maps as a Chassis with an embedded Manager (the EMCP/PowerCommand controller), its electrical output modeled with standard Sensor/metrics resources and a paralleling-bus Circuit, and its engine parameters carried as linked Sensor resources + an Oem engine block. That is normal and acceptable — Redfish is the transport and the common namespace; the Oem extension carries what the standard schema does not yet name.

### §4.1 Genset — Cat G3520H (primary) / Cummins HSK78G (second source) [W]

| Signal group | Source protocol | Redfish mapping |
|---|---|---|
| Electrical output — per-phase V, A, kW, kVAr, kVA, PF, frequency | Modbus (controller) | Linked Sensor resources + PowerSupplyMetrics PolyPhase* pattern; aggregated on the 4.16 kV Circuit |
| Engine — RPM, jacket-water temp, oil pressure/temp, intake-manifold/turbo, exhaust temp (per bank), coolant level | J1939 + Modbus | Chassis/{genset}/Oem/Engine/* + linked Sensor resources |
| Run-state & lifecycle — run/stop, mode, start count, run-hours, load-factor history | Modbus | Oem/Engine/RunHours, Status, PowerState; run-hours mirrored to the compliance historian (§11) |
| Aftertreatment / SCR — NOx in/out, catalyst bed temp, DEF/urea level, dosing rate, O₂, ΔP across catalyst | Modbus (dosing controller) | Chassis/{genset}/Oem/Aftertreatment/* + linked Sensor; emissions mirrored to compliance historian |
| Faults / alarms | J1939 DTC + Modbus | EventService subscription; LogService; ManagerEvent registry |
| Breaker / synchronizing | Switchgear (Modbus/DNP3) | Circuit state; Oem/Sync (slip, phase angle, permissive) |

**Dual-source abstraction (was CTRL-002, now TEL-002):** the bridge presents an identical Redfish profile for a genset position regardless of whether a G3520H or an HSK78G occupies it. OEM register differences (EMCP vs PowerCommand) are resolved in the bridge driver, not exposed upward. Per MGN-BOD-002 §4.2, the genset count per node is set by the engine actually allocated (5 units for Cat, 7 for HSK78G at 60 Hz) — the telemetry model is count-agnostic and reads the as-built population from the plant master.

### §4.2 BESS — the bridge metric [L as a telemetry priority]

The 6 MW / 3 MWh grid-forming BESS (MGN-BOD-002 §5.3) is the single most important asset for the §10 correlation, because it is what physically couples the GPU step to the genset response. It must be sampled at the fast supervisory rate (Class B, §9) with peak/dip capture (Sensor.PeakIntervalReading / LowestIntervalReading).

| Signal | Redfish mapping |
|---|---|
| PCS real power ±P and reactive ±Q (4-quadrant) | Sensor (signed) on the BESS Circuit — the live picture of "how hard is the battery bridging right now" |
| State of charge (SoC), state of health (SoH) | Chassis/{bess}/Batteries/{id} (StateOfChargePercent, StateOfHealthPercent) |
| Cell/module/rack temperatures, balancing | Linked Sensor; Environmental |
| Grid-forming mode, V/Hz reference, droop/isochronous state | Oem/GridForming/* |
| Round-trip energy, throughput, cycle count | PolyPhaseEnergykWh + Oem lifecycle |

### §4.3 4.16 kV paralleling switchgear, protection & step-up [W]

- **Bus & feeders:** modeled as PowerDistribution with Circuit children; NominalVoltage set on each Circuit (4.16 kV AC here; DC400V/DC800V on the compute-block bus per §5/§6 using Circuit v1.9.0).
- **Protective relays:** DNP3 or IEC 61850 (RELAY-PROTO, §16). Relays remain the protection authority; Redfish receives status, trip events, and metering — not control. Where IEC 61850 is chosen, GOOSE/MMS stays on the protection LAN and a 61850→Redfish collector publishes status north-bound.
- **Redundancy:** the 4-running-of-5 firm-power configuration is encoded with Redundancy v1.7.0 — MinNumNeededForFaultTolerance carries the real N+1 number, distinct from the group minimum. Power-registry redundancy events fire on loss of N+1.
- **Island separation enforcement (site-specific) [L where applicable]:** at dual-utility sites (e.g., Cameron Street, per MGN-PROP-005 — Entergy and LUS never tied synchronously), the telemetry plane surfaces breaker and synchronizing status for both sources so the ops layer can continuously verify the two are not paralleled. Monitoring/alarm only; the interlock lives in relay/PLC logic, not in Redfish.
- **Step-up transformer:** winding/oil temperature, tap position, loading → linked Sensor resources.
- **Synchronous condenser (provisional, MGN-BOD-002 §5.4):** if the fault study adds one, its reactive output and rotor/stator temps mount as Sensor resources on the bus Circuit.

### §4.4 Plant master / dispatch [W]

The plant master controller (dispatch, load-share, BESS coordination, N+1 sequencing) is exposed as a Manager. Its dispatch and merchant-ops setpoints (target MW, BESS charge/discharge schedule, grid-services mode) are supervisory Control resources — the AI/ops layer reads and may request, the plant master arbitrates against engine and bus limits. *(Tracked as TEL-DISPATCH.)*

## §5 Domain D2 — Compute Telemetry (Tier 1)

Redfish-native via the rack BMC / rack manager. BMC firmware family is an OEM confirmation item per platform — do not assume AMI MegaRAC by name (TEL-BMC, §16).

| Signal | Redfish endpoint | Use |
|---|---|---|
| GPU junction temperature | /Chassis/{rack}/Thermal/Temperatures | Leading indicator of cooling demand (next 30–60 s) |
| GPU power per device | /Systems/{node}/Power/PowerControl (or EnvironmentMetrics) | The heat load delivered to the CDU and the electrical load the gensets/BESS must serve |
| Workload utilization | /Systems/{node}/Processors/{id} | Anticipate the ramp before temperature/power move |
| Memory temperature | /Chassis/{rack}/Thermal/Temperatures | Secondary thermal indicator |
| Cold-plate inlet/outlet (coolant) | /ThermalEquipment/CDUs/{cdu}/SecondaryCoolantConnectors/{rack}/{Supply,Return}TemperatureCelsius | Direct CDU-delivery feedback per rack |
| Residual fan speed | /Chassis/{rack}/Thermal/Fans | Air load not handled by liquid |
| Power-cap / throttle status | /Systems/{node}/Power/PowerControl/PowerLimit + Power-registry v1.3.0 messages | Know when compute is throttled for thermal/electrical reasons — a key cross-domain event |
| Scale-up fabric (UALink) | Port v1.18.0 / Processor v1.22.0 UALink properties | NVL72 GPU-to-GPU fabric health |
| NVMe state | Drive v1.22.0 / Storage v1.21.0 ActivePersonalities | Rack-local storage personality / freeze state |
| CXL dynamic capacity (where present) | MemoryExtent (2026.1), CXLLogicalDevice, MemoryChunks | Pooled-memory telemetry on CXL 3.2 platforms |

Software-layer observability (parallel track): GPU/job orchestration metrics ride OpenTelemetry/Prometheus and are correlated with the Redfish hardware telemetry on the common time base — not merged into Redfish. Hardware truth (Redfish) and workload truth (OTel) are two views of the same rack on one clock.

## §6 Domain D3 — Cooling Telemetry (Tier 2)

The CDU/TCS mapping is fully specified in the internal Deschutes Redfish/AI reference (Rev 1.3) and is not re-derived here. Summary of what this unified plane inherits:

- CDU → ThermalEquipment/CDUs/{id}; pumps (Pumps), VFD (SpeedControlPercent), HX, primary valve (PrimaryCoolantConnectors), reservoir, leak detection (LeakDetection/LeakDetectorGroups).
- TCS rack loop → SecondaryCoolantConnectors/{rack} + Oem/TCSInterface/* (branch flow, branch ΔT, end-of-line ΔP, balancing-valve position, coolant quality, filter ΔP). The TCS is CDU-layer (Tier 2), not external.
- N+1 pumps → CoolingUnit v1.5.0 CoolingUnitRedundancy; redundancy-loss events from the Environmental registry.
- **Commissioning & condensation safety (Environmental registry v1.5.0):** subscribe to coolant-connector pair-reversal messages (catches a supply/return cross-connection — a real and dangerous commissioning error) and dew-point messages (condensation risk, cross-referenced with §7 wet-bulb/dew-point context). These did not exist in the 2025.4 bundle and are a direct reason to be on 2026.1.
- Leak telemetry → LeakDetector v1.6.0 carries Voltage/CurrentAmps alongside detector state.
- Bridge → identical pattern to §4: CDU PLC (Modbus, CompactLogix 5380) + TCS sensor gateway (Modbus/BACnet/MQTT) normalized into Redfish. PLC remains safety authority.

## §7 Domains D4/D5 — Facility & External Context (Tiers 3/4)

- **D4 Facility:** PDUs (phase V/I, kW, harmonics → detect overload before breakers trip), UPS (SoC, runtime, bypass), generators as seen by the building (cross-checked against D1's deeper genset telemetry), BMS (room temp/RH, CRAC/CRAH, fire), chiller plant, utility meter (real/reactive power, demand, PF). Protocols: BACnet/IP, SNMP, Modbus, Redfish where available.
- **D5 External:** wet-bulb temperature is the single most important external metric — the physical floor on heat-rejection performance, propagating straight back into the CDU approach-temperature loop. Also dry-bulb, RH, dew point (cross-referenced with Environmental v1.5.0 dew-point events), wind, 24–72 h forecast, solar irradiance, grid status (behind-the-meter dispatch and grid-services), water availability. HRS equipment (cooling towers / dry / adiabatic coolers) is facility/HRS context, not TCS.
- Open-Meteo (no key) is the baseline weather source; a site weather station is added where forecast resolution is insufficient.

## §8 The Unifying Layer — Redfish Service Model

### §8.1 One service root, federated

Each node runs a Redfish service aggregator that federates its local domains; a campus-level aggregator federates the nodes using AggregationSource (Modbus-capable since the 2025.2 line — meaningfully reducing custom bridge code for the genset/CDU PLCs). Result: a single tree the AI/ops layer and dashboards query without per-vendor software.

```
/redfish/v1
├── /Chassis
│     ├── /Genset-1 … /Genset-5        (Oem/Engine, Oem/Aftertreatment)
│     ├── /BESS-1                       (Batteries/*, Oem/GridForming)
│     ├── /Switchgear-4kV               (links to PowerDistribution)
│     ├── /CDU-1                        (→ ThermalEquipment)
│     └── /Rack-01 … /Rack-NN           (Thermal, Fans, NetworkAdapters/UALink)
├── /PowerEquipment  ▸ /PowerDistribution/4kV-Bus
│     ├── /Circuits/*                   (NominalVoltage 4.16kV AC; DC800V on compute blocks)
│     └── /Redundancy                   (MinNumNeededForFaultTolerance = N+1)
├── /ThermalEquipment ▸ /CDUs/{id}      (Pumps, HX, Connectors, LeakDetection, Oem/TCSInterface)
├── /Systems          ▸ /{compute-node} (Processors, Memory, Power/PowerControl, Storage/NVMe)
├── /Managers         ▸ EMCP·PowerCommand·PLC·BMC·PlantMaster   (ManagerEvent)
├── /TelemetryService ▸ /MetricReportDefinitions/*  /MetricReports/*
└── /EventService     ▸ /Subscriptions/*  (alarms, redundancy-loss, leak, power-limit, pair-reversal)
```

*(Rev 0.2: this tree is implemented in simulation — 97-resource mockup at `system/twin/redfish/`, served read-only by `serve-redfish.ps1`.)*

### §8.2 Streaming, not just polling

- TelemetryService / MetricReportDefinitions define one report per cadence class (§9). Reports are pushed on interval or on-change to the data plane — this scales far better than polling thousands of properties.
- TelemetryData (bulk) pulls device-specific telemetry en masse without the BMC unpacking it.
- EventService subscriptions deliver asynchronous alarms/events (genset trip, leak, N+1 loss, chassis power-limit, coolant-pair reversal, ResourceUnavailable/ResourceAvailable).
- clientcontext (Spec v1.24.0) lets a poller fetch only collection members added since its last read — efficient for growing log/event collections.

## §9 Telemetry Cadence & Data Classes [L]

Generators and GPUs live on very different physics. Forcing one rate on everything either floods the store with redundant genset data or under-samples the GPU/BESS transient. Four classes (plus compliance):

| Class | Period | What | Where it lives | Into Redfish? |
|---|---|---|---|---|
| P — Protection / transient | < 20 ms (sub-cycle) | Relay protection, BESS grid-forming inner loop, governor; fault waveforms | Relays, PCS, DFR / fast historian | Event + post-event capture only. Never on the Redfish critical path. |
| A — Control | 100 ms – 1 s | CDU ΔP & approach PID; engine governor; genset load-share | PLC / EMCP / AGC | Polled/published ~1 s |
| B — Supervisory | 1 – 5 s | GPU temp/power/util, BESS ±P/±Q & SoC, genset kW/V/Hz, CDU state, TCS branch | The main telemetry plane | Yes — primary MetricReports |
| C — Contextual | 30 – 60 s | Weather/wet-bulb/dew-point, facility, emissions trend, fuel | Context collectors / BMS | Yes — slow MetricReports |
| D — Compliance / billing | 1 min – 1 h aggregates | Run-hours, NOx/CO/CO₂/HCHO, DEF use, fuel, energy, demand | Compliance/billing historian (§11) | Mirrored; immutable store |

**Transient capture (Class B refinement):** during a load step the true peak/dip can fall between two 1-second samples. Enable Sensor.PeakIntervalReading / LowestIntervalReading (v1.12.0) on the BESS ±P, bus frequency, genset kW, and GPU power sensors so the interval extremes are reported even when the instantaneous sample misses them.

**Common time base [L]:** all classes timestamp against a single PTP/NTP-disciplined clock (§2.3) so the §10 correlation holds. A genset-kW sample and the GPU-power sample that caused it must be placeable on the same millisecond-resolution timeline.

## §10 The Cross-Domain Correlation Use Case (why one plane)

This is the payoff. A single synchronized AI training step — the exact event MGN-BOD-002 §5.3 sizes the 6 MW PCS around — traced across the unified plane on one clock:

```
t-30s    GPU utilization begins climbing            D2  /Systems/.../Processors      ← AI sees it first
t-0      Collective-comm phase: coherent power step
         (up to ~5 MW across the pod per §5.3)      D2  /Systems/.../PowerControl    ← the CAUSE
t+0..1s  BESS injects +P to hold the bus            D1  BESS Circuit ±P, SoC dip     ← the BRIDGE
         (4-quadrant; absorbs on load rejection)    D1  Sensor.LowestIntervalReading (freq)
t+1..45s Gensets ramp fuel, kW rises,               D1  Genset PolyPhasePowerWatts   ← the RESPONSE
         BESS backs down as engines pick up         D1  bus frequency recovers
t+5..120s Rack heat reaches the CDU; secondary      D3  CDU SecondaryCoolant ΔT      ← the FOLLOWER
          ΔT and TCS branch flow respond            D3  pump ΔP / approach temp
          AI had already pre-positioned pump ΔP     (Deschutes Loop 1, driven by D2 util)
```

What this enables that two islands cannot:

- **Verify BESS sizing against reality** — measure the actual coherent step vs the 5 MW design assumption, the actual gas block-load ramp vs the ~45 s assumption, and the energy delivered across the bridge vs the ~0.06 MWh estimate. Right-size the next node's PCS/energy on data, not assumption.
- **Predictive cooling (Deschutes Loop 1)** — GPU utilization at t-30 s lets the AI raise pump ΔP and pre-position the primary valve before the thermal transient, using D2 to drive D3.
- **Protect the engines** — confirm the staged ramp is staying inside lean-burn block-load limits (no misfire/trip) by watching genset kW slope against the BESS discharge profile.
- **Demand-shape for merchant ops** — correlate the demand/grid-services signal (D4/D5) with controllable compute load to shave peaks.

*(Rev 0.2: this timeline runs today in simulation — `system/twin/`, registry-driven, reproducing the 5 MW peak inside the 6 MW PCS and the ~1% SoC dip.)*

## §11 Compliance & Merchant-Ops Telemetry [L]

This is a commercial-survival requirement, not a nicety. The whole platform economics rest on the synthetic-minor air permit (MGN-BOD-002 §7), and ENV-001 must size potential-to-emit on actual node count and measured standby run-hours — including the standby N+1 fleet. That data only exists if it is logged from day one.

| Telemetry | Source | Why |
|---|---|---|
| Run-hours & starts per genset | D1 Oem/Engine | PTE per subpart JJJJ/ZZZZ; standby-fleet run-hour accounting |
| NOx, CO, CO₂, formaldehyde (in/out where instrumented) | D1 Oem/Aftertreatment | NSPS / RICE NESHAP demonstration; SCR performance |
| DEF/urea consumption | D1 dosing controller | Aftertreatment availability; ENV-002 logistics |
| Fuel rate / gas quality (Wobbe/MN) | D1 + FUEL-001 metering | Heat-rate model; emissions factor inputs |
| Energy & demand (per node, campus) | D1 PolyPhaseEnergykWh, utility meter | Merchant settlement, grid-services, demand-charge optimization |

**Schema gap (honest):** Redfish has no native emissions schema. Emissions and run-hours are carried as Oem properties and mirrored into a dedicated, immutable compliance historian (Class D, §9) so the regulatory record is independent of the operational store's retention. Tracked as EMIS-OEM (§16).

## §12 Open-Source Stack [W]

| Function | Tool | Note |
|---|---|---|
| Redfish client | DMTF python-redfish-library | Read/write Redfish |
| Conformance | Redfish-Service/Protocol/Interop-Validators | Gate every bridge endpoint against 2026.1 + the site profile (§2.4) |
| Pre-hardware sim | DMTF Redfish-Mockup-Server | Build AI/dashboards before metal *(Rev 0.2: ADC twin mockup serves this role today)* |
| BMC reference | OpenBMC | Reference Redfish implementation |
| Modbus | pymodbus | CDU PLC, genset controllers, BESS |
| Protection protocols | opendnp3, libiec61850 | Relay/switchgear collectors (per RELAY-PROTO) |
| BESS / PV | pySunSpec2 | SunSpec Modbus models |
| Engine CAN | J1939 stack (python-can + J1939 layer) | Engine DTC/parameters |
| Bridge service | Python + FastAPI | Hosts Redfish endpoints; the controlled OT/IT boundary |
| Flow/no-code glue | Node-RED | Modbus↔Redfish↔MQTT↔DB wiring |
| Transport | Eclipse Mosquitto (MQTT) + Sparkplug B | Store-and-forward OT transport |
| Time-series store | InfluxDB or TimescaleDB | All classes; Class D to an immutable store |
| Dashboards | Grafana | Four-tier + power island in one view |
| Alerting | Grafana Alerting + SMTP/Slack | Operator notification |
| AI/ML | scikit-learn / TensorFlow / PyTorch | Rule → PID → LSTM/anomaly/RL/digital-twin |
| IT observability | OpenTelemetry / Prometheus | Workload metrics, correlated to Redfish |
| Weather | Open-Meteo | Wet-bulb/dew-point/forecast, no key |

**Leverage note:** because AggregationSource now speaks Modbus, some genset/CDU points can be federated by the Redfish aggregator directly rather than through bespoke bridge code — pilot this against one genset controller in the POC to quantify how much custom code it removes (TEL-AGG).

## §13 Security & Segmentation [L]

- **Purdue-style separation:** Layer-0/1 protection and control networks (relay GOOSE/MMS, governor, PCS inner loop, PLC I/O) are isolated from the telemetry/IT LAN. The Layer-2 bridges are the only controlled crossing point.
- **North-bound posture:** Redfish over HTTPS, RBAC, per-service credentials. No supervisory command may exceed a Layer-1 limit — protection relays, governor limits, PCS limits, and PLC interlocks are authoritative and reject out-of-bounds requests.
- **Attestation (optional):** DMTF SPDM for device identity/measurement on supported hardware.
- **Telemetry is not a control path:** loss or delay of the telemetry plane degrades observability and supervisory optimization only — it must never block or delay a protection action. Fail-safe is "local control continues, north-bound goes stale," never the reverse.

## §14 POC / Phasing [W]

Extends the Deschutes 6-phase POC to include the power island; reuse the Deschutes POC hardware (CompactLogix 5380, SPECK pumps, ABB VFDs, Belimo valve, leak rope, IT-load simulator, SBC/industrial PC).

1. **Phase 1 — Simulate.** *(Rev 0.2: IMPLEMENTED — ADC-SYS-001 registry, executable twin with §10 correlation dashboard, 97-resource /redfish/v1 mockup + read-only server, draft Interoperability Profile v0.1.0. All in `system/`.)*
2. **Phase 2 — Bridge (cooling).** Real CDU PLC over Modbus → Redfish on the SBC; validate endpoints.
3. **Phase 3 — Bridge (power).** Add a genset-controller emulation (or one real EMCP/PowerCommand) and a BESS PCS sim over Modbus/SunSpec → same Redfish service. Validate the PolyPhase + Redundancy + Battery mappings against 2026.1. Pilot AggregationSource Modbus here.
4. **Phase 4 — Correlate.** Drive the IT-load simulator to mimic a coherent step; confirm the unified timeline captures cause→bridge→response→follower (§10) on one clock. Tune PTP/NTP.
5. **Phase 5 — Tier 1 + External.** Connect a real rack BMC (Redfish) and the weather API; demonstrate predictive pump-ΔP pre-positioning from GPU utilization, and dew-point/wet-bulb pre-positioning.
6. **Phase 6 — ML + Compliance.** After 30+ days of unified data: train the LSTM/anomaly models; stand up the immutable compliance historian and produce a sample run-hour/emissions PTE extract for ENV-001.

## §15 Decision Ledger

**Locked [L]:** Redfish is the single north-bound model for all five domains; build on the 2026.1 bundle / Spec v1.24.0 · one bridge architecture, extended from the CDU to the power island · Layer-1 controllers retain real-time control & safety authority; Redfish/telemetry is supervisory only · four telemetry cadence classes + compliance class; protection/transient stays local · common PTP/NTP-disciplined time base is mandatory (method open) · compliance/run-hour/emissions telemetry is a hard requirement with a dedicated immutable historian · Redundancy v1.7.0 MinNumNeededForFaultTolerance encodes N+1 for gensets and pumps · conformance-gated bridges (validators + site Interoperability Profile) · TCS is Tier-2 (CDU layer); HRS/towers are facility context.

**Working [W]:** genset Oem property dictionary (engine + aftertreatment) · time-series store choice and stream-bus scope · campus aggregation topology and how far AggregationSource Modbus federation replaces custom bridge code · plant-master/dispatch product selection within this model.

**Open [O]:** protection-relay protocol DNP3 vs IEC 61850 (RELAY-PROTO) · time-sync method PTP vs NTP-discipline and where PMU/C37.118 capture is warranted (TEL-TIME) · BESS SunSpec/Modbus register map confirmation (TEL-BESS) · BMC firmware family per NVL72 platform (TEL-BMC) · emissions Oem schema + compliance-historian retention (EMIS-OEM).

## §16 Open Items

| ID | Discipline | Item | Gating input |
|---|---|---|---|
| TEL-001 | CTRL/IT | Re-sync schema/registry copies to 2026.1; **pin = commit hash or release tag of DMTF/Redfish-Publications at 2026.1** | DMTF Redfish-Publications repo |
| TEL-002 | CTRL | Author the genset Oem/Engine + Oem/Aftertreatment property dictionary | EMCP / PowerCommand register maps |
| RELAY-PROTO | ELEC | Choose protective-relay protocol (DNP3 vs IEC 61850) and the collector | Switchgear/relay vendor selection |
| TEL-TIME | CTRL | Time-sync architecture (PTP vs NTP) + correlation accuracy target | Network design; §10 accuracy need |
| TEL-BESS | ELEC | Confirm BESS SunSpec/Modbus map (±P/±Q signed, SoC/SoH, grid-forming state) | BESS/PCS vendor |
| TEL-BMC | IT | Confirm BMC firmware family + Redfish profile per NVL72 platform | NVIDIA/OEM submittal |
| EMIS-OEM | ENV/CTRL | Emissions Oem schema + immutable compliance historian + sample PTE extract | ENV-001 PTE method; analyzer instrumentation |
| TEL-PROFILE | CTRL | Site Redfish Interoperability Profile (genset/BESS/CDU/rack mandatory points) — *Rev 0.2: draft v0.1.0 exists, `system/twin/profile/`* | Asset list per node |
| TEL-STORE | IT | Time-series store + stream-bus selection and sizing | Point count per node × campus |
| TEL-AGG | CTRL/IT | Quantify AggregationSource Modbus federation vs custom bridge code | POC Phase 3 result |
| TEL-DISPATCH | CTRL | Fold plant-master/dispatch (was CTRL-001) into this model | Merchant-ops requirements |

---

*End MGN-TEL-001 Rev 0.2 — Working Draft. Built on Redfish 2026.1 /
Specification v1.24.0 (2026-04-02). Parents: MGN-BOD-002 Rev 0.2
(power) and the internal Deschutes Redfish/AI reference Rev 1.3
(compute + cooling). Markdown is the governing format from this
revision; the Rev 0.1 docx is retained as history. Subsequent revisions
carry tracked changes via git.*
