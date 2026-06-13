# ADC-PORT-001 — Supplier-Ready Portfolio One-Pager

| Field | Value |
|---|---|
| Document | ADC-PORT-001 |
| Revision | 0.1 — issued 2026-06-12, pending Scott approval |
| Decision | [0016](../../ops/decisions/0016-two-game-plan-deployment.md) (GP-B artifact), [0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md) (lineup) |
| Audience | Capital-partner conversations (GP-B / Ornn room) — **presented by Scott only; nothing sent from this repo** |
| Rule | Each row links the canonical document; nothing is restated. Statuses as of 2026-06-12. |

## The established stack (decision 0005 lineup — the only platform)

| Product | Document | Status 2026-06-12 |
|---|---|---|
| **CDU — 2 MW Cooling Distribution Unit** | [ADC-CDU-DES-BOM-001 Rev 0.3](../../products/CDU/ADC-CDU-DES-BOM-001_Rev0_3.md) | **APPROVED** — RFQ-ready |
| **Modular TCS — headers & branch lines** | [ADC-MOD-TCS-001 v1.1](../../products/TCS/ADC-MOD-TCS-001_Version1_1.md) | **APPROVED** — RFQ-ready |
| **BESS — 6 MW / 3 MWh AC-coupled grid-forming** | [ESS-BOD-001 Rev 0.3](../../products/ESS/ESS-BOD-001_Rev0_3.md) + [ESS-RFQ-001 Rev 0.2](../../products/ESS/ESS-RFQ-001_Rev0_2.md) | **APPROVED** — RFQ releasable per site (Attachment A) |
| **Facility Water System (heat rejection)** | [FWS-COOL-001 Rev 0.2](../../products/FWS/FWS-COOL-001_Rev0_2.md) | **APPROVED** — two site-selectable architectures |
| **N★ Block — 5 MW IT + 10 MW node standard** | [ADC-NSTAR-001 Rev 0.2](../../products/NStar/ADC-NSTAR-001_Rev0_2.md) | **APPROVED** — the repeatable scaling unit |
| **16-rack reference cluster (electrical)** | [ADC-CLU-BOM-001 Rev 0.1](../../products/Cluster/ADC-CLU-BOM-001_Rev0_1.md) | **APPROVED** — electrical bundles RFQ-ready |
| **10 MW NG Microgrid Node** | [MGN-BOD-002 Rev 0.2](../../products/Microgrid/MGN-BOD-002_Rev0_2.md) | Working draft — approval pending |
| **Unified Telemetry (AI-native OS)** | [MGN-TEL-001 Rev 0.2](../../products/Microgrid/MGN-TEL-001_Rev0_2.md) | POC Phase 1 running — approval pending |
| **HAC — hot-aisle containment structure** | [products/HAC/](../../products/HAC/README.md) | Pre-design, OCP-Redmond interface locked |

Roadmap (not supplier-ready, watch-gated): Lane B ±400/800 VDC track,
[ADC-LANEB-001 Rev 0.1](../../products/Diablo/ADC-LANEB-001_Rev0_1.md)
per decisions 0011/0013.

## What the stack proves in a capital conversation

- **Spec-first discipline:** every product has a numbered, revisioned,
  approved document with supplier-ready BOMs — not slideware.
- **Standards alignment:** OCP Deschutes/Redmond basis; one Redfish
  telemetry namespace across generation, cooling, and compute.
- **A repeatable unit economics story:** 1 N★ block = 5 MW IT + 10 MW
  node; sites scale as n independent blocks; 20 nodes = 200 MW under
  one air-permit envelope.
- **Deployment surface already controlled:** see ADC-CAP-001 §2
  (property stack) and the colo site register (`colo/`).
