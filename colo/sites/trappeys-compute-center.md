# Trappey's Compute Center — Site Record

**Filled from ST-TRAP-BOD-001 Rev 0.6** (Basis of Design, 2026-04-23),
imported 2026-06-11. Per decision
[0003](../../ops/decisions/0003-trappeys-adc-native-reengineering.md)
the ST-TRAP package at `gpu-learning-lab/adc3k-deploy/trappeys/`
(~18 docs + README index Rev 1.7) is **legacy reference only** — a new
ADC-native engineering package will be created (TRAP-OI-03). Site
facts, regulatory posture, and load targets below carry over;
third-party platform products do not (see the
[third-party scan](../../ops/research/2026-06-11-trappeys-third-party-product-scan.md)).
Tags carry the BOD's own L/W/O status; source column cites the BOD
ledger ID.

> **Name note:** the engineering package calls the project **"Trappey's
> AI Center"**; the Telemetry reference title page says **"Trappey's
> Compute Center."** This record keeps the repo's existing slug; treat
> the names as the same project until Scott rules otherwise.

> **Platform divergence (resolved by decision 0003):** the legacy set
> engineers the site on its own **Cassette platform** (40 ft ISO
> cassettes, internal 800 VDC, CoolIT CHx2000 CDU) with Cat CG260-16
> gensets at 13.8 kV in 11 × 4 blocks — not the ADC product stack.
> Scott's ruling 2026-06-11: **re-engineer on ADC products only**
> (ADC CDU, Modular TCS, HAC, n× MGN-BOD-002 nodes, ADC-CLU-BOM-001
> electrical pattern, Telemetry). Scale (91.1 MW Stage 1) still far
> exceeds the MISSION §BL2 5–10 MW profile — carried as a target.

## Identity & status

| Field | Value | Tag | Source |
|---|---|---|---|
| Site name | Trappey's Compute Center (repo) / Trappey's AI Center (engineering pkg) | [W] | Telemetry reference title page; ST-TRAP-BOD-001 header |
| Play | Brownfield repurposing — adaptive reuse of historic cannery (scale exceeds BL2 profile, see flag above) | [W] | ST-TRAP-BOD-001 §A |
| Address / parcel | 22-acre Trappey's Cannery site, Vermilion River, Lafayette, LA | [L] | ST-TRAP-BOD-001 P-01 |
| Historic structures | 12 nationally registered | [L] | P-02 |
| Site control | [O] — not stated in BOD | [O] | — |
| Governing doc | ST-TRAP-BOD-001 Rev 0.6 (working draft; external repo) | [W] | doc header |
| Stage | diligence/proposal — engineering package in active development; C1 critical-path gates all open (NVIDIA allocation, Cat CSA, tower sizing, SHPO Part 1, LPDES + Title V pre-apps, ITEP, gas supply) | [W] | ST-TRAP-BOD-001 §M |
| Revenue model | Colocation only, base case; LUS sell-back excluded (future optionality) | [L] | P-09, P-10 |
| Identity vs Cameron Street (COLO-01) | **Different sites — CONFIRMED by Scott 2026-06-11 (decision 0003). COLO-01 CLOSED;** records stay split. | [L] | ops/decisions/0003 |

## Brownfield qualification checklist (MISSION.md §BL2)

| Criterion | Finding | Tag | Source |
|---|---|---|---|
| Prior large electrical consumption | Former cannery (industrial); consumption history not stated | [O] | — |
| Existing transmission access | Not required — BTM permanent island day one; LUS Pinhook interconnect optional future at LUS cost/schedule | [L] | E-01, E-02 |
| Existing substation / switching | n/a (island); per-block 13.8 kV→480 V transformers are new build | [L] | E-07, E-08 |
| Industrial zoning | Parish-level civil scope incl. historic district overlay; not yet documented | [O] | §H |
| On-prem natural gas piping | Supply OPEN — pipeline interconnect, metering, contingency storage; gates Block 1 energization (C1) | [O] | §K, §M |
| Local support for industrial use | LED (Secretary Bourgeois, Governor's office), SHPO, parish PILOT engagement underway | [W] | §N |

## Power

| Field | Value | Tag | Source |
|---|---|---|---|
| Serving utility | None — behind-the-meter permanent island from day one; no anti-islanding | [L] | E-01, E-18 |
| Dual-utility site? | No (island). LUS Pinhook = optional future feature only | [L] | E-02 |
| Target IT load | **Stage 1: 91.1 MW** (44 cassettes × 2,070 kW); **Full Build: 182.2 MW** (88 cassettes) | [L] | P-03, P-05 |
| Generation unit | Cat CG260-16 NG genset, 13.8 kV [W]; 44 units = 11 blocks × 4, N+1 at block | [L] | E-03, E-04, E-06 |
| Block pattern | Replicated Marlie-pattern block: 4 gensets paralleled at 13.8 kV → ~15 MVA step-down → 480 VAC block bus → 4 cassette feeds + BESS + solar inverters; no campus MV ring | [L] | E-07, E-08 |
| Node count (MGN-BOD-002) | n/a — cassette/block architecture, not MGN nodes (see platform-divergence flag) | [W] | §E |
| BESS | 39.6 MWh working (11 × 3.6 MWh), LiFePO4, AC-coupled at block 480 VAC via Hitachi AMPS PCS | [W] | E-10..E-13 |
| Solar | 2.05 MW First Solar Series 7, B1/B2 rooftops, AC-coupled via inverter | [L] | E-14..E-17 |
| GPU platform | NVIDIA Vera Rubin NVL72; 28,512 GPUs Stage 1 / 57,024 Full Build (allocation = gating variable, Open) | [W] | C-10, P-07, P-08, §A |
| Biggest technical risk | CG260-16 governor response in 24/7 island mode under AI dispatch; Cat CSA engagement = key external validation (C1) | [W] | §E, §M |

## Natural gas

| Field | Value | Tag | Source |
|---|---|---|---|
| Supply | OPEN — pipeline interconnect, metering, contingency storage not locked; **gates Block 1 energization** (C1) | [O] | §K, §M |
| On-prem piping condition | Not stated | [O] | — |

## Water

| Field | Value | Tag | Source |
|---|---|---|---|
| Heat rejection | Evaporative cooling tower field, primary sink: ~72.9 MW Stage 1 / ~145.7 MW Full Build; tower type (wet/hybrid/adiabatic) OPEN (T-05); no absorption chiller; Vermilion River thermal loop removed at Rev 0.6 | [L]/[O] | T-04, T-05, T-08 |
| Makeup source | OPEN — municipal vs on-site well vs Vermilion River intake (makeup only); consumption pending tower type lock (T-09) | [O] | §G |
| Discharge | LPDES permit required — cooling tower blowdown only | [L] | R-03 |

## Structure & compute hall

| Field | Value | Tag | Source |
|---|---|---|---|
| Buildings | B1/B2 historic restoration (NOC / partner hub / rooftop solar); B3 compute hall — 20 cassettes; B4 compute hall — 24 cassettes | [L] | B-01..B-04 |
| Yard | 42,000 sq ft rear slab (gensets + BESS); 28,000 sq ft infrastructure yard (cooling + SCR) | [L] | B-05, B-06 |
| Structural assessment | **Not commissioned for any building** — must precede any load placement on B1/B2 | [O] | B-07, §H |
| HAC / 100.5″ plane fit | n/a — compute lives in 40 ft HC ISO cassettes (NEMA 3R), not an ADC HAC bay | [W] | C-07..C-09 |

## Permitting & environmental

| Field | Value | Tag | Source |
|---|---|---|---|
| Air | Title V triggered at 44-genset scale; SCR for NOx in infrastructure yard; LDEQ pre-application is C1 | [W] | R-04, §B, §M |
| Water | LDEQ thermal limits 5°F rise / 90°F absolute; LPDES (blowdown) pre-application is C1 | [L] | R-01..R-03 |
| Historic | SHPO Part 1 prepared **not filed** (C1, before any activity triggering review); Part 2 scope TBD; HTC stack 45% (Fed 20% + LA 25%) | [O]/[L] | R-05..R-07 |
| Incentives | LA ITEP filed before construction (C1); Parish PILOT in place of HB 827 (<$200M threshold) | [W]/[L] | R-08, R-09 |
| Naming constraints | External docs use "Scott Tomsu" as project/company name; FM Bank / Farmers Merchants Bank / Mark Sibley excluded from all materials | [L] | N-01, N-03 |

## Telemetry site-specifics (MGN-TEL-001 §4.3 / TEL-PROFILE)

| Field | Value | Tag | Source |
|---|---|---|---|
| Site control stack | AMCL five-tier (L0 field → L1 block PLC → L2 SCADA/OPC-UA → L3 AI dispatch → L4 HMI + IEC 62443); cassette BMS = Jetson AGX Orin, 148 ch × 44 ≈ 6,500 points Stage 1 | [W] | A-09, §I |
| Relation to ADC Telemetry / TEL-PROFILE | Not established — the ST-TRAP doc set predates the Telemetry product naming; mapping AMCL/SCADA points to the Redfish interop profile is open (TRAP-OI-02) | [O] | — |

## Site open items

| ID | Item | Gates |
|---|---|---|
| ~~COLO-01~~ | **CLOSED 2026-06-11** — different sites, confirmed (decision 0003) | — |
| ~~TRAP-OI-01~~ | **RESOLVED 2026-06-11 by decision 0003** — re-engineer ADC-native; ST-TRAP set = legacy reference, stays in gpu-learning-lab | — |
| ~~TRAP-OI-02~~ | **FOLDED into TRAP-OI-03** — new package uses Telemetry, not AMCL/Jetson/OPC-UA | — |
| TRAP-OI-03 | **Create the ADC-native Trappey's engineering package** (ADC CDU, Modular TCS, HAC, n× MGN-BOD-002 nodes, ADC-CLU-BOM-001 pattern, Telemetry/TEL-PROFILE). Removal/replacement checklist: [third-party scan](../../ops/research/2026-06-11-trappeys-third-party-product-scan.md). Carry-over: site facts, regulatory posture, load targets per scan §C | all site engineering; supersedes legacy ST-TRAP citations |

(C1 critical-path engineering gates — NVIDIA allocation, Cat CSA, tower
sizing, SHPO/LDEQ/ITEP filings, gas lock — are tracked in
ST-TRAP-BOD-001 §M, not duplicated here.)

## Source documents

| Document | Location | Status |
|---|---|---|
| ST-TRAP-BOD-001 Rev 0.6 — Basis of Design (source of the facts above) | `gpu-learning-lab/adc3k-deploy/trappeys/TRAP-BOD-001_Rev0.6.md` (external repo) | **Legacy reference per decision 0003** — facts imported 2026-06-11; not governing |
| ST-TRAP-MASTER-ENG-001 Rev 0.4 + ~16 sibling docs (ELEC, THERMAL-BASIS, COOLING-TOWER, BESS, SOLAR, CTRL, CYBER, FIRE, MODES, TAGS, Cassette-MASS/SIS…) | same folder; indexed by its README Rev 1.7 | Legacy reference — superseded by TRAP-OI-03 package when issued |
| Deschutes Redfish/AI Reference Rev 1.3 (title page names the site) | [products/Telemetry/](../../products/Telemetry/Deschutes_Redfish_AI_Control_Reference_TCS_Technology_Cooling_System.docx.md) | name only |
| Investor/gallery HTML pages | [colo/Trappey's Compute Center/](../Trappey's%20Compute%20Center/) | dropped 2026-06-11, untracked; marketing, not engineering source |
