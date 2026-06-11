# 0001 — GitHub repo as single source of truth

- **Date:** 2026-06-10
- **Status:** Accepted
- **Decided by:** Scott Tomsu (President), with Mission Control (AI)

## Decision

The `ADC_Solutions` GitHub repository is the canonical system of record for the
company. All company facts, mission/strategy documents, product specifications,
decisions, and the public website source live here in plain-text Markdown.
Notion, Google Drive, and the website are downstream views.

## Why

- **AI-native from day one.** Plain text under version control is the only
  format every AI agent and automation can fully read, diff, and act on.
- **Prevents tool sprawl.** Without a declared canonical home, facts scatter
  across Notion, Drive, and email and silently diverge.
- **Auditability.** Git history answers "what did we believe and when" — useful
  for investors, partners, and future hires.

## Consequences

- Authored documents start as Markdown here, not as Google Docs.
- The website at ADC3K.com will be generated/deployed from `website/` in this
  repo.
- The original mission Word document is superseded by `MISSION.md`.
