# ADC-LANEB-001 — Lane B: the SpaceX/Tesla-aligned ±400/800 VDC topology track

- **Rev:** 0.1 — ISSUED 2026-06-12, pending Scott approval
- **Status:** ROADMAP-GATED. Lane B is a named design track, **not a
  product**. Decision 0011 watch status governs; decision 0007 fact
  stands (no 800 V DC distribution system for IT is generally
  available). No ADC document may cite Lane B hardware as available.
- **Established by:** decision 0013 §1

## What Lane B is

ADC's second topology play: a ±400/800 VDC power architecture per
**OCP Diablo 400 v0.7.0** and the **NVIDIA 800 VDC roadmap** (Rubin
Ultra era, 2027), held design-ready for the moment the ecosystem
ships. Lane A — the canonical AC-coupled 4.16 kV line (MGN-BOD-002,
decisions 0005/0006/0007) — is what ADC sells today, to everyone,
including SpaceX.

**Lane B is OCP-aligned by construction.** Diablo 400 is an OCP
project; NVIDIA's 800 VDC path runs through the same ecosystem. Lane B
therefore *supports* ADC's opencompute.org submission ambition — the
two lanes are one roadmap at two maturity stages, not competing
topologies.

## Why it exists (audiences)

1. **SpaceX/xAI:** Colossus-class clusters run 220,000+ NVIDIA GPUs;
   when that fleet moves to 800 VDC, it moves the NVIDIA/OCP way.
   Lane B lets ADC truthfully pitch: *"we build the
   gas-generation-plus-grid-battery pattern Colossus runs today, and
   we're designing on the NVIDIA/OCP 800 VDC roadmap Colossus-class
   clusters are moving to."*
2. **Tesla edge/enterprise & robotaxi-era infrastructure:** EV
   charging is the one domain where 400 V-class and 800 V-class DC
   components are mature **today** (EV supply chain: fuses,
   contactors, connectors per Diablo_text_markdown.md §components).
   The Evangeline charging-hub concept (EVH-HUB-001, decision 0014
   §4) is the lowest-risk place to build Lane B DC competence on
   shipping parts.
3. **BL1 manufacturing adjacency:** when a trigger fires, Diablo-class
   power racks are a Lafayette manufacturing/assembly candidate
   (decision 0011 context).

## Activation triggers (inherited verbatim from decision 0011 §3)

Re-evaluate as a Business-Line-1 manufacturing/assembly candidate when
any fires:
- the OCP Diablo 400 specification reaches **1.0**;
- a vendor releases a **catalog** ±400 V power shelf + DC PDU +
  connector kit (Delta most likely, per its GTC 2026 660 kW rack);
- NVIDIA's monopolar 800 V path resolves the two-wire vs ±400 V
  three-wire question for the relevant platform generation.

Watch carried as registry item SYS-OI-14. Until a trigger fires,
Lane B work is limited to: this document, the EVH-HUB-001 charging
concept (mature EV-class components only), and zero-cost spec/vendor
watch.

## Hard constraints (no exceptions)

- Ecosystem is pre-production as of 2026-06: spec is a v0.7.0 draft;
  shelves are sampling, not catalog; 800 VDC arc-flash / DC protection
  standards are not yet codified (Diablo_text_markdown.md §caveats).
- Lane B never displaces Lane A in proposals, RFQs, or the OCP
  submission path; supplier-ready artifacts stay Lane A unless Scott
  rules otherwise after a trigger fires.
