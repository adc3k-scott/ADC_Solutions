# 0004 — N★ block topology: 5 MW IT + 10 MW microgrid node is the safe building block

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** Accepted (directive given 2026-06-11; engineering definition to be issued for approval)

## Decision

ADC's product set and site topology is the **N★ ("N-star") block**:

- The repeating unit pairs a **5 MW IT heat-load block** with a
  **10 MW microgrid node** (MGN-BOD-002, 10 MW firm 4-of-5).
- This pairing is the **safe building block** — sized so the node
  carries the IT load plus cooling/house load with engineering margin,
  and small enough to finance, permit, and commission incrementally.
- Sites scale as **N× independent stars**, not as one shared plant —
  consistent with the block-independence pattern already proven in the
  legacy Trappey's set ("Marlie-pattern block", ST-TRAP-BOD-001 §E)
  and the 11-independent-blocks topology.

## Context

- The 5 MW IT half now has an engineering basis in the repo:
  `colo/Heat_Rejection_5MW_IT.pdf` (Lafayette design wet-bulb 80.7 °F;
  W32/W40 closed-circuit evaporative fluid coolers + 15–25 % chiller
  trim; 5 MW block ≈ 1,700–1,950 GPM, ≈ 1,422 tons).
- The 10 MW half is MGN-BOD-002 Rev 0.2 (5× Cat G3520H, 4 running +
  1 N+1; 6 MW / 3 MWh grid-forming BESS).
- The IT fill of a 5 MW block can be expressed in ADC's two compute
  packagings: the 16-rack / 2 MW cluster (products/Cluster/) or the
  2.3 MW Pure-DC cassette (website white paper) — exact fill rule is
  an open engineering question, **not** decided here.
  *(Resolved 2026-06-11 by decision
  [0005](0005-no-cassettes-current-product-lineup.md): cassette
  dropped; fill = 4× reference cluster = 4,992 kW.)*

## Consequences

- The TRAP-OI-03 sizing study (handoff item 3) sizes Trappey's in N★
  blocks: n× (5 MW IT + 10 MW node) against the ~101 MW Stage-1
  facility load — not as one monolithic plant.
- Site records state capacity in N★ blocks where engineering has
  started; proposals derive node counts from the block, not ad hoc.
- A governing N★ definition document (block boundary, electrical and
  cooling interfaces, telemetry profile per block) should be issued as
  a Rev 0.1 for approval; until then this record is the only source.
- Open question carried to that document: 1 node powers 1 block's IT
  plus cooling/house — confirm the pairing ratio against PUE ≤ 1.05
  (cassette) vs reference-bay (TCS/HAC) cooling overheads.
  *(2026-06-11, decision 0005: cassette path dropped — the pairing
  ratio confirms against reference-bay overheads only, in
  ADC-NSTAR-001.)*
