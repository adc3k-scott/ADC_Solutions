# 0007 — BESS coupling: AC-coupled 4.16 kV grid-forming (locked) vs DC-coupled 800 V-class

- **Date:** 2026-06-11
- **Decided by:** Scott Tomsu, President — **PENDING**
- **Status:** Proposed (issued for Scott's ruling; drafted by Mission Control)

## The question

The 2026-06-11 ESS drop (`products/ESS/`) classifies the node BESS
**DC-coupled to an 800 V-class common DC bus serving IT** (ESS-BOD-001
Rev 0.2 §1.2 W-08, §2; ESS-RFQ-001 §1.1 + Package 2 PCS/DC-DC). The
locked microgrid design says the opposite: MGN-BOD-002 Rev 0.2 §5.2/§5.3
**lock [L]** the BESS as **AC-coupled on the 4.16 kV bus via a
4-quadrant grid-forming PCS** — it forms the island bus, black-starts the
node, and bridges the 5 MW coherent step. Both documents size the asset
identically (6 MW PCS / 3 MWh, LFP, 5 MW step × 1.20); only the coupling
axis conflicts.

| | Option A — AC-coupled 4.16 kV (MGN-BOD-002, locked) | Option B — DC-coupled 800 V-class (ESS-BOD-001 as dropped) |
|---|---|---|
| Grid-forming / black start | BESS PCS forms the bus and black-starts the node; gensets sync to the live bus — the locked control architecture | Grid-forming function would need a new home (genset isochronous primary, or grid-forming DC-DC+inverter chain not yet a standard product) |
| Equipment availability | Standard utility-class product today (4-quadrant MV-connected PCS) | **Not generally available yet** — 800 V-class DC distribution serving IT plus the matching DC-DC conversion is forward-looking; recorded as such, not as current fact (Scott, 2026-06-11) |
| Product-lineup alignment | Matches the current lineup; decision 0005 dropped the 800 VDC cassette platform and with it the only ADC product that distributed at 800 VDC | Revives an 800 VDC distribution assumption that decision 0005 superseded |
| Conversion path | AC bus → seam transformers → 415Y/240V RPPs (ADC-TRAP-ELEC-001 topology, SYS-OI-09) | Would re-open the block electrical seam just issued for approval |
| Efficiency argument | One extra conversion stage vs DC at the margin | Fewer conversions on paper — the long-term attraction, when the equipment class matures |

## Recommendation (Mission Control)

**Option A — keep the locked AC-coupled 4.16 kV grid-forming basis.**
The DC-coupled classification cannot be executed with generally
available equipment, contradicts a locked [L] design that carries the
black-start function, and re-opens the just-issued block electrical seam
(ADC-TRAP-ELEC-001). The fix to the ESS package is small: ESS-BOD-001
Rev 0.3 re-states the coupling axis as AC-coupled (W-08 becomes the
4.16 kV PCS interface; §2 row + §9 one-line row update), and ESS-RFQ-001
Rev 0.2 replaces Package 2 "PCS/DC-DC" with the 4-quadrant grid-forming
PCS already specified in MGN-BOD-002 §5.3. Everything else in the ESS
package — sizing, chemistry, siting, NFPA 855 (2026) gates, detection,
ERP, supplier matrix — is coupling-independent and survives unchanged.
**Track 800 V DC coupling as a watch item** (re-evaluate when the
equipment class is listed and shipping; pairs with the existing NiZn
re-scan P-2 at the BOD's next major revision).

## Consequences (whichever way it goes)

- **ESS-RFQ-001 Rev 0.1 is HELD** until this decision (its §1.1,
  §3.1-2, Package 2 structure, and Appendix A compliance rows hard-code
  DC coupling).
- If **Option A**: ESS-BOD-001 → Rev 0.3 (coupling axis re-stated;
  ledger D-12 records this ruling), ESS-RFQ-001 → Rev 0.2 (Package 2 =
  grid-forming AC PCS) then clears for release once Attachment A is
  filled; MGN-BOD-002 untouched; TEL-BESS register-map item unaffected.
- If **Option B**: MGN-BOD-002 §5.2/§5.3 [L] items re-open (grid-former,
  black start, transient bridge all re-architect), ADC-TRAP-ELEC-001
  Rev 0.1 re-opens, and procurement waits on equipment that is not yet
  generally available — schedule risk on every block.
- Registry: **SYS-OI-13** tracks this decision; gates ESS-RFQ-001
  release and the node electrical one-line.
