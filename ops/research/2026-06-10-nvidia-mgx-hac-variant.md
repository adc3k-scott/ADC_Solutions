# NVIDIA MGX (600 mm) rack — HAC variant engineering basis — 2026-06-10

Research agent dispatch (third run; first two died on transient API
errors). Question: does published data support engineering the
"NVIDIA 24-inch × 5-wide" HAC variant claimed in MISSION.md?
**Answer: no — concept-level only. Claim softened same day (SYS-OI-03).**

## What IS published (enough for concept/preliminary design)

| Parameter | Value | Source / confidence |
|---|---|---|
| Rack width | **600 mm (23.6″)** — "24-inch" is nominal; 19″ EIA rails inside | Lenovo Press LP2357 (GB300 NVL72) — published spec |
| Rack depth | 1,068 mm base MGX frame, **plan to 1,200 mm** with rear extension | Lenovo — published spec |
| Rack height | 48U; 88–91″ varies by OEM (Lenovo 2,294 mm; GB200 hyperscaler 2,236 mm) | Published, ±2–3″ OEM variance |
| Loaded weight | ~3,000 lb (GB200); GB300 projected 3,000–3,500 lb — Lenovo's 185 kg is empty frame only | Secondary source; confirm per OEM for floor loading |
| Rack power | GB200 ≈120 kW; Vertiv RA 132 kW; **GB300 135 kW TDP / 155 kW peak — design variant for ≥150 kW/rack** | Published (NVIDIA DGX guide, Lenovo) |
| Power feed | Facility **whips** (6–8× 60 A IEC 60309 3-ph per rack) into in-rack 50 VDC / 1,400 A busbar — NOT overhead busduct; HAC must route whips + network overhead. 800 VDC direct feed coming (Rubin era) | Published |
| Liquid flow | 59 LPM @ 25 °C → 177 LPM @ 45 °C inlet per rack (ASHRAE W45); ~90% heat to liquid, **~12–15 kW/rack residual air heat is what the HAC manages** | Lenovo — published spec |
| Footprint stability | Vera Rubin NVL144 (Oct 2025 OCP) uses the **same MGX rack footprint**; next break = "Kyber" rack (Rubin Ultra NVL576, ~2027) | NVIDIA OCP blog — published |

## What is NOT published (why full engineering can't start)

- **No NVIDIA/OCP containment interface exists** — Redmond (Deschutes
  §18) is the only published OCP HAC interface. NVIDIA's MGX OCP
  contribution covers rack and trays, not room-level containment.
- **No manifold/cable-tray elevations AFF**, no rear-clearance spec, no
  bay width, no racks-per-bay — the Redmond-equivalent numbers do not
  exist publicly. That geometry lives in the Vertiv/NVIDIA reference
  design and OEM site-survey packages (NDA).
- **"5 racks per side per bay" has no published basis** — it was an ADC
  assumption. Arithmetically plausible (5 × 600 mm = 118.1″ vs
  Redmond's 121″ bay — structurally adjacent to our existing design),
  but nothing endorses it. NVIDIA's published deployment unit is the
  Scalable Unit (8 compute racks, ~1.2 MW), with no bay subdivision.
- NVIDIA's only public aisle guidance is H100-era air-cooled
  (≥36″ aisles, ≥48″ cold aisle recommended) — not NVL72 containment
  geometry.

## Actions taken 2026-06-10

1. MISSION.md claim softened to "NVIDIA MGX (600 mm) bay variant in
   development"; root README aligned.
2. HAC spec sheet gains an "NVIDIA MGX variant (concept)" section with
   the published envelope above.
3. Registry hac.json + SYS-OI-03 updated: variant = concept stage;
   full engineering gated on an NVIDIA/OEM site-planning data package
   (DGX site survey / Vertiv RA under NDA) or the OCP Open Data Center
   1.0 spec — NVIDIA is a named ODS contributor, a Redmond-equivalent
   interface may land there. Watch both.

Key sources: Lenovo Press LP2357 · NVIDIA GB200 OCP contribution blog ·
NVIDIA Vera Rubin/OCP blog · DGX GB200 user guide · GB200 SuperPOD RA ·
Vertiv/NVIDIA reference design announcement · TechArena OCP EMEA 2026.
