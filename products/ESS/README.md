# ADC Energy Storage System (ESS) — Facility BESS + Rack-Tier Supercaps

Safety-and-compliance-first ESS package for the N★ block: the **6 MW /
3 MWh LFP containerized BESS** (the transient bridge sized in
[MGN-BOD-002](../Microgrid/MGN-BOD-002_Rev0_2.md) §5.3) plus EDLC-only
supercapacitors at the rack tier, engineered to the OCP white paper
*Requirements for Energy Storage Systems Used in Data Centers* Rev 1.0
(January 2026) — filed here as the governing reference PDF.

## Coupling resolved — decision 0007 (Accepted 2026-06-11)

Per Scott's ruling ([0007](../../ops/decisions/0007-bess-coupling.md)):
the BESS is **AC-coupled, grid-forming, on the 4.16 kV node bus** per
MGN-BOD-002 §5.2/§5.3 [L] — it forms the island bus and black-starts
the node. **There is no 800 V DC distribution system for IT yet**; the
DC-coupled classification in the original drop was re-stated at
ESS-BOD-001 Rev 0.3, and DC coupling is a watch item only (D-12).
ESS-RFQ-001 Rev 0.2 carries the AC re-cut and is **releasable once
Attachment A is filled** from the selected site record and Scott
approves the issue.

## Documents

| Document | File | Status |
|---|---|---|
| ESS-BOD-001 — Energy Storage System Basis of Design, **Rev 0.3** (2026-06-11) | [ESS-BOD-001_Rev0_3.md](ESS-BOD-001_Rev0_3.md) | **Governing** (Markdown) — **APPROVED by Scott 2026-06-12** (SYS-OI-13 closed); coupling AC per decision 0007. Rev 0.2 docx retained as history |
| ESS-RFQ-001 — Package 1 Containerized LFP BESS RFQ, **Rev 0.2** (2026-06-11) | [ESS-RFQ-001_Rev0_2.md](ESS-RFQ-001_Rev0_2.md) | **APPROVED by Scott 2026-06-12**; AC re-cut; releasable once Attachment A filled (the only remaining gate). Rev 0.1 docx retained as history |
| ESS-RFQ-001 Attachment A — Site Data Sheet (fill-in template) | [ESS-RFQ-001_AttachmentA_SiteDataSheet.md](ESS-RFQ-001_AttachmentA_SiteDataSheet.md) | Template — fill from the site record (first instance: Trappey's) before NDA release |
| OCP White Paper — Requirements for ESS Used in Data Centers, Rev 1.0 (Jan 2026) | [OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf](OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf) | Governing industry reference (CC BY-SA 4.0) |

## Procurement structure (from the BOD)

Five packages, sequenced PS-1/PS-2 (Package 1 first; LSFT report is a
**bid** requirement, not post-award): P1 containerized BESS · P2
4-quadrant grid-forming PCS (AC-coupled, 4.16 kV) · P3 supercapacitors
(EDLC only, SC-1) · P4 yard-level detection · P5 explosion control.
US supplier matrix in ESS-BOD-001 Appendix A.

## Open items

Registered in the unified register (`system/registry/open-items.json`):
**SYS-OI-13** (closes when Scott approves ESS-BOD-001 Rev 0.3) and
**ESS-OI-01…04** (fault-domain split, vendor LSFT/non-propagation, AHJ
engagement, liquid-cooling leak-detection trigger). The BOD §10.2 T-2
protocol item is the existing **RELAY-PROTO** decision — cross-linked,
not duplicated. Full per-discipline ledger in ESS-BOD-001 §10.2.
