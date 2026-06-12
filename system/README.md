# ADC-SYS-001 — System Registry & Executable Twin

The machine-readable model of the whole ADC platform: every asset, every
cross-product interface, every locked parameter, and every open item —
in one validated place. The product spec sheets in
[products/](../products/) are the human views; **this registry is what
an AI agent (or the executable twin) reads and checks.**

This is the implementation of "AI-native": the company's system of
record is structured data an agent can verify mechanically, not prose it
has to re-interpret.

## Layout

```
system/
├── registry/
│   ├── assets/          one JSON per product/asset (cdu, tcs, hac,
│   │                    microgrid-node, it-rack, telemetry-plane)
│   ├── interfaces/      one JSON per cross-product interface — shared
│   │                    constants are defined HERE, once:
│   │                    wmf-plane              the 100.5″ plane
│   │                    cdu-tcs-hydraulic      flow/pressure/coolant/materials
│   │                    tcs-rack-branch        170 kW cap, QDs
│   │                    hac-structural         Redmond critical envelope
│   │                    node-compute-electrical  the double bridge
│   │                    telemetry-northbound   Redfish model, cadences, authority
│   └── open-items.json  unified register across all documents
│                        with cross-product gating made explicit
├── tools/
│   ├── validate-registry.ps1      zero-dependency validator (PS 5.1)
│   └── check-interop-profile.ps1  TEL-PROFILE conformance checker —
│                                  asserts the twin tree (or a bridge
│                                  endpoint dump) against the draft
│                                  interop profile (PS 5.1)
└── twin/                executable twin (Phase 2 — see twin/README.md)
```

## Conventions

- **Format:** JSON, not YAML — this machine validates with stock
  PowerShell and the twin reads the same files in a browser; zero
  dependencies, by design.
- **Tags** mirror the engineering documents: `L` locked · `W` working ·
  `O` open. `"critical": true` marks fit/function dimensions; the
  validator enforces that critical parameters are locked.
- **Single definition:** a value shared by two products (e.g., 100.5″)
  lives in the interface file, never duplicated in asset files.
- **Every parameter carries a `source`** naming the governing document
  and section. The documents win; the registry is their queryable index.
- **Open items** carry `gates` (what they block, free text) and
  `related` (validated cross-links — e.g., TCS SUP-01 ↔ HAC-OI-01 ↔
  CDU-G8 are one Louisiana-PE engagement seen from three products).
- **Hard external deadlines** get a `due` field (`YYYY-MM-DD`). The
  validator prints a DEADLINES table, warns when an item is due within
  21 days, and **fails** on overdue items — a date in prose is
  invisible; a date in `due` is enforced.

## Validation

```powershell
.\system\tools\validate-registry.ps1
```

Checks: JSON parse, id/filename agreement, interface↔asset
cross-references (both directions), parameter schema (key/value/source/
L-W-O tag, critical⇒locked), open-item id uniqueness, product validity,
`related` linkage, and `due` deadlines (overdue = FAIL, ≤21 days = warn).
Run it after any registry or spec-sheet change;
a sheet that contradicts the registry is a bug in one of them.

```powershell
.\system\tools\check-interop-profile.ps1   # [-TwinRoot <v1 dir>]
```

Asserts the twin Redfish tree against the draft TEL-PROFILE interop
profile: every profile class instantiated, every Mandatory property
present on every instance, all `@odata.id` links resolve, protocol
floor met. Run after regenerating the twin tree or editing the
profile; point `-TwinRoot` at a bridge-endpoint dump to use it as the
vendor acceptance test.

Current state: **11 assets · 6 interfaces · 121 parameters (47 critical) ·
107 open items — PASS.** (Counts are reprinted by the validator on every
run; trust its output over this line.)

## Change rule

A fact changes in its governing document first, then here, then in the
product README — in that order. If the registry and a README disagree,
fix whichever lags the governing document and re-run the validator.
