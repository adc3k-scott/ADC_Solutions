# 0014 — Tesla relationship: ESS-RFQ bidder (not partner slot) + Evangeline robotaxi/charging-hub concept

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** APPROVED by Scott 2026-06-12, as issued (Mission Control session ruling [W])

## Decision

1. **Tesla enters ESS procurement as a bidder, not a partner.**
   Tesla/Megapack competes through ESS-RFQ-001 under the Attachment A
   gate like any other vendor — no sole-source slot on brand strength.
   The next ESS-RFQ-001 revision adds one **mandatory written
   question** for any Tesla bid: *can Megapack be dispatched by a
   third-party site controller (Modbus/DNP3 or equivalent) WITHOUT the
   Tesla Microgrid Controller / Autobidder layer, with warranty and
   performance guarantees intact?* (Historical precedent exists — the
   SCE Powerpack project used Modbus/DNP3 to utility SCADA — but
   current Megapack terms are not public.) If the answer is no, the
   bid carries the platform-dependence cost in evaluation.
2. **Controls boundary [L]:** ADC / Mission Control owns site
   dispatch. Tesla's software stack (Microgrid Controller, Powerhub,
   Autobidder) does not go inside ADC nodes. The fleet model (Mission
   Control Node 0, decision 0010) is premised on ADC owning that
   layer; ceding it would collapse ADC's differentiation to
   installer-of-Tesla-equipment.
3. **Duty-cycle finding (drives decision 0015):** the MGN-BOD-002
   node-internal BESS is 6 MW / 3 MWh — 0.5-hour, ~2C, grid-forming.
   Megapack's products are 1,927 kW / 3,854 kWh (2-hr, ~0.5C) and
   979 kW / 3,916 kWh (4-hr, ~0.25C) — energy-shifting machines.
   Hitting 6 MW with Megapacks buys ~4–5× the specified energy.
   **Megapack's natural lane at ADC is the colo/CSP business line
   (2–4 hr energy shifting, peak support, utility services), not the
   node-internal BESS** — pending the 0015 trade study.
4. **Evangeline robotaxi/charging-hub concept is commissioned:**
   `colo/Evangeline Distribution Hub/EVH-HUB-001_Rev0_1.md` issued.
   The building at 1016 SW Evangeline Thruway was already designed as
   a charging station (Scott 2026-06-12 [W]; charging imagery in the
   site folder); the concept evaluates a Tesla robotaxi/charging hub
   use. Constraints carried from decision 0009: leasehold-only, land
   stays Union Pacific — any site-host arrangement needs
   landlord-consent diligence first (EVA-OI-01 / CAP-OI-02 lineage).
   Synergy noted: EV charging is the one domain where 400/800 V DC
   components are mature today — the lowest-risk place to build
   Lane B (decision 0013) DC competence.

## Context

Tesla Energy research filed at
`partners/Tesla/TESLA-RESEARCH-001_energy-deep-dive_2026-06-12.md`.
Findings driving this record: LFP matches ESS-BOD-001 D-02; AC-block
deployment matches decision 0007; Houston Megafactory (Megapack 3,
up to 50 GWh/yr, 2026 start) gives Gulf Coast proximity and a
domestic-content story (LGES US-made LFP from 2027). Against that:
Tesla publishes no cycle-life curves, degradation guarantees, or BMS
detail (exactly what Attachment A forces); both Powerwall and Megapack
have been supply-constrained; and Tesla's integration moat is also a
platform-dependence risk. The gas-generation-plus-Megapack pattern at
the xAI/Colossus complex (~1.5 GW turbines + Megapacks) is the proven
behind-the-meter analog to ADC's node product — useful narrative for
the SpaceX engagement (decision 0013) whichever vendor wins the BESS.

Scott's direction 2026-06-12: align with the SpaceX/Tesla ecosystem as
the second play (edge/enterprise, robotaxis, robots) without changing
the canonical topology or the OCP submission path.

## Consequences

- Registry: TSLA-OI-01 (Evangeline hub concept progression) added;
  ESS-OI-05 added under `ess` (duration trade study, decision 0015).
- ESS-RFQ-001 next revision adds the third-party-dispatch question
  (§1) — no edit to the issued Rev 0.2 now.
- EVH-HUB-001 Rev 0.1 issued for approval.
- COLO-04 (Evangeline intended use) stays open — the hub concept is an
  additional candidate use, not a ruling.
