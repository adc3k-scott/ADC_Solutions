# MGN-SRC-001 — Genset Sourcing Intelligence Agent, Basis of Design, Rev 0.1

- **Date:** 2026-06-13
- **Author:** Mission Control (AI), for Scott Tomsu, President
- **Status:** ISSUED Rev 0.1 — pending Scott approval
- **Serves:** [Decision 0017 — NG genset acquisition fund](../../ops/decisions/0017-ng-genset-acquisition-fund.md)
  · [ADC-FUND-001](../../company/capital/ADC-FUND-001_genset-btm-acquisition-fund_Rev0_1.md)
  · buy-box gate [MGN-BOD-002](MGN-BOD-002_Rev0_2.md)
- **Parameter tags:** [L] Locked · [W] Working · [O] Open

## 1. Purpose

A daily, autonomous sourcing-intelligence agent that finds, normalizes,
tracks, and scores every available **new-surplus, used, and rebuilt
generator** across the global secondary market, so ADC always has a
current picture of what it can buy. This is the operational engine behind
decision 0017: *time is the thesis* — the supply window is finite and the
same iron is being drained by xAI/VoltaGrid/Wärtsilä-scale buyers
([genset-lead-times research, 2026-06-13](../../ops/research/2026-06-13-genset-lead-times.md)).
Whoever sees the inventory first, and prices it best, wins.

The agent is not a scraper. It is a four-stage pipeline:
**Find → Normalize → Delta → Score & Digest.** The repo holds the
persistent data store (the engine); Scott receives an email digest of
only what changed (the output).

## 2. Buy box — discovery net vs. fund gate [W — Scott 2026-06-13]

The agent casts a **wider net** than the fund buys, so nothing is missed,
then **tags each listing into a lane**. A listing is logged regardless;
it only *alerts* if it clears a lane gate.

### 2.1 Discovery net (what the agent captures & logs)
- **Fuel:** natural-gas and dual-fuel RICE (primary); **low-hour diesel**
  (included per Scott — flip/rebuild candidates while diesel surplus is
  deeper than gas).
- **Size:** **sub-1 MW (modular)** through **2.5 MW** (the G3520H node
  position). Units **>2.5 MW also alert** [W — Scott 2026-06-13], flagged
  out-of-band so they're visible but distinct from node-standard hits.
- **Condition tiers:** new-surplus · low-hour used · rebuilt/certified ·
  as-is core.
- **Frequency:** 50 Hz **and** 60 Hz — per 0017 §5, an islanded BTM
  compute node is not grid-synchronized, so 50 Hz European/ME/Asia
  surplus is in-scope. **Frequency is a sourcing edge, not a filter.**

### 2.2 Lanes (each listing tagged to exactly one primary lane)
| Lane | Gate | Why it matters |
|---|---|---|
| **FUND** | NG/dual-fuel RICE, ≥1 MW, conforms to or adaptable to MGN-BOD-002 (ISO 8528 G3+, MV-capable) | Direct 0017 acquisition target. Highest priority. |
| **MODULAR** | NG/dual-fuel, <1 MW | Smaller/paralleled node configs; faster-moving inventory. |
| **FLIP** | Low-hour diesel, any band | Resale arbitrage or rebuild-to-NG core; fund liquidity / trading margin, not node iron. |

### 2.3 Iron watchlist (makes the agent *smart*, not generic)
The agent knows the target iron by name and ranks listings against it:
- **Node-standard match (FUND, top priority):** Cat **G3520H / G3520C /
  G3520B**, Cummins **HSK78G** (0017 second source).
- **Adjacent gas RICE (FUND/MODULAR):** Cat CG132/CG170/CG260, Wärtsilä
  **34SG / 32GD**, INNIO **Jenbacher J620/J920/J420**, Waukesha
  APG/VHP/L7044GSI, MWM TCG, MTU 4000-series gas, Generac Industrial gas.
- **Diesel flip watch (FLIP):** Cat 3512/3516/3520, Cummins QSK60/KTA,
  MTU 16V/20V 4000, Wärtsilä/MaK — low-hour, motivated-seller, or
  rebuild-to-gas core candidates.

## 3. Source registry (tiered by accessibility — build high-yield first)

Sources live in a maintained registry file so the list grows without
touching agent logic. Tiering sets build order, not importance.

- **Tier 1 — structured / auction feeds (build first):** Ritchie Bros ·
  IronPlanet · GovPlanet · GovDeals · Public Surplus · Purple Wave ·
  Machinery Trader · EquipmentFacts · Bid-on-Equipment. Clean result
  pages, predictable, often searchable by kW/fuel.
- **Tier 2 — dealer / broker catalogs:** Woodstock Power · Generator
  Source · Worldwide Power Products · USP&E (Atlanta; **exports — global
  reach**) · Power Plus International · Depco · Collicutt (Canada) ·
  AB Industrial · Central States Diesel · General Power · Americas
  Generators.
- **Tier 3 — oilfield / gas-compression (NG-rich, ADC's edge):** Kruse
  Energy auctioneers · Permian/Gulf Coast surplus · gas-compression
  packager used inventory (CSI Compco, Flogistix, Archrock retirements).
  Overlaps Scott's oilfield network — the warm-lead lane.
- **Tier 4 — global 50 Hz surplus (the 0017 frequency edge):** UK/EU/ME/
  Asia brokers and retired rental fleets (Aggreko/APR, Clarke Energy
  Jenbacher reconditioned, EU plant liquidations). Logged with freight-
  to-Gulf flagged.
- **Tier 5 — noisy / manual:** eBay · Facebook Marketplace · Craigslist ·
  LinkedIn equipment posts. High noise, occasional steal; lower poll
  cadence.
- **OEM certified-used (premium, the "rebuilt" lane):** Cat Used / Cat
  Reman · Cummins · MTU · Wärtsilä reconditioned. Reliable condition,
  premium price.

## 4. Data model (one canonical schema for messy inputs)

Every listing normalizes to one record. Store: `sourcing/listings/`
(JSON, one file per active listing, keyed by fingerprint).

```
listing_id        fingerprint hash (make+model+kW+hours+seller)
captured_date     first-seen
last_seen_date    most recent confirmation
status            NEW | ACTIVE | PRICE_DOWN | PRICE_UP | AGING | GONE
lane              FUND | MODULAR | FLIP
make / model      normalized against §2.3 watchlist
fuel              NG | dual-fuel | diesel
rating_kW         prime / standby noted
frequency_hz      50 | 60
voltage
hours             engine hours (null if not stated)
year
condition         new-surplus | used | rebuilt | as-is core
price             current; price_history[] retained
location          for freight calc
seller            name + source tier
source_url
node_fit_score    0-100 vs MGN-BOD-002 (§5)
arb_score         price vs comp book vs rebuild cost (§5)
landed_cost_est   price + freight-to-Gulf estimate
notes
```

## 5. Scoring — the moat layer

Three scores turn a list into intelligence:
1. **node_fit (FUND lane):** how cleanly it drops into MGN-BOD-002 —
   exact G3520H/HSK78G = 100; adjacent gas RICE needing adaptation =
   lower; off-standard = flagged.
2. **arb_score:** listing price vs ADC's rolling **comp book** (built from
   GONE/sold prices, §6) vs estimated rebuild-to-spec cost → flip-margin
   estimate.
3. **landed_cost_est:** price + freight-to-Gulf, so a cheap 50 Hz unit in
   Europe is compared honestly against a fair one in Texas.

## 6. Delta engine — track change, not snapshots

Each daily run fingerprints every listing and diffs against yesterday:
- **NEW** clearing a lane gate → enters the digest.
- **PRICE_DOWN** → flagged (motivated seller).
- **GONE** (delisted) → marked *likely sold*; last price frozen as a
  **comp**. This quietly builds the best used-genset price book in the
  market — direct FUND-001 negotiation leverage.
- **AGING** (listed 60+ days) → flagged as negotiation leverage.

## 7. Architecture — native scheduled agent [W — Scott 2026-06-13]

- Runs as a **daily cloud-scheduled Claude agent** (cron, ~06:00 CT)
  using built-in WebSearch / WebFetch — zero infrastructure, live this
  week.
- Reads the **source registry**, pulls each source, normalizes to §4,
  runs the §6 delta + §5 scoring, writes the data store, emails the
  digest.
- **Known limit:** some JS-heavy / anti-bot sites won't render fully via
  WebFetch. Per the agreed plan, start native; graduate only the
  highest-value stubborn sources to a dedicated Playwright fetcher later
  (Hybrid path) if and when they prove worth it.
- All run output (full data + the digest) commits to the repo — canonical
  truth, and the audit trail for the fund.

## 8. Daily output — digest, not dump [W — Scott 2026-06-13]

Email to **scott@adc3k.com**, ~06:00 CT. Structure:
```
ADC Genset Sourcing — {date}
TODAY: {n} new in-box · {n} price drops · {n} likely sold

🔥 NEW — FUND lane
  • 2.5 MW Cat G3520H, NG, 60 Hz, 1,200 hrs — $___ — Houston, TX
    node_fit 100 · landed $___ · [listing]
↓ PRICE DROPS
  • ...
✓ LIKELY SOLD (new comps)
  • ...
AGING / LEVERAGE
  • ...
```
Repo store (`products/Microgrid/sourcing/`) holds the full dataset and
comp book; email surfaces only what changed.

## 9. Build phases

- **P1 (this week):** source registry + Tier 1 + Tier 2 (top 8–10
  highest-yield sources), data model, delta engine, email digest. Prove
  the buy box and the digest.
- **P2:** add Tier 3 (oilfield) + Tier 4 (global 50 Hz); turn on comp
  book / arb scoring once enough GONE history accrues.
- **P3:** Hybrid fetcher for stubborn high-value sources; optional Notion
  dashboard if Scott wants a browsable board later.

## 10. Decisions resolved & open items

**Resolved [W — Scott 2026-06-13]:**
- **Cadence:** daily including weekends, **06:00 CT**.
- **Large-frame:** units **>2.5 MW DO alert** (no longer logged-only) —
  flagged as out-of-band so they're visible but distinguishable from
  node-standard hits.
- **Go-live gate:** registry seed list is **reviewed/extended by Scott
  before P1 goes live** — see [sourcing/sources.md](sourcing/sources.md).

**Open [O]:**
- Confirm freight-to-Gulf cost model for landed_cost_est (per-MW ocean +
  inland rule of thumb, or live quotes).
