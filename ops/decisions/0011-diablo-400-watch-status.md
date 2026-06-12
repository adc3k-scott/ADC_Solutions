# 0011 — Diablo 400 (±400 VDC power rack): filed as watch/research, NOT current lineup

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** Issued — pending Scott approval (issue-then-approve)

## Decision

1. The Diablo 400 procurement study Scott dropped at
   `products/Diablo/Diablo_text_markdown.md` is filed as
   **watch/research status**. Diablo 400 is **NOT part of the current
   product lineup** — decision 0005 (current lineup only) is
   unchanged.
2. The filing is **consistent with decision 0007**, not in tension
   with it: the report itself documents that the ±400/800 VDC
   ecosystem is **pre-production as of June 2026** (OCP Diablo 400
   spec is a v0.7.0 draft; Delta/Lite-On/Flex hardware is
   shown/sampling; Vertiv's portfolio is explicitly H2 2026; the
   cited Amphenol connector part numbers do not verify in any public
   catalog). No ADC document states ±400/800 VDC-for-IT hardware as
   available.
3. **Watch triggers** (re-evaluate Diablo 400 as a Business-Line-1
   manufacturing/assembly candidate when any fires):
   - the OCP Diablo 400 specification reaches **1.0**;
   - a vendor releases a **catalog** ±400 V power shelf + DC PDU +
     connector kit (Delta most likely, per its GTC 2026 660 kW rack);
   - NVIDIA's monopolar 800 V path resolves the two-wire vs ±400 V
     three-wire question for the relevant platform generation.
4. **Telemetry relevance noted now:** the spec's management section
   recommends Redfish (OpenBMC rack managers and vendor PMCs with
   Redfish are production today) — when hardware exists, a Diablo
   power rack is a natural TEL-PROFILE citizen. No TEL work starts
   before a trigger fires.

## Context

Scott added the folder 2026-06-12 as preliminary research and flagged
the Redfish telemetry angle himself. The study is a solid PoC
procurement report: ~60% of a proof-of-concept is orderable today
(ORV3 frames, EV/BESS-grade fuses/contactors, Bender ground-fault
monitors, supercapacitor shelves), but the one component that defines
the product — a compliant ±400 VDC power shelf — is sampling, not in
distribution. Building now would mean demonstrating mechanics, not
the electrical envelope. Watching costs nothing; the EV-supply-chain
thesis (400 V class) is exactly the kind of manufacturing adjacency
BL1 could serve from Lafayette when the ecosystem ships.

## Consequences

- `products/Diablo/README.md` created with an explicit status banner
  (watch/research; not current lineup; pre-production ecosystem).
- Registry: one watch item under the `system` asset (Diablo 400
  spec/vendor watch, triggers above) — **no new product asset**.
- The current lineup (decision 0005) and the AC-coupling ruling
  (decision 0007) are unchanged; no forward document may cite Diablo
  400 as an available product.
