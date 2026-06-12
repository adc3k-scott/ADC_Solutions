# 0012 — Repo file-structure conformance: binaries, duplicates, colo layout, plain text

- **Date:** 2026-06-12
- **Decided by:** Scott Tomsu, President
- **Status:** Issued — pending Scott approval (issue-then-approve)

## Problem

A repo audit (2026-06-12) found the repo violating its own
[systems-of-record](../systems-of-record.md) rules in four ways:

1. **Binary rule vs. reality.** The rules say binaries live in Drive,
   but the repo holds 80+ PDFs/docx/HEIC/MP4 — and most of them
   *belong* here, because product specs and decisions cite them. The
   rule is wrong, not (mostly) the files.
2. **Duplicates drifting.** The same spec PDF exists in two places
   (Deschutes: `products/CDU/` + `partners/OCP/`; Diablo 400 v0.7.0:
   `products/Diablo/` + `partners/OCP/`; Open Data Center Spec 0.5.0:
   `colo/` + `partners/OCP/`). Rule 3 ("copies drift") applies to us.
3. **colo/ split brain.** Canonical site records live in `colo/sites/`
   while artifacts live in parallel space-named folders ("Trappey's
   Compute Center", "Marlie Hub", …) plus loose files at colo root —
   two structures, no stated relationship.
4. **Authored prose trapped in .docx.** MGN-PROP-004, Willow Glen Path
   to Site Control, and MGN-BOD-002 Rev 0.1 exist only as `.md.docx`,
   violating the plain-text convention. (The ESS folder shows the right
   pattern: both formats exist, Markdown governs.)

## Decision

1. **Amend the binary rule.** GitHub MAY hold *reference binaries* —
   third-party specs, white papers, and signed-nothing PDFs that repo
   documents cite — under two conditions: (a) every folder holding
   binaries has a README index saying what each file is, and (b) each
   file has exactly **one** copy in the repo. Drive remains the vault
   for photos, video, signed legal documents, and third-party
   spreadsheets (`company/Docs/` HEIC photos and the MP4/JPG files move
   to Drive with a Markdown pointer left behind).
2. **One canonical home per reference PDF.** The canonical copy lives
   next to the ADC document that cites it most directly (Deschutes →
   `products/CDU/`, Diablo 400 → `products/Diablo/`, ODS 0.5.0 →
   `colo/`). `partners/OCP/README.md` already points at these homes;
   on approval the `partners/OCP/` duplicates of those three are
   deleted.
3. **colo/ layout.** `colo/sites/*.md` records stay canonical. Each
   space-named artifact folder gets a one-line pointer FROM its site
   record (record → artifacts, never the reverse), and loose files at
   colo root get filed into the folder of their subject. No folder
   renames — the names match how Scott refers to the sites.
4. **Extract trapped prose.** The three `.md.docx`-only documents get
   their text extracted to governing Markdown beside the .docx (ESS
   pattern). Markdown governs; the .docx stays as the as-transmitted
   artifact.
5. **Rename `partners/Cummings/` → `partners/Cummins/`** (engine maker
   is Cummins; typo in the folder name of a partner we may put in
   front of customers).

## Consequences

- `ops/systems-of-record.md` is amended per #1 on approval (rule
  change in the governing doc first, per its own rule 1).
- Registry: SYS-OI-15 tracks execution; closes when #1–#5 are done and
  the validator still passes.
- Already done (non-destructive, 2026-06-12): `partners/OCP/README.md`
  index with canonical-home pointers; `.claude/settings.json`
  untracked + `.claude/` gitignored; deadline `due` field + validator
  enforcement.
- NOT in scope: anything touching website deploy (separate repo), the
  Drive folder structure itself (already mirrors repo per rule 4).
