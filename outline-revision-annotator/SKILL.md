---
name: outline-revision-annotator
description: Use when comparing a revised PDF outline against an older DOCX outline and you need a high-signal change report plus visible PDF markup that calls out only structural additions or rewrites.
license: MIT
---

# Outline Revision Annotator

Compare a new outline PDF with an older outline DOCX, then produce:

- a UTF-8 markdown report
- a DOCX report generated from that markdown
- an annotated PDF with visible yellow note boxes in the page margin

This skill is for structural revision review, not line editing.

## Use This Skill For

- Story bibles, season outlines, beat sheets, treatment revisions
- `new.pdf` versus `old.docx` review workflows
- Chinese-language documents where PDF popup comments often render as garbled text
- Deliverables that need to be readable without clicking annotation popups

## Do Not Use It For

- punctuation or wording polish
- paragraph-level copy edits that do not change story function
- literal redline review
- “mark everything that changed” requests

## Qualification Rule

Mark only changes that alter structure or story function:

- new season engine, new thematic spine, or new professional framework
- new antagonist, institutional pressure line, or evaluation thread
- a character arc rewritten to serve a different dramatic job
- ending reset from “closed loop” to “hook for next season”
- a case line upgraded from emotional texture to ethical / institutional conflict

Do not mark:

- sentence rewrites with the same dramatic function
- softened or intensified phrasing
- richer detail that does not change structure

## Workflow

### 1. Extract the sources

Run the helper script first. It produces plain text and page/block maps for the new PDF, plus plain text for the old DOCX.

- Windows commands: [references/windows.md](references/windows.md)
- macOS commands: [references/macos.md](references/macos.md)

### 2. Compare semantically

Read the extracted text and decide which changes are structural. Then manually author two files:

- `compare_report.md`
- `annotation_manifest.json`

Manifest schema and examples: [references/manifest-schema.md](references/manifest-schema.md)

### 3. Render the final deliverables

Run the same script in `render` mode. It will:

- create an annotated PDF with visible margin boxes
- copy the markdown report as UTF-8
- convert the markdown report into DOCX
- write a normalized manifest copy into the output folder

### 4. Visually verify the PDF

Open the annotated PDF and check:

- the right-side yellow box text is visible without clicking
- Chinese text is not garbled
- note boxes do not cover the source paragraph
- only structural changes were marked

If something is wrong, read [references/troubleshooting.md](references/troubleshooting.md).

## Non-Negotiable Rules

- On Windows PowerShell, never pipe Chinese Python source directly into `python -`. Save a real UTF-8 `.py` file and run the file.
- Do not rely on popup PDF comments for Chinese review notes. Write visible note boxes into the page margin.
- If a change is stylistic rather than structural, leave it unmarked.
- Prefer an ASCII fallback filename if a downstream tool or browser tab cannot handle Chinese filenames cleanly.

## Deliverables Checklist

- `annotated.pdf`
- `compare_report.md`
- `compare_report.docx`
- `annotation_manifest.normalized.json`

## Script Entry Points

The bundled script is:

- `scripts/build_outline_diff_outputs.py`

Supported modes:

- `extract`: dump source text and PDF block maps
- `render`: build the annotated PDF and report outputs

## What the Script Does Not Decide

The script is deterministic. The agent still decides:

- which changes count as structural
- which blocks should be grouped into one note
- how to phrase the comparison report
- how to phrase each yellow-box explanation

Keep that judgment in the agent; keep rendering in the script.
