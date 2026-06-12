# Survey: 2026-06-11 file drops (colo/, partners/, website/, company/)

Full scan completed 2026-06-11 (handoff item 2). Everything below is
**already tracked** (commits 2b420f4 and the partners/website drop), so
the survey records what each file is, where its facts land, and
file-hygiene recommendations — not track/exclude decisions.

Extraction note: most PDFs in this drop are "Microsoft: Print To PDF"
with **no text layer** (vectorized glyphs). They are read by rendering
pages to PNG via the WinRT renderer (`Windows.Data.Pdf` PowerShell
script) and viewing the images — the plain-text extractor returns
nothing on them.

## colo/

| File | What it is | Facts land in |
|---|---|---|
| `Heat_Rejection_5MW_IT.pdf` (8 p) | Engineering decision study: heat-rejection architecture for a 5 MW IT liquid-cooled block in Lafayette. Design wet-bulb 80.7 °F = the "W27 wall"; recommends W32/W40 closed-circuit evap fluid coolers + 15–25 % magnetic-bearing chiller trim; NVL72 warm-coolant tolerance makes W32 sufficient; 5 MW block ≈ 1,700–1,950 GPM, ≈ 1,422 tons | **5 MW IT half of the N★ block (decision 0004)**; future TCS/site cooling engineering |
| `Open Data center Spec Version 0.5.0.pdf` | OCP "Datacenter: Next-Generation Infrastructure Design Principles" v0.5.0 — the in-progress ODS the registry watches | SYS-OI-06 / SYS-OI-03 (NVIDIA HAC variant watch) — copy now in repo |
| `Entergy Cameron Street/` (docx + preview.html) | MGN-PROP-004 Rev 0.3 — imported 2026-06-11 into [cameron-street.md](../../colo/sites/cameron-street.md). Note: preview.html cites MGN-BOD-002 **Rev 0.3** while the docx cites Rev 0.1 (repo governs Rev 0.2) — version drift, CAM-OI-02 | done |
| `Evangeline Distribution Hub/` (2 PDFs, docx, photos, mp4) | 1016 SW Evangeline Thruway acquisition study: lease brochure (Elifin; $6M / $5/SF/yr NNN; 173,437 SF on 12.26 ac, IL zoning), Beacon parcel report (**owner: Union Pacific Railroad 100 %** — sale is leasehold-only), buy-vs-build memo (greenfield replacement $19.4–26.6M all-in) | [evangeline-distribution-hub.md](../../colo/sites/evangeline-distribution-hub.md) |
| `Marlie Hub/marlie-building.jpg` | The MARLIE 1 building — small metal shop building, Lafayette (photo shows a motorcycle dyno shop). Seed-round POC site: **first 3 cassettes** (Ornn thread, 2026-04-10). Origin of the "Marlie-pattern block" cited in ST-TRAP-BOD-001 §E | [marlie-hub.md](../../colo/sites/marlie-hub.md) |
| `Willow Glen/` (docx + 7 aerials) | Willow Glen Terminal campus — retired riverfront power station (twin stacks, large intact switchyard, tank farm, Mississippi River frontage). Docx = "Path to Site Control" working plan: ground lease/option (not the ~$175M purchase), NDA + non-circumvention → exclusivity/ROFN → LOI → diligence; moat = independent Entergy/MISO load-serving inquiry; counterparty Zydeco/Willow Glen Ventures (Yorktown PE); comp = Hut 8 River Bend 25 mi north | [willow-glen.md](../../colo/sites/willow-glen.md) |
| `Trappey's Compute Center/` (2 HTML) | Investor brief (91.1 MW / 44 cassettes / 28,512 Rubin GPUs / 45 % HTC stack / B1–B4 allocation) + 67-photo gallery index. Legacy-platform numbers (Cat CG260-16, cassette counts) — **reference only per decision 0003**; site facts already in trappeys-compute-center.md | TRAP-OI-03 inputs |

## partners/ (all new)

Relationship + intelligence layer. Deep-research reports unless noted.

| Folder | Contents / key fact |
|---|---|
| `Nvidia/` | Gmail thread "NVIDIA GTC - Follow UP": **Antonio Rivera, Account Executive, construction account team** (anrivera@nvidia.com, 512-945-2590); calls 2026-03-31/04-01; Scott pitched ROXY, flare-gas compute, Vera Rubin NVL72/DSX; asked for Account Rep + NPN access |
| `Ornn/` | 4 Gmail threads + due-diligence report. **Ornn AI Inc.** (NY, f. 2025, $5.7M seed): OCPI compute price index on Bloomberg, OTC compute swaps, ORNNX LLC dealer. Contacts: **Jack Minor — jack@ornn.com current** (jack@ornnai.com dead as of 2026-04-22), Kush Bavaria (kush@ornnai.com). Key thread "The Moat Just Got a Lot Wider": **Fibrebond (Minden, LA)** cassette manufacturing at scale (acquired Boyd → liquid cooling in-house); **seed $5M = cassette infra + POC at MARLIE 1; Series A = Rubin GPUs**. Jack offers underwriting + financing partners. DD verdict: early-stage counterparty, "overlay not offtake". `previous emails4.pdf` = exact duplicate of `previous emails2.pdf` (candidate for deletion) |
| `Slemco/` | Deep-dive **for MGN-PROP-002** (proposal number previously unknown to the registry). Co-op, ~$304M revenue, owns no generation, ~9.75-yr NextEra full-requirements contract = the single biggest constraint AND opening; CEO/GM Katherine Domingue + named board/exec map; pitch frame: BTM, member-load-additive, full-requirements-contract-neutral |
| `Entergy/` | Corporate/financial deep-dive supporting MGN-PROP-004. 10 MW sits below large-load tariff thresholds; Entergy prefers owning generation; standby charges + supplementary-service tariff friction; **flags that 2623 Cameron Street may not be in Entergy retail territory (west Lafayette ≈ SLEMCO/LUS)** → CAM-OI-03 |
| `LUS/` | Asset report: electric (2 peakers, 15 substations, 1,068 mi 13.8 kV), water (51.6 MGD, Chicot), wastewater, LFT Fiber (XGS-PON, 100 G ring). No retail gas; stormwater is LCG not LUS |
| `Cat/` | BTM/islanded procurement intelligence: **lead time is the binding constraint** ($51.2B backlog); 50↔60 Hz inventory arbitrage real (G3520K/H offered both); 10 MW node late-2026 achievable; 100 MW 2027–28 needs reservations now; order transformers/MV switchgear/relays first |
| `Cummins/` (was `Cummings/` [sic]; renamed per decision 0012) | Cummins gensets deep-dive: QSK95 diesel anchor (10 MW in 3–4 units), HSK78G gas prime-power option; lock QSK95 slots, keep Cat G3520H gas baseline; DNP3-vs-IEC 61850 protection-protocol decision flagged |
| `Wartsila/` | Corporate deep-dive: Marine/Energy/Storage segments; strong New Orleans workshop; competitor/alternative for flexible engine plants |
| `First Solar/` | New Iberia plant: 1400 Corporate Dr; $1.1B, 2.4M SF, Series 7 CdTe, 3.5 GW/yr when ramped; "lease land, own buildings"; corporate-level contacts only — the 30-mi supply-chain story for Trappey's |
| `Skydio/` | Product/competitive research (X10/X10D/R10, Dock, pricing bands) — backs MGN-PROP-004 §9.1 | 
| `Victaulic/` | Data-center thermal + fire piping portfolio (grooved, Series 250, TA balancing, FireLock/Vortex; "TCS Equipment Modules") — TCS supply-chain candidate |
| `Drone Institute/` | Lafayette UAS company (George Femmer, 105 Dorset Ave): NDT/oil&gas inspection + Part 107 workforce dev — **competitor and potential partner** for the Part 107-certified Lafayette contractor |
| `OCP/` | Full-stack OCP benchmark as of June 2026: ODS initiative (Oct 2025), Diablo 400 ±400 V vs NVIDIA single-ended 800 V tracks, Deschutes cooling standardization — aligns with registry watches |

## website/

| File | What it is |
|---|---|
| `white_papers/ADC_Pure_DC_AI_Factory_White_Paper-4.pdf` | The cassette product paper (April 2026): 40-ft HC ISO, 10× NVL72, **2.3 MW IT / 720 GPUs / 800 V DC end-to-end / PUE ≤ 1.05**, Eaton ORV3 stack, dual-loop liquid, offshore variant (NEMA 4X, DNV 2.7-1), 30–60 days pad-to-GPU, scale to 200 MW. Sent to Ornn 2026-04-10. ~~The cassette is an ADC product — decision 0003 removed only the third-party ST-TRAP platform~~ **SUPERSEDED 2026-06-11 by decision 0005: cassette dropped from the product set; the white paper no longer describes the product (marketing refresh flagged)** |
| `white_papers/Compute_Follows_Power_White_Paper.docx` | "Compute Follows Power — Why Louisiana" v1.0 (June 2026): the Louisiana thesis (Henry Hub, Haynesville, Act 730, BTM + liquid cooling; Hyperion / Amazon NW-LA / Hut 8 River Bend comps). Publication-ready for ADC3K.com |

## company/

`Personnel/Scott Tomsu/`: resume v3 (HTML, 5.4 MB — ROV
superintendent background, NVIDIA infra certs, GC since 2003, Part
107 + private pilot, commercial diver, CDCDP in progress), two LA
Secretary of State printouts (Advantage Design Construction, Inc. —
charter 35616804D, inactive 2023; `Search2` duplicates `Search`),
logo video, photos. `Docs/`: 10 HEIC photos (certs etc.) —
**unviewable on this machine** (no HEIC decode path yet); convert to
JPG when needed.

## File-hygiene recommendations (no action taken)

1. Delete or quarantine duplicates: `partners/Ornn/previous emails4.pdf`
   (= emails2) and `company/.../Commercial - Search2.pdf` (= Search).
2. `MGN-BOD-002` citation drift (Rev 0.1 docx / Rev 0.3 preview / Rev
   0.2 repo) — reconcile at next proposal rev (CAM-OI-02).
3. The two website white papers are the first ADC-authored binaries
   intended for publication; when the website build starts they should
   get Markdown sources in this repo per the plain-text convention.
4. `company/Docs/*.HEIC` → convert to JPG for usability.

## Registry effects

- New site records: willow-glen, marlie-hub, evangeline-distribution-hub.
- New open items: COLO-02 (Willow Glen site control), COLO-03 (MARLIE 1
  POC definition), COLO-04 (Evangeline leasehold diligence), CAM-OI-03
  (Entergy retail-territory check, in site record).
- SYS-OI-06 watch: ODS 0.5.0 copy now in-repo.
- Decision 0004 (N★ block) recorded.
