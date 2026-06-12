# ESS-TRADE-001 — Node BESS Duration Trade Study (0.5 h vs 2–4 h)

- **Rev:** 0.1 — ISSUED 2026-06-12, pending Scott approval
- **Commissioned by:** decision 0015
- **Governing documents:** MGN-BOD-002 Rev 0.2 (node BESS 6 MW / 3 MWh,
  AC-coupled 4.16 kV grid-forming [L]); ESS-BOD-001 Rev 0.3 (LFP D-02,
  coupling per decision 0007); ESS-RFQ-001 Rev 0.2 + Attachment A.
- **Out of scope (settled):** chemistry (LFP), coupling axis
  (AC-coupled 4.16 kV grid-forming), safety/siting framework
  (ESS-BOD-001 §F, NFPA 855 / UL 9540A path).

## 1. Question

The node-internal BESS is specified at **6 MW / 3 MWh** — 0.5-hour
duration at rated power (~2C) — for grid-forming, black start,
transient support, and N+1 bridging on the 10 MW genset node. The
dominant utility-scale BESS product class is built the other way:
**0.5C–0.25C energy-shifting blocks** (e.g., Megapack 2-hr:
1,927 kW / 3,854 kWh; 4-hr: 979 kW / 3,916 kWh — TESLA-RESEARCH-001).
Meeting 6 MW with that class buys ~15+ MWh, ~5× the specified energy.

Should the node spec stay power-dense, or does longer duration earn
its capex at Louisiana conditions?

## 2. The two candidate duties

| | **A — 0.5 h power-dense (current spec)** | **B — 2–4 h energy-shifting** |
|---|---|---|
| Primary function | Grid-forming bus, black start, genset-trip ride-through, step-load buffering for GPU transients | All of A, plus daily energy shifting, peak support, gas-price arbitrage, utility services |
| Power / energy per node | 6 MW / 3 MWh (~2C) | 6 MW / 12–24 MWh (0.5–0.25C) |
| Vendor field | Power-dense / high-C-rate suppliers; standard 2-hr blocks only if oversized on energy | Megapack-class mainstream; widest field, most bankable product class |
| Capex driver | Power electronics (PCS) dominate | Energy (cells) dominate — 4–8× the cell buy of A |
| Footprint / siting | Smallest yard; SEP-1 spacing per ESS-BOD-001 still governs | 4–8× container count; yard area, HMA consequence, and AHJ package all grow (ESS-OI-02/-03 interactions) |
| Revenue beyond reliability | None claimed | Requires a monetizable spread or program — must be shown, not assumed |

## 3. Sourced benchmarks (context, not pricing)

- Stationary-storage average pack price **$70/kWh (2025, BNEF)**;
  LFP >40% cheaper than NMC on average (IEA 2025). Cell-energy capex
  for option B's extra ~9–21 MWh/node is therefore first-order
  material even at falling prices. [TESLA-RESEARCH-001 §cost trends]
- Lazard 2025 LCOS, utility-scale standalone 4-hr BESS:
  **~$115–254/MWh**. Option B's incremental energy must clear its
  position in this range against the actual Louisiana revenue stack.
  [TESLA-RESEARCH-001 §LCOES]
- Proven adjacent pattern: xAI/Colossus pairs gas turbines with
  Megapack-class storage behind the meter — but at hundreds of MW
  with market/contract structures ADC's 10 MW node does not
  automatically have. [SPACEX-RESEARCH-001 §F]

## 4. Louisiana-specific inputs required before a ruling

No ruling is defensible until these are in hand (no invented prices):

1. **Gas price basis** for the node fuel contract (FUEL-001 lineage) —
   the arbitrage case is genset-fuel-cost vs charge-cost spread.
2. **Tariff / market context per siting class:** behind-the-meter at
   a customer yard (OFS tier ladder), Entergy/SLEMCO/LUS territory
   programs (ADC-UTIL-001 working sessions UTIL-OI-04/-05/-06), and
   any MISO participation path.
3. **Dispatch model** from the plant-master selection (CTRL-001) —
   who would actually run an energy-shifting program across the
   fleet (Mission Control), and at what telemetry cost (TEL-BESS).
4. **Yard area and AHJ deltas** at the reference sites (Trappey's
   first) for 4–8× container count — feeds ESS-OI-02/-03.
5. **GPU-transient duty profile** — confirm 3 MWh adequately covers
   worst-case step-load + black-start + N+1 bridge sequences; this is
   the floor for option A regardless of B.

## 5. Preliminary direction (Rev 0.1 — to be confirmed by inputs)

**Option A (0.5 h, current spec) stands unless §4 inputs prove a
monetizable spread.** Reasoning: the node BESS's specified functions
are power functions; every added MWh beyond the reliability floor is
speculative revenue carried as certain capex, in the largest
cost-per-kWh component of the node. The energy-shifting thesis has a
natural home that does not burden the node product: the **colo/CSP
business line** (brownfield sites, utility partnership program), where
2–4 h Megapack-class blocks are the right tool and the revenue
counterparty is identifiable (decision 0014 §3).

If §4 item 2 surfaces a concrete program (e.g., a utility working
session yields a dispatchable-capacity or peak product with named
terms), Rev 0.2 re-runs the comparison with real numbers and the
vendor field re-opens per decision 0015 §3.

## 6. Open items

- ESS-OI-05 tracks this study; related: ESS-OI-01 (PCS fault-domain
  split interacts with energy sizing), ESS-OI-02/-03 (siting/AHJ
  consequences of container count), CTRL-001, TEL-BESS.
