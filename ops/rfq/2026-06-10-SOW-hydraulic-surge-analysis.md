# Scope of Work — Hydraulic Transient (Surge) Analysis, ADC Modular TCS

**ADC Solutions Inc · PO Box 2224, Lafayette, LA 70502 · scott@adc3k.com · 337-780-1535**
Issued 2026-06-10 · Closes mandatory gate **HYDR-01** (ADC-MOD-TCS-001 §8);
informs **FLOW-01** and **RELIEF-01**. This analysis is contractually
required before ADC releases purchase orders for TCS valves, actuators,
and accumulators (RFQ bundles B3a/B3b).

## 1. Problem statement

The ADC Modular TCS is a 46 ft liquid-cooling distribution row: one
end-fed 2 MW / 500 GPM CDU into a 6″ Sch 10S 304L supply/return header
pair at 100.5″ AFF, serving 32× 2″/DN50 EPDM-lined SS-braided branch
hoses (16 supply + 16 return, avg 126″ drop) to IT racks via 2″
dry-break quick disconnects. First-order Joukowsky screening for
instantaneous closure of a DN50 branch valve at the released 170 kW /
6 fps branch condition yields **≈ 326 psi — exceeding the 150 psig
design working pressure**. ADC requires a method-of-characteristics (or
equivalent) transient model of the full row to size mitigations and set
operating limits.

## 2. System data (full tables in ADC-SYS-001 registry extract)

| Parameter | Value |
|---|---|
| Fluid | PG25 (25% propylene glycol, DowFrost LC25 basis), 18–55 °C |
| Design flow | 500 GPM row; 31.25 GPM/rack avg; DN50 branch max 6 fps (1.8 m/s) |
| Pressures | 0–115 psig normal · 130 alarm · **150 design WP** · ≥450 burst · backup PSV prelim 145 psig (RELIEF-01); CDU relief 130 psig |
| Pump source | 2× SPECK TOEMA065200 sealless (N+1), 500 GPM @ 112 psi, ABB ACH580 VFDs |
| Header | 6″ Sch 10S 304L, Victaulic grooved, 5.05 ft/s at design |
| Branch hose | 2″ EPDM-lined SS-braid (compliance/wave-speed data from hose vendor; HOSE-01 EPDM vs PTFE pending — analyze EPDM base case + PTFE sensitivity) |
| Proposed mitigations to size/verify | Slow-close actuators (≥30 s 6″ butterflies, ≥5 s 2″ balls); hydropneumatic accumulators at far-end caps and automated valve clusters (HS-12/HR-12, qty TBD); staged valve-sequencing MOPs |

## 3. Required cases
1. Single DN50 branch closure at 170 kW/6 fps — actuator closure-time
   sweep (instant, 1 s, 5 s, 10 s) → minimum safe closure time.
2. QD dry-break disconnect during rack hot-swap (spill-free coupling
   closure characteristic from Stäubli RBE2 data).
3. 6″ header isolation valve closure (30 s basis) at full flow.
4. Pump trip (both running pumps, power loss) and N+1 pump start.
5. Simultaneous multi-branch sequencing per draft MOP — validate or
   correct the staging.
6. Accumulator sizing/placement optimization; with/without comparison.
7. Relief coordination: confirm or revise the 145 psig backup PSV
   against the CDU's 130 psig relief (input to RELIEF-01).

## 4. Deliverables & schedule
Calibrated transient model (tool stated in proposal), case results with
pressure envelopes vs the 150/450 psig limits, mitigation schedule
(actuator times, accumulator size/precharge/location, MOP staging),
and a released-limits memo ADC can cite in ADC-MOD-TCS-001 Rev 2.
Vendor-quoted duration basis: **2–3 weeks** from data package. Proposal
requested within 5 business days.

## 5. Provided on NDA
ADC-MOD-TCS-001 Version 1 (full BoD/RFQ incl. P&ID-level tag list),
ADC-SYS-001 registry extract, CDU pump curves (CDU-G2 overlay, DI +
PG25), hose vendor data as received.
