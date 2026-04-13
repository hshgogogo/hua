# macOS Workflow

Use this when running the workflow in Terminal or iTerm on macOS.

## 1. Install dependencies

```bash
python3 -m pip install --upgrade pymupdf python-docx
```

## 2. Create a clean working folder

```bash
mkdir -p ./work ./output
```

## 3. Extract the source text and PDF block map

```bash
python3 ./scripts/build_outline_diff_outputs.py extract \
  --new-pdf "/Users/you/path/new-outline.pdf" \
  --old-docx "/Users/you/path/old-outline.docx" \
  --output-dir "./work"
```

This creates:

- `./work/new_pdf_full_text.txt`
- `./work/new_pdf_blocks.json`
- `./work/old_docx_full_text.txt`

## 4. Compare the two versions

Read the extracted files and manually create:

- `./work/compare_report.md`
- `./work/annotation_manifest.json`

Manifest format: [manifest-schema.md](manifest-schema.md)

## 5. Render the deliverables

```bash
python3 ./scripts/build_outline_diff_outputs.py render \
  --new-pdf "/Users/you/path/new-outline.pdf" \
  --old-docx "/Users/you/path/old-outline.docx" \
  --manifest-json "./work/annotation_manifest.json" \
  --report-md "./work/compare_report.md" \
  --output-dir "./output"
```

## 6. Verify the PDF

Open the output PDF and check:

- visible yellow note boxes show Chinese correctly
- only structural changes are marked
- note boxes are outside the source text area

## macOS Notes

- A committed `.py` file is still safer than ad hoc pasted code.
- If Chinese text does not render, install or point the script at a CJK system font.
- If Preview.app caches an older PDF, close and reopen the file after regeneration.
