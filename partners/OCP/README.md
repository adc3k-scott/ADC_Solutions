# OCP — Open Compute Project reference library

Third-party OCP specifications, white papers, and usage guides
(all dropped 2026-06-11). These are **reference documents from OCP**,
not ADC product specs — nothing here implies a product is in the
ADC lineup (see decisions [0005](../../ops/decisions/0005-no-cassettes-current-product-lineup.md),
[0010/0011](../../ops/decisions/)).

Where a spec also lives next to the ADC product it informs, the
**product folder copy is canonical** and is the one product docs cite.

## Specifications

| File | Notes |
|---|---|
| OCP-Specification-Deschutes v1_0.pdf | ORV3 in-rack CDU spec. Canonical copy: [products/CDU/](../../products/CDU/) |
| OCP-Specification-Diablo 400 v0.7.0 FINAL.pdf | ±400 VDC rack power, pre-production. **WATCH status, not lineup** (decision 0011). Canonical copy: [products/Diablo/](../../products/Diablo/) |
| Open Data center Spec Version 0.5.0.pdf | Open Data Center spec. Canonical copy: [colo/](../../colo/) |
| HVDC_LVDC_PSU_18kW Spec_1.0.0.pdf | 18 kW HVDC→LVDC PSU spec. Background for HVDC power-chain watch (decisions 0007/0011) |
| ORV3 HVDC-LVDC 100kW Power Shelf Spec_1.0.0.pdf | ORV3 100 kW HVDC-LVDC power shelf. Same watch track as the 18 kW PSU |
| Rope Leak Sensor Base Specification_R1.0.0_FINAL.pdf | Leak-detection rope sensor base spec — relevant to TCS/CDU leak detection |
| OBMF-ICP over USB 1.0.pdf | Open BMC firmware ICP-over-USB management spec |

## White papers

| File | Notes |
|---|---|
| DCF Power Distribution LVDC white paper version 1.0_FINAL.pdf | DC Factory LVDC power distribution. Reference only — **never cite 800 VDC for IT as fact** (decision 0007) |
| DCF Water-Heat-Energy-2026March.pdf | DC Factory water/heat/energy white paper |
| OCP Open Data Center for AI Whitepaper FINAL.pdf | Open Data Center for AI overview |
| OCP-OCS_White_Paper_April_2026_FINAL.pdf | Open Cluster Designs white paper (2026-04) |
| WHITE PAPER_OCP READY REQUIREMENTS FOR ENERGY STORAGE SYSTEMS_FINAL.pdf | OCP Ready requirements for ESS — informs [products/ESS docs](../../products/) |
| Considerations For Shipping and Storage of 1-Phase Coldplate Liquid Cooled Racks and Servers FINAL March 2026.pdf | Shipping/storage of liquid-cooled racks (2026-03) |
| OCP Benchmark.pdf | OCP benchmarking overview |

## Reference architectures & usage guides

| File | Notes |
|---|---|
| OCP-Open Cluster Designs Aligned AI Training Fabric RA.pdf | Aligned AI training fabric reference architecture |
| Open Cluster Designs Aligned AI Inference Fabric Reference Architecture.pdf | Aligned AI inference fabric reference architecture |
| UsageGuide-Baseline_1.1.0_FINAL.pdf | Hardware management baseline usage guide (Redfish) — informs [system/twin/](../../system/twin/) |
| UsageGuide-ServiceBaseline_1.0.0_FINAL.pdf | Service baseline usage guide |
| UsageGuide-EthernetNIC_1.0.0_FINAL.pdf | Ethernet NIC usage guide |

## Site-assessment examples (OCP Ready)

| File | Notes |
|---|---|
| OCP Ready v2 for Hyperscale Data Center Site Assessment - v1.0 rev14 ATL01 Aligned Data Centers.pdf | v2 hyperscale example — template for ADC colo site assessments |
| OCP Ready v1 Site Assessment - v1.0 rev1.4 Global Switch Amsterdam East.pdf | v1 example |
| OCP Ready v1 Site Assessment - v1.0 rev1.4 Global Switch Hong Kong Data Centre.pdf | v1 example |
