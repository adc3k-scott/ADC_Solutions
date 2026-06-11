# Louisiana Colocation Solutions Provider (CSP) — Business Line 2

The colocation side of ADC Solutions: developing and operating
mission-critical AI compute sites in Louisiana, built from our own
product stack (CDU, Modular TCS, HAC, 10 MW Microgrid Node, Telemetry)
and our in-house Louisiana General Contractor License. Mission context:
[MISSION.md](../MISSION.md) §Business line 2.

## The three plays

| # | Play | Profile |
|---|---|---|
| 1 | **Brownfield repurposing** | Older commercial/industrial locations that previously consumed large amounts of electricity, with on-prem natural gas, that can host 5–10 MW IT compute clusters (NVIDIA GPUs or Google TPUs). Ideal because they already have transmission, substations, switching infrastructure, industrial zoning, natural gas piping, and local support for continued industrial use. |
| 2 | **AI Enterprise for oilfield services** | Introduce AI enterprise compute — and its resale value — to Louisiana oilfield service companies. |
| 3 | **Greenfield development** | Projects with large amounts of on-prem natural gas and water. |

## How a site becomes real

A site is the unit of this business line, the way the 10 MW node
(MGN-BOD-002) is the unit of the power platform. Every site gets one
record in [sites/](sites/) built from the
[site-record template](sites/_TEMPLATE.md). The record is the canonical
index of site facts — utilities, gas, water, structure, zoning,
permitting — each tagged [L]/[W]/[O] with a source, same convention as
the product registry.

Site records **reference, never restate,** the platform standards:

- **Power:** nodes per MGN-BOD-002 (10 MW AC-MV NG node; campus = n×nodes
  under one minor-source air-permit envelope — ENV-001 applies to every
  campus commitment).
- **Telemetry:** site-specific requirements per MGN-TEL-001 §4.3 (e.g.,
  dual-utility island-separation monitoring) and the site Redfish
  interoperability profile (TEL-PROFILE).
- **Compute hall:** CDU + TCS + HAC reference bay per `products/`.

## Site register

| Site | Record | Status |
|---|---|---|
| Trappey's Compute Center | [sites/trappeys-compute-center.md](sites/trappeys-compute-center.md) | **Filled 2026-06-11 from ST-TRAP-BOD-001 Rev 0.6** (legacy reference, external) — 22-acre cannery, Vermilion River; 91.1 MW Stage 1 BTM island. **ADC-native re-engineering decided ([0003](../ops/decisions/0003-trappeys-adc-native-reengineering.md)) — new package = TRAP-OI-03** |
| Cameron Street (Entergy, dual-utility) | [sites/cameron-street.md](sites/cameron-street.md) | **Filled 2026-06-12 from MGN-PROP-004 Rev 0.3** (Entergy BTM proposal; 2623 Cameron St, Entergy ops site + adjacent substation; Phase-1 pilot + single 10 MW node). PROP-004 does **not** subsume MGN-PROP-005 (dual-utility) — **SYS-OI-02 stays open** |

**COLO-01 CLOSED 2026-06-11:** Trappey's and Cameron Street are
**different sites**, confirmed by Scott (decision 0003). Records stay
split.

## Open items

Colo-relevant items live in the unified register
(`system/registry/open-items.json`): SYS-OI-02 (MGN-PROP-005 file
drop), COLO-01 (site identity), ENV-001 (PTE / minor-source — gates
every 200 MW campus commitment), ELEC-006 (firm-MW de-rate to site
ambient — gates every commercial commitment), CIVIL-001/002 (footprint,
acoustics — gate site layout/selection).
