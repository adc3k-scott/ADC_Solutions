# 0007 — BESS coupling: AC-coupled 4.16 kV grid-forming stands; no 800 V DC system for IT exists yet

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** Accepted

## Decision

1. **The BESS remains AC-coupled, grid-forming, on the 4.16 kV node bus**
   per MGN-BOD-002 Rev 0.2 §5.2/§5.3 [L] — it forms the island bus,
   black-starts the node, and bridges the 5 MW coherent step. The locked
   microgrid design is unchanged.
2. **There is no 800 V DC distribution system for IT yet.** The
   DC-coupled / 800 V-class classification in the ESS-BOD-001 Rev 0.2
   drop is not executable with generally available equipment and is not
   to be treated as fact anywhere in the system (same ruling family as
   decision 0005, which dropped the 800 VDC cassette platform). DC
   coupling is recorded as a **watch item only** (ESS-BOD-001 D-12):
   re-evaluate at a future major revision if/when listed, shipping
   equipment exists.

## Context

The 2026-06-11 ESS drop classified the 6 MW / 3 MWh BESS as DC-coupled
to an 800 V-class bus serving IT, conflicting with the locked AC-coupled
grid-forming basis. Both documents sized the asset identically; only the
coupling axis conflicted. Scott's ruling 2026-06-11: AC stands; 800 V DC
for IT does not exist yet.

## Consequences

- **ESS-BOD-001 → Rev 0.3** (2026-06-11, issued pending approval):
  coupling axis re-stated AC (W-08, §2, §9), chemistry-table criterion
  generalized to battery-string voltage, Package 2 re-scoped from
  "PCS/DC-DC (DC-coupled)" to **4-quadrant grid-forming PCS at 4.16 kV**,
  E-2 reworded to battery-DC/PCS integration, new ledger entry D-12.
  All safety/siting/detection/gate/supplier content unchanged.
- **ESS-RFQ-001 → Rev 0.2** (2026-06-11): §1.1 and §3.1 re-cut AC;
  compliance-matrix row updated; **hold lifted** — releasable once
  Attachment A is filled from the selected site record and Scott
  approves the issue.
- MGN-BOD-002, ADC-TRAP-ELEC-001, and the node one-line are untouched.
- Registry: SYS-OI-13 resolves to this ruling (closes when Scott
  approves ESS-BOD-001 Rev 0.3); ess.json coupling parameter locks [L].
