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

## Site state (2026-06-12 — overhaul deployed, then ROLLED BACK same day)

**The runbook's homepage rule is WRONG — do not act on it.** The
2026-06-12 overhaul swapped the homepage to `adc3k-indexpage.html` per the
runbook's instruction; Scott confirmed that file is the **old** website
(stale hero, ~10 tabs of superseded content). **The live `index.html`
(5-tab page, title "MARLIE 1 — Lafayette Infrastructure Partnership") is
the current site Scott wants.** Production was rolled back to the
pre-overhaul deployment (`adc3k-deploy-4npka6yks`) and verified live;
the deploy repo's `main` was reset to match (`a305cec`), with the
overhaul parked on branch `overhaul-2026-06-12-parked` in
gpu-learning-lab (commit `d0f05ae`) — reference only, not for deploy.

**Same day, after rollback:** in-place wording fixes to the live 5-tab
site deployed at Scott's instruction (commit `4dc401a` in gpu-learning-lab):
homepage title → ADC Solutions Inc, dead cassette modal removed, Marlie Hub
naming, Pure DC/800 VDC claims neutralized (Bloom-vs-Cat page kept as a
comparison report), Louisiana power cards → NG genset microgrid + BESS,
`/investors` footer link removed. Verified live, zero stale hits on all
five tabs. Note: after a Vercel rollback, new prod deploys need an explicit
`vercel promote`. Old standalone pages (`/investors`, `/marlie`,
`/cassette-spec`) are still reachable by direct URL — awaiting Scott's call.

Lessons recorded:
- The runbook (`website instructions.txt`) is stale on homepage routing.
  Its other NEVER rules still stand until reviewed with Scott.
- Any future site change gets a **visual preview to Scott before deploy**
  — never swap pages based on a text instruction over the live site.
- A fresh site update will restart from the actual live 5-tab page.
- Pre-existing issue (unrelated): `/api/chat` (ROXY agent) returns 500 —
  its primary backend is a dead RunPod vLLM pod; fix requires a new
  inference endpoint (`ADC_INFERENCE_URL`) or an `ANTHROPIC_API_KEY`
  fallback in the Vercel project env.
