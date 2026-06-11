# Systems of Record

One fact, one home. Everything else is a view or a copy that can be regenerated.

| System | Role | What lives there | What does NOT live there |
|---|---|---|---|
| **GitHub (this repo)** | Canonical truth | Company facts, mission, product specs, decision log, website source, process docs, AI agent context | Binary files, signed legal documents, private correspondence |
| **Notion** | Human dashboards & pipeline | Deal/site pipeline (CRM), task boards, meeting notes, anything needing a friendly UI for non-technical collaborators | Canonical company facts (link back to repo instead of copying) |
| **Google Drive** | Binary artifact vault | Signed contracts, PDFs, CAD files, photos, spreadsheets from third parties, anything that arrives as a file | Authored prose that could be Markdown in the repo |
| **Google Workspace (Gmail/Calendar)** | Communications | Email (scott@adc3k.com), scheduling | Decisions (summarize decisions into `ops/decisions/`) |
| **ADC3K.com** | Public face | Marketing site — built/generated from `website/` in this repo, never hand-edited in a separate CMS | Anything not intended for the public |

## Rules

1. **If a fact changes, change it in the repo first.** Website, Notion, and
   documents are downstream.
2. **Decisions made in email or meetings get written down** as a numbered
   record in `ops/decisions/` — otherwise they didn't happen.
3. **Notion links to the repo; it does not copy from it.** Copies drift.
4. **Drive folders mirror repo structure** (company/, products/, colo/) so a
   binary artifact is always findable from its subject.
