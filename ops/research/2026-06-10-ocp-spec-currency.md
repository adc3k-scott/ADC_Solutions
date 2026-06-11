# OCP / DMTF specification currency check — 2026-06-10

Single research agent dispatched against opencompute.org + dmtf.org to
verify every external specification our engineering documents depend
on. Method note: opencompute.org sits behind a Cloudflare challenge, so
findings triangulate search-indexed OCP document URLs, OCP blog/wiki,
and reputable secondary coverage (TechArena, DCD, Google Cloud blog,
DMTF). Re-check after the next OCP Global Summit.

| # | Document | We hold/cite | Latest found | Verdict |
|---|---|---|---|---|
| 1 | OCP Project Deschutes: Data Center Facilities | v1.0.0 (Google, 2026-02-26) | v1.0 final, incl. Redmond HAC — no later rev | **CURRENT** |
| 2 | "Deschutes Redfish, AI Control & Four-Tier Reference" v1.2 | cited as MGN-TEL-001 parent, file not held | **not found publicly anywhere** under any similar title | **UNRESOLVED — internal-only or erroneous citation** |
| 3 | OCP Modular TCS Working Paper | Rev 1.0 (Aug 2025) "with 2026 patches" | Rev 1 (2025-08-25) still latest; update WP announced "coming soon"; **no published 2026 patches** | **CURRENT** (drop the "2026 patches" phrase) |
| 4 | OCP Diablo 400 Rack & Power | v0.7.0 (TCS doc) / v0.5.2 (CDU BOM) | **v0.7.0 (2026-03-01)** — v0.5.2 superseded; v0.7.0 permits bipolar ±400 V AND unipolar 800 V sidecar output | TCS cite **CURRENT**; CDU BOM cite **STALE** |
| 5 | OCP Open Data Center Spec | v0.5.0 (Feb 2026) | v0.5.0 still latest; 1.0 in progress; new "Open Data Center for AI" whitepaper (Apr 2026) | **CURRENT** (watch 1.0) |
| 6 | New OCP cooling items since Mar 2026 | — | Deschutes 1.0/Redmond is the headline (we hold it); TCS update WP pending; nothing supersedes us | **NO SUPERSESSION RISK** |
| 7 | DMTF Redfish | 2026.1 / DSP0266 v1.24.0 "published 2026-05-20" | 2026.1 / v1.24.0 still latest; official doc date is **2026-04-02** (our 05-20 was announcement/download date); 2026.2 expected ~Aug 2026 | **CURRENT** (date correction) |

## Key URLs

- Deschutes (earlier rev PDF): https://www.opencompute.org/documents/ocp-specification-deschutes-final-2025-09-05-pdf
- Modular TCS Rev 1: https://www.opencompute.org/documents/ocp-modular-tcs-rev-1-final-2025-pdf
- Diablo 400 v0.7.0: https://www.opencompute.org/documents/ocp-specification-diablo-400-v0-7-0-final-pdf
- Open Data Center Spec v0.5.0: https://www.opencompute.org/documents/open-data-center-spec-version-0-5-0-pdf
- Open DC for AI whitepaper: https://www.opencompute.org/documents/ocp-open-data-center-for-ai-whitepaper-final-pdf
- Redfish 2026.1 release: https://www.dmtf.org/content/redfish-release-20261-now-available

## Actions taken (same day)

- Registry SYS-OI-01 rewritten: the missing MGN-TEL-001 parent is not a
  file-drop problem — the document does not exist publicly and must be
  confirmed as internal-only or corrected at MGN-TEL-001 Rev 0.2.
- New open items SYS-OI-04 (CDU BOM's Diablo v0.5.2 → v0.7.0; the
  bipolar/unipolar output change is material to microgrid-sidecar
  interfaces), SYS-OI-05 (remove unsupported "2026 patches" phrase;
  watch the announced TCS update WP), SYS-OI-06 (standing watch: ODS
  1.0, Redfish 2026.2, post-Summit re-check; correct Redfish date to
  2026-04-02 at next doc revision).
- CDU spec sheet annotated with the Diablo supersession note.
