# Cameron Street (dual-utility) — Site Record

**Skeleton record.** The governing proposal document **MGN-PROP-005 is
not in the repo** (SYS-OI-02) — everything below is limited to what
other repo documents say about this site. This record fills in when
MGN-PROP-005 lands.

## Identity & status

| Field | Value | Tag | Source |
|---|---|---|---|
| Site name | Cameron Street | [W] | MGN-TEL-001 §4.3 |
| Play | [O] — brownfield presumed, unconfirmed | [O] | — |
| Address / parcel | [O] | [O] | MGN-PROP-005 (not in repo) |
| Site control | [O] | [O] | MGN-PROP-005 (not in repo) |
| Governing proposal doc | MGN-PROP-005 — **missing from repo, SYS-OI-02** | [O] | MGN-TEL-001 §4.3 |
| Stage | [O] | [O] | — |
| Identity vs Trappey's Compute Center | **COLO-01 — different sites (proposed answer, 2026-06-11):** Trappey's = 22-acre cannery on the Vermilion River, BTM permanent island, no utility interconnect day one (ST-TRAP-BOD-001 P-01/E-01); Cameron Street = Entergy+LUS dual-utility grid site. Closes on Scott confirmation. | [W] | ST-TRAP-BOD-001 Rev 0.6 vs MGN-TEL-001 §4.3 |

## What the repo establishes (the only sourced facts)

| Fact | Tag | Source |
|---|---|---|
| **Dual-utility site: Entergy and LUS — the two sources are never tied synchronously** | [L where applicable] | MGN-TEL-001 §4.3 (citing MGN-PROP-005) |
| Telemetry plane must surface breaker + synchronizing status for **both** sources so the ops layer continuously verifies they are not paralleled — monitoring/alarm only; the interlock lives in relay/PLC logic, never in Redfish | [L where applicable] | MGN-TEL-001 §4.3 |

This island-separation requirement is the platform's canonical example
of a site-specific telemetry requirement and must appear in this site's
Redfish interoperability profile (TEL-PROFILE) when site engineering
starts.

## Everything else

Power sizing, node count, gas, water, structure, permitting: **[O] —
awaiting MGN-PROP-005.** Use [_TEMPLATE.md](_TEMPLATE.md) sections when
filling.

## Site open items

| ID | Item | Gates |
|---|---|---|
| SYS-OI-02 | MGN-PROP-005 not in repo — file it (or its facts) here | site telemetry requirements; this entire record |
| COLO-01 | Different-sites answer proposed (see Identity table) — Scott to confirm; records stay split | site register structure |

## Source documents

| Document | Location | Status |
|---|---|---|
| MGN-PROP-005 (Cameron Street dual-utility site proposal) | **not in repo** | SYS-OI-02 — awaiting file drop |
| MGN-PROP-004 Rev 0.3 — Entergy Technical Proposal (.md.docx) | [colo/Entergy Cameron Street/](../Entergy%20Cameron%20Street/) | dropped 2026-06-11, untracked — **not yet imported**; likely fills this record (extract pending) |
| MGN-TEL-001 Rev 0.2 §4.3 | [products/Microgrid/MGN-TEL-001_Rev0_2.md](../../products/Microgrid/MGN-TEL-001_Rev0_2.md) | only repo document citing this site |
