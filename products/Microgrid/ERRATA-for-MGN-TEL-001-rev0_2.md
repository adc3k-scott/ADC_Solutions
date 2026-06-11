# Errata pack — MGN-TEL-001 Rev 0.1 → Rev 0.2

Prepared 2026-06-10 by Mission Control for Scott Tomsu. Apply when
revising the Unified Telemetry BoD docx. Sources:
`ops/research/2026-06-10-ocp-spec-currency.md`, ADC-SYS-001 registry,
decision 0002.

## E1 — Redfish 2026.1 date correction (SYS-OI-06)

§2.1 says "Release published 2026-05-20." The official document date on
DSP0266 v1.24.0 and DSP0268 2026.1 is **2026-04-02** (2026-05-20 was
likely the announcement or download date). 2026.1 remains the latest
release as of 2026-06-10; 2026.2 expected ~Aug 2026.

## E2 — Parent document citation (SYS-OI-01, closed)

The header cites parent "OCP Project Deschutes — Redfish, AI Control &
Four-Tier Reference v1.2 (compute + cooling)." Correct to: **internal
ADC document (not an OCP publication), Rev 1.3 (2026-06-10), repo path
`products/Telemetry/Deschutes_Redfish_AI_Control_Reference_TCS_Technology_Cooling_System.docx.md`.**
Rev 1.3 aligned it to this BoD and the 2026.1 baseline, so the
parent/child relationship is now consistent in both directions.

## E3 — The plane is a named product (decision 0002)

The architecture this BoD defines is productized as **Telemetry** (plain
— not "ADC_Telemetry"), spec'd in `products/Telemetry/README.md`
(ADC-OS-001: autonomy ladder A0–A3, conformance contract, double
bridge). Add a scope note tying the BoD to the product, and consider
whether the **MGN doc prefix** should change at this revision —
COMM-001's hardware half is still open.

## E4 — Implementation status (new since Rev 0.1)

§14 POC Phase 1 ("Simulate") is **implemented**: ADC-SYS-001 registry
(`system/registry/`, validated), executable twin replaying the §10
correlation (`system/twin/`), a registry-generated 97-resource
`/redfish/v1` mockup with GET-only server, and the draft site
Interoperability Profile (TEL-PROFILE v0.1.0-draft,
`system/twin/profile/`). Rev 0.2 should record this so the BoD's
phasing reflects reality.

## E5 — Minor

- §16 TEL-001: add "pin = commit hash or release tag of
  DMTF/Redfish-Publications at 2026.1" so the action is unambiguous.
- CTRL-001/CTRL-002 subsumption note (§1) — confirm MGN-BOD-002's next
  revision points here rather than carrying both.
