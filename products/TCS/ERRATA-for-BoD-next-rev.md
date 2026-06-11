# Errata pack — ADC-MOD-TCS-001 Version 1 → next revision

Prepared 2026-06-10 by Mission Control for Scott Tomsu. Apply when
revising the TCS BoD/RFQ docx. Source:
`ops/research/2026-06-10-ocp-spec-currency.md`.

## E1 — "2026 patches" phrase has no public basis (SYS-OI-05)

The BoD cites "OCP Modular TCS Working Paper Rev 1.0 (Aug 2025, with
2026 patches)." Rev 1 (2025-08-25) is still the **latest published**
revision — no 2026 patches exist publicly. OCP has announced an
"Update to Modular TCS, Design & Delivery Best Practices" as coming
soon but unpublished. Either delete "with 2026 patches" or, if the
phrase refers to material you hold from the OCP cooling-environments
list, cite that source explicitly. Add a watch note for the announced
update WP.
URL: https://www.opencompute.org/documents/ocp-modular-tcs-rev-1-final-2025-pdf

## E2 — Reference confirmations (no change needed, record them)

Verified current as of 2026-06-10: OCP Deschutes v1.0 (final, includes
Redmond), OCP Diablo 400 **v0.7.0** (this BoD already cites v0.7.0 —
correct), Open Data Center Spec v0.5.0 (1.0 in progress — re-check
after the next OCP Global Summit). A revision-notes line recording this
verification keeps the citation trail clean.

## E3 — Optional, recommended

- RELIEF-01 coordination: when setting the backup PSV schedule, note
  the CDU relief is 130 psig (Deschutes §3.1) vs TCS design WP
  150 psig — the coordinated schedule is also flagged in the CDU BOM
  errata (E3/SYS-OI-07 context).
- TCS telemetry points (branch flow/ΔT, leak zones, pair-reversal
  detection) are now covered by the **Telemetry** product (decision
  0002) and the draft site Interoperability Profile
  (`system/twin/profile/`) — a forward reference replaces any need to
  re-specify them here.
