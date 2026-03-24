# Schema — folder rules & naming conventions

This file defines the rules for how documents are named, structured, and placed.
The LLM must validate every proposed file against these rules before presenting it to Pedro.

---

## Naming conventions

| Document type | Pattern | Example |
|---|---|---|
| Meeting note | `YYYY-MM-DD-topic.md` | `2025-03-24-team-standup.md` |
| Journal entry | `YYYY-MM-DD.md` | `2025-03-24.md` |
| Goal document | `YYYY-Qn-goals.md` | `2025-Q1-goals.md` |
| OKR document | `YYYY-Qn-okrs.md` | `2025-Q1-okrs.md` |
| Project README | `README.md` inside project folder | `work/projects/my-project/README.md` |
| Action points | `action-points.md` inside project folder | `work/projects/my-project/action-points.md` |
| Finance log | `YYYY-MM.md` | `personal/finance/2025-03.md` |
| Health log | `YYYY-MM.md` | `personal/health/2025-03.md` |

- All filenames: **lowercase**, **hyphens** instead of spaces, no special characters
- All dates: **ISO 8601** format (YYYY-MM-DD)
- Never use `_` in filenames (reserved for special folders like `_inbox`)

---

## Special folders

| Folder | Purpose |
|---|---|
| `personal/_inbox/` | Drop zone for unprocessed personal documents |
| `work/_inbox/` | Drop zone for unprocessed work documents |

Documents in `_inbox/` are **temporary**. They must be routed out after processing.
The `_inbox/` folder should never accumulate more than ~10 documents.

---

## Project folder structure

Every project under `work/projects/` must follow this layout:

```
work/projects/{project-name}/
  README.md           → project overview, goals, status
  action-points.md    → open and completed action points
  docs/               → supporting documents
```

A new project folder is only created after Pedro confirms it.

---

## Document front matter

Every Markdown document must start with YAML front matter:

```yaml
---
title: "Document title"
date: YYYY-MM-DD
type: goal | journal | meeting | project | finance | health | okr
status: active | completed | archived
tags: []
---
```

- `type` must be one of the defined values above
- `status` defaults to `active` on creation
- `tags` are optional but encouraged for searchability

---

## Validation checklist

Before proposing any file to Pedro, verify:

- [ ] Filename follows the naming convention for its type
- [ ] File is going into the correct folder
- [ ] Front matter is complete and valid
- [ ] Personal documents go in `personal/`, work documents in `work/`
- [ ] No file is being deleted, only created or moved
- [ ] If a new folder is needed, it is explicitly flagged in the proposal
