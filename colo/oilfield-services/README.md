# Oilfield Services Compute Program — MISSION BL2 Play #2

AI Enterprise compute for Louisiana oilfield service companies along
the US-90 corridor (Lafayette → New Iberia → Morgan City). Governing
decision: [0010](../../ops/decisions/0010-oilfield-services-compute-program.md).

| Document | Role | Status |
|---|---|---|
| [ADC-OFS-001_Rev0_1.md](ADC-OFS-001_Rev0_1.md) | Program spec — corridor thesis, tier ladder (edge → cluster → N★ block → multi-block), ADC fleet model (all nodes report to Mission Control Node 0), yard qualification checklist | **Rev 0.1 APPROVED by Scott 2026-06-12** |
| ADC-OFS-001-A.. | Per-prospect annexes | Written as Scott names companies (OFS-OI-01) |

**The model:** owner's edge workloads first; spare capacity brokered
across the fleet by ADC through Telemetry — no yard depends on its own
demand. Owner gets tools + knowledge + revenue share.

**Boundaries:** no rental returns or prices asserted; no named
prospects in the public spec; no GPU supply commitment; nothing is
sent to any prospect — Scott approves and presents. Open items
OFS-OI-01..04 live in the unified register
(`system/registry/open-items.json`).
