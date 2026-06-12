# 0010 — Oilfield Services Compute Program (US-90 corridor, tier ladder, ADC fleet model)

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** APPROVED by Scott 2026-06-12, as issued

## Decision

1. **ADC formalizes the AI Enterprise play for Louisiana oilfield
   service companies** — MISSION.md Business Line 2, play #2, getting
   its first documents. Target profile (generic until prospects are
   named): service companies along the **US-90 corridor, Lafayette →
   New Iberia → Morgan City**, with large yards, on-prem natural gas,
   and high-voltage service. These yards already satisfy the
   brownfield qualification checklist (prior industrial use, gas
   piping, HV service, industrial zoning, local support).
2. **The offer is a tier ladder built from the existing product
   ladder** — fungible up and down by design, no new engineering:
   - **Tier 0** — edge enterprise compute in their shop (utility AC,
     sub-block per ADC-NSTAR-001 §5; their own AI workloads first);
   - **Tier 1** — 8→16-rack reference cluster (SCALE-1 populate-only
     growth, the pattern validated at Marlie Hub);
   - **Tier 2** — full N★ block (5 MW IT + 10 MW MGN-BOD-002 node on
     their gas);
   - **Tier n** — multiple blocks.
3. **GPU operations = the ADC fleet model [L].** Every yard node
   reports to **Mission Control Node 0 (Marlie Hub)**; ADC operates
   via Telemetry (per-site TEL-PROFILE) and brokers/allocates spare
   capacity across the fleet; the owner gets the tools, the knowledge,
   and a revenue share. (Deliberate contrast with decision 0008's
   vendor-neutral drone ruling — here Scott DID select the ops model.)
4. **Document shape:** one program spec — `ADC-OFS-001` — plus a
   per-prospect annex as companies are named (mirror of the utility
   program pattern). **Generic profile for now**; the first annex
   waits for Scott to name the company.

## Context

Scott's strategic direction, 2026-06-12: these operators understand
energy better than most — they will get the load story instantly (and
sanity-check our genset numbers; the offer must be supplier-grade,
which MGN-BOD-002 is). The strongest part of the thesis: **renting
idle assets is already the oilfield-services business model** (tools,
pumps, crews) — GPU rental maps natively onto how they think. The
structural weakness of any single small yard is utilization (a few
GPUs with only local demand is a stranded asset); the fleet model is
the answer and is sold as such — aggregated through Node 0, no yard
depends on its own demand. The Ornn overlay is a candidate financial
layer on the aggregated capacity (overlay not offtake, framing per
decision 0005).

Customer/capital overlap is a feature, not a conflict: the same
companies are ADC-CAP-001 §5 Plan C strategic investors — educating
them as customers cultivates them as investors.

## Consequences

- New document set `colo/oilfield-services/` (Rev 0.1, issued pending
  approval): **ADC-OFS-001** program spec + README; annexes follow as
  prospects are named.
- Registry: new `ofs` asset + OFS-OI-01..04 (prospect list, corridor
  connectivity survey, Tier-0/1 minimum site standard, fleet
  revenue-share commercial model).
- No rental returns or prices are asserted anywhere — economics are
  modeled per prospect, never promised.
- GPU supply is not committed by this program (the NVIDIA relationship
  is a separate thread).
- Nothing is sent to any prospect until Scott approves and presents.
