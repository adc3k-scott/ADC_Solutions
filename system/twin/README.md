# Executable Twin — POC Phase 1 (simulate, no metal)

A zero-dependency implementation of MGN-TEL-001 §14 Phase 1: the
cross-domain load-step correlation (§10) running as simulation, with
every design constant read from the
[ADC-SYS-001 registry](../README.md) — change the registry, re-run the
scenario, and the twin follows. No Python, no installs; stock
PowerShell 5.1 and a browser.

## Run it

```powershell
.\system\twin\tools\run-scenario.ps1   # regenerates dashboard/timeline.js
```

then open `system/twin/dashboard/index.html` in any browser.

## What it shows

The defining event of the platform — one synchronized AI training step
traced across domains on one clock, exactly the §10 timeline:

1. **CAUSE (D2, t−30→0 s)** — GPU utilization climbs, then the coherent
   5 MW step hits the bus (50% of the 10 MW node, the design case).
2. **BRIDGE (D1, t+0→5 s)** — the grid-forming BESS injects up to 5 MW
   (inside its 6 MW PCS rating — the simulation reproduces the 1.20
   design margin), and the frequency dip stays shallow.
3. **RESPONSE (D1, t+2→45 s)** — gensets ramp through the staged
   lean-burn block-load profile; the BESS backs down as engines pick up.
   SoC dips ~1% of the 3 MWh — confirming energy is not the binding
   constraint, exactly as MGN-BOD-002 §5.3 argues.
4. **FOLLOWER (D3, t+5→120 s)** — one Reference Bay's ITE ΔT lags the
   step with a ~40 s time constant; the pump ΔP trace shows the AI
   pre-positioning cooling at t−20 s from D2 utilization (Deschutes
   Loop 1) — acting *before* the heat arrives.

## What it is for

- **Interface verification:** encoding the timeline forces every
  cross-product constant through the registry; inconsistencies fail
  loudly here before they fail expensively in steel.
- **The demo:** this is the closed-loop story — generation, storage,
  compute, and cooling as one machine — running, not claimed.
- **The harness for what's next:** POC Phases 2–3 replace the simulated
  D3 and D1 series with real Modbus→Redfish bridge data; the dashboard
  and the registry contract stay the same.

## Honest limits

First-order physics (smoothstep ramps, single-pole thermal lag) chosen
to match the BoD's stated assumptions, not to predict hardware. The
numbers worth trusting are the registry constants; the curves between
them are illustrative until POC Phase 4 replaces them with measured
data. Frequency response is sketched (grid-forming PCS holds ~0.3 Hz
dip) — a real value needs the ELEC-002 fault study.
