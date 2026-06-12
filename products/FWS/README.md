# ADC Facility Water System (FWS) — Chillers & Heat Rejection

Facility-side cooling for the N★ block: everything from the
[CDU](../CDU/README.md) primary connections out to atmospheric heat
rejection — chillers, heat exchangers, fluid coolers / dry coolers,
pumps, economizer, and redundancy — sized for the **5 MW IT / 10 MW
node** design point and hardened for Louisiana Gulf Coast (ASHRAE 2A)
conditions.

## Two architectures, site-selectable — decision 0006 (Accepted 2026-06-11)

Per Scott's ruling
([0006](../../ops/decisions/0006-heat-rejection-architecture.md)),
**both heat-rejection architectures are retained as site-selectable
options** — maximum flexibility; neither supersedes the other. The
choice is made per site, driven by water availability/permitting:

| Option | Architecture | Profile |
|---|---|---|
| Evaporative + chiller trim | W32/W40 closed-circuit evaporative fluid coolers, 15–25% chiller trim (`colo/Heat_Rejection_5MW_IT.pdf` + [ADC-FAC-HRS-BOM-001](ADC-FAC-HRS-BOM-001_v0_1.md)) | Best PUE — the ADC-NSTAR-001 Rev 0.2 §4 basis (mech+CDU ≈1.10–1.14); consumes water |
| Zero-water dry-cooler + chiller plant | Trane CVHH/RTWD always-on, 54°C PG30 HR loop to N+2 dry coolers ([FWS-COOL-001](FWS-COOL-001_Rev0_2.md)) | No process water, wet-bulb-indifferent; mech ≈32% of IT peak / upper teens annualized |

The same ruling **purged the non-lineup 2.5 MW CDU model** from the
system: the only CDU is the ADC CDU (Deschutes basis, 2 MW / 500 GPM,
[ADC-CDU-DES-BOM-001](../CDU/ADC-CDU-DES-BOM-001_Rev0_3.md)), 4 per
block, one per reference cluster — FWS-COOL-001 Rev 0.2 carries the
re-cut.

## Documents

| Document | File | Status |
|---|---|---|
| FWS-COOL-001 — FWS (Cooling Side) BOD, Trane basis, **Rev 0.2** (2026-06-11) | [FWS-COOL-001_Rev0_2.md](FWS-COOL-001_Rev0_2.md) | **APPROVED by Scott 2026-06-12** — the **zero-water site option** (decision 0006); CDU basis = 4× ADC CDU |
| FWS-RFQ-M-001 — Water-Cooled Chillers RFQ, multi-vendor, **Rev 0.2** (2026-06-11) | [FWS-RFQ-M-001_Rev0_2.md](FWS-RFQ-M-001_Rev0_2.md) | Hold lifted by decision 0006 — issue at Scott's discretion when a site selects its architecture; re-check quantities against FWS-COOL-001 M-5 first |
| ADC-FAC-HRS-BOM-001 — Facility-side CDU→HRS BOM/BoD, Deschutes basis, **v0.1** (2026-05-19) | [ADC-FAC-HRS-BOM-001_v0_1.md](ADC-FAC-HRS-BOM-001_v0_1.md) | Reference — per-CDU (2 MW) packaging of the evaporative-first option |

## Open items

Registered in the unified register (`system/registry/open-items.json`):
**SYS-OI-12** (remaining work: ADC-NSTAR-001 Rev 0.3 adds the
dry-cooler alternate PUE band note, then closes) and **FWS-OI-01…04**
(vendor selection runs, adiabatic option, electrical coordination with
the BESS step envelope, telemetry mapping into MGN-TEL-001).
FWS-COOL-001 §11 carries the full per-discipline ledger (M-1…M-5,
E-1/E-2, C-1/C-2, S-1).
