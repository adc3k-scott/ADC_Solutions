# Marlie Hub — Engineering Documents

ADC-native engineering set for **Marlie Hub — Mission Control Node 0**
(1201 SE Evangeline Thruway, Lafayette — the ADC home office that
supports compute and hosts the fleet's Mission Control / Telemetry
head-end). Site facts live in the [site record](../marlie-hub.md);
these documents carry the deployment engineering. Naming rule:
**"Marlie Hub" only.**

| Doc | Scope | Status |
|---|---|---|
| ADC-MHUB-001 | [Compute scope: 8-rack seed/POC scalable in place to 16 (SCALE-1) — phasing, electrical/mechanical scope, building survey, validation test plan, budget structure](ADC-MHUB-001_Rev0_2.md) | **Rev 0.2 ISSUED 2026-06-11** — pending Scott approval; closes COLO-03 on approval |

Pattern: engineering basis = the 16-rack reference cluster
(ADC-CLU-BOM-001, approved); seed populates 8 rack positions with all
row infrastructure (headers, CDU, busway, RPPs) built for 16. Marlie
Hub is the first physical instance of the cluster and the validation
site for the product pattern that replicates at every N★ site.
Sub-block on utility AC per ADC-NSTAR-001 §5 — no microgrid node here.
