# Genset Sourcing — Source Registry (seed)

- **Owner:** Mission Control (AI) · **Reviewer:** Scott Tomsu
- **Status:** SEED — pending Scott review before P1 go-live
- **Governed by:** [MGN-SRC-001](../MGN-SRC-001_genset-sourcing-agent_Rev0_1.md) §3
- **Updated:** 2026-06-13

This file is the agent's source list. The agent reads it each run — add or
remove a row here and the daily sweep follows, no code change. `poll`
sets cadence; `on` toggles a source without deleting it.

**Review actions for Scott:** strike any you don't want, add warm
oilfield/broker contacts you know, and confirm the Tier-3/4 lanes.

---

## Tier 1 — structured / auction feeds (build first)

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | Ritchie Bros | rbauction.com | daily | Largest industrial auctioneer; gensets by kW. |
| ✅ | IronPlanet | ironplanet.com | daily | Ritchie online arm. |
| ✅ | GovPlanet | govplanet.com | daily | Gov/military surplus gensets — low-hour MEP units. |
| ✅ | GovDeals | govdeals.com | daily | Municipal/utility surplus; sleeper deals. |
| ✅ | Public Surplus | publicsurplus.com | daily | Gov agencies. |
| ✅ | Purple Wave | purplewave.com | daily | Midwest unreserved auctions. |
| ✅ | Machinery Trader | machinerytrader.com | daily | Dealer aggregator, strong genset category. |
| ✅ | EquipmentFacts | equipmentfacts.com | daily | Auction aggregator. |
| ✅ | Bid-on-Equipment | bid-on-equipment.com | daily | Used industrial, gensets. |

## Tier 2 — dealer / broker catalogs

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | Woodstock Power | woodstockpower.com | daily | Deep used-genset inventory, NG + diesel. |
| ✅ | Generator Source | generatorsource.com | daily | Used/surplus, good specs listed. |
| ✅ | Worldwide Power Products | wpowerproducts.com | daily | Houston — local freight edge. |
| ✅ | USP&E | uspeglobal.com | daily | Atlanta; **exports — global/50 Hz reach.** |
| ✅ | Power Plus International | powerplusintl.com | daily | Used/surplus broker. |
| ✅ | Depco Power Systems | depcollc.com | daily | Used industrial gensets. |
| ✅ | Collicutt Energy | collicutt.com | weekly | Canada; gas RICE specialist. |
| ✅ | AB Industrial / AB Power | — | weekly | Industrial surplus. |
| ✅ | Central States Diesel | centralstatesdieselgenerators.com | weekly | Diesel-heavy (FLIP lane). |
| ✅ | General Power | generalpower.com | weekly | New + used. |
| ✅ | Americas Generators | shopgenerators.com | weekly | Miami; export-oriented. |

## Tier 3 — oilfield / gas-compression (NG-rich, ADC edge)

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | Kruse Energy Auctioneers | kruseenergy.com | daily | Oilfield equipment auctions — gas gensets/compression. |
| ✅ | Archrock retirements | archrock.com | weekly | Gas-compression fleet; watch for retirements. |
| ✅ | Flogistix used | flogistix.com | weekly | Gas-lift/compression packages. |
| ✅ | CSI Compco | — | weekly | Compression packager used inventory. |
| ⬜ | *(Scott warm leads)* | — | — | **Add oilfield contacts here.** |

## Tier 4 — global 50 Hz surplus (the 0017 frequency edge)

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | Clarke Energy (Jenbacher reconditioned) | clarke-energy.com | weekly | EU/global Jenbacher gas. |
| ✅ | Aggreko / APR retired fleet | aggreko.com | weekly | Rental-fleet retirements; 50 Hz. |
| ⬜ | EU plant liquidation brokers | — | weekly | **Seed list TBD — Scott confirm appetite.** |
| ⬜ | ME/Asia surplus traders | — | weekly | **Seed list TBD — Scott confirm appetite.** |

## Tier 5 — noisy / manual (lower cadence)

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | eBay (industrial generators) | ebay.com | daily | High noise; watchlist-filtered. |
| ⬜ | Facebook Marketplace | facebook.com | manual | Anti-bot; manual or P3 fetcher. |
| ⬜ | Craigslist (multi-metro) | craigslist.org | weekly | Regional steals. |
| ✅ | LinkedIn equipment posts | linkedin.com | weekly | Broker/seller posts. |

## OEM certified-used (premium — the "rebuilt" lane)

| On | Source | URL | Poll | Notes |
|----|--------|-----|------|-------|
| ✅ | Cat Used / Cat Reman | catused.cat.com | daily | Node-standard make; certified condition. |
| ✅ | Cummins | cummins.com | weekly | HSK78G second-source make. |
| ✅ | MTU reconditioned | mtu-solutions.com | weekly | Premium recip. |
| ✅ | Wärtsilä reconditioned | wartsila.com | weekly | 34SG-class gas. |
