# 0005 — No cassettes: the current product lineup is the only platform

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** Accepted

## Decision

1. **The Pure-DC cassette (40-ft ISO container, 2.3 MW, 800 VDC — the
   April 2026 white paper product) is dropped from the ADC product
   set.** No forward engineering, proposal, or site plan uses
   cassettes. Cassette language is **removed wherever encountered**;
   historical records (legacy ST-TRAP descriptions, research notes,
   decision records) keep descriptive references marked superseded.
2. ADC builds on the **current product lineup only**: ADC CDU
   (ADC-CDU-DES-BOM-001), Modular TCS (ADC-MOD-TCS-001), HAC reference
   bay, 10 MW Microgrid Node (MGN-BOD-002), 16-rack reference cluster
   (ADC-CLU-BOM-001), Telemetry (ADC-OS-001 / MGN-TEL-001 /
   TEL-PROFILE).
3. With the cassette gone, Scott accepts the ADC-TRAP-SIZE-001 Rev 0.1
   recommendations as rulings:
   - **N★ fill rule [L]: one 5 MW IT block = 4× reference cluster**
     (4 × 1,248 kW = 4,992 kW). Resolves the open question in decision
     0004 and TRAP-OI-07.
   - **Trappey's Stage 1 = 19 N★ blocks [L]** (95.0 MW IT; 37 blocks
     Full Build). Closes TRAP-OI-04.

## Context

Decision 0003 removed the *third-party* ST-TRAP cassette platform but
left the ADC Pure-DC cassette (white paper, sent to Ornn 2026-04-10) as
a product; decision 0004 carried "cluster vs cassette" as the open N★
fill question. ADC-TRAP-SIZE-001 then showed the cluster fills the 5 MW
block almost exactly (0.16 % slack) while the cassette does not divide
(2.17×). Scott's ruling 2026-06-11 ends the dual-packaging question:
clusters only.

## Consequences

- **Governing N★ doc** (ADC-NSTAR-001 Rev 0.1, `products/NStar/`)
  issued with the fill rule locked — tracked as SYS-OI-08 until
  approved.
- **ADC-TRAP-SIZE-001 → Rev 0.2**: 19 blocks [L], 4-cluster fill [L],
  cassette comparisons removed; TRAP-OI-04/-07 closed.
- **MARLIE 1 re-scopes**: the seed POC was framed as "first 3
  cassettes" (Ornn thread); the POC unit is now the reference cluster.
  Seed budget line-items (Boyd/Eaton CDU, Munters, 800 VDC, Fibrebond
  manufacturing) all re-derive — COLO-03 scope doc carries it.
- **Website/marketing debt**: the ADC Pure DC AI Factory white paper
  and the Trappey's investor HTML no longer describe the product —
  flagged for refresh, not edited here (Scott's files).
- **Partner framing**: Ornn thread and Fibrebond manufacturing role
  were cassette-anchored; re-cut at next engagement.
- Decision 0004 stands; its open fill question is resolved here.
