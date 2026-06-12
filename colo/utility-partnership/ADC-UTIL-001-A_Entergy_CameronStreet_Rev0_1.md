# ADC-UTIL-001-A — Entergy Louisiana Annex (Cameron Street)

| | |
|---|---|
| Document | ADC-UTIL-001-A — per-utility annex to [ADC-UTIL-001](ADC-UTIL-001_Rev0_1.md) |
| Counterparty | Entergy Louisiana (IOU) |
| Anchor site | 2623 Cameron Street, Lafayette — Entergy regional operations parcel with **adjacent substation/switchyard** ([site record](../sites/cameron-street.md)) |
| Revision | **Rev 0.1 — APPROVED by Scott 2026-06-12**; working draft for the Entergy session |
| Relationship to MGN-PROP-004 | **Complement, not replacement.** PROP-004 Rev 0.3 remains the site technical proposal; this annex packages the partnership program around it. PROP-004's re-base onto MGN-BOD-002 Rev 0.2 stays open (CAM-OI-02). |

Revision history

| Rev | Date | Change |
|---|---|---|
| 0.1 | 2026-06-11 | First issue per decision 0008 |

---

## 1. Why Entergy, why Cameron Street

MGN-PROP-004 already establishes the site logic: an Entergy-owned
parcel whose adjacent substation is "the decisive asset," a two-phase
deployment (compute pilot → 10 MW BTM nodes), and a §9 value-adds
package that included docked-drone substation inspection. This annex
extends §9 into the full four-element program of ADC-UTIL-001:

| Program element (ADC-UTIL-001 §2) | Cameron Street instance |
|---|---|
| 10 MW block | Phase-2 BTM node(s) per PROP-004 §6; node step-up matched to the adjacent substation voltage (TBC, threshold data item #2) |
| Drone inspection | Dock on the parcel covers the **adjacent Entergy substation** + the **distribution feeders/ROW through the surrounding west-Lafayette area** — expanded scope vs PROP-004 §9 (which covered the substation; this annex adds area line coverage within FAA-authorized radius, expanding under Part 108 when final) |
| Telemetry grid services | PROP-004 §9.2–9.5 stand: BESS grid services dispatched DNP3/IEC 61850, black-start/storm restoration value, NWA T&D deferral, redeployable bridge asset — all via the site TEL-PROFILE |
| Federal alignment | IOU-relevant rows of the §2.4 matrix: **GRIP** (watch post-SPARK rounds; awards pending), **Speed to Power** (the demand-growth narrative in federal print), **40101(d) via LDENR** (microgrids named in round-2 RFPs); BRIC runs through state/local applicants, not the IOU directly |

## 2. What the inspection element gives Entergy specifically

- **Substation thermal baseline:** scheduled radiometric-thermal passes
  over the adjacent substation — bushings, connections, transformer
  tanks — anomaly-flagged through the telemetry plane instead of
  periodic truck-roll IR surveys.
- **Area feeder/ROW coverage:** the lines running down Cameron Street
  and the surrounding corridors get recurring visual inspection at
  near-zero incremental cost once the dock exists — storm-damage
  assessment from the same dock in restoration scenarios.
- **Crew leverage:** inspection data arrives as work-ready flags;
  Entergy's stretched field crews are dispatched to confirmed
  anomalies, not on patrol.
- Ops model (who flies: ADC / Entergy's own UAS program / local
  operator) is a working-session item per decision 0008 — Entergy has
  its own utility-UAS context, and the spec's interfaces accommodate
  any of the three.

## 3. Working-session agenda (the ask: 60–90 minutes)

1. PROP-004 §5 threshold items #1–#2 (parcel status; adjacent
   substation ownership/voltage/capacity/spare bays) — unchanged.
2. **CAM-OI-03 retail-territory check** — confirm whose retail
   territory 2623 Cameron Street is in (west Lafayette is heavily
   SLEMCO/LUS); reshapes standby-service and metering asks. The
   open-source program posture makes this a feature, not an
   embarrassment: if the answer is "not Entergy," the same program
   stands with the territory holder, and Entergy keeps the
   transmission/substation partnership scope.
3. Remaining §5 data items #3–#10 (fault duty, interconnection
   process, metering, standby terms, IEEE 1547 settings, ambient,
   gas, parcel area).
4. **Drone ops model selection** (UTIL-OI-03) + dock siting on the
   parcel + inspection data-delivery format into Entergy's systems.
5. Federal alignment: which matrix rows Entergy wants to pursue
   jointly, and who owns each application.

## 4. Open items touched

| ID | Status |
|---|---|
| CAM-OI-01 | Entergy §5 data exchange — unchanged, this annex is the vehicle to schedule it |
| CAM-OI-02 | PROP-004 re-base to MGN-BOD-002 Rev 0.2 — open, unchanged by this annex |
| CAM-OI-03 | Retail-territory check — now agenda item §3.2 |
| UTIL-OI-03 / UTIL-OI-04 | Drone ops model + Entergy working session — this annex's execution items |
