# 0017 — NG genset acquisition fund: scarcity-window asset vehicle, Ornn anchor LP, ADC own-use BTM first deploy

- **Date:** 2026-06-13
- **Decided by:** Scott Tomsu, President
- **Status:** ISSUED 2026-06-13 (Rev 0.1) — pending Scott approval
- **Parameter tags:** [L] Locked · [W] Working (Scott's word this session) · [O] Open

## Decision

1. **ADC stands up a hard-asset acquisition vehicle to buy available
   ≥1 MW natural-gas gensets (50 Hz and 60 Hz) on the global secondary
   market now, while a supply window is open [W — Scott 2026-06-13].**
   New large-frame gensets are on multi-year allocation lists; ADC may
   place deposits / hold list positions [W], but the deployable supply
   today is existing equipment worldwide. The window is finite — **time
   is the thesis**, not an afterthought.

2. **Structure: pooled co-ownership SPV, Ornn as anchor LP
   [W — Scott 2026-06-13].** Investors collectively own the iron; ADC is
   manager/GP earning a development fee + carry. Preferred form is a
   Delaware LLC, **series-LLC so each deployment node is ring-fenced**
   from the others (one bad unit does not contaminate the pool) [O —
   confirm with counsel]. This is the asset-backed instance of GP-B's
   "financial layer on an operating platform" posture
   ([ADC-GPB-001](../gameplans/ADC-GPB-001_ornn-established-products_Rev0_1.md) §1),
   not a product-offtake bet.

3. **First deployment is ADC's own behind-the-meter compute site
   [W — Scott 2026-06-13].** The fund buys the iron; ADC stands up its
   own BTM compute load on Louisiana natural gas. Vertically integrated:
   ADC owns the assets (via the fund), runs the load, and controls the
   fuel. The first node lands against the decision 0009 property
   triangle (Evangeline hub / Marlie Hub head-end) [O — site selection].
   Power-as-a-service to third parties is a later option, not the
   opening move.

4. **Node-standard conformance is a buy-box gate
   [L — engineering boundary].** Acquired units are bought to conform
   to (or be adapted to) the ADC node standard
   ([MGN-BOD-002](../../products/Microgrid/MGN-BOD-002_Rev0_2.md)):
   ≤10 MW node, reciprocating gas gensets at medium voltage, AC-coupled
   BESS transient bridge, ISO 8528 class G3 or better. The fund does not
   buy iron the node standard cannot use.

5. **Frequency is a sourcing edge, not a constraint
   [W — Scott 2026-06-13].** A behind-the-meter compute island is not
   grid-synchronized; server PSUs rectify AC→DC at the rack, so a 50 Hz
   genset can power a 60 Hz-region compute load on an islanded node.
   This opens the global 50 Hz surplus (Europe, Middle East, Asia) to
   ADC, not just the North American 60 Hz pool. **Caveat [O]:** balance
   of plant (switchgear, transformers, protection, any auxiliaries) must
   be matched to the unit's native frequency; the frequency-agnostic
   claim is the *compute load*, not the *plant*.

6. **Air-permit qualification is the kill-risk gate, checked before any
   purchase commitment [L].** Continuous-duty prime BTM power is not
   emergency-standby permitting. Each candidate unit is screened against
   40 CFR 60 subpart JJJJ (NSPS spark-ignition) and 40 CFR 63 subpart
   ZZZZ (RICE NESHAP) for **prime-power applicability**, with the
   relocated/used-engine applicability rules applied honestly — a used
   overseas unit may be standby-only in the US. The node standard's
   20-node / 200 MW single minor-source envelope (MGN-BOD-002 §7) is the
   permitting frame the fleet must fit. No unit enters the buy-box on
   condition/price alone.

7. **Provenance buy-box [W]:** documented hours, maintenance/overhaul
   records, named OEM frames only, emissions/prime-power qualification
   per §6. Capital is not committed to undocumented iron.

8. **Fuel is the Louisiana advantage [W]:** the BTM thesis runs on
   Lafayette/oilfield gas — including potentially stranded or flared gas
   [O — supply path]. Gulf-Coast gas is the thing this fund has that an
   out-of-state vehicle does not; it is part of the thesis, not an
   afterthought.

9. **Relationship to decisions 0016 / 0009 / GP-B: extends, does not
   supersede.** This vehicle is presented to Ornn (Jack Minor) as a
   sharper, time-boxed instance of the GP-B capital conversation
   (CAP-OI-04). It **does not displace GP-A** (SpaceX-first primary,
   decision 0016 §1) and is subordinate to the calendar guard (Trappey's
   2026-06-16, §48E 2026-07-04, BRIC 2026-07-23). If the two compete for
   time, GP-A wins (0016 §1 conflict rule).

10. **Approval / send discipline [L]:** this record and the fund brief
    issue Rev 0.1 pending Scott's approval. Nothing is sent from this
    repo; **the Ornn outreach is issued-not-sent and requires Scott's
    explicit per-channel sign-off** (0016 §6).

## Context

Scott's direction 2026-06-13 [W]: build an investor strategy specifically
for natural-gas gensets ≥1 MW, 50 Hz and 60 Hz, both usable for
behind-the-meter compute. New systems are on allocation (get on lists,
place deposits), but available equipment exists worldwide today and the
window will not last — so raise funds and fill it as a pooled vehicle
where the participants co-own the assets. The assets serve ADC's natural-
gas enterprise BTM strategy. Ornn is the partner to approach with this
when ADC reaches out Monday 2026-06-15.

Session rulings captured via Mission Control Q&A 2026-06-13 [W]:
**Ornn = anchor LP in the fund** (not JV platform partner, not merely
folded into existing GP-B); **first deployment = ADC's own BTM compute
site** (own-use, vertically integrated). These two rulings fix the
framing of the Ornn brief.

Engineering grounding: MGN-BOD-002 Rev 0.2 already defines the 10 MW node
(5× Cat G3520H, 4+1 N+1), the AC-coupled BESS bridge, the prime-mover
codes (NFPA 37/70/110, ISO 8528, IEEE 1547/519), and the emissions /
air-permit frame (40 CFR 60 JJJJ, 40 CFR 63 ZZZZ; 20-node / 200 MW
minor-source envelope). The fund acquires iron that fits this standard;
it does not invent a new one.

## Consequences

- `company/capital/ADC-FUND-001_genset-btm-acquisition-fund_Rev0_1.md`
  issued — the one-page Ornn-room brief for the anchor-LP ask.
- Registry: open item **FUND-OI-01** (vehicle stand-up: counsel on
  series-LLC structure, securities posture for the raise) and
  **FUND-OI-02** (buy-box / air-permit qualification protocol per §6)
  to be added; CAP-OI-04 (Ornn capital re-engagement) cross-referenced.
- Open items [O] to close before any purchase commitment: SPV legal
  structure + securities counsel (FUND-OI-01); prime-power air-permit
  qualification protocol (FUND-OI-02); first-node site selection against
  the decision 0009 triangle; fuel-supply path (stranded/flared gas).
- Monday runsheet (`ops/gameplans/2026-06-15-monday-runsheet.md`) to gain
  a GP-B sub-item: present the acquisition-fund anchor-LP ask to Ornn,
  subordinate to GP-A and the calendar guard.
- Subordination to decision 0016 restated: GP-A primacy and the calendar
  guard are binding on this vehicle.
