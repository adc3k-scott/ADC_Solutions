# Diablo 400 (±400 VDC Power Rack) — WATCH / RESEARCH STATUS

> **STATUS (decision [0011](../../ops/decisions/0011-diablo-400-watch-status.md),
> 2026-06-12): NOT part of the current ADC product lineup** (decision
> 0005 unchanged — lineup = CDU, TCS, HAC, MGN node, Cluster,
> Telemetry, N★). The ±400/800 VDC power ecosystem is
> **pre-production as of June 2026** — consistent with decision 0007:
> no ADC document states this class of hardware as available. This
> folder is research toward a future re-evaluation, nothing more.

## What this is

OCP **Diablo 400** is a draft open specification (v0.7.0,
co-authored by Microsoft/Meta/Google) for a disaggregated "sidecar"
power rack delivering ±400 VDC or 800 VDC to IT racks from 100 kW up
to 1 MW, deliberately leveraging the EV 400 V-class component supply
chain.

| Document | Role |
|---|---|
| [Diablo_text_markdown.md](Diablo_text_markdown.md) | PoC procurement study (dropped by Scott 2026-06-12): what is orderable today vs sampling vs custom, staged PoC plan, compliance risks |

## Study bottom line (as of June 2026)

- ~60% of a PoC is orderable now (ORV3 frames, EV/BESS-grade DC
  fuses/contactors, Bender ground-fault monitors, supercapacitor
  shelves, busbar fabrication).
- The defining component — a compliant ±400 VDC AC/DC power shelf —
  is **sampling/announced only** (Delta closest; Vertiv explicitly
  H2 2026). The spec's own connector part numbers do not verify in
  any public catalog.
- 800 VDC arc-flash / DC protection standards are not yet codified —
  a PoC needs a bespoke safety case and NRTL field evaluation.

## Why ADC watches it

1. **BL1 manufacturing adjacency** — if the ecosystem ships, power-
   rack assembly/integration is the kind of modular manufacturing the
   Lafayette base could serve.
2. **Telemetry fit** — the spec's management section recommends
   **Redfish** (OpenBMC rack managers and vendor PMCs with Redfish
   are production today); a Diablo rack would be a natural
   TEL-PROFILE citizen when hardware exists.

## Watch triggers (re-evaluate when any fires — decision 0011)

1. OCP Diablo 400 spec reaches **1.0**.
2. A vendor releases a **catalog** ±400 V shelf + DC PDU + connector
   kit (Delta most likely, per its GTC 2026 660 kW rack).
3. NVIDIA's monopolar 800 V path resolves 2-wire vs ±400 V 3-wire for
   the relevant platform generation.

Registry watch item: see `system/registry/open-items.json`
(system-asset Diablo watch). No PoC procurement starts before a
trigger fires and Scott decides.
