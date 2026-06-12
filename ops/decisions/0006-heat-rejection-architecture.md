# 0006 — N★ block heat rejection: both architectures retained, site-selectable; non-lineup CDU model purged

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** Accepted

## Decision

1. **Maximum flexibility: both heat-rejection architectures are retained
   as site-selectable options under the FWS product.** Neither
   supersedes the other:
   - **Evaporative + chiller trim** (W32/W40 closed-circuit fluid
     coolers, 15–25% trim — `colo/Heat_Rejection_5MW_IT.pdf`,
     ADC-FAC-HRS-BOM-001): the basis of the ADC-NSTAR-001 Rev 0.2 §4
     PUE derivation (mech+CDU ≈1.10–1.14). Best PUE; consumes water.
   - **Zero-water dry-cooler + chiller plant** (FWS-COOL-001): for
     water-constrained sites; higher mechanical overhead, no process
     water, indifferent to wet bulb.
   The architecture choice is made per site in the site record, driven
   by water availability/permitting; NSTAR carries the evaporative
   numbers as its stated basis with the dry-cooler variant noted as the
   alternate band (NSTAR Rev 0.3 adds the note — SYS-OI-12 remainder).
2. **The 2.5 MW CDU model named in the FWS-COOL-001 Rev 0.1 drop is not
   an ADC product and is removed from the system — its model name is not
   to be referenced anywhere.** The only CDU in the lineup is the
   ADC CDU (OCP Deschutes basis, 2 MW / 500 GPM,
   ADC-CDU-DES-BOM-001); the N★ block basis is **4× ADC CDU, one per
   16-rack reference cluster** (decisions 0004/0005, ADC-NSTAR-001).
   Executed at FWS-COOL-001 Rev 0.2 (purge + §5.6/§5.8/§7 re-cut).

## Context

The 2026-06-11 drop introduced FWS-COOL-001 Rev 0.1 (Trane basis,
zero-water dry coolers, JCI RDG 402 lineage), which conflicted with the
issued NSTAR PUE basis (evaporative + trim) and assumed a 3-unit fleet
of a 2.5 MW CDU model outside the lineup. Scott's ruling: keep both
architectures for flexibility; purge the non-lineup CDU model entirely.

## Consequences

- **FWS-COOL-001 → Rev 0.2** (2026-06-11): CDU basis re-cut to 4× ADC
  CDU (power budget now carries 4×74 kW = 0.30 MW CDU draw; node
  design-day total ≈6.9 MW; mech ≈32% peak), non-lineup model purged,
  new open item M-5 (block load reconciliation vs ADC-CLU-BOM-001).
- **FWS-RFQ-M-001 Rev 0.2 hold lifted by this ruling** in principle —
  it is the chiller RFQ for the dry-cooler-plant option (or trim duty);
  issue at Scott's discretion when a site selects its architecture.
  Quantities re-check against M-5 before release.
- **ADC-NSTAR-001 Rev 0.3** (when next revised): states the evaporative
  basis explicitly and adds the dry-cooler alternate PUE band.
- Site records gain an architecture-selection line (water availability
  is the driver); registry SYS-OI-12 tracks the NSTAR note as the
  remaining work, then closes.
