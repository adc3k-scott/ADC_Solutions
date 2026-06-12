# ADC-MHUB-001 — Marlie Hub Compute Scope
## Seed-Round Validation Deployment at the ADC Home Office — Current-Lineup Terms

**CONFIDENTIAL — Internal Engineering**

| Field | Value |
|---|---|
| Document | ADC-MHUB-001 |
| Title | Marlie Hub Compute Scope — Mission Control Node 0, POC / validation deployment definition |
| Revision | **0.2** — Issued for review, **pending Scott Tomsu approval** |
| Date | 2026-06-11 |
| Prepared by | Mission Control |
| Site | **Marlie Hub — Mission Control Node 0** — 1201 SE Evangeline Thruway, Lafayette, LA (site record: [marlie-hub.md](../marlie-hub.md)) |
| Closes | COLO-03 (on approval) |
| Parameter tags | [L] Locked · [W] Working · [O] Open |

## Revision History

| Rev | Date | Summary |
|---|---|---|
| 0.1 | 2026-06-11 | First issue per Scott's 2026-06-11 ruling: site = Marlie Hub exclusively, home office that supports compute, current product lineup only. Defines deployment unit, phasing, electrical/mechanical scope, building-fit survey, validation test plan, and seed budget structure. |
| 0.2 | 2026-06-11 | Per Scott's ruling: **seed/POC = 8 racks, scalable in place to 16** (row infrastructure built for the full reference cluster; 8 rack positions populated at seed); **Marlie Hub designated Mission Control Node 0** — the zeroth node of the fleet, hosting the Mission Control / Telemetry supervisory head-end. §2/§3/§4.1/§7/§8 updated; new design rule SCALE-1 and open item MHUB-OI-05. |

---

## §1 Purpose

Defines the seed-funded compute deployment at Marlie Hub — the ADC
Solutions home office, where the team is physically located — entirely
in **current-lineup terms**: ADC CDU (ADC-CDU-DES-BOM-001), Modular TCS
(ADC-MOD-TCS-001), HAC reference bay, 16-rack reference cluster
(ADC-CLU-BOM-001), Telemetry (MGN-TEL-001 / TEL-PROFILE). This document
is the basis for the seed budget, the validation claims ADC makes to
partners and customers, and the replication story: **what runs at
Marlie Hub is the product pattern that replicates at every N★ site.**

Scope principle (seed capital plan, [W]): **seed buys infrastructure,
not GPUs.** GPU rack hardware is Series A scope, after the
architecture is validated and a customer is signed. Validation
therefore uses thermal/electrical load emulation (§7), not IT.

## §2 Site Basis

| Field | Value | Tag | Source |
|---|---|---|---|
| Site | Marlie Hub, 1201 SE Evangeline Thruway, Lafayette, LA | [L] | Scott 2026-06-11 |
| Designation | **Mission Control Node 0** — the zeroth node of the ADC fleet: not a production N★ node, but the supervisory home where Mission Control (team + AI ops layer) and the Telemetry head-end physically live. Every future node reports here | [L] | Scott 2026-06-11 |
| Role | Home office that supports compute; ADC team office on site | [L] | Scott 2026-06-11 |
| Site control | Established (team physically on site); instrument/form to document | [W] | Scott 2026-06-11 |
| N★ relation | Sub-block / partial-block deployment per ADC-NSTAR-001 §5: clusters on utility AC, **no microgrid node** — the Marlie Hub pattern | [L] | ADC-NSTAR-001 Rev 0.2 §5 |
| Distinct from | Evangeline Distribution Hub, 1016 **SW** Evangeline Thruway (different site, different play) | [L] | site records |

**Mission Control Node 0 carries (in addition to the compute row):**
the Telemetry plane supervisory head-end — historians, the unified
store, TEL-PROFILE conformance tooling, and the ops/AI layer per
MGN-TEL-001 (supervisory only; Layer-1 safety authority stays in the
field controllers, always). Fleet sites (Trappey's, Cameron Street,
Willow Glen…) report into Node 0. [W — head-end sizing/hosting detail
rides TEL-STORE]

## §3 Deployment Unit and Phasing

**Seed/POC = 8 racks, scalable in place to 16.** [L — Scott 2026-06-11]

The engineering basis remains the **16-rack reference cluster**
(ADC-CLU-BOM-001 Rev 0.1, approved): 46-ft row, 4 HAC bays, one
end-fed 2 MW ADC CDU, 1,248 kW IT at the 78 kW/rack Deschutes basis.
The seed deployment populates **8 rack positions (2 HAC bays,
624 kW IT design)**, with the row built so the remaining 8 positions
are a populate-only expansion:

**Design rule SCALE-1 [L]:** all row-level infrastructure is installed
at seed for the full 16-rack cluster — TCS headers (full 46-ft run),
the 2 MW CDU, all 8 busducts and 4 RPPs, heat-rejection capacity
sized per MHUB-OI-02 for the 16-rack condition (or staged with a
defined add-on step). Scaling 8 → 16 adds HAC bays 3–4, rack TCS
branch kits, tap boxes/whips, and load — **no rework of headers,
CDU, electrical backbone, or heat-rejection primary**.

| Phase | Content | Capital | Gate |
|---|---|---|---|
| 0 | Site confirmation: utility service inquiry (MHUB-OI-01), building-fit survey (MAR-OI-01), heat-rejection selection (MHUB-OI-02) | Survey/eng only | This doc approved |
| 1 | Build the row per SCALE-1; populate **8 rack positions** (2 bays): HAC + TCS + CDU + E1–E5 + heat rejection + telemetry head-end (Node 0) | Seed | Phase 0 complete; RFQ returns priced |
| 2 | Validation campaign per §7 at the 8-rack condition — load-emulated, 30+ day unified-telemetry run; publishable validation data | Seed | Phase 1 commissioned |
| 3 | Scale to 16 (populate bays 3–4) and/or IT fill (GPU racks) | **Series A** — customer signed | Phase 2 exit criteria met |

Marlie Hub validates the product pattern and hosts Mission Control
Node 0 — it does not host production N★ blocks; production
commitments are whole blocks at other sites. [L]

## §4 Electrical Scope (utility AC, no node)

### §4.1 Service requirement

| Consumer | Phase 1–2 (8 racks, full-load test) | Phase 3 (16 racks) | Notes |
|---|---|---|---|
| IT-equivalent load (emulated at seed) | up to 624 kW | up to 1,248 kW | heater skids/load banks, staged — §7 |
| CDU | 74 kW | 74 kW | ADC-CDU-DES-BOM-001 (one CDU either way, SCALE-1) |
| Heat rejection + pumps | ~80–250 kW | ~150–400 kW | architecture-dependent (MHUB-OI-02; decision 0006 band) |
| House/office + Node 0 head-end + instrumentation | ~50 kW | ~50 kW | office + telemetry head-end + test gear |
| **Service planning envelope** | **~0.9–1.1 MVA** | **~1.6–1.8 MVA** | utility inquiry (MHUB-OI-01) quotes both conditions |

The MHUB-OI-01 utility inquiry requests the **Phase 1 service with a
defined upgrade path to the Phase 3 condition** (transformer sized for
16-rack day one [W], or utility-side staged — LUS's call). Validation
can begin at fractional load (single-bay, ~300 kW class) while service
work progresses — the test plan is staged accordingly (§7). [W]

### §4.2 Utility seam

- Serving utility: city-of-Lafayette address → **LUS presumed** [W];
  territory and available capacity confirmed at MHUB-OI-01 (SLEMCO
  possible at city margins — same check that flagged Cameron Street).
- Proposed seam: utility MV → **dedicated pad-mount transformer to
  415Y/240 V** → 4× RPP (sources A/B/C/D) per ADC-CLU-BOM-001 §3.2.
  Transformer ~2,000 kVA class [W]; catalog confirmation rides
  ELE-OI-05 (same 415Y/240 V unit question as the block seam).
- **Redundancy posture (validation scale):** the Deschutes upstream
  rule (UPS/gen redundancy ≥ feed redundancy, ELE-OI-02) applies to
  production IT. For load-emulated validation with no IT and no
  availability commitment, a single utility source with the 4-RPP /
  4-makes-3 white-space topology is sufficient — the failover *logic*
  is exactly what the test plan exercises (§7.3). Production IT at
  Marlie Hub (Phase 3) re-opens this posture. [W — MHUB-OI-04]

### §4.3 White space

Per ADC-CLU-BOM-001, unmodified: 8× 600 A busducts (4/side), 64
dual-outlet IEC 60309 32 A tap boxes, 4× RPP + aux panel, grounding
lot — bundles E1–E5, quantities in `products/Cluster/rfq/*.csv`,
supplier sheets via the RFQ machine. [L]

## §5 Mechanical Scope

- **CDU:** 1× ADC CDU package per ADC-CDU-DES-BOM-001 Rev 0.3 (M0
  roll-up). [L]
- **TCS:** 1× row kit, bundles B1–B9 per ADC-MOD-TCS-001 — subject to
  the standing TCS gates: HYDR-01 surge analysis **mandatory before
  B3a/B3b valve/actuator/accumulator POs** (SOW issued, firm pending),
  SUP-01/HAC-OI-01 LA-PE structural (SOW issued). Marlie Hub is the
  first physical instance — these gates land here first. [L]
- **HAC:** 1× 4-bay kit (M3 steel takeoff; HAC-OI-03 Gulf Coast
  sourcing; HAC-OI-05 Fusion geometry feeds fabrication drawings). [L]
- **Heat rejection (MHUB-OI-02, per decision 0006 — site-selectable):**
  single-cluster duty ≈ 1.35 MW. Candidates at this scale:
  | Option | Fit at Marlie Hub | Watch |
  |---|---|---|
  | Packaged closed-circuit evaporative fluid cooler (W32/W40 class, scaled) | City water/sewer available at an urban address; best PUE; matches the NSTAR basis | Water treatment program at small scale; siting/plume at an office property |
  | Dry cooler + small chiller trim | Zero process water; simplest O&M | Larger footprint/fan power per FWS-COOL-001 economics |
  Selection is a Phase 0 deliverable — drives the §4.1 service
  envelope and the yard/roof siting question in the building survey. [O]

## §6 Building Fit — survey checklist (MAR-OI-01, Phase 0)

The photo on record shows a small metal shop building; an addition or
alternate on-parcel structure is a live possibility. Survey must
capture, against the reference-cluster envelope:

1. Clear interior length ≥ 46 ft row + CDU at row end + service
   clearances (per HAC layout and CDU BOM service envelope).
2. Clear height for HAC Levels 2–4 (busduct + tray + TCS headers above
   racks) per HAC kit drawings.
3. Slab: rack + HAC point loads, CDU wet weight 6,900 lb, trenching/
   routing for TCS headers — input to the LA-PE structural SOW (D-scope
   already issued; Marlie Hub becomes its first site application).
4. Power entry: utility service route, transformer pad location,
   RPP wall/floor space.
5. Heat-rejection siting: yard or roof area, structural capacity,
   setbacks/noise toward neighbors (urban address).
6. Water (make-up + drain) if evaporative selected; domestic water
   service capacity.
7. Office coexistence: separation of compute hall from occupied
   office space (egress, noise, security).

## §7 Validation Test Plan (Phase 2)

No GPUs at seed — the row is validated at the **8-rack condition**
with **thermal load emulation on the TCS loop** (resistive heater
skids plumbed to the rack quick-disconnects, emulating 78 kW racks)
plus electrical load banks on the busway outlets. The 8→16 scale-up
(Phase 3) repeats 7.2–7.4 at the 16-rack condition as its
commissioning gate. Staged:

| Step | Test | Pass basis | Standing gate exercised |
|---|---|---|---|
| 7.1 | TCS fill/flush ≤ 24 h using the CDU as flushing rig | cleanliness spec per TCS BoD | CDU-01 (claim validated here) |
| 7.2 | CDU SAT: thermal-hydraulic curves 25/50/75/100% | per CDU validation plan | CDU-G9 |
| 7.3 | Electrical failover: drop each RPP source in turn at load — every rack spot keeps 3 of 4 feeds | no outlet loss; currents within §3.1 margins of ADC-CLU-BOM-001 | proves the 4-makes-3 claim |
| 7.4 | Thermal transient: step the heater skids to emulate a coherent load swing; capture TCS/CDU ride-through (~24 s TCS / ~40–50 s system basis) | ride-through ≥ basis values | CDU/TCS transient story |
| 7.5 | Leak/dew-point events: induced QD drip test, pair-reversal | detection + alarm routing per TEL | TCS leak architecture |
| 7.6 | Telemetry conformance: live bridge asserted against TEL-PROFILE v0.1.0 via `system/tools/check-interop-profile.ps1 -TwinRoot <live>` | PASS on mandatory points | TEL-PROFILE (bridge-vendor acceptance test, run for real) |
| 7.7 | 30+ day unified-data soak: one clock, one store, full cluster telemetry under cycling load | dataset complete; no protection action ever blocked by telemetry loss | MGN-TEL-001 §10 pattern at cluster scale |

**Exit criteria:** 7.1–7.7 passed and documented → the reference
cluster is a **validated, replicable product pattern**; validation
report becomes the supplier/customer-facing artifact and the Series A
technical basis. [W]

## §8 Seed Budget Structure (~$5M envelope [W])

No dollar line-items are stated until RFQ returns price them — the
budget is structured on the procurement machine that already exists.
Quantities live in the bundle CSVs; supplier sheets generate via
`build-rfq-sheets.ps1`.

| Category | Contents | Source of pricing |
|---|---|---|
| B1 White space electrical | E1 busway, E2 tap boxes, E3 RPPs, E5 grounding (E4 whips deferred to IT fill) | ops/rfq/sheets E1/E2/E3/E5 returns |
| B2 Mechanical | M0 roll-up: CDU package, TCS B1–B9, HAC 4-bay kit + M3 steel | CDU BOM / TCS BoD / M3 quotes (Stuart/Continental) |
| B3 Heat rejection | MHUB-OI-02 selection + installation | vendor quotes after Phase 0 selection |
| B4 Site & service | Utility service upgrade + transformer, slab/building modifications per survey, trenching | LUS engagement + GC estimate (in-house LA GC license) |
| B5 Validation equipment | Thermal heater skids (8× 78 kW class for the seed condition; staged subset acceptable), electrical load banks, instrumentation | rental-vs-buy trade at Phase 1 |
| B6 Engineering & compliance | LA-PE structural (SOW D1–D3), surge analysis (HYDR-01 SOW), commissioning | SOWs already issued — firm selection pending |
| B7 Contingency | — | % set at Phase 1 budget approval |

Re-derivation note: all line items derive from the current product
lineup only. [L — Scott 2026-06-11]

## §9 Open Items

| ID | Item | Gates |
|---|---|---|
| MHUB-OI-01 | Utility territory + service inquiry at 1201 SE Evangeline Thruway (LUS presumed; ~0.9–1.1 MVA Phase 1 with defined path to ~1.6–1.8 MVA at 16 racks; upgrade cost/schedule) | Phase 1 start; §4.1 envelope |
| MAR-OI-01 | Building-fit survey per §6 (pre-existing item, scoped here) — survey against the **full 16-rack row** per SCALE-1, not the 8-rack seed condition | Phase 1 start |
| MHUB-OI-02 | Heat-rejection selection per decision 0006 (evaporative vs dry+trim); state the 16-rack capacity plan — full-size day one vs defined add-on step | B3 procurement; §4.1 envelope |
| MHUB-OI-03 | Validation rig specification: heater-skid design (78 kW rack emulation at the QD interface, 8× for seed), load-bank plan, rental-vs-buy | Phase 2 test plan execution |
| MHUB-OI-04 | Redundancy posture for Phase 3 production IT at Marlie Hub (re-opens ELE-OI-02 upstream rule at this site) | any production IT commitment here |
| MHUB-OI-05 | 8→16 scale-up detail: which 2 bays populate at seed (CDU-end vs far-end — affects TCS branch balancing), tap-box/whip staging vs full install, and the Phase 3 commissioning re-test scope (§7 note) | Phase 1 layout release |

Standing platform gates that land at Marlie Hub first: HYDR-01 (surge,
before TCS valve POs), SUP-01/HAC-OI-01/CDU-G8 (LA-PE structural),
ELE-OI-01 (busway catalog), ELE-OI-05 (415Y transformer catalog),
LAYOUT-01 (end-fed confirmation → E1 footage).

---

*ADC-MHUB-001 Rev 0.2 — issued for review, pending Scott Tomsu
approval (8-rack seed scalable to 16; Mission Control Node 0 per
Scott's 2026-06-11 ruling). On approval, COLO-03 closes and Phase 0
(utility inquiry + building survey + heat-rejection selection) begins.*
