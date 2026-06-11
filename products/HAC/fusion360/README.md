# Fusion 360 parameter set — ADC HAC repeatable bay (HAC-OI-05)

37 user parameters for the parametric bay model, generated from the
[ADC-SYS-001 registry](../../../system/README.md) by
`system/tools/build-hac-fusion-params.ps1`. The generator verifies its
table against the registry before writing (9 critical dimensions
checked) — regenerate after any registry change; never edit these files
by hand.

## Two ways to load

1. **Native script (recommended):** in Fusion 360 open
   *Utilities → Add-Ins → Scripts and Add-Ins*, create a new Python
   script, replace its contents with
   [create_adc_hac_parameters.py](create_adc_hac_parameters.py), and
   Run with a design open. Idempotent — re-running updates existing
   parameters in place.
2. **ParameterIO add-in:** import
   [adc-hac-bay-params.csv](adc-hac-bay-params.csv)
   (Name, Unit, Expression, Comment format).

## Parameter classes

- **CRITICAL (17)** — the OCP Redmond interface: post centers, bay
  width, aisle, elevations (100.5 / 115.5 / 127.5 / 139.5), rack
  envelope, row/ceiling minimums. Comments say "do not alter" because
  changing them breaks fit with every Deschutes deployment.
- **Structure members (16)** — HSS post, base plate, hanger arm,
  baskets per Fig 18.5.1 / Detail A. Four of these (WMF detail offsets
  3.00 / 8.62 / 45.25 / 5.25) carry **VERIFY** comments — their exact
  identity must be confirmed against Figure 18.5 before they drive
  geometry (same caution as the HAC spec sheet's open dimensions).
- **Fungible (4)** — below-floor extension, pattern counts
  (racks/side/bay, bays/row, hangers/post). Adjust freely per site.

Model in **inches** (OCP is inch-primary); the metric values in
Figure 18.3.1 govern any metric drawing (note the OCP 2210 mm typo,
HAC-OI-02).
