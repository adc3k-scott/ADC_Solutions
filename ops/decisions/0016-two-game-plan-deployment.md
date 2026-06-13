# 0016 — Two game-plan deployment: GP-A (SpaceX-first, primary) + GP-B (Ornn capital, secondary)

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** ISSUED 2026-06-12 (Rev 0.1) — pending Scott approval

## Decision

1. **ADC adopts two business-level game plans, deployed together Monday
   2026-06-15. GP-A is primary [W — Scott 2026-06-12].**
   - **GP-A — SpaceX-first** (`ops/gameplans/ADC-GPA-001_spacex-tesla-dc-forward_Rev0_1.md`):
     develop ADC's Louisiana projects with the SpaceX/Tesla ecosystem —
     supplier entry per decision 0013, Tesla charging/robotaxi via
     EVH-HUB-001 per decision 0014, solar, and the forward DC-volt
     (Lane B) strategy. Scott's personal space-program mission rides
     this plan, supplier-relationship-first, implicit in external
     documents [W].
   - **GP-B — the Ornn play** (`ops/gameplans/ADC-GPB-001_ornn-established-products_Rev0_1.md`):
     Jack Minor capital re-engagement on the established supplier-ready
     product stack, per ADC-CAP-001 (decision 0009) and CAP-OI-04.
   - **Conflict rule:** when the two plans compete for the same time or
     resources, GP-A wins. GP-B proceeds in parallel and is not dropped
     — its capital outcome still funds the decision 0009 property
     triangle that GP-A builds on (Evangeline hub, Trappey's/Evangeline
     solar roofs, Marlie Hub head-end).
2. **Non-conflation clause.** Decision 0013's "two lanes" (Lane A
   AC 4.16 kV / Lane B ±400/800 VDC) are a **topology** posture.
   This record's "two game plans" are a **partner/business** posture.
   The axes are orthogonal: both game plans ship Lane A hardware today;
   Lane B stays decision-0011-watch-gated regardless of which game plan
   advances. Naming is **GP-A / GP-B** to avoid collision with
   ADC-CAP-001 §5's capital "Plans A–D" (where Ornn is capital Plan A).
3. **Relationship to decisions 0013/0014/0015: framed, not superseded.**
   All three were approved by Scott 2026-06-12 (session ruling [W]).
   Their constraints carry into both game plans unchanged — notably the
   controls boundary [L] (Tesla software never inside ADC nodes, 0014
   §2), the Vermilion spending gates (0013 §4, SPX-OI-02), and the
   truthfulness rule on 800 VDC availability (0013 §1, decision 0007).
4. **§48E instrument trade opened [W — Scott 2026-06-12]:** Tesla is
   evaluated against First Solar for the §48E qualifying module order
   (CAP-OI-07). Registry item **CAP-OI-08** carries it with a **hard
   cutoff of 2026-06-19**: unless a written Tesla offer is in hand by
   then that (a) supplies commercial-scale modules meeting the
   domestic-content bonus test, (b) supports a begin-construction
   action before 2026-07-04, and (c) suits the candidate rooftops, the
   First Solar order proceeds per CAP-OI-07 with zero further delay.
   Evaluation inputs: `partners/Tesla/TESLA-RESEARCH-002_robotaxi-solar-status_2026-06-12.md`
   §B. Tesla remains evaluable for post-deadline scopes (e.g.,
   charging-hub canopies) regardless of this trade's outcome.
5. **Calendar guard restated (from 0013 §5, binding on both plans):**
   nothing displaces the Trappey's offer (submits 2026-06-16,
   CAP-OI-01), the §48E begin-construction action (2026-07-04,
   CAP-OI-07/-08), or the FEMA BRIC window (closes 2026-07-23,
   UTIL-OI-01).
6. **Approval flow:** game-plan artifacts issue Rev 0.1 pending Scott's
   approval; the pitch letter and all outreach remain issued-not-sent;
   **every external send requires Scott's explicit per-channel
   sign-off**, GP-A primacy notwithstanding.

## Context

Scott's direction 2026-06-12 [W]: deploy two separate game plans Monday
morning 2026-06-15 — plan one going strictly with SpaceX, developing
ADC's Louisiana projects with them and implementing Tesla's charging
systems, robotaxis, and solar with the forward DC-volt direction compute
is heading; plan two the Ornn play on ADC's established products. Scott
ruled GP-A primary; his background and the company's positioning align
with the space program, and the personal mission stands (work with the
space program any way possible).

External state verified 2026-06-12 (research notes -002 in both partner
folders): SpaceX closed day one at $160.95 (+19.2%, ~$2.1T market cap)
and Musk stated IPO proceeds fund 100,000+ satellites and **AI data
centers in space** — a direct hook for ADC's power/thermal/liquid-cooling
competence (drives pitch Rev 0.3). The Vermilion Parish tract remains
rumored only. Tesla robotaxi runs unsupervised in Dallas/Houston with a
seven-city target by mid-2026 and **no Louisiana presence** — the gap
EVH-HUB-001 positions for. The inbox shows no inbound from any named
counterparty in the last week; the field is ADC's to move on.

## Consequences

- `ops/gameplans/` directory created: ADC-GPA-001 Rev 0.1, ADC-GPB-001
  Rev 0.1, the 2026-06-15 Monday runsheet, and a README index.
- `company/capital/ADC-PORT-001_supplier-ready-portfolio_Rev0_1.md`
  issued — the established-stack one-pager for the Ornn room.
- Pitch letter Rev 0.3 issued (AI-data-centers-in-space hook; ambition
  implicit; NOT SENT).
- Research addenda filed: SPACEX-RESEARCH-002, TESLA-RESEARCH-002;
  README indexes updated per decision 0012.
- Registry: GP-OI-01 (GP-A execution), GP-OI-02 (GP-B execution),
  CAP-OI-08 (§48E instrument trade, cutoff 2026-06-19) added;
  SPX-OI-01/-02, TSLA-OI-01, CAP-OI-04 status updated.
- Decisions 0013/0014/0015 status lines updated to APPROVED 2026-06-12.
