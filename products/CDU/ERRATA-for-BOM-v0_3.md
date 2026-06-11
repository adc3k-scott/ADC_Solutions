# Errata pack — ADC-CDU-DES-BOM-001 → next revision (v0.3)

Prepared 2026-06-10 by Mission Control for Scott Tomsu. Apply these when
revising the CDU BOM docx; each item carries its registry tracking ID.
Sources: `ops/research/2026-06-10-ocp-spec-currency.md` and the
ADC-SYS-001 registry.

## E1 — Version identity (CDU-G10)

Filename says **v0.2**; the title page reads **v0.1**. Set both to the
new revision (v0.3) and add a revision-history row so this can't recur.

## E2 — Diablo 400 citation is superseded (SYS-OI-04)

The BOM cites **OCP Diablo 400 Rack & Power v0.5.2** (sidecar power
context). Current is **v0.7.0, dated 2026-03-01** — and the change is
material, not cosmetic: v0.7.0 explicitly permits **both bipolar
(±400 V three-wire) and unipolar (800 V two-wire)** sidecar output for
100 kW–1 MW racks. Update the citation and re-check any sidecar-power
context statements against the new output options.
URL: https://www.opencompute.org/documents/ocp-specification-diablo-400-v0-7-0-final-pdf

## E3 — Three numeric values to settle (SYS-OI-07)

Two ADC documents currently disagree; declare the governing values in
the BOM (registry carries the Deschutes §3.1 readings until the final
OCP drawing package settles it):

| Parameter | Deschutes §3.1 / registry | Redfish/AI Reference §8.1 | Action |
|---|---|---|---|
| CDU depth | **42.29″** | 40.29″ | State 42.29″; note 40.29″ appears in some public Deschutes material — resolve at drawing package |
| Wet weight | **6,900 lb** | 6,910 lb | State 6,900 lb max |
| Facility ΔP basis | **15–30 psi** | 15–27 psi | State 15–30 psi |

## E4 — Internal reference citation (SYS-OI-01, closed)

The BOM cites "Deschutes Redfish/AI/TCS Reference v1.2 (May 2026)".
Cite it as: **internal ADC document, Rev 1.3 (2026-06-10), repo path
`products/Telemetry/`** — it is not an OCP publication, and v1.2 is
superseded by Rev 1.3 (2026.1 baseline alignment).

## E5 — Optional, recommended

The unified telemetry plane is now the named product **Telemetry**
(decision 0002). Where the BOM mentions the optional Redfish bridge
(PLC/RF/NET subsystem), reference MGN-TEL-001 and the Telemetry product
rather than describing the bridge ad hoc.
