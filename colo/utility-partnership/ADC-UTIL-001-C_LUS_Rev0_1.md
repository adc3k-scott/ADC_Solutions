# ADC-UTIL-001-C — LUS Annex (Lafayette Utilities System)

| | |
|---|---|
| Document | ADC-UTIL-001-C — per-utility annex to [ADC-UTIL-001](ADC-UTIL-001_Rev0_1.md) |
| Counterparty | Lafayette Utilities System (LUS) — municipal utility of Lafayette Consolidated Government (electric, water, wastewater; LFT Fiber broadband) |
| Revision | **Rev 0.1 — APPROVED by Scott 2026-06-12**; working draft for the LUS session |
| Existing relationship hook | **Marlie Hub — Mission Control Node 0** (1201 SE Evangeline Thruway) is presumed-LUS service; the MHUB-OI-01 service inquiry (~0.9–1.1 MVA → 1.6–1.8 MVA) is the natural opener |

Revision history

| Rev | Date | Change |
|---|---|---|
| 0.1 | 2026-06-11 | First issue per decision 0008 |

Facts below are from ADC's LUS asset deep-dive
[W — partners/LUS/Lafayette Utilities System Asset Report.pdf
(primary sources: 2026 Consulting Engineer Report covering FY2025,
LCG/LUS official pages), reviewed 2026-06-11] unless tagged otherwise.

---

## 1. The LUS frame

LUS's own public record documents the stretched-thin thesis:

- **Electric system:** ~46 miles of transmission, **15 substations**,
  87 distribution circuits, **1,068 miles of 13.8 kV distribution**;
  generation = two local NG peakers (T.J. Labbé 2×48 MW LM6000,
  Hargis-Hébert) plus the Rodemacher Unit 2 position via LPPA.
- **Public capital list already includes:** Bonin redevelopment, Moss
  Street Substation, Ridge & Milton substations/transmission,
  **replacement of aged 230 kV structures**, **distribution
  automation**, feeder reconductoring.
- **Concentration risk** (per the CER-based analysis): the
  transmission/substation backbone, the two big water plants (with
  backup-power gaps and outdated PLC controls), downtown wastewater
  lift/collection, and the LFT Fiber headend.

A municipal utility with that capital list, a small transmission
footprint, and city-wide service obligations is the textbook
beneficiary of every program element — and of federal hazard-
mitigation money in particular.

## 2. Program elements, LUS-cut

| Element | LUS instance |
|---|---|
| 10 MW block | BTM node at a Lafayette site (the Cameron Street parcel itself may resolve to LUS territory — CAM-OI-03); node = dispatchable local resilience behind LUS's own distribution, additive load that brings its own generation |
| Drone inspection | 15 substations + 1,068 mi of 13.8 kV in a compact city footprint = dense dock coverage; **multi-utility bonus:** the same dock + telemetry plane can serve LUS water plants, lift stations, and LFT Fiber routes — one inspection program across four utility systems |
| Telemetry grid services | LUS owns its distribution and its SCADA decisions (no LPSC retail constraint); black-start/storm-restoration value and NWA deferral against the named capital items (Moss St, Ridge/Milton, reconductoring) are directly negotiable |
| Federal alignment | **FEMA BRIC** — LCG is the textbook applicant class and the FY24–25 $1B NOFO **closes 2026-07-23** (the near-term hook); **40101(d) via LDENR** round-2 RFPs (microgrids + critical infrastructure, resilience hubs); GRIP future rounds; PACE for any renewable/storage scope |

## 3. The Marlie Hub opener

ADC is already (presumptively) an LUS customer: **Mission Control
Node 0** at 1201 SE Evangeline Thruway needs a Phase-1 service
confirmation (~0.9–1.1 MVA, path to ~1.6–1.8 MVA at 16 racks —
MHUB-OI-01). The service inquiry and the partnership conversation are
the same meeting: ADC shows up as a growing local load that brings
its own platform, not as an out-of-state hyperscaler asking LUS to
find it 100 MW.

## 4. Working-session agenda

1. MHUB-OI-01 service confirmation (territory, transformer path,
   timeline for the 8-rack seed at Marlie Hub).
2. **BRIC FY24–25** — does LCG/LUS have an application in flight for
   the 2026-07-23 deadline, and does a microgrid/resilience-hub scope
   fit it (40101(d) round-2 as the parallel track).
3. CAM-OI-03 from the LUS side: is 2623 Cameron Street LUS retail
   territory?
4. Drone ops model (UTIL-OI-03) + the cross-utility inspection scope
   (electric + water + wastewater + fiber assets in one rotation).
5. NWA conversation: which named capital items (Moss St, Ridge/
   Milton, reconductoring) could a sited node defer or de-risk.
6. TEL-PROFILE counterpart + inspection data-delivery format.

## 5. Open items

| ID | Item |
|---|---|
| UTIL-OI-06 | LUS working session — this annex's execution item |
| MHUB-OI-01 | Marlie Hub service inquiry — same meeting, agenda item 1 |
| CAM-OI-03 | Cameron Street retail-territory check (LUS side) |
| UTIL-OI-01 | BRIC deadline 2026-07-23 — matrix refresh before the session |
