# ADC3K.com — Website

Public face of ADC Solutions (www.ADC3K.com).

**Where the site actually lives:** the deployed site is **not built from
this folder** — it deploys from the separate
`gpu-learning-lab/adc3k-deploy` repo to Vercel.
[website instructions.txt](website%20instructions.txt) is the operating
runbook (repo, deploy command, Vercel project, DNS, and the critical
rules — homepage routing, naming, what never to commit). Treat its
"NEVER" rules as binding. Do not copy logins or keys out of that file.

| Item | Notes |
|---|---|
| [website instructions.txt](website%20instructions.txt) | Deploy runbook for `gpu-learning-lab/adc3k-deploy` (dropped 2026-06-11) |
| [white_papers/](white_papers/) | Published white papers (Compute Follows Power). The Pure DC AI Factory paper was **removed 2026-06-11 by Scott** — it described the 800 VDC cassette platform dropped by decision [0005](../ops/decisions/0005-no-cassettes-current-product-lineup.md); do not cite Pure-DC/800 VDC as current product (equipment not generally available) |

## Site state (2026-06-12 overhaul — commit `d0f05ae` in gpu-learning-lab)

Full conformance pass executed and **deployed to production 2026-06-12**
(Scott's go; post-deploy checks passed — homepage, redirects, all routes):

- **Homepage = `adc3k-indexpage.html`** per the runbook. The shadowing
  `index.html` (old MARLIE 1 page) was **removed** — the runbook discrepancy
  is resolved; `vercel.json` catch-all now points to `adc3k-indexpage.html`.
- **Taken down (308 → `/`):** `/investors`, `/cassette-spec`,
  `/old-investor-pitch`, `/marlie`, `/trappeys`, `/trappeys-investors`,
  `/trappeys-dsx-prep`. All carried dropped cassette/800 VDC content
  (decisions 0005/0007) or investor data outside the gate. Rewrite from
  ADC-CAP-001 at next engagement (CAP-OI-06 gate applies).
- **Content conformance:** site-wide sweep — ADC Solutions Inc (was
  "Advantage Design Construction Inc."), Marlie Hub only (was MARLIE 1),
  five-product lineup (CDU 2 MW / Modular TCS / HAC / 10 MW NG genset
  microgrid / Telemetry), two business lines per MISSION.md, no cassette,
  no 800 VDC for IT, DSX claims reframed to OCP Deschutes.
- **New interactive pages** (spacex-tracker pattern): `/ai-economics`
  (Henry Hub power calculator) and `/louisiana-sites` (evidence-tiered
  sites status board, public-safe facts only).
- **Queued for later rewrite** (still routed, still carry old cassette
  engineering): `trappeys-technology`, `trappeys-power`,
  `trappeys-blueprints`, `trappeys-91mw-floorplan` — re-cut to the
  reference-cluster architecture per decision 0005.
- **Known issue (pre-existing, not deploy-related):** `/api/chat` (ROXY
  agent) returns 500 — its primary backend is a dead RunPod vLLM pod;
  fix requires a new inference endpoint (`ADC_INFERENCE_URL`) or an
  `ANTHROPIC_API_KEY` fallback in the Vercel project env.
