# ADC Solutions Inc - Request for Quotation

**Bundle E3-rpp** | Package ADC-CLU-BOM-001 Rev 0.1 (16-rack reference cluster) | Issued 2026-06-11

| | |
|---|---|
| Contact | Scott Tomsu, President - scott@adc3k.com - 337-780-1535 |
| Mail | ADC Solutions Inc, PO Box 2224, Lafayette, LA 70502 |
| Web | www.ADC3K.com |
| Quote due | TBD - 5 to 10 business days from receipt requested |

Quote against the performance specification. First-source part numbers indicate the
design basis; equivalent alternates meeting the spec are welcome and should be quoted
with full catalog data. Items tagged W or O carry working quantities - quote unit
pricing so totals survive quantity changes. Delivery to Lafayette, LA unless noted.

| Item | Description | Qty | Unit | Performance specification | First source | Alternates | Notes |
|---|---|---|---|---|---|---|---|
| E3-01 | Remote power panel / distribution switchboard (sources A-D) | 4 | ea | 800 A frame, 415/240 Vac Wye 3-phase 4-wire + ground, each fitted: 2x 600 A 3-pole feeder breakers (busway end feeds) + 4x spare 3-pole spaces, AIC rating TBD per fault study | Square D (QED-2 / I-Line class) | Eaton Pow-R-Line; ABB | [W] One RPP per feed source A/B/C/D; each feeds 2 busducts (one per aisle side) so any single-source loss = exactly one feed lost per rack (4-makes-3 preserved). AIC is [O] - gated by ELE-OI-02 / ELEC-002 fault study. Line side (feeders from upstream) excluded. |
| E3-02 | CDU feeder breaker | 2 | ea | 150 A 3-pole, mounted in RPP-A and RPP-B, feeding the CDU dual-feed PDU (approx 74 kW / 103 A FLA at 380-416 Vac) | match RPP series | match RPP series | [W] 103 A FLA exceeds 80 percent of a 125 A frame - 150 A selected. CDU cordage by install contractor. |
| E3-03 | Auxiliary panelboard | 1 | ea | 100 A, 415/240 Vac Wye, 24-circuit, fed from RPP-C - controls power, leak-detection electronics, HAC lighting | Square D | Eaton | [W] Loads itemized at detail design. |

*Generated from products/Cluster/rfq/E3-rpp.csv by build-rfq-sheets.ps1 on 2026-06-11. Do not edit this sheet directly.*
