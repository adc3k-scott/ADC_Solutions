# 0006 — N★ block heat-rejection architecture: evaporative + chiller trim vs zero-water dry-cooler plant

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President — **PENDING**
- **Status:** Proposed (issued for Scott's ruling; drafted by Mission Control)

## The question

The 2026-06-11 drop (`products/FWS/`) introduced FWS-COOL-001 Rev 0.1, a
Trane-basis Facility Water System BOD that **adopts** (its D-2) zero-water
dry-cooler heat rejection with an always-on chiller plant — while the
governing N★ PUE derivation and the prior facility-side BOM are built on
the opposite architecture. One must be ruled the N★ block standard.

| | Option A — Evaporative + chiller trim | Option B — Zero-water dry-cooler + chiller plant |
|---|---|---|
| Source | `colo/Heat_Rejection_5MW_IT.pdf` (NSTAR Rev 0.2 §4 basis); ADC-FAC-HRS-BOM-001 v0.1 (2026-05-19, ranks it #1 for Louisiana) | FWS-COOL-001 Rev 0.1 (2026-06-11), adapted from the JCI RDG 402 gigawatt blueprint |
| Heat rejection | W32/W40 closed-circuit evaporative fluid coolers; chillers only as 15–25% trim | N+2 dry coolers on a 54°C PG30 loop; Trane CVHH/RTWD chillers carry the load continuously |
| Mechanical overhead | Mech+CDU PUE ≈1.10–1.14 (the SYS-OI-10 derivation in ADC-NSTAR-001 Rev 0.2) | ≈28% of IT at design-day peak, ≈15% annualized (≈ mech PUE 1.15 annualized, higher at peak) |
| Water | Consumes water (evaporative make-up + blowdown, treatment/Legionella program); ~60k gal/day class at 5 MW per the RDG 402 scaling cited in FWS-COOL-001 D-2 | **Zero process water** — dry coolers are sensible machines; Louisiana humidity does not penalize them (dry-bulb driven) |
| Wet-bulb exposure | Leaving-water temp floored by ~80–81°F design wet bulb; works because CDU wants warm water, not 44°F | Indifferent to wet bulb; condensation control on sub-27°C piping becomes the governing detail (FWS-COOL-001 §9.1) |
| Genset/BESS impact | Lower parasitic load → more node headroom; current MGN dispatch basis | Node design-day total ≈6.7 MW (FWS-COOL-001 §7) — still >3 MW headroom, but chiller plant raises the baseline |
| Capex/opex shape | Lower energy, but water treatment O&M, Legionella program, make-up supply dependency | Higher energy, larger chiller plant, no water dependency, simpler O&M outdoors |

## Recommendation (Mission Control)

**Option A — evaporative + chiller trim — remains the N★ standard**, for
three reasons: (1) it is the issued basis of ADC-NSTAR-001 Rev 0.2 §4 and
the 1.10–1.14 mech+CDU PUE that anchors the pairing-ratio story
(SYS-OI-10); (2) two independent ADC documents (the heat-rejection study
and the May HRS BOM) both rank it first for Louisiana specifically;
(3) warm-water liquid cooling is exactly the load that lets evaporative
equipment win in a high-wet-bulb climate. **Option B is retained as the
documented water-constrained-site alternate** — sites where water supply,
discharge permitting, or Legionella program burden disqualify evaporative.
FWS-COOL-001 stays in the repo as that alternate's BOD, relabeled at its
next revision.

## Consequences (whichever way it goes)

- **FWS-RFQ-M-001 Rev 0.2 is HELD** until this decision: it quotes 3×750-ton
  + 2×170-ton chillers sized for Option B's always-on duty. Under Option A
  the chiller line items shrink to the trim fraction and the RFQ re-issues.
- **CDU basis must be corrected regardless:** FWS-COOL-001 §5.6 assumes
  3× "CDU-2500" (2.5 MW frames). The locked N★ basis is **4× 2 MW
  Deschutes CDUs**, one per reference cluster (decisions 0004/0005,
  ADC-NSTAR-001). Next FWS-COOL revision re-cuts loads and loop flows to
  that basis.
- If **Option A**: SYS-OI-10 derivation stands; NSTAR Rev 0.2 unaffected;
  FWS-COOL-001 Rev 0.2 re-scopes to "water-constrained alternate."
- If **Option B**: ADC-NSTAR-001 §4 re-derives (mech+CDU PUE rises to
  ≈1.15+ annualized, peak higher), genset dispatch basis and the
  asserted 1.15–1.25 facility band re-check, and the W32/W40 references
  retire.
- Registry: **SYS-OI-12** tracks this decision; gates FWS-RFQ-M-001
  release, SYS-OI-10 closure, and NSTAR Rev 0.3.
