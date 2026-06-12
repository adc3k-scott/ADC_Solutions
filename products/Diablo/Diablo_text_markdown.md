# Building a Proof-of-Concept Diablo 400 (±400VDC) Power Rack from Today's Market: A Procurement Report

## TL;DR
- **You can build a credible PoC today, but it will be roughly 60% off-the-shelf and 40% custom/substituted.** The rack frame, AC input gear, DC-rated fuses/contactors, ground-fault monitors, busbar stock, BBUs and supercapacitor shelves all exist as orderable products; the one thing that does NOT exist as a verifiable catalog part is a fully Diablo-400-compliant ±400VDC AC/DC PSU/power shelf with the exact regulation/transient behavior — those are sampling or announced (H2 2026), not in distribution.
- **The ±400VDC/800VDC ecosystem is real but pre-production as of June 2026.** Delta, Lite-On, Flex, Vertiv, Eaton and ABB have all publicly shown or announced ±400V/800VDC power-rack hardware tied to OCP Diablo 400 and/or NVIDIA's 800VDC roadmap, but the headline rectifier/PSU portfolios are scheduled for H2 2026 release, and the spec itself is v0.7.0 — a pre-1.0 draft whose own tables are marked "to be updated in future revision."
- **The pragmatic PoC path:** buy a stock ORV3 rack frame, a stock AC PDU/busway tap-box, EV/BESS-grade DC fuses (Mersen/Bussmann 1000-1500VDC), EV-grade contactors (TE Kilovac/Gigavac, 800-1000VDC), a Bender insulation/ground-fault monitor, and either (a) partner directly with Delta/Lite-On/Flex for a sampling ±400V power shelf, or (b) substitute a standard 50V ORV3 shelf where the spec's lower-power/lower-voltage allowances permit, and custom-fabricate the 3-conductor vertical busbar and DC output cabling.

## Key Findings

1. **The spec is brand-new and still a draft.** Diablo 400 v0.7.0 is the current OCP base specification, following v0.5.2 (dated May 30, 2025; the v0.5 draft was opened for industry feedback at OCP EMEA in May 2025). Per OCP's own announcements, the specification — co-authored by Microsoft, Meta and Google — describes a disaggregated "sidecar" power rack "pushing power delivery from today's 48 volts direct current (VDC) within the rack to either +/-400 VDC or 800VDC," and is "designed to scale IT racks from 100 kilowatts up to 1 megawatt." Google's stated rationale (OCP EMEA 2025) is that the new architecture improves "end-to-end efficiency by ~3 percent while enabling the entire IT rack to be used for xPUs," and that "selecting 400 VDC as the nominal voltage allows us to leverage the supply chain established by electric vehicles."

2. **No vendor sells a turnkey, fully-compliant Diablo 400 rack yet.** What exists are (a) reference designs and sampling hardware from power vendors, and (b) a mature catalog of adjacent components (EV/BESS/solar-grade) that meet the ±400VDC electrical envelope because the spec deliberately targets the EV 400V-class supply chain.

3. **Production vs. announced status of the headline power vendors (June 2026):**
   - **Delta** — Most advanced public portfolio. At OCP 2025 it showed "±400VDC In-Row Power: Delivering up to 800VDC output...achieves up to 98% efficiency. Multiple racks can be connected in parallel to support IT loads up to 2.4MW, while active current sharing with droop control is enabled via inter-rack signaling," plus a 108kW HVDC/DC power shelf and a 72kW 2U BBU (UL9540A). At GTC 2026 (March 16, 2026) Delta went further, announcing "800 VDC In-Row 660kW Power Racks with a total of 480kW of embedded Battery Backup Units (BBU) and AC-DC efficiency up to 98%" — built from six 110kW power shelves each carrying an 80kW BBU, plus a newly developed 18.5kW AC/DC PSU. Status: shown/sampling, ramping.
   - **Lite-On** — 1MW Power Rack, 55kW MGX power shelf, 33kW BBU, 20kW Capacitor Shelf, and an 800V HVDC solution with NVIDIA (50V↔800V). Status: shown at COMPUTEX 2025 / OCP 2025.
   - **Flex (Flex Power Modules)** — Explicitly markets modules for both NVIDIA 800VDC and OCP ±400VDC "Diablo 400"; OCP-inspired power rack supporting ±400V. Status: announced/sampling.
   - **Vertiv** — Per its Oct 13, 2025 release, the "800 VDC power portfolio is planned to release in the second half of 2026, aligning to support the 2027 rollout of NVIDIA Rubin Ultra platforms," with designs including "centralized rectifiers, high-efficiency DC busways, and rack-level DC-DC converters." Status: announced, not yet shipping.
   - **Eaton** — 800VDC reference design with supercapacitor ride-through, ORV3 busbar, DC connectors, hot-aisle containment. Status: reference design.
   - **ABB** — supporting NVIDIA 800VDC; backs DG Matrix SST. Status: reference/announced.
   - **Advanced Energy** — ships ORV3 HPR 5.5kW PSU / 33kW shelves (48-50V), and is the interoperability partner named for "power management" in Diablo 400. Status: production but 48V, not ±400V.

4. **The spec deliberately leans on EV/BESS components**, which means the protection and interconnect layer (fuses, contactors, insulation monitors, connectors) is buyable today from mature suppliers — this is the strongest "off-the-shelf" story in the whole BoM.

5. **The single biggest verification gap:** the specific Amphenol FCI DC connector part numbers reportedly cited for the 100kW output cable (10183400-009LF, 10183401-009LF, 10183401-013LF, 10183400-015LF) could NOT be found on any distributor (Mouser, Digi-Key, Arrow, Avnet), on Amphenol's own sites, or on Octopart. No "Powermass" Amphenol family could be verified either. Treat these as pre-release/internal numbers, not orderable catalog parts.

## Details by Building Block

### 1. Rack Frame (Mechanical)
**Status: OFF-THE-SHELF (ORV3 frames) with custom modification needed for Diablo dimensions.**

Diablo 400 calls for ~2329mm (option to 2410mm) height, 600/711mm width, 1200-1219mm depth, 6000 lb (~2722 kg) load, Open Rack base, sliding shelves with blind-mate connectors, center-justified busbar, locking doors with intrusion detection, front-to-back airflow, fully air-cooled.

Commercially available ORV3 frames that form the closest base:
- **Rittal Open Rack V3 (ORV3)** — listed OCP product; Rittal co-contributed to the ORV3 base spec and is partnering with Siemens specifically on an OCP-based "sidecar" power rack that "consolidates power electronics in a dedicated rack that directly supplies nearby server racks."
- **Eaton ORV3 open rack (EORV49RU48B)** — 48OU, optional integrated busbar + power shelf, convertible 21"/19" rails.
- **Legrand OCP ORv3 Rack & Power** — bespoke configs to 5,000 lb, up to 54" deep / 31.5" wide / 48OU; 44OU vertical DC busbar in 400A/700A/1400A variants; supports >100kW per rack.
- **ATEN RC8000** — 44OU/48OU, 21" internal, static load 1,600 kg / dynamic 1,400 kg.
- **Cheval Group ORv3** — knock-down + welded, static 1,600 kg / dynamic 1,400 kg.
- **Emcor ORV3** (US-engineered), **Wiwynn/Quanta/Foxconn-Ingrasys** (hyperscale ODM, contact direct).

**Gap:** Standard ORV3 frames are rated ~1,600 kg static (~3,500 lb) — below the Diablo 6,000 lb target. Eaton markets a Heavy-Duty SmartRack supporting 5,000 lb static for AI. For 6,000 lb you will need a bespoke/reinforced frame from Rittal, Eaton, Legrand or an ODM. The center-justified 3-conductor busbar and blind-mate sliding shelves for PSU/BBU/CBU are also non-standard vs. the 48V ORV3 single-busbar layout and will require custom mechanical work.

### 2. AC Input / AC PDU / AC Interconnect
**Status: LARGELY OFF-THE-SHELF.**

Spec: 3-phase WYE 5-wire (3L+N+PE) or Delta 4-wire (3L+PE), nominal 480/415/400 Vrms ±10%, 50/60 Hz; AC PDU accepting up to 12× 200A cords, internal fuses, two-hole compression lugs or connectorized input; 200A whips (1/0 AWG single-conductor W-type or 3/0 AWG 4-conductor), 100A whips (2 AWG); tap-box/MTS busway connection.

- **Busway + tap-off boxes:** Starline Track Busway (T5/B250/B400/B800, to 1,250A; high-power line to 6,300A) is the field-proven data-center standard; third-party UL857 tap-off boxes (e.g., PDU Cables "Busway Solutions") are stock. Eaton and Vertiv (Powerbar iMPB) also supply busway. Note: Starline busway today is rated for AC (e.g., 600V US / 415V metric); a DC tap would be a custom/engineered application.
- **AC PDU:** Legrand/Starline 0U AC PDUs and ORv3 2RU/33kW AC-input power shelves accept 380-415V 3Φ-Y; these are production. A purpose-built 12×200A Diablo AC PDU is not a catalog item — expect to assemble from a custom panel + stock fuse blocks, or have an ODM build it.
- **Connectorized input — Amphenol SurLok / SurLok Plus:** Production, orderable (Mouser stocks the family; SLPPA25BSB is a 1kV/120A SurLok Plus plug). SurLok Plus is field-installable, IP67, 1000/1500VDC, 50-500A, crimp/screw/busbar termination, UL1977/TUV certified, R4 RADSOK contacts. This is the realistic quick-connect for both AC whips and DC. **Note:** the spec names "Amphenol SurLock quick-connect"; the actual product family is **SurLok / SurLok Plus**.
- **W-type oil-resistant cable (SO/SOO/W, 90°C):** standard from any industrial cable house.
- **Molex 1×4 ferrule connectors (Table 14/15):** not independently verified at part level; Molex does make ferrule/power terminal products — confirm with Molex direct.

### 3. AC/DC PSU and Power Shelf
**Status: SAMPLING / ANNOUNCED — the critical long-lead item. NOT in distribution.**

Spec: 1OU PSU modules in two cited form factors (Sol.1: L810×H40×W165mm; Sol.2: L954×H43×W134mm), 25-30 kW each (30kW@480VAC, then 27/26/25kW variants), 3-phase in, ±400VDC out (3-wire floating, galvanic isolation) or optional 2-wire 800VDC, hot-swappable, front-accessible. PF >0.95 <20% load / >0.99 ≥20%; THD <5% ≥30% load. Output regulation 410VDC no-load → 400VDC full-load (10V±0.5V droop), ±0.5%, ripple ±1%, transient ±3% with 3ms settling; dynamic steps to 140-180% TDP (175%<2ms, 180%<0.5ms, 150%<50ms), 1A/µs slew, to 10kHz step frequency; ≥20ms holdup at 100% load without energy storage (distributed holdup acceptable between the AC/DC PSU and downstream DC/DC converters). End-to-end rack efficiency >95%@20%, >97-98%@50%, >96.5-97%@100%. Power shelf to 2OU, 21-24" wide, droop + active current sharing, bus-clip connector with thermal sensor, optional control module (Microsoft RSCM 81.2×30×340.9mm; Google module 42×39.7×885mm).

Who is actually shipping/sampling ±400VDC / 800VDC OCP-style shelves/PSUs:
- **Delta** — 108kW HVDC/DC power shelf (six 18kW PSUs, up to 98.5%); ±400VDC In-Row Power up to 800VDC; an OCP internal presentation (July 9, 2025) describes an 18kW DC PSU / 100kW DC power shelf with ±400 to ±410VDC nominal. At GTC 2026, a new 18.5kW AC/DC PSU and 110kW shelves (with 80kW embedded BBU) in 660kW racks. **Closest match to the Diablo PSU; sampling, not catalog.**
- **Lite-On** — 55kW MGX power shelf, 1MW Power Rack, 800V HVDC (50V↔800V).
- **Flex Power Modules** — modules explicitly for ±400VDC Diablo 400 and 800VDC; OCP-inspired power rack.
- **Vertiv** — centralized rectifiers + rack DC-DC, H2 2026 release.
- **Advanced Energy** — production ORV3 HPR PSU/shelves but 48-50V (substitute-only).
- **Others named in the NVIDIA/OCP ecosystem:** Lead Wealth, Megmeet, Great Wall, Chicony, Compuware, Murata, MEAN WELL — varying maturity; most are 800VDC-roadmap, not shipping ±400V Diablo shelves. Silicon for these designs (Infineon, Navitas/GaN, onsemi, ROHM, TI, STMicroelectronics, MPS, Power Integrations) is sampling/production at the device level; ST has a validated 12kW board NVIDIA moved to production testing.

**Assessment:** This is the block you cannot simply order. For a PoC you either (a) sign an eval/sampling agreement with Delta, Lite-On or Flex for a ±400V shelf, or (b) substitute a production 50V ORV3 shelf (Delta 33kW/72kW, Advanced Energy 33kW, Eaton 18kW) and accept that you are demonstrating mechanical/architecture compliance, not the ±400V electrical envelope.

### 4. Power Shelf Control Module
**Status: CUSTOM / VENDOR-SPECIFIC.** The Microsoft RSCM and Google control modules are hyperscaler-internal. For a PoC, use an OpenBMC-based rack manager or the PSU vendor's own controller (e.g., Advanced Energy ORv3 PMC/PMI/PMM with Modbus/Redfish), which are production.

### 5. DC PDU / Output Protection & Control Module
**Status: ASSEMBLE FROM EV/BESS COMPONENTS (off-the-shelf parts, custom integration).**

Spec: up to 400kW per module, attaches to ±400/800VDC busbar, outputs at 50kW/63A or 100kW/125A per cable, physical on/off per output, LED indicators, fuses + relays for overcurrent, output voltage disconnect before unplug (no live contacts), per-cable ground-fault detector with voltage-balance detection for high-resistance midpoint grounding.

- **DC fuses (1000-1500VDC):** Mersen NH gBat (1000VDC NH1/NH2; 1500VDC NH1XL/2XL/3L, to 150kA, IEC 60269-7) and ABAT15C (1500VDC, 500-1250A); Eaton Bussmann XL (1500VDC) / NH (1000VDC) battery-storage and high-speed lines (UL DC-recognized 800VDC parts exist). All orderable.
- **Contactors / relays (800-1500VDC):** TE Kilovac (EV/aerospace, to 1000VDC/1000A; ECK 1000V / ECP 1500V industrial to 800A); Gigavac GX series (to 800VDC, cRUus); Sensata|Gigavac, Panasonic EV relays. Orderable, though Gigavac lead times are reportedly long post-Sensata acquisition.
- **Ground-fault / insulation monitoring (ungrounded/high-resistance DC):** Bender ISOMETER family — iso685 (to 1000VDC, IEC 61557-8), isoHR685W, isoES425 (energy storage, to 400VAC/DC), iso415R (SmartDetect, AC/DC ungrounded), iso1065. These directly satisfy the GFD/voltage-balance requirement. Littelfuse and ABB offer equivalents. Orderable.
- **Integrated DC PDU products at ±400/800VDC:** none verified as catalog items; Vertiv explicitly notes higher-current DC protection today is delivered via fuse-and-disconnect combinations because "the ecosystem for resettable [DC] breakers is" still maturing. Delta's SiC e-Fuse Module (<3µs cutoff) is a shown component, not yet catalog.

### 6. DC Busbar (vertical 3-conductor)
**Status: CUSTOM FABRICATION (from stock busbar vendors).**

Spec: vertical 3-conductor (+400, −400, Common), full rack height, 1.1 MW average capacity, air-cooled, touch-safe/concealed.

No vendor sells a 3-conductor ±400VDC ORV3 rack busbar as a catalog product. Existing ORV3 busbars (Legrand 400/700/1400A, Eaton, ATEN, Amphenol BarKlip BK1000HD to 1000A/contact, 2000A total) are single 48V conductors. Busbar fabricators — Methode Electronics, Rogers/ROLINX, Mersen, Storm Power Components, Amphenol, TE — produce laminated/custom busbars and bus clips and are the realistic route to a custom 3-conductor assembly. Eaton's 800VDC reference design and Delta's core-shell liquid-cooled busbar show the direction but are not orderable rack busbars. **For a PoC, custom-fabricate via Storm Power / Methode / Mersen with HiPot-tested layer-to-layer insulation and touch-safe covers.**

### 7. DC Output Cables / Connectors
**Status: PARTIAL — connector family exists, specific cited part numbers do NOT verify.**

Spec: ±400VDC 3-wire + PE + 2 sense (LMFB last-mate-first-break) pins, latching with switch interlock, 63-125A contacts. Cited Amphenol FCI numbers: 10183400-009LF / 10183401-009LF / 10183401-013LF / 10183400-015LF (100kW); Bizlink TBD for 96/100kW 2-wire 800V. Cables: 50kW/63A = 4×4AWG W-type; 100kW/125A = 4×1AWG W-type per NEC 310.60(C)(4) 65°C ambient.

- **The four cited Amphenol FCI part numbers could not be confirmed on any distributor, Amphenol's own sites, or Octopart.** The "10183xxx / -NNNLF" format is consistent with genuine Amphenol ICC numbering, but these exact numbers return nothing public, and no Amphenol "Powermass" family could be verified (closest real families: POWERSOK, PowerLok, SurLok Plus, Voltarius/HVDC, HVC2P, BarKlip). Treat as pre-release/internal.
- **Orderable alternatives that meet the 800V/125A envelope:** Amphenol SurLok Plus (1000/1500VDC, 50-500A, busbar-terminable, UL1977); Amphenol automotive HVC2P/HVC2P63 (800VDC, to 125A); Amphenol Aerospace HVDC/Voltarius (to 1000VDC/450A, RADSOK); TE, Molex, Staubli, Anderson Power, Positronic EV/industrial HV lines.
- **Bizlink** — confirmed NVIDIA 800VDC partner "developing" AC whips, busbars, power-shelf connectors and HVDC cables (announced Oct 14, 2025; COMPUTEX 2026 showcase). No specific 96/100kW 2-wire SKU/datasheet published yet.
- Cable (W-type, 90°C, 1-4 AWG) is stock from industrial cable houses; the LMFB sense pins + integrated interlock latch is the custom element.

### 8. Energy Storage (BBU / CBU)
**Status: OFF-THE-SHELF at 48V; ±400V-class is SAMPLING.**

Spec: BBU 45-90s backup at 100% load, 4OU, blind-mate; CBU capacitor bank option.

- **48V ORV3 BBUs (production):** Delta 72kW 2U BBU (UL9540A, 97.5%), Advanced Energy 18kW battery shelf, Analog Devices ORV3 BBU reference (MAX32625/ADBMS6948). LG Energy Solution, Samsung SDI, Panasonic supply cells. These are mature but 48V.
- **±400V/800V-class BBU:** Delta (GTC 2026) 110kW shelves with 80kW embedded BBU (480kW across a six-shelf 660kW rack); Infineon's BBU roadmap (announced March 2025) uses "modular 4kW Partial Power Converter cards that parallel to 12kW per unit at up to 99.5% peak efficiency." Sampling/announced.
- **Supercapacitor / CBU shelves:** Eaton XLHV (rack-mount, to 420kW); Delta Power Capacitance Shelf (1RU, EDLC+Li-ion, UL9540A, ~15kW for up to 5-10s); Skeleton Technologies GrapheneGPU (Curved Graphene supercap shelf); Lite-On 20kW Capacitor Shelf; Musashi. Several orderable/sampling — the strongest "available now" energy-storage option for transient buffering.

### 9. Management / Telemetry
**Status: OFF-THE-SHELF.** Spec recommends Redfish, allows Ethernet/CANbus/I2C/PMBus/Modbus. OpenBMC-based rack managers and vendor PMCs (Advanced Energy ORv3 PMC/PMI/PMM with Modbus daisy-chain and Redfish; Legrand controllers with Gigabit Ethernet + Redfish API) are production. Use these directly.

### 10. Safety / Compliance
**Status: PATH EXISTS but DC standards are still maturing — biggest regulatory risk.**

- **IEC/UL 62368-1** is the compliance path; ±400V keeps each rail within EV-mature 400V-class envelopes. **800VDC arc-flash, DC clearing curves, and PPE standards are NOT yet standardized** — Legrand/Starline note engineers must currently extrapolate from AC models, which may understate hazard; NEMA/UL working groups are active. This is a genuine PoC risk: budget for a custom safety case and an NRTL (UL, Intertek/ETL, TUV) field evaluation rather than a listed-product path.
- Leakage limits (3.5mA AC / 10mA DC), CISPR 32/35 Class A (≈ FCC/EN EMC), UL 9540/9540A/1973 for the ESS (Delta BBU/PCS already UL9540A), 10-40kA SCCR, UL-certified 90°C oil-resistant W/SO/SOO cable — all achievable with stock components.
- **High-resistance midpoint grounding + per-cable ground-fault detection with voltage-balance** is explicitly in the spec; Bender ISOMETERs satisfy it.

## Realistic PoC Bill of Materials: Buy vs. Build

| Block | Buy off-the-shelf today | Sampling/announced (engage vendor) | Must custom-build |
|---|---|---|---|
| Rack frame | ORV3 frame (Rittal/Eaton/Legrand/ATEN) | Heavy-duty 6,000 lb variant | 3-conductor busbar layout, blind-mate sliding shelves |
| AC PDU/interconnect | Starline busway + tap-box; SurLok Plus; W-cable; ORv3 AC PDU | 12×200A Diablo AC PDU (ODM) | Custom 12×200A panel |
| PSU / power shelf | (48V substitute: Delta/AE/Eaton) | ±400V shelf: Delta/Lite-On/Flex | — |
| DC busbar | Busbar stock (Storm/Methode/Mersen) | — | 3-conductor ±400V busbar |
| DC PDU/protection | Mersen/Bussmann DC fuses; TE Kilovac/Gigavac contactors; Bender GFD | Delta SiC e-Fuse | DC PDU integration |
| DC cables/connectors | SurLok Plus / HVC2P / Voltarius; W-cable | Bizlink HVDC cable; FCI Diablo connectors | LMFB sense + interlock latch |
| Energy storage | Eaton XLHV / Delta PCS / Skeleton supercap; 48V BBUs | ±400V BBU (Delta/Infineon) | — |
| Management | OpenBMC manager; AE PMC; Legrand controller | — | Integration |
| Safety | 62368-1 parts, Bender, UL9540A ESS | — | DC arc-flash safety case + NRTL field eval |

## Recommendations (Staged)

**Stage 1 — Architecture/mechanical PoC (buy now, ~4-8 weeks lead):** Order an ORV3 frame, Starline busway + tap-box, SurLok Plus connectors, Mersen/Bussmann DC fuses, TE/Gigavac contactors, a Bender iso685/isoES425 GFD, and a supercapacitor shelf (Eaton XLHV or Delta PCS). Custom-fabricate the 3-conductor busbar (Storm Power/Methode/Mersen). Validate mechanical fit, grounding scheme, protection coordination, and telemetry with an OpenBMC manager. Use a production 50V ORV3 power shelf as a stand-in to prove the disaggregated topology end-to-end.
*Threshold to advance:* successful HiPot/insulation test of the custom busbar at ≥2× working voltage, and a working high-resistance-midpoint GFD with voltage-balance alarm.

**Stage 2 — ±400V electrical PoC (engage vendors now, hardware H2 2026):** Sign sampling/eval agreements with Delta (108kW HVDC shelf / 18.5kW PSU / ±400V In-Row), Lite-On, or Flex for ±400VDC PSU/shelf hardware, and with Bizlink/Amphenol for the actual DC output connector once part numbers are released. Co-develop the DC PDU and LMFB output connector. Pull in Infineon/Delta ±400V BBU samples.
*Threshold to advance:* a shelf meeting the 410→400V droop, ±0.5% regulation, and 150-180% transient envelope on the bench.

**Stage 3 — Compliance/safety:** Engage an NRTL (UL/Intertek/TUV) early for a field evaluation and a DC arc-flash study, since 800VDC arc-flash standards are not yet codified. Confirm UL9540A on the ESS and CISPR 32/35 Class A EMC.

**Triggers that change the plan:** If a vendor (most likely Delta, given its GTC 2026 660kW rack) releases a catalog ±400V shelf + matching DC PDU + connector kit before your Stage 2, skip the custom DC PDU and buy the integrated set. If NVIDIA's monopolar 800V (2-wire) path wins your end-use, re-scope to the 800VDC design option (fewer conductors, simpler busbar, but loses the EV-400V-class component advantage on each rail).

## Caveats
- **The spec is a v0.7.0 draft** (pre-1.0); details (dimensions, connector tables, form factors) are explicitly marked "to be updated in future revision." Build to it knowing it will change.
- **Vendor "availability" is mostly forward-looking.** Delta/Lite-On/Flex hardware is shown/sampling; Vertiv's 800VDC portfolio is explicitly H2 2026; NVIDIA's monopolar 800V is, per SemiAnalysis, "air-cooled samples and production in mid-2026, and a liquid-cooled VR Ultra variant sampling in late-2026." Several statements quoted are announcements/roadmaps, not shipping confirmations.
- **The cited Amphenol FCI connector part numbers and the "Powermass" family are unverified** in any public catalog as of June 2026; do not design around them until Amphenol publishes them — use SurLok Plus / HVC2P / Voltarius as the orderable bridge.
- **800VDC arc-flash and DC protection standards are immature**; a PoC of this class needs a bespoke safety case and NRTL involvement, not an off-the-shelf listing. Even Vertiv (a DC-power incumbent) states higher-current DC protection at this voltage is currently delivered via fuse-and-disconnect, not resettable breakers.
- The spec permits both high-resistance and solid midpoint grounding; the GFD/voltage-balance requirement applies to the high-resistance scheme, which is the more likely PoC choice.
- Some efficiency/parallel-capacity figures (e.g., Delta "up to 98%," "2.4MW parallel") are vendor marketing claims from product showcases, not independently verified bench results.