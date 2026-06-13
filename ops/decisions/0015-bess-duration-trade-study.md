# 0015 — Commission BESS duration trade study (node-internal 0.5 h vs 2–4 h)

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** APPROVED by Scott 2026-06-12, as issued (Mission Control session ruling [W])

## Decision

1. **ADC commissions a BESS duration trade study** —
   `products/ESS/ESS-TRADE-001_Rev0_1.md`, registry item ESS-OI-05.
   Question: does the node-internal BESS stay at **6 MW / 3 MWh
   (0.5-hour, grid-forming/transient duty per MGN-BOD-002 Rev 0.2
   [L])**, or is there a defensible case for extending to **2–4 hour
   duty** (energy shifting, peak support, gas-price arbitrage)?
2. **What the study does NOT touch:** chemistry (LFP, ESS-BOD-001
   D-02) and coupling (AC-coupled 4.16 kV grid-forming, decision 0007
   [L]) are settled either way. Scope is duration/energy only.
3. **Output gates vendor eligibility:** if 0.5-h duty stands, the
   node-BESS vendor field is power-dense suppliers and
   Megapack-class products compete only in the colo/CSP
   energy-shifting lane (decision 0014 §3). If 2–4 h duty wins,
   Megapack-class products re-enter the node field and ESS-RFQ-001
   package sizing is re-issued.
4. **Discipline:** no invented prices. The study states its method,
   uses sourced market benchmarks, and lists the Louisiana-specific
   inputs that must be obtained before a ruling. The recommendation is
   issued Rev 0.x for Scott's approval like any other artifact.

## Context

Decision 0014 §3 surfaced the duty-cycle mismatch: the specified node
BESS is ~2C; the dominant utility-scale product class (Megapack and
peers) is 0.5C/0.25C, so meeting 6 MW of power buys 4–5× the specified
energy. That is either wasted capex (if 0.5-h duty is right) or an
unexamined revenue source (if longer duration monetizes at Louisiana
gas and tariff conditions). Scott ruled 2026-06-12: run the trade
study before fixing Megapack's lane.

## Consequences

- ESS-TRADE-001 Rev 0.1 issued alongside this record (framework,
  benchmarks, data-needed list, preliminary direction).
- Registry: ESS-OI-05 added under `ess`, related to ESS-OI-01 (PCS
  fault-domain split interacts with energy sizing).
- ESS-RFQ-001 node-package sizing is unchanged until the study rules.
