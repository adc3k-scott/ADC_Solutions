# HAC-OI-02 — OCP Deschutes 102″ metric typo: CONFIRMED against source

**Date:** 2026-06-11 · **Item:** HAC-OI-02 ("Confirm OCP 102-inch metric
typo (2210 vs 2590.91 mm) before metric drawings") · **Result: typo
confirmed, item closed.** Verified directly against the repo copy of the
OCP source, not the working captures.

## What the source actually prints

| Location in OCP Project Deschutes v1.0 §18 | Inch value | Metric value printed |
|---|---|---|
| Table 18.2.1, hot aisle width row ("maximum without RDHx, measured between rear rack faces") | 102″ | **(2210mm)** ← the typo |
| Figure 18.3.1, outermost across-aisle dimension chain | 102 | **[2590.91]** |

Verified 2026-06-11 against
`products/CDU/OCP-Specification-Deschutes v1_0.pdf` (the authoritative
public document per the HAC spec sheet): raw text extraction of the
table row reads `102" (2210mm) maximum without RHx (measured between
rear rack faces)`, and the Figure 18.3.1 capture
(`products/HAC/Screenshot_19-5-2026_63534_www.opencompute.org.jpeg`)
prints `102 [2590.91]`.

## Why the table value is provably the error (three independent ways)

1. **Arithmetic.** 102 in × 25.4 mm/in = **2,590.8 mm**. The figure's
   2,590.91 matches (see rounding note below). The table's 2,210 mm
   back-converts to 87.01 in — it does not correspond to 102 in under
   any unit conversion, and no dimension anywhere in §18 is 87 in.
2. **Geometric impossibility.** Figure 18.3.1's across-aisle chain nests
   68.41 (between RDHx rear faces) < 90 (post centers) < 102 (outermost
   span). If the outermost span were 2,210 mm = 87.0 in, it would be
   *narrower than the 90-in post centers it encloses* — physically
   impossible.
3. **Conversion-pattern consistency.** The figure's other bracket pairs
   confirm OCP's own conversion convention: 90 → [2286.11], 95 →
   [2413.11], 121 → [3073.36], 54 → [1371.60] — all within ~0.15 mm of
   exact ×25.4 (CAD dual-dimension rounding). 2,590.91 fits the pattern
   for 102 in; 2,210 misses it by 380.8 mm — a typo, not rounding.

## Disposition

- **Inch values govern** (OCP is inch-primary; the HAC spec sheet
  already states the figures, not the prose, carry the mm values).
- **ADC metric drawings print 2,590.8 mm** (exact ×25.4) for the 102 in
  dimension, consistent with how the Fusion 360 parameter set and any
  metric drawing derive every other mm value. The figure's 2,590.91 is
  OCP's CAD rounding of the same inch value, cited for traceability
  only. The 2,210 mm table value must never appear in an ADC document.
- Note: the same 102 in appears as two physical readings (table: between
  rear rack faces without RDHx; figure: base-plate outer faces). The
  typo finding is independent of that — the table's mm contradicts its
  *own* inch value on the same row.
- **Erratum candidate:** worth reporting upstream to the OCP Deschutes
  editors (cooling@opencompute.org per the spec's contact convention)
  next time ADC corresponds with the project; not gating anything.

**Registry action:** HAC-OI-02 → RESOLVED 2026-06-11 (this note).
Metric drawing release is no longer gated; HAC-OI-01 (LA-PE structural
analysis) remains the only gate on fabrication drawings.
