# ADC-FUND-001 — NG Genset BTM Acquisition Fund — Ornn Anchor-LP Brief

| Field | Value |
|---|---|
| Document | ADC-FUND-001 |
| Revision | 0.1 — issued 2026-06-13, pending Scott approval |
| Decision | [0017](../../ops/decisions/0017-ng-genset-acquisition-fund.md) (this vehicle); frames under [0016](../../ops/decisions/0016-two-game-plan-deployment.md) GP-B, [0009](../../ops/decisions/0009-three-property-acquisition-seed-capital.md) capital |
| Owner | Scott Tomsu, President — **Scott presents; nothing is sent from this repo** |
| Audience | Jack Minor / Ornn — anchor-LP ask |
| Priority | Runs under GP-B (SECONDARY); never displaces GP-A or the calendar guard (0016 §1) |

## §1 The one-sentence thesis

The bottleneck in AI compute is **power, not chips** — and new large-frame
gensets are on multi-year allocation, so the only way to deploy firm
behind-the-meter power *this year* is to buy the world's available ≥1 MW
natural-gas iron now, before the window closes. **ADC owns the assets,
runs the load, and controls the fuel.**

## §2 Why now — the window

- New ≥1 MW gas gensets are on allocation lists [O — verify current OEM
  lead times before the room]. ADC will hold list positions and place
  deposits, but those units land in years, not months.
- **Deployable supply today is existing equipment, worldwide.** It is
  finite and it is being bought up. First mover locks the inventory.
- Behind-the-meter gas **bypasses the grid interconnection queue**
  (multi-year) — compute comes online while everyone else waits in line.
  That bypass, not the genset itself, is the moat.

## §3 The differentiated edge — 50 Hz *and* 60 Hz

A behind-the-meter compute island is **not grid-synchronized**. Server
power supplies rectify AC→DC at the rack, so a **50 Hz genset can power a
60 Hz-region compute load** on an islanded node. That means ADC's
sourcing pool is the **entire world's surplus** — the large 50 Hz
inventory in Europe, the Middle East, and Asia — not just the North
American 60 Hz market. Almost no one pitching US compute power can buy
50 Hz iron. ADC can.

*Engineering caveat (stated honestly): the frequency-agnostic claim is
the compute load. Balance of plant — switchgear, transformers,
protection — is matched to each unit's native frequency at the node.*

## §4 The structure — Ornn as anchor LP

- **Pooled co-ownership SPV.** Participants collectively own the iron.
  ADC is manager/GP, earning a development fee + carry.
- **Series-LLC, node-ring-fenced** [O — counsel]: each deployment node
  is walled off, so one underperforming unit never contaminates the pool.
- **Asset-backed downside.** Investors hold hard assets with residual /
  resale value — not equity in an operating company. If a deployment
  underperforms, the iron still has a market. Easier raise, real floor.
- **The ask:** Ornn as **anchor LP** — the lead commitment that lets ADC
  move on the inventory window with a closing clock. This is the sharper,
  time-boxed instance of the GP-B capital conversation (CAP-OI-04):
  a financial layer on an operating platform, with a deadline.

## §5 The first deployment — own-use, vertically integrated

The fund's first iron lands at **ADC's own behind-the-meter compute
site** on the decision 0009 property triangle (Evangeline hub / Marlie
Hub head-end) [O — site selection]. ADC owns the assets through the fund,
runs its own compute load, and fuels it on Louisiana gas. This proves the
node before any power-as-a-service offering to third parties — which is a
later option, not the opening move.

Acquired units are bought to the existing ADC node standard
([MGN-BOD-002](../../products/Microgrid/MGN-BOD-002_Rev0_2.md)): ≤10 MW
node, reciprocating gas gensets at MV, AC-coupled BESS transient bridge,
ISO 8528 class G3 or better, fitting the 20-node / 200 MW single
minor-source air-permit envelope. **ADC is not improvising — there is an
engineering basis of design the fund acquires iron to fit.**

## §6 Fuel — the Louisiana advantage

The BTM thesis runs on Lafayette / oilfield natural gas, including
potentially stranded or flared gas [O — supply path]. Gulf-Coast gas is
the asset this vehicle has that an out-of-state fund does not. It is part
of the thesis.

## §7 The discipline — what protects the capital

- **Buy-box gate:** documented hours, maintenance/overhaul records, named
  OEM frames only. No undocumented iron.
- **Air-permit gate (the kill risk, handled up front):** continuous-duty
  *prime* BTM power is screened against 40 CFR 60 subpart JJJJ (NSPS
  spark-ignition) and 40 CFR 63 subpart ZZZZ (RICE NESHAP), with
  relocated/used-engine applicability applied honestly — a used overseas
  unit may be standby-only in the US. Qualification precedes any purchase
  commitment. ADC names this risk before Ornn has to.

## §8 The honest boundaries (first conversation, not a term sheet)

- This is a first conversation (per ADC-CAP-001 §7 posture) — no
  exclusivity, no offtake language, no term sheet in the room.
- Open items to close before any purchase commitment: SPV legal /
  securities structure (FUND-OI-01), air-permit qualification protocol
  (FUND-OI-02), first-node site, fuel-supply path.
- This vehicle is **secondary to GP-A** (SpaceX-first) and subordinate to
  the calendar guard (Trappey's 2026-06-16, §48E 2026-07-04, BRIC
  2026-07-23). It runs in parallel; it does not displace.

## §9 The one-line close

*"We've found a closing window on the one thing AI compute can't get —
firm power. Here's an asset-backed vehicle to capture it before it's
gone. We want Ornn as the anchor."*
