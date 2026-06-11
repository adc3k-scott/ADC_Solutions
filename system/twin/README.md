# Executable Twin — POC Phase 1 (simulate, no metal)

## The twin speaks Redfish

```powershell
.\system\twin\tools\build-redfish-tree.ps1   # regenerate the /redfish/v1 tree from the registry
.\system\twin\tools\serve-redfish.ps1        # serve it: http://localhost:8910/redfish/v1
```

`build-redfish-tree.ps1` generates a DMTF-mockup-style resource tree
(99 resources) from ADC-SYS-001 registry constants: 5 genset chassis
with Oem Engine/Aftertreatment blocks and Sensor v1.12.0 peak/dip
capture, the grid-forming BESS with signed ±P, the 4.16 kV bus with
**Redundancy v1.7.0 `MinNumNeededForFaultTolerance = 4 of 5`**, the CDU
as CoolingUnit v1.5.0 with N+1 pumps and 16 TCS branch
CoolantConnectors, 3-zone leak detection, managers (EMCP / PLC / plant
master / BMC), and MetricReportDefinitions for cadence classes B/C/D.
Values are the scenario baseline (t<0); the read-only server returns
405 on writes — setpoints belong to Layer-1 controllers, even in
simulation.

This is the API target for dashboards and AI code before metal exists,
and the working companion to the draft site Interoperability Profile in
[profile/adc-site-interop-profile-draft.json](profile/adc-site-interop-profile-draft.json)
(TEL-PROFILE groundwork): the profile says what every asset class MUST
expose; the mockup shows it; and
`system\tools\check-interop-profile.ps1` **asserts it** — every
mandatory property on every instance, link integrity, protocol floor —
exit 0/1. Run it after regenerating the tree or editing the profile.
The same check is the bridge-vendor acceptance test: dump a candidate
endpoint as a mockup tree, point the checker at it with `-TwinRoot`.
POC Phases 2–3 swap mockup folders for
live bridge endpoints — same URLs, same contract.

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
