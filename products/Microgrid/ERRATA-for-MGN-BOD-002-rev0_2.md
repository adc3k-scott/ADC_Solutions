# Errata pack — MGN-BOD-002 Rev 0.1 → Rev 0.2

Prepared 2026-06-10 by Mission Control for Scott Tomsu. Light pack —
the BoD held up well; these keep it consistent with decisions made
since 2026-06-08.

## E1 — CTRL-001 / CTRL-002 pointer

Both are subsumed into MGN-TEL-001 (tracked there as TEL-DISPATCH and
TEL-002). Rev 0.2 §11 should point to MGN-TEL-001 §16 for these two
rather than carrying parallel copies.

## E2 — COMM-001 half-resolved (decision 0002)

The platform/product-name half is decided: the AI-native OS is named
**Telemetry** (plain). The remaining open half is the hardware-document
prefix — whether "MGN" stays or changes for the node document series.
Update the COMM-001 row accordingly.

## E3 — §8 Controls/SCADA naming

§8 is titled "Mission Control." That name now collides with two things:
the Telemetry product (which owns the merchant-ops/dispatch layer it
describes) and "Mission Control" as the standing name for the company's
AI agent role in CLAUDE.md. Recommend §8 reference the Telemetry
product for Layers 3–5 and keep "plant master controller" as the
Layer-1 term.

## E4 — Record citation verification

OCP/DMTF citations relevant to this BoD verified current 2026-06-10
(`ops/research/2026-06-10-ocp-spec-currency.md`). A revision-notes line
keeps the trail.
