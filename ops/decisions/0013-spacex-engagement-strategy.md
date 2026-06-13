# 0013 — SpaceX engagement strategy: two-lane topology posture + staged Louisiana supplier entry

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** APPROVED by Scott 2026-06-12, as issued (Mission Control session ruling [W])

## Decision

1. **ADC adopts a two-lane topology posture. No prior decision is
   reversed.**
   - **Lane A (shippable today):** the canonical lineup — AC-coupled
     4.16 kV grid-forming node (MGN-BOD-002, decision 0007 [L]), Cat
     G3520H gensets, CDU/TCS liquid cooling, lineup per decision 0005.
     Lane A remains the basis for opencompute.org submissions and for
     every supplier-ready artifact.
   - **Lane B (roadmap-gated):** a **named** SpaceX/Tesla-aligned
     ±400/800 VDC topology track per OCP Diablo 400 v0.7.0 and the
     NVIDIA 800 VDC roadmap, documented in
     `products/Diablo/ADC-LANEB-001_Rev0_1.md`. Lane B activates only
     when a decision 0011 watch trigger fires (spec 1.0; vendor
     catalog shelf + DC PDU + connector kit; NVIDIA monopolar-800 V
     resolution). Lane B **is OCP-aligned** — Diablo 400 is an OCP
     project — so it supports, not competes with, the OCP submission
     ambition. Decision 0007's fact stands: no 800 V DC distribution
     system for IT is generally available; no forward document may
     state otherwise.
2. **Stage 1 supplier positioning starts now (~zero cost)** —
   registry item SPX-OI-01:
   - register at spacex.com/supplier under Facilities / Construction /
     Non-Flight categories (ground support, power, thermal scopes);
   - SAM.gov + USASpending.gov alerts for "Space Exploration
     Technologies Corp";
   - direct outreach to LEDA (CEO Mandi Mitchell) and One Acadiana
     (CEO Troy Wayman) — ask onto any aerospace supplier database
     being assembled for the Vermilion project;
   - ITAR compliance-program groundwork (documentation only at this
     stage).
3. **Starlink ground-segment power is the near-term pursuit lane:**
   gateway sites need gensets + BESS + power conditioning
   (~$500K–$2M/site per SPACEX-RESEARCH-001 §G). Louisiana's BEAD
   grant agreement with SpaceX (~$82M / 10,635 locations, reported
   2026-06-11) implies in-state ground infrastructure. These are
   winnable at current scale and build SpaceX past-performance before
   any megaproject.
4. **Spending gates:** AS9100D certification, dedicated staffing, and
   any megaproject capacity investment **wait for official
   confirmation of the Vermilion Parish land purchase** — registry
   item SPX-OI-02 carries the benchmark triggers adopted from
   SPACEX-RESEARCH-001 ("Benchmarks that should change your
   strategy"). The Vermilion deal is rumored, NOT confirmed, as of
   2026-06-12; no ADC document may state it as confirmed.
5. **Calendar guard:** nothing in this program displaces the
   Trappey's offer (submits 2026-06-16, CAP-OI-01) or the §48E solar
   begin-construction action (2026-07-04, CAP-OI-07).
6. **The pitch letter is authorized as an issued artifact only:**
   `partners/SpaceX/Scott_Tomsu_SpaceX_Louisiana_Pitch_Rev0_2.md`
   keeps Scott's dual-track framing (direct operations role + local
   contracting relationship, Scott's ruling 2026-06-12 [W]) with
   factual corrections (§Context). **Nothing is sent externally
   before Scott's sign-off.**

## Context

SpaceX IPO'd 2026-06-12 (Nasdaq: SPCX, ~$75B raised, ~$1.77T IPO
valuation) and is the rumored buyer of a ~136,000-acre ExxonMobil
tract near Pecan Island, Vermilion Parish — ~30 minutes from
Lafayette — backed by a signed 2026 state aerospace-incentive package.
Research filed at
`partners/SpaceX/SPACEX-RESEARCH-001_ipo-louisiana_2026-06-12.md`.

Scott's strategic direction 2026-06-12: SpaceX alignment is a
first-order priority ("most important company in the world"); ADC
keeps its canonical OCP line AND maintains a second play able to serve
the SpaceX/Tesla ecosystem (edge/enterprise, robotaxi-era
infrastructure) — hence the two-lane posture rather than a topology
change.

The Rev 0.1 pitch letter (`Scott_Tomsu_SpaceX_Louisiana_Pitch.docx`)
required three corrections, made in Rev 0.2:
- "800V DC distribution … the same architecture the company runs at
  Colossus" contradicted decision 0007 and misstated Colossus (which
  runs gas turbines + Tesla Megapacks, AC). Replaced with the truthful
  two-lane sentence: ADC builds the gas-generation-plus-grid-battery
  pattern Colossus runs today and is designing on the NVIDIA/OCP
  800 VDC roadmap Colossus-class clusters are moving to.
- "SpaceX has confirmed … Vermilion Parish" overstated; replaced with
  accurate sourcing (SpaceX "exploring" statement + Sen. Hensgens'
  on-record confirmation of negotiations).
- Header said New Orleans; corrected to Lafayette (canonical,
  CLAUDE.md).

## Consequences

- Registry: SPX-OI-01 (Stage 1 actions) and SPX-OI-02 (Vermilion
  confirmation watch + triggers) added under the `system` asset.
- `products/Diablo/ADC-LANEB-001_Rev0_1.md` issued (Lane B one-pager).
- `partners/Space X/` renamed `partners/SpaceX/` per decision 0012
  conformance; research drops given descriptive filenames.
- Pitch letter Rev 0.2 issued for approval; Rev 0.1 .docx retained as
  the binary original.
- Companion decisions: 0014 (Tesla relationship), 0015 (BESS duration
  trade study).
