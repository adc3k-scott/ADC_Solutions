# ADC Energy Storage System (ESS) — Facility BESS + Rack-Tier Supercaps

Safety-and-compliance-first ESS package for the N★ block: the **6 MW /
3 MWh LFP containerized BESS** (the transient bridge sized in
[MGN-BOD-002](../Microgrid/MGN-BOD-002_Rev0_2.md) §5.3) plus EDLC-only
supercapacitors at the rack tier, engineered to the OCP white paper
*Requirements for Energy Storage Systems Used in Data Centers* Rev 1.0
(January 2026) — filed here as the governing reference PDF.

## ⚠ Coupling decision pending — decision 0007

ESS-BOD-001 classifies the BESS **DC-coupled to an 800 V-class DC bus
serving IT**. MGN-BOD-002 Rev 0.2 **locks [L]** the same BESS
**AC-coupled, grid-forming on the 4.16 kV bus** (it forms the bus and
black-starts the node). These cannot both hold. The 800 V DC path is
forward-looking — key equipment classes are not yet generally
available — and is recorded as such, not as current fact.
`ops/decisions/0007-bess-coupling.md` resolves it. Until decided:
**ESS-RFQ-001 is HELD — do not release to bidders** (its §1.1 and the
Package 2 PCS/DC-DC structure hard-code DC coupling).

Everything else in the BOD — sizing (matches MGN-BOD-002 exactly),
LFP chemistry, outdoor containerized siting, NFPA 855 (2026) gates
G-1…G-7, detection/early-intervention (EI-1+EI-2), managed burn-down
ERP, US supplier matrix — is coupling-independent and stands either way.

## Documents

| Document | File | Status |
|---|---|---|
| ESS-BOD-001 — Energy Storage System Basis of Design, **Rev 0.2** (2026-06-11) | [ESS-BOD-001_Rev0_2.md](ESS-BOD-001_Rev0_2.md) | **Governing** (Markdown) — issued for review, pending Scott approval; coupling axis subject to decision 0007. Original docx retained |
| ESS-RFQ-001 — Package 1 Containerized LFP BESS RFQ, **Rev 0.1** (2026-06-11) | [ESS-RFQ-001_Rev0_1.md](ESS-RFQ-001_Rev0_1.md) | **HELD pending decision 0007** — do not issue. Original docx retained |
| ESS-RFQ-001 Attachment A — Site Data Sheet (fill-in template) | [ESS-RFQ-001_AttachmentA_SiteDataSheet.md](ESS-RFQ-001_AttachmentA_SiteDataSheet.md) | Template — fill from the site record (first instance: Trappey's) before NDA release |
| OCP White Paper — Requirements for ESS Used in Data Centers, Rev 1.0 (Jan 2026) | [OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf](OCP_WP_Requirements_for_ESS_in_Data_Centers_Rev1_0.pdf) | Governing industry reference (CC BY-SA 4.0) |

## Procurement structure (from the BOD)

Five packages, sequenced PS-1/PS-2 (Package 1 first; LSFT report is a
**bid** requirement, not post-award): P1 containerized BESS · P2
PCS/DC-DC conversion · P3 supercapacitors (EDLC only, SC-1) · P4
yard-level detection · P5 explosion control. US supplier matrix in
ESS-BOD-001 Appendix A.

## Open items

Registered in the unified register (`system/registry/open-items.json`):
**SYS-OI-13** (the 0007 coupling decision — gates RFQ release and the
electrical one-line) and **ESS-OI-01…04** (fault-domain split, vendor
LSFT/non-propagation, AHJ engagement, liquid-cooling leak-detection
trigger). The BOD §10.2 T-2 protocol item is the existing
**RELAY-PROTO** decision — cross-linked, not duplicated. Full
per-discipline ledger in ESS-BOD-001 §10.2.
