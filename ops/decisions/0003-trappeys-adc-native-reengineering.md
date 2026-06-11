# 0003 — Trappey's gets a new ADC-native engineering package; COLO-01 closed (different sites)

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** Accepted

## Decision

1. **COLO-01 closed:** Trappey's Compute Center and Cameron Street are
   **different sites**. The two site records in `colo/sites/` stay
   split.
2. ADC Solutions will **create a new engineering package for Trappey's
   using ADC products only**. The existing ST-TRAP doc set
   (`gpu-learning-lab/adc3k-deploy/trappeys/`, ~18 docs anchored on
   ST-TRAP-BOD-001 Rev 0.6) becomes **legacy reference input** — site
   facts, regulatory posture, and load targets carry over; third-party
   platform products do not. Example given: the CoolIT CHx2000 CDU
   will not be used — ADC builds its own CDU.

## Context

Imported 2026-06-11 (commit add39fc), the ST-TRAP package engineers the
site on a "Cassette" platform (40 ft ISO cassettes, internal 800 VDC,
CoolIT CDU, Munters dehumidification, Delta in-row racks, Jetson BMS,
Cat CG260-16 13.8 kV blocks, AMCL/OPC-UA controls). That predates and
diverges from the ADC product stack: ADC CDU
(ADC-CDU-DES-BOM-001), Modular TCS (ADC-MOD-TCS-001), HAC, 10 MW
Microgrid Node (MGN-BOD-002: 5× Cat G3520H @ 4.16 kV per node),
cluster electrical pattern (ADC-CLU-BOM-001), and Telemetry
(ADC-OS-001 / MGN-TEL-001 / TEL-PROFILE).

## Consequences

- Third-party product references in the legacy set are catalogued in
  `ops/research/2026-06-11-trappeys-third-party-product-scan.md` —
  the removal/replacement checklist for the new package.
- TRAP-OI-01 (site record) is resolved by this decision; the new open
  work is the ADC-native package itself (TRAP-OI-03 in the site
  record). TRAP-OI-02 (telemetry) folds into it: the new package uses
  Telemetry, not AMCL/Jetson/OPC-UA.
- The ST-TRAP set stays in gpu-learning-lab as reference; it is not
  imported into ADC_Solutions and must not be cited as governing.
- Vendor-neutral categories where ADC has no product (gensets inside
  the MGN node, BESS cells, solar, cooling towers, fire suppression,
  compute payload) remain procurement selections, re-validated in the
  new package.
