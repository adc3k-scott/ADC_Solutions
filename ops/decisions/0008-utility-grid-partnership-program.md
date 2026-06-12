# 0008 — Utility Grid Partnership Program: open-source spec + per-utility annexes (Entergy, SLEMCO, LUS)

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President
- **Status:** APPROVED by Scott 2026-06-12, as issued

## Decision

1. **ADC formalizes a Utility Grid Partnership Program** offered to
   Louisiana electric utilities. The package is four elements, all built
   from the existing platform:
   1. the **10 MW MGN-BOD-002 BTM block** (and its N★ aggregation),
   2. **autonomous drone inspection coverage** — dock-based, covering
      not only the host substation but the distribution feeders/ROW
      running through the surrounding area,
   3. the **unified telemetry plane as grid services** (DNP3/IEC 61850
      dispatch, black start, storm resilience, non-wires-alternative
      deferral, inspection data delivery), and
   4. **federal funding alignment support** — helping the utility frame
      the partnership as a qualifying project under the federal
      grid/data-center infrastructure programs (GRIP/SPARK, 40101(d),
      USDA RUS, BRIC).
2. **Document shape:** one utility-agnostic, **open-source program
   spec** — `ADC-UTIL-001` — plus a **per-utility annex** for each
   counterparty. First three: **Entergy (Cameron Street annex, written
   fullest), SLEMCO, LUS.**
3. **Drone operations are vendor-neutral by design.** The spec
   describes the inspection capability and its interfaces; it does
   **not** commit to who owns or operates the aircraft (ADC, the
   utility, or a local operator such as Drone Institute Lafayette).
   The ops model is selected at each utility's working session.
4. **Release posture:** the program spec is public (the repo is public
   by Scott's standing choice); the annexes also live in the public
   repo but are framed as working drafts for each counterparty's
   session. The same offer is visible to all three utilities — that is
   the point: their territories interlock around Lafayette, and an
   open spec means no utility is being sold a lock-in.

## Context

Scott's strategic direction, 2026-06-11: Louisiana's power companies
are undersupplied and stretched thin, and ADC has insight they would
want. The repo already documents the evidence: LUS's own public capital
list includes aged 230 kV structure replacement and distribution
automation; SLEMCO is a distribution-only co-op with ~10,500+ miles of
line and 37 substations and no generation of its own; and nobody is
even certain whose retail territory 2623 Cameron Street is in
(CAM-OI-03). Meanwhile the federal government has explicitly
re-organized grid funding around data-center demand growth (DOE Speed
to Power initiative, 2025-09-18; SPARK $1.9B, 2026-03-12), and FEMA's
reinstated BRIC program has a live $1B window closing 2026-07-23.

The program formalizes an existing thread, not an invention:
MGN-PROP-004's deck already pitched a Skydio drone-in-a-box substation
inspection as an Entergy value-add (§9 / slide 8), and MISSION.md
claims drone/aviation expertise in the forward outlook.

## Consequences

- New document set `colo/utility-partnership/` (all Rev 0.1, issued
  pending approval): **ADC-UTIL-001** program spec + annexes
  **-A Entergy/Cameron Street**, **-B SLEMCO**, **-C LUS**.
- Annex A **complements — does not replace — MGN-PROP-004**; the
  CAM-OI-02 re-base of PROP-004 onto MGN-BOD-002 Rev 0.2 stays open
  and is unchanged by this decision.
- Registry: new `util` asset + UTIL-OI-01..06 (federal-matrix refresh,
  FAA Part 108 watch, drone ops model selection, and the three utility
  working sessions).
- Nothing is sent to any utility until Scott approves and presents;
  these are issue-then-approve drafts.
- Federal-program and FAA facts in the docs are verified-as-of
  2026-06-11 with sources, and carry a refresh obligation (UTIL-OI-01)
  — they are time-sensitive, not permanent facts.
