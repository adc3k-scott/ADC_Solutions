# ADC Solutions Inc — Mission Control

This repository is the **single source of truth** for ADC Solutions Inc. Any AI agent
or human working on company business starts here.

## Company facts (canonical — update here first, everywhere else follows)

- **Legal name:** ADC Solutions Inc
- **President:** Scott Tomsu
- **Email:** scott@adc3k.com (Google Workspace)
- **Phone:** 337-780-1535
- **Mailing:** PO Box 2224, Lafayette, LA 70502
- **Website:** www.ADC3K.com
- **Location:** Lafayette, Louisiana
- **Credentials:** In-house Louisiana General Contractor License

## What the company does

Louisiana's first AI-native business model for mission-critical, high-performance
AI compute infrastructure. Two business lines:

1. **Modular infrastructure manufacturing & distribution** (see `products/`)
   — CDUs, modular TCS, HAC structures, NG genset microgrids.
2. **Louisiana Colocation Solutions Provider (CSP)** (see `colo/`)
   — brownfield repurposing, greenfield development, AI enterprise for
   Louisiana oilfield service companies.

Full mission: `MISSION.md`

## Where things live (systems of record)

See `ops/systems-of-record.md`. Short version: **GitHub = canonical truth**,
Notion = human dashboards, Drive = binary files/signed documents,
Google Workspace = communications, ADC3K.com = public face (built from this repo).

## Conventions

- Significant decisions get a numbered record in `ops/decisions/` before acting.
- Company facts above are referenced, never duplicated — if a fact appears in a
  proposal, the website, or a doc, it should be traceable back to this repo.
- Plain text (Markdown) preferred over binary formats for anything authored here.
- Dates are written absolute (e.g., 2026-06-10), never relative.
