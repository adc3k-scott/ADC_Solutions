# Trappey's legacy doc set — third-party product reference scan

- **Date:** 2026-06-11
- **Purpose:** removal/replacement checklist for the ADC-native
  Trappey's engineering package (decision
  [0003](../decisions/0003-trappeys-adc-native-reengineering.md)).
  Scott's rule: the new package uses **ADC products only** in every
  category where ADC has a product.
- **Scanned:** all 18 `.md` engineering docs in
  `gpu-learning-lab/adc3k-deploy/trappeys/` (ST-TRAP-BOD-001 Rev 0.6
  doc set, README index Rev 1.7). Counts are case-insensitive
  substring hits per file; treat as locators, not totals.

## A. REMOVE/REPLACE — ADC has the product

| Legacy reference | Hits (files:count) | ADC replacement |
|---|---|---|
| **CoolIT CHx2000 CDU** (C-03; "external CDU skid") | BOD:5, MASTER-ENG:14, THERMAL-BASIS:6, COOLING-TOWER:6, CHP-SCHEMATIC:5, Cassette-MASS:3, ELEC:1, README:2 | **ADC CDU** (ADC-CDU-DES-BOM-001 Rev 0.3) |
| **Boyd CDU** (pre-Rev-0.6 legacy, still cited in logs/history) | BOD:2, MASTER-ENG:2, THERMAL-BASIS:1, CTRL:1, README:4 | same — purge with CoolIT |
| **Cassette platform itself** (40 ft HC ISO NEMA 3R, internal 800 VDC busway, C-01..C-25; Cassette-MASS-001, Cassette-SIS-001 are whole docs) | pervasive — the architecture | **ADC Modular TCS + HAC reference bay + cluster pattern** (ADC-MOD-TCS-001, products/HAC/, ADC-CLU-BOM-001); compute hall, not containers |
| **Delta 660 kW in-row power racks** (R11–R15, 480 VAC→800 VDC; E-24/E-25) | Cassette-MASS:64, BOD:12, ELEC:12, MASTER-ENG:12, +6 files | **ADC cluster electrical pattern** (ADC-CLU-BOM-001: 415/240 Wye, busway + tap boxes + RPPs); 800 VDC conversion stage disappears with the cassette |
| **Cat CG260-16 @ 13.8 kV, 11×4 block architecture** (E-03..E-08; per-block 15 MVA step-down) | BOD:6, MASTER-ENG:15, ELEC:8, THERMAL-BASIS:9, +5 files | **n× MGN-BOD-002 10 MW nodes** (5× Cat G3520H @ 4.16 kV each, node BESS as grid-former). Cat as OEM is consistent — the model/voltage/topology changes. Node count for ~101 MW Stage 1 facility load: size in new package |
| **AMCL five-tier control + OPC-UA SCADA** (A-09; Trap-CTRL/CYBER/MODES/TAGS are largely this) | TAGS:57, CYBER:37, CTRL:26, MODES:25 (OPC-UA); AMCL in 9 files | **Telemetry** (ADC-OS-001, MGN-TEL-001, Redfish/TEL-PROFILE) |
| **NVIDIA Jetson AGX Orin cassette BMS** (C-06, 148 ch) | CYBER:67, CTRL:18, Cassette-SIS:17, MODES:10, +5 files | Telemetry plane / Redfish-conformant BMC per TEL-PROFILE (Jetson is the BMS controller, not compute payload) |
| **Munters DSS Pro dehumidification + exhaust-regen CHP path** (C-19/C-20, T-12/T-13: 5.5 MW Stage 1 slip-stream) | FIRE:29, MODES:21, MASTER-ENG:20, THERMAL-BASIS:19, CHP-SCHEMATIC:12, BOD:10, +8 files | No direct ADC product, but it is cassette-coupled: in a TCS/HAC hall the per-cassette regen path dies. Re-derive hall humidity control + CHP heat use in the new package; don't carry Munters by default |
| **Staubli hot-swap disconnects** (C-22, cassette-internal) | BOD:1, CHP-SCHEMATIC:1 | dies with the cassette; ICD ADC-ICD-001 governs CDU↔TCS connections |
| **GRC / Submer immersion** (C-25, deferred future rev) | BOD:2, MASTER-ENG:1 | drop — not in ADC stack |

## B. KEEP as vendor-neutral procurement — ADC has no product (re-validate in new package)

| Reference | Hits (top files) | Note |
|---|---|---|
| NVIDIA Vera Rubin NVL72 + QM9700 InfiniBand | Cassette-MASS:16 (NVL72), CTRL:5/CYBER:5 (QM9700) | compute payload — customer/IT side, stays |
| BESS: Hitachi AMPS PCS (E-11/E-12); shortlist Fluence, LG ES, Saft (§N) | BESS-001:16 (Hitachi), 7 (Fluence/Saft) | superseded by **MGN-BOD-002 node BESS** (grid-forming PCS, 6 MW/3 MWh per node) — block-level Hitachi coupling goes away; cell/PCS vendor = procurement within the node spec |
| First Solar Series 7, 2.05 MW rooftop (E-14..E-17) | SOLAR-001:14 | keep — no ADC product; re-validate coupling point against node architecture |
| Cooling towers: SPX/Marley, BAC, Evapco, Brentwood shortlist (T-05, §N) | 1 hit each in 5 files | keep — procurement; duty re-derives from ADC TCS numbers |
| Fire: Novec 1230 + VESDA (C-05) | FIRE:23 (Novec) | keep category; re-scope from cassette NFPA 2001 to hall-level suppression |

## C. Carries over untouched (site facts, not products)

Site identity (P-01/P-02), regulatory posture (R-01..R-10: LDEQ,
LPDES, Title V, SHPO, HTC 45%, ITEP, PILOT), buildings B1–B4 + slab +
yard (B-01..B-06), island-mode posture (E-01/E-02), naming rules
(N-01..N-03), C1 critical-path gates (§M), stakeholder map (§N).
Load targets (91.1/182.2 MW) carry as **targets** — the per-cassette
arithmetic behind them does not.

## Caveats

- `BAC` counts were contaminated by "BACnet" substring matches —
  tower shortlist taken from BOD §N text instead.
- `Delta` may include a few false positives (ΔT prose); Cassette-MASS
  count is dominated by the real product.
- G3520H already appears in THERMAL-BASIS:5 and ELEC:3 — the legacy
  set itself compared against the ADC node engine; useful seam for
  the rewrite.
