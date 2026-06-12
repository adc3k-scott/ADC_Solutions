# ESS-RFQ-001 — Attachment A: Site Data Sheet (Fill-In Template)

Companion to [ESS-RFQ-001 Rev 0.2](ESS-RFQ-001_Rev0_2.md) and [ESS-BOD-001 Rev 0.3](ESS-BOD-001_Rev0_3.md). Complete all fields before release to bidders under NDA. Fields marked with a BOD reference close or feed the corresponding open item. Enter "TBD + responsible party + date" for any value not yet available — do not leave blank at release.

> Governing Markdown converted 2026-06-11 from
> `ESS-RFQ-001_AttachmentA_SiteDataSheet.docx` (original retained alongside).
> Coupling resolved (decision 0007 — AC at 4.16 kV); the RFQ is releasable once
> this sheet is filled. First-instance candidate site: Trappey's Compute Center
> (`colo/sites/trappeys-compute-center.md`).

## 1. Site Identification

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Site name / designation | | Buyer |
| Street address | | Buyer |
| Parcel / coordinates (lat, long) | | Survey / GIS |
| Site elevation (ft, NAVD88) | | Survey |
| AHJ (fire) — name, contact | | Buyer |
| AHJ (building/electrical) — name, contact | | Buyer |
| Adopted IFC edition | | AHJ (BOD F-1) |
| Adopted NFPA 1 / 855 edition | | AHJ (BOD F-1) |
| Adopted NEC edition | | AHJ (BOD F-1) |

## 2. Climate / Ambient Design Conditions

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Design dry bulb, max (°F, 0.4%) | | ASHRAE climatic data |
| Coincident wet bulb (°F) | | ASHRAE climatic data |
| Design dry bulb, min (°F, 99.6%) | | ASHRAE climatic data |
| Design wet bulb, max (°F, 0.4%) | | ASHRAE climatic data |
| Relative humidity range (%) | | ASHRAE / NOAA |
| Solar load basis | | ASHRAE |
| Corrosive atmosphere class (coastal) | | ISO 9223 / site assessment |

## 3. Wind / Storm

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Basic wind speed, Vult (mph) | | ASCE 7 hazard tool |
| ASCE 7 edition / risk category | | Local building code |
| Exposure category | | Site assessment |
| Wind-borne debris region? (Y/N) | | ASCE 7 / local code |
| Hurricane shutdown/securement notes | | Buyer ops plan |

## 4. Seismic

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Ss / S1 (mapped accelerations) | | USGS / ASCE 7 hazard tool |
| Site class | | Geotechnical report |
| SDS / SD1 (design accelerations) | | Calc per ASCE 7 |
| Seismic design category | | Calc per ASCE 7 |

## 5. Flood / Drainage

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| FEMA flood zone | | FIRM panel |
| FIRM panel no. / effective date | | FEMA map service |
| Base flood elevation (ft, NAVD88) | | FIRM |
| Required min. equipment mounting elevation (ft) | | BFE + freeboard per local code |
| Site drainage / ponding notes | | Civil |

## 6. Geotechnical (BOD C-1)

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Geotech report available? (Y/N, date, firm) | | Buyer |
| Allowable bearing pressure (psf) | | Geotech report |
| Foundation type assumption (pile / pad) | | Geotech (BOD C-1: pile assumed until proven) |
| Groundwater depth (ft) | | Geotech report |
| Frost depth (in) | | Local code |

## 7. BESS Yard

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Yard area available (ft × ft) | | Site plan |
| Distance to nearest building (ft) | | Site plan (FMDS 1-20 / HC-3) |
| Distance to generation island (ft) | | Site plan |
| Distance to switchgear / MV equipment (ft) | | Site plan |
| Distance to property line / public way (ft) | | Site plan |
| Inter-container spacing basis | | BOD SEP-1 (propagation assumed) or vendor G-2a report |
| Fire apparatus access route / width | | Fire code / AHJ |
| Hydrant / water supply location & flow | | Utility / fire dept. |
| Blast barrier requirement? (Y/N, basis) | | AHJ / HMA (BOD §4.3) |

## 8. Electrical Interfaces

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Battery-side DC voltage window (V) | | Package 1 vendor data / Package 2 PCS design (BOD W-08; coupling = AC at 4.16 kV per decision 0007) |
| PCS supplier / model (Package 2, 4-quadrant grid-forming) | | Buyer award |
| Aux power available to yard (V, ϕ, A) | | Electrical one-line |
| Emergency safety-system power source (BP-1/BP-2) | | Backup power design — independent of BESS |
| Grounding system / soil resistivity (Ω·m) | | Electrical / geotech |

## 9. Controls / Telemetry Interfaces

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Protocol (Modbus TCP / IEC 61850) | | Buyer decision T-2 |
| Network demarcation point | | Telemetry architecture |
| Constantly attended alarm location | | Buyer ops (BOD §6.2) |
| First-responder read-only display location | | ERP (BOD §6.6) |

## 10. Logistics

| Parameter | Value (fill in) | Source / Reference |
|---|---|---|
| Delivery route restrictions (weight/height) | | DOT / route survey |
| Crane / SPMT laydown area | | Site plan |
| Receiving constraints / hours | | Buyer ops |
| Target delivery window | | Project schedule |

---

Completed by: ____________________ Date: ____________ Checked by: ____________________ Date: ____________
