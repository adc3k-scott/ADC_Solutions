# ADC Facility Water System (FWS) — Chillers & Heat Rejection

Facility-side cooling for the N★ block: everything from the
[CDU](../CDU/README.md) primary connections out to atmospheric heat
rejection — chillers, heat exchangers, fluid coolers / dry coolers,
pumps, economizer, and redundancy — sized for the **5 MW IT / 10 MW
node** design point and hardened for Louisiana Gulf Coast (ASHRAE 2A)
conditions.

## ⚠ Architecture decision pending — decision 0006

This folder currently holds **two conflicting heat-rejection
architectures** for the same design point:

| Basis | Architecture | Where it lives |
|---|---|---|
| Evaporative + chiller trim | W32/W40 closed-circuit evaporative fluid coolers, 15–25% chiller trim; mech+CDU PUE ≈1.10–1.14 | `colo/Heat_Rejection_5MW_IT.pdf` (NSTAR Rev 0.2 §4 derivation) + [ADC-FAC-HRS-BOM-001](ADC-FAC-HRS-BOM-001_v0_1.md) (ranks evaporative #1 for Louisiana) |
| Zero-water dry cooler + chiller plant | Trane CVHH/RTWD chillers always-on, PG30 HR loop at 54°C to N+2 dry coolers (JCI RDG 402 lineage); mech ≈28% of IT peak, ≈15% annualized | [FWS-COOL-001](FWS-COOL-001_Rev0_1.md) |

`ops/decisions/0006-heat-rejection-architecture.md` resolves which is
the N★ standard. Until decided: **FWS-RFQ-M-001 is HELD — do not send
to vendors** (it quotes chillers sized for the dry-cooler architecture),
and the NSTAR Rev 0.2 PUE band stays as issued. FWS-COOL-001 §5.6 also
assumes 3× "CDU-2500" — whichever architecture wins must be re-cut to
the locked N★ basis of **4× 2 MW Deschutes CDUs** (1 per reference
cluster, ADC-NSTAR-001).

## Documents

| Document | File | Status |
|---|---|---|
| FWS-COOL-001 — FWS (Cooling Side) Basis of Design, Trane equipment basis, **Rev 0.1** (2026-06-11) | [FWS-COOL-001_Rev0_1.md](FWS-COOL-001_Rev0_1.md) | Draft for review — architecture subject to decision 0006 |
| FWS-RFQ-M-001 — Water-Cooled Chillers RFQ, multi-vendor, **Rev 0.2** (2026-06-11) | [FWS-RFQ-M-001_Rev0_2.md](FWS-RFQ-M-001_Rev0_2.md) | **HELD pending decision 0006** — do not issue |
| ADC-FAC-HRS-BOM-001 — Facility-side CDU→HRS BOM/BoD, Deschutes basis, **v0.1** (2026-05-19) | [ADC-FAC-HRS-BOM-001_v0_1.md](ADC-FAC-HRS-BOM-001_v0_1.md) | Reference — per-CDU (2 MW) packaging of the evaporative-first architecture |

## Open items

Registered in the unified register (`system/registry/open-items.json`):
**SYS-OI-12** (the 0006 architecture decision — gates RFQ release,
SYS-OI-10 closure, NSTAR Rev 0.3) and **FWS-OI-01…04** (vendor
selection runs, adiabatic option, electrical coordination with the BESS
step envelope, telemetry mapping into MGN-TEL-001). FWS-COOL-001 §11
carries the full per-discipline ledger (M-1…S-1).
