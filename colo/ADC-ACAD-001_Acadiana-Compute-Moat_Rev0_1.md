# ADC-ACAD-001 — The Acadiana Compute Moat
## Regional Siting Thesis — why Lafayette / Acadiana is structurally advantaged for behind-the-meter AI compute

| Field | Value |
|---|---|
| Document | ADC-ACAD-001 |
| Title | The Acadiana Compute Moat — Regional Siting Thesis |
| Revision | **Rev 0.1 — ISSUED 2026-06-13, pending Scott approval** |
| Author | ADC Solutions Inc (Mission Control), direction Scott Tomsu |
| Audience | Investors and strategic partners — **presented by Scott only; nothing is sent from this repo** |
| Release posture | Internal until approved; intended to seed the investor narrative, the website "why Louisiana" page, and the front matter of capital docs. |
| Companion docs | [MISSION.md](../MISSION.md) (business lines) · [colo/README](README.md) (the three plays) · [ADC-OFS-001](oilfield-services/ADC-OFS-001_Rev0_1.md) (customers) · [ADC-UTIL-001](utility-partnership/ADC-UTIL-001_Rev0_1.md) (utilities) · [ADC-FUND-001](../company/capital/ADC-FUND-001_genset-btm-acquisition-fund_Rev0_1.md) (the capital vehicle this thesis underwrites) · [MGN-BOD-002](../products/Microgrid/MGN-BOD-002_Rev0_2.md) (the 10 MW node) · [decision 0006](../ops/decisions/0006-heat-rejection-architecture.md) (heat-rejection architecture) |

## Revision history

| Rev | Date | Change |
|---|---|---|
| 0.1 | 2026-06-13 | First issue. Captures the "vertical-integration-depth" moat frame, the speed-to-power thesis, the five-layer stack (fuel/buildings/water/network/workforce), the compounding regional advantages, the honest-risk register, and the investor one-liner. Load-bearing external facts verified and sourced (§Sources); local quantitative figures carried as ACAD-OI open items. |

---

## §1 Thesis in one sentence

> **AI compute is bottlenecked on speed-to-power, the fastest power is behind-the-meter on-site generation, the cheapest and most infrastructure-complete generation fuel in America is South Louisiana natural gas — and Acadiana is one of the only places on earth where a developer can integrate the whole value chain, from the GPU down to the molecule at its national pricing point, on assets that already exist.**

The moat is not "we have cheap gas." The moat is **how far upstream on the energy value chain a site lets you integrate** — and Lafayette lets you climb the entire ladder. Every rung you own is a rung a competitor in Virginia, Phoenix, or Dallas structurally cannot climb, because the geology, the pipe, the buildings, the water, the fiber, and the workforce are not under their feet. [L — Scott, framing, 2026-06-13]

## §2 Why now — power is the binding constraint, not silicon

The gating item for new AI capacity has shifted from GPUs to **the ability to energize load**. Grid interconnection is the choke point:

- A project reaching commercial operation in 2024 spent a median of **~55 months (~4.5 years)** in the interconnection queue, and **~2,290 GW** of capacity sat active in U.S. queues at end-2024 — **roughly twice the entire installed U.S. generating fleet.** [W — LBNL *Queued Up*, 2025 Edition; §Sources]
- A model generation turns over in ~12–18 months. A site that cannot energize for ~5 years is dead on arrival in that race.

**Behind-the-meter (BTM) generation sidesteps the queue entirely.** Power is generated on the customer side of the utility meter, so the load never waits on a transmission interconnection — it energizes as fast as the gensets and the gas tap can be landed (months, not years). Acadiana's serving grid is MISO South [W — confirm RTO/queue specifics, ACAD-OI-03], but the BTM thesis is RTO-agnostic by design: **the whole point is not to need the queue.** This is the single most important sentence for an investor — *we sell speed-to-power, and BTM gas is the fastest power in America.*

## §3 The ladder — the moat is integration depth

| Rung (bottom → top) | What it means | Who is stuck here |
|---|---|---|
| Buy power from the grid | At the mercy of the interconnection queue and grid price | Almost every data-center developer |
| **Generate on-site (behind-the-meter)** | You own the electrons; you skip the queue | The leading edge (gas-BTM is the current industry move) |
| **Own the fuel** | You own the molecule cost, not just the electron | Rare |
| **Sit at the source of the fuel** | Cheapest, most reliable, most infrastructure-complete molecule in the country | **Almost nobody — Acadiana can** |

ADC's product stack is purpose-built to climb this ladder: the **10 MW AC-MV natural-gas microgrid node** ([MGN-BOD-002](../products/Microgrid/MGN-BOD-002_Rev0_2.md)) is the BTM-generation rung, scaling in N★ blocks ([ADC-NSTAR-001](../products/NStar/ADC-NSTAR-001_Rev0_2.md)). This thesis never restates node parameters — MGN-BOD-002 governs.

## §4 The stack, layer by layer

Every data center on earth needs the same five inputs: **electrons → cooling → network → land/buildings → people.** Acadiana is rare in supplying all five at the source.

### §4.1 Fuel — at the source, not the end of a lateral

- **The national benchmark is next door.** Henry Hub — the physical delivery and pricing point for U.S. natural gas and the NYMEX/CME global benchmark — is in **Erath, Vermilion Parish, the parish bordering Lafayette to the south** (on the order of ~20 mi straight-line / ~40 mi by road from the city). It is a header system interconnecting multiple interstate and intrastate pipelines, operated by Sabine Pipe Line. [W — CME / Wikipedia; §Sources]
- **Dense supply and transport.** South Louisiana is among the most pipeline-dense, storage-dense (salt-dome) gas regions in North America; the Haynesville (NW Louisiana) is one of the largest U.S. gas plays and feeds the Gulf LNG export corridor. [W — general/EIA; refine with a sourced figure, ACAD-OI-04]
- **The implication.** Most data-center developers *contract* for gas to be *delivered* down a constrained lateral. An Acadiana site sits inside the densest gas grid in the country, adjacent to the price-setting hub — the difference between buying at retail down a straw and standing at the wholesale spigot.

### §4.2 Buildings — brownfield shells with the right bones

The repurposing case (MISSION.md Business Line 2, play #1; [colo/README](README.md)): Lafayette's **Oil Center** (the historic petroleum business district) and the broader inventory of oilfield-service and industrial buildings were built *by* the energy industry, and they already carry what a compute hall needs:

- **heavy industrial slabs** — liquid-cooled AI racks are heavy (commonly ~1,500–3,000+ lb each); industrial floors already carry that load;
- **large electrical service, big lots, industrial zoning, and local support** for continued industrial use; and, critically,
- **natural gas already piped to the building** — the "last mile" of fuel is already done.

Repurposing a hardened shell vs. greenfield typically saves ~12–24 months and a large slug of capex (no new shell, pad, or fresh utility taps). Specific per-building MW, slab ratings, and clear heights are site-record facts, tagged per [colo/sites/](sites/) records, not asserted here. [O — per-building, ACAD-OI-01]

### §4.3 Water — abundant for the region, but used honestly

High-density compute rejects heat into water (evaporative cooling / make-up water), and water availability is now a hard siting gate — the constraint that is throttling arid markets (Phoenix, West Texas).

- **Acadiana is water-rich relative to those markets:** the **Chicot Aquifer** is the principal fresh-groundwater source for southwestern Louisiana (~48% of the state's groundwater use, underlying ~9,500 mi² including Lafayette; it is LUS's municipal water source), plus surface water (Vermilion River, Bayou Teche) and ~55–60 in/yr of rainfall. [W — USGS / LSU LWRRI; rainfall figure ACAD-OI-05]
- **The honest asterisk:** the Chicot is being **overdrawn** — on the order of ~661 Mgal/d pumped against ~313 Mgal/d recharge in recent reporting. [W — USGS / WWNO; §Sources] So the pitch is *not* "unlimited free water."
- **Why this is a feature, not a bug for ADC:** the platform already treats heat rejection as **site-selectable between evaporative and a zero-water dry-cooler plant** ([decision 0006](../ops/decisions/0006-heat-rejection-architecture.md); [products/FWS/](../products/FWS/)). We can site water-assisted where water is genuinely abundant and dry-cool where it is stressed — a sophistication most developers cannot offer. The abundance is real and differentiating versus the desert; the discipline is what makes it durable.

### §4.4 Network — the third leg almost everyone forgets

Power and cooling are useless without the network. **LUS Fiber** is Lafayette's community-owned, **100%-fiber** network — one of the first municipal fiber-to-the-home/business systems in the U.S. (bonds approved by voters 2005, first customers Feb 2009), delivering gigabit service across the Lafayette area. [W — LUSFiber / Lightreading; §Sources] Carrier-grade municipal fiber downtown is something most secondary markets simply do not have, and it directly underwrites the edge/enterprise colocation lane.

### §4.5 Workforce — the most under-priced asset

A gas-powered data center is, mechanically, a **process facility**: high-pressure gas handling, rotating equipment (gensets, compressors), instrumentation & controls / SCADA, 24/7 mission-critical shift operations, and a hard process-safety culture. Acadiana's oilfield workforce already runs exactly this equipment, and the downturn cycles freed up that talent locally. Hyperscalers in greenfield markets must *import* this skill set; here it is hired locally and arrives safety-trained. (Scott is the embodiment of the type — see [scott-tomsu-profile](../company/Personnel/Scott%20Tomsu/scott-tomsu-profile.md).)

## §5 The advantages that compound the moat

| Advantage | Why it matters | ADC linkage |
|---|---|---|
| **Genset service ecosystem is already local** | When a unit trips at 02:00 you need parts and a field tech *now*. The oilfield built that dealer/rental/compression-packager network here. An uptime moat greenfield markets lack. | Cat / Cummins / Wärtsilä partner threads ([partners/](../partners/)) |
| **Customers are next door** | LA oilfield-service firms sit on huge proprietary datasets (seismic, well logs, ROV/subsea video, fleet telemetry) under pressure to adopt AI, and care about data sovereignty — a warm vertical, not a cold market. | [ADC-OFS-001](oilfield-services/ADC-OFS-001_Rev0_1.md) (decision [0010](../ops/decisions/0010-oilfield-services-compute-program.md)) |
| **Microgrid resilience turns hurricane risk into a feature** | A self-islanding gas microgrid keeps compute (and grid services) up when the grid is down. The thing investors flag as risk is the thing the product answers. | [ADC-UTIL-001](utility-partnership/ADC-UTIL-001_Rev0_1.md) §2 (black-start, storm resilience) |
| **A credible in-state decarbonization path** | Pre-empts the "but it's fossil" objection: Louisiana leads on carbon capture — **EPA granted the state Class VI well primacy (final rule 2023-12-28, effective 2024-02-05; 3rd state after WY/ND)** [W — Mayer Brown/EPA; §Sources]. Salt-dome geology + 45Q create a real CCS path for BTM generation; flare/stranded-gas capture ("flare-to-compute") is both a cost and an ESG story. | decision 0006 / future ENV scope; ESS solar hybridization ([products/ESS/](../products/ESS/)) |
| **The fab yards build the *other* business line** | The same Port of Iberia / Acadiana fabrication network that built subsea topsides and modules can bend metal for CDUs, TCS, HAC, and power skids — a manufacturing moat distinct from the colo moat. | MISSION.md Business Line 1; logistics: Port of Iberia, rail, I-49/I-10 |
| **Talent pipeline for the IT/AI side** | UL Lafayette (Computer Science / Informatics) and the LITE immersive-tech center supply the IT/network/AI complement to the oilfield OT workforce. | §4.5 |
| **A single motivated local counterparty** | LUS is an unusual municipal utility owning **electric + water + fiber** — one counterparty for the grid-side pieces a site actually wants. | [ADC-UTIL-001-C LUS](utility-partnership/ADC-UTIL-001-C_LUS_Rev0_1.md) |
| **Permissive, energy-literate permitting + manufacturing incentives** | LDEQ gas-combustion air permitting is well-trodden here (a real gate elsewhere). **ITEP gives manufacturers (NAICS 31–33) an 80% property-tax abatement up to 10 yr, 93–100% for $500M+ mega-projects** [W — LED/LEDC; §Sources] — a clean fit for the BL1 manufacturing line. **Note:** ITEP targets *manufacturers*; data-center / colo eligibility is a separate question (Quality Jobs is sunsetting under the 2025 tax overhaul; Restoration Tax Abatement, Enterprise Zone, and Opportunity Zones are the likelier colo-side tools). Confirm colo-side incentive stack before any investor claim. [O — ACAD-OI-02] |
| **Cost basis** | Cheap industrial land and buildings, low labor cost vs. coastal metros, no suburban NIMBY zoning fight. | per-site records |

## §6 Honest risks — and how the thesis answers them

| Objection an investor will raise | The answer |
|---|---|
| **"Why not Texas / ERCOT?"** | ERCOT's queue is jammed too; **BTM avoids the queue everywhere** — so the tiebreaker becomes fuel cost at the source (LA wins, at the hub) and water (LA is not water-constrained like West Texas). |
| **Hurricane / flood exposure** | Real. The microgrid *answers* it (islanding, black-start, storm resilience — §5); site selection above flood and hardened concrete shells mitigate the rest. Frame resilience as product, not just risk. |
| **Gas-price volatility** | Henry-Hub adjacency, hedging, long-term supply, and optional wellhead/stranded gas. Cheap, stable molecules → cheap, stable electrons. |
| **Emissions / ESG** | In-state CCS path (Class VI primacy, salt-dome geology, 45Q), efficient lean-burn gensets with SCR + oxidation catalyst (MGN-BOD-002), and flare-to-compute. |
| **Water (Chicot drawdown)** | Acknowledged honestly (§4.3); the zero-water dry-cooler option (decision 0006) is the structural answer. |
| **Scale ceiling of BTM gas** | BTM gas is *ideal* for the **edge / enterprise lane** (tens of MW) — which is ADC's stated lane (MISSION.md BL2; ADC-OFS-001). Gigawatt training campuses are a different animal; not needing to be one is a feature, not a gap. Say so plainly. |

## §7 How this thesis maps to ADC's existing work

This document is the "why here" that the rest of the repo already leans on:

- **ADC-FUND-001 (genset BTM acquisition fund)** — this thesis is the fund's underwriting narrative: the fund acquires exactly the brownfield, gas-served, water-available sites this document describes. [ADC-FUND-001](../company/capital/ADC-FUND-001_genset-btm-acquisition-fund_Rev0_1.md)
- **ADC-OFS-001 (oilfield-services compute)** — §4.5 (workforce) and §5 (customers next door) are the human and demand side of the same moat.
- **ADC-UTIL-001 (utility partnership)** — §5 (resilience) and §6 (storm) are the grid-services articulation.
- **The SpaceX Louisiana pitch** — the "power and compute infrastructure" capability rests on this regional stack. [partners/SpaceX/](../partners/SpaceX/)
- **Site records** — every claim that is site-specific (per-building MW, slab, gas pressure, water source) lives tagged in [colo/sites/](sites/), never asserted here.

## §8 The investor one-liner

> *"AI is bottlenecked on speed-to-power. The fastest power is behind-the-meter gas. The cheapest, most infrastructure-complete gas in America is South Louisiana — and Lafayette sits in the next parish over from Henry Hub, the national benchmark, with the buildings, the gas taps, the water, the fiber, and the workforce already in the ground. Everyone else assembles these over years; here they're already stacked. That stack is the moat."*

The three "why":
- **Why now** — speed-to-power is the binding constraint; queues run ~4.5 years; AI cannot wait (§2).
- **Why here** — the five-layer stack at the source: fuel + buildings + water + fiber + workforce, with the national gas hub next door (§4).
- **Why us** — ADC builds the hardware, runs mission-critical industrial systems, is AI-native and local, and can self-island (§3, §7).

## §9 Open items

| ID | Item | Gates |
|---|---|---|
| ACAD-OI-01 | Per-building inventory: candidate Oil Center / brownfield shells with MW service, slab rating, clear height, gas pressure (feeds [sites/](sites/) records) | any building-specific investor claim |
| ACAD-OI-02 | **Colo-side incentive stack confirmation** — ITEP applies to BL1 manufacturing; confirm data-center/colo treatment (Restoration Tax Abatement, Enterprise Zone, Opportunity Zone, any LA data-center incentive; Quality Jobs sunset status) | any incentive claim in an investor doc |
| ACAD-OI-03 | MISO South interconnection-queue specifics for the serving territory (to localize the national LBNL figure) | the "why now" slide |
| ACAD-OI-04 | Sourced figures for South-Louisiana gas: Haynesville scale, pipeline/storage density, current Henry Hub basis ($/MMBtu) | the fuel-cost argument |
| ACAD-OI-05 | Confirm local figures: Lafayette annual rainfall, Chicot sustainable-yield headroom near candidate sites | the water slide |

## §Sources (accessed 2026-06-13)

- Henry Hub / Erath / Sabine Pipe Line — [CME Group: Henry Hub global benchmark](https://www.cmegroup.com/articles/whitepapers/henry-hub-natural-gas-futures-global-benchmark.html) · [Wikipedia: Henry Hub](https://en.wikipedia.org/wiki/Henry_Hub)
- Interconnection queue (~55 months median; ~2,290 GW active) — [LBNL *Queued Up* (Energy Markets & Planning)](https://emp.lbl.gov/publications/queued-2025-edition-characteristics) · [APPA summary](https://www.publicpower.org/periodical/article/report-details-projects-looking-interconnect-grid-end-2024)
- Louisiana Class VI primacy (final rule 2023-12-28; effective 2024-02-05; 3rd state) — [Mayer Brown](https://www.mayerbrown.com/en/insights/publications/2024/02/state-of-louisiana-granted-primacy-over-class-vi-wells) · [EPA newsroom](https://www.epa.gov/newsreleases/epa-opens-public-comment-proposal-granting-louisiana-primacy-carbon-sequestration-and)
- LUS Fiber (100% fiber muni network; 2005 bond vote, Feb 2009 first customers) — [Wikipedia: LUSFiber](https://en.wikipedia.org/wiki/LUSFiber) · [Lightreading: the muni model in Lafayette](https://www.lightreading.com/fttx/the-divide-how-lus-fiber-makes-the-muni-model-work-in-lafayette-louisiana)
- Chicot Aquifer (principal SW-LA source; ~48% state groundwater use; LUS source; overdraft) — [USGS SIR 2004-5212](https://pubs.usgs.gov/publication/sir20045212) · [LSU LWRRI Chicot study](https://www.lsu.edu/lwrri/research/chicot_aquifer.php) · [WWNO: overdraft](https://www.wwno.org/coastal-desk/2021-03-09/louisianas-biggest-source-of-groundwater-is-losing-water-fast)
- ITEP (80% / 10-yr abatement; 93–100% for $500M+; manufacturer NAICS 31–33) — [LED: Industrial Tax Exemption](https://www.opportunitylouisiana.gov/incentive/industrial-tax-exemption) · [LEDC summary](https://ledc.net/incentives/industrial-tax-exemption-program/)
