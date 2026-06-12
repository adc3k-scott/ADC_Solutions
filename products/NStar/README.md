# N★ Block — the repeating site unit

The **N★ block** pairs a **5 MW IT heat load** (4× 16-rack reference
cluster, ADC-CLU-BOM-001) with **one 10 MW microgrid node**
(MGN-BOD-002). Sites scale as N independent stars. Decided in
[0004](../../ops/decisions/0004-n-star-block-topology.md) +
[0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md);
governed by **[ADC-NSTAR-001 Rev 0.2](ADC-NSTAR-001_Rev0_2.md)**
(**approved by Scott 2026-06-12** — SYS-OI-08 closed).

This is not a hardware product like its siblings — it is the
**aggregation standard** one level above
[products/Cluster/](../Cluster/): Cluster (1.25 MW) → N★ block
(5 MW IT + 10 MW node) → site (N blocks).

First applied sizing: Trappey's Stage 1 = **19 blocks**
([ADC-TRAP-SIZE-001 Rev 0.2](../../colo/sites/trappeys-engineering/ADC-TRAP-SIZE-001_Rev0_2.md)).

Open: SYS-OI-08 (approval), SYS-OI-09 (node-bus→RPP electrical seam),
SYS-OI-10 (house/aux PUE residual — mechanical+CDU portion derived at
Rev 0.2, ≈1.10–1.14), SYS-OI-11 (78 kW reference-cluster basis vs
NVL72-density rack count) — see `system/registry/open-items.json`.
