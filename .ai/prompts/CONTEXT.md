# Context — my-life-repo

This file is the primary context document for any LLM working with this repository.
Read it fully before taking any action, proposing any change, or routing any document.

---

## Who I am

- **Name**: Pedro Ferraz
- **Location**: Montijo, Portugal
- **Language**: English (all documents, summaries, and action points must be in English)
- **Review cadence**: Weekly — goals and action points are reviewed every week
- **Output style**: Mix of concise bullet points and short prose. Never walls of text.
  Use bullets for action points and tasks. Use short paragraphs for summaries and reflections.

---

## What this repo is

A private, encrypted personal knowledge base that holds both my **personal life** and
**work** documents, goals, action points, and tools. It is the single source of truth
for what I am working on, what I want to achieve, and what I have reflected on.

The repo is structured so that both I and an LLM can read, write, and navigate it.
All Markdown documents follow consistent templates (see `templates/`).
All sensitive content lives in `personal/` and `work/` — both encrypted at rest on GitHub.

---

## Repo structure

```
personal/
  goals/        → personal quarterly and yearly goals
  journal/      → weekly reflections and thoughts
  finance/      → budget tracking, expenses, financial goals
  health/       → habits, fitness, wellbeing notes
  _inbox/       → drop zone — unprocessed documents waiting to be routed

work/
  projects/     → one subfolder per project
  meetings/     → meeting notes, named YYYY-MM-DD-topic.md
  okrs-goals/   → quarterly OKRs and key results tracking
  _inbox/       → drop zone — unprocessed work documents

.ai/
  CONTEXT.md    → this file
  schema.md     → folder rules, naming conventions, validation rules
  prompts/      → reusable prompt templates

templates/      → Markdown templates for goals, meetings, projects, journal
tools/          → Python scripts and CLI helpers
apps/           → web applications for visualization
```

---

## Personal areas I track

| Area | Folder | Cadence |
|---|---|---|
| Personal goals | `personal/goals/` | Quarterly set, weekly reviewed |
| Journal & reflections | `personal/journal/` | Weekly entries |
| Health & habits | `personal/health/` | Weekly notes |
| Finance & budget | `personal/finance/` | Monthly tracking |

---

## Rules the LLM must always follow

1. **Never move or create a file without my explicit confirmation.** Always propose
   first — show me exactly what you intend to do (file name, destination folder,
   content summary) and wait for my approval before executing.

2. **Always use the correct template** from `templates/` when creating a new document.
   Never invent a new structure — if no template fits, ask me first.

3. **Always write in English**, regardless of the language of the source document.

4. **Action points must be specific and actionable.** Not "think about finance" but
   "review February expenses and identify top 3 overspend categories."

5. **Never delete files.** If something should be removed, flag it to me and let me
   decide.

6. **Respect the personal/work separation strictly.** Never place a personal document
   in `work/` or vice versa.

7. **When in doubt, ask.** It is always better to ask a clarifying question than to
   make an assumption and act on it.

---

## How to process a document from _inbox/

When a document lands in `personal/_inbox/` or `work/_inbox/`, follow this process:

1. **Read** the document fully
2. **Classify** it: what type is it? (goal, reflection, meeting note, project doc, etc.)
3. **Identify** the correct destination folder based on the schema
4. **Extract** action points if any are present or implied
5. **Propose** to me:
   - Suggested destination path and filename
   - A brief summary (2–3 sentences)
   - Extracted action points (bullet list)
   - Any new folders that would need to be created
6. **Wait** for my confirmation before doing anything
7. **Execute** only what I approved — nothing more

---

## Weekly review prompt

Every week I want to:
- Review open action points across `personal/` and `work/`
- Update goal progress in `personal/goals/` and `work/okrs-goals/`
- Write a new journal entry in `personal/journal/`
- Identify the top 3 priorities for the coming week

When I say "weekly review", run through this checklist with me.
