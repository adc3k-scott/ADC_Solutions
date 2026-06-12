# Trappey's ADC-Native Engineering Package (TRAP-OI-03) — Index

**Phase 1 skeleton, issued 2026-06-11 for Scott's review.** Per decision
[0003](../../../ops/decisions/0003-trappeys-adc-native-reengineering.md)
this package re-engineers Trappey's on **ADC products only**; the
ST-TRAP doc set (`gpu-learning-lab/adc3k-deploy/trappeys/`, ~18 docs,
ST-TRAP-BOD-001 Rev 0.6) is legacy reference, never governing. Per
decision
[0004](../../../ops/decisions/0004-n-star-block-topology.md) the site
is sized in **N★ blocks** (5 MW IT + 10 MW MGN-BOD-002 node).

> **Doc-prefix note [W]:** docs here use the working prefix
> `ADC-TRAP-`. Final prefix follows the COMM-001 ruling; renaming is
> mechanical.

> **Phase gate:** skeleton **approved 2026-06-11** (Scott rulings via
> decision [0005](../../../ops/decisions/0005-no-cassettes-current-product-lineup.md):
> 19 blocks Stage 1 [L], fill = 4× reference cluster [L], no
> cassettes). The TBD docs below start on Scott's go, after
> ADC-NSTAR-001 settles the block definition they all reference.

## Doc tree

| Doc | Title | Status |
|---|---|---|
| ADC-TRAP-SIZE-001 | [N★ sizing study + hall concept](ADC-TRAP-SIZE-001_Rev0_2.md) | **Rev 0.2 APPROVED 2026-06-11** (rulings applied per decision 0005) |
| ADC-TRAP-ELEC-001 | [Node 4.16 kV bus → block RPP distribution (the SYS-OI-09 seam)](ADC-TRAP-ELEC-001_Rev0_1.md) | **Rev 0.1 APPROVED by Scott 2026-06-12** (SYS-OI-09 closed) |
| ADC-TRAP-THERM-001 | Heat rejection per block (Heat_Rejection_5MW_IT basis, W32/W40 + trim) + water balance | TBD |
| ADC-TRAP-TEL-001 | Site telemetry profile (MGN-TEL-001 §4.3 + TEL-PROFILE; replaces legacy AMCL/OPC-UA) | TBD |
| ADC-TRAP-ENV-001 | Air/water permitting strategy (minor-source envelope vs Title V; LPDES) | TBD |
| ADC-TRAP-CIVIL-001 | B1–B4 building mapping, structural assessment scope, yard layout | TBD |
| ADC-TRAP-GAS-001 | Gas supply, metering, contingency storage (carries legacy C1 gate) | TBD |
| ADC-TRAP-FIRE-001 | Hall-level fire protection (re-scoped from cassette NFPA 2001) | TBD |

## What carries over from the legacy set (scan §C)

Site identity (P-01/P-02), regulatory posture (R-01..R-10: LDEQ, LPDES,
Title V analysis, SHPO, HTC 45 %, ITEP, PILOT), buildings B1–B4 + slabs
+ yards (B-01..B-06), island-mode posture (E-01/E-02), naming rules
(N-01..N-03), C1 critical-path gates (§M), stakeholder map (§N).
**Load targets (91.1 / 182.2 MW IT) carry as targets** — the
per-cassette arithmetic behind them does not. Full map:
[third-party scan](../../../ops/research/2026-06-11-trappeys-third-party-product-scan.md).

## What is replaced (scan §A, condensed)

| Legacy | ADC replacement |
|---|---|
| CoolIT CHx2000 / Boyd CDU | ADC CDU (ADC-CDU-DES-BOM-001) |
| 40 ft ISO Cassette platform, internal 800 VDC | Modular TCS + HAC reference bays + cluster pattern — compute hall, not containers |
| Delta 660 kW in-row 480→800 VDC racks | ADC-CLU-BOM-001 (415/240 Wye busway, "4 makes 3") |
| Cat CG260-16 @ 13.8 kV, 11×4 blocks | n× MGN-BOD-002 nodes (5× Cat G3520H @ 4.16 kV, 10 MW firm 4-of-5) |
| AMCL five-tier + OPC-UA; Jetson cassette BMS | Telemetry (ADC-OS-001 / MGN-TEL-001 / TEL-PROFILE) |
| Munters DSS Pro + exhaust-regen CHP slip-stream | container-coupled — dies with the legacy platform; hall humidity + CHP heat use re-derived (SIZE-001 §5) |
| Block-coupled Hitachi AMPS BESS | node-internal grid-forming BESS (6 MW / 3 MWh per MGN-BOD-002) |
| Staubli hot-swaps, GRC/Submer immersion | dropped; ADC-ICD-001 governs CDU↔TCS |

Vendor-neutral procurement (NVL72 payload, solar, cooling towers, fire,
BESS cells) stays — re-validated per category in the TBD docs.

## Package open items

| ID | Item | Gates |
|---|---|---|
| ~~TRAP-OI-04~~ | **CLOSED 2026-06-11 (decision 0005):** Stage 1 = **19 blocks [L]** (95.0 MW IT); Full Build = 37 | — |
| TRAP-OI-05 | Permit envelope: 19 nodes sits at the edge of the MGN-BOD-002 §7 twenty-node minor-source claim; Full Build (37 nodes) cannot fit one envelope — strategy doc needed | ADC-TRAP-ENV-001 |
| TRAP-OI-06 | B3/B4 floor dimensions + structural data — hall fit in SIZE-001 §5 is unverified until plans/assessment exist (legacy B-07: no structural assessment commissioned) | ADC-TRAP-CIVIL-001 |
| ~~TRAP-OI-07~~ | **CLOSED 2026-06-11 (decision 0005):** N★ fill rule = **4× reference cluster [L]** (4,992 kW); locked in ADC-NSTAR-001 | — |

(TRAP-OI-03 itself stays open in the
[site record](../trappeys-compute-center.md) until this package
supersedes the legacy citations; legacy C1 gates — NVIDIA allocation,
Cat CSA, tower sizing, SHPO/LDEQ/ITEP, gas — carry into the TBD docs.)
