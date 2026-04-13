# Windows Workflow

Use this when running the workflow in PowerShell on Windows.

## 1. Install dependencies

```powershell
python -m pip install --upgrade pymupdf python-docx
```

## 2. Create a clean working folder

```powershell
New-Item -ItemType Directory -Force .\work | Out-Null
New-Item -ItemType Directory -Force .\output | Out-Null
```

## 3. Extract the source text and PDF block map

```powershell
python .\scripts\build_outline_diff_outputs.py extract `
  --new-pdf "E:\path\new-outline.pdf" `
  --old-docx "E:\path\old-outline.docx" `
  --output-dir ".\work"
```

This creates:

- `.\work\new_pdf_full_text.txt`
- `.\work\new_pdf_blocks.json`
- `.\work\old_docx_full_text.txt`

## 4. Compare the two versions

Read the extracted files and manually create:

- `.\work\compare_report.md`
- `.\work\annotation_manifest.json`

Manifest format: [manifest-schema.md](manifest-schema.md)

## 5. Render the deliverables

```powershell
python .\scripts\build_outline_diff_outputs.py render `
  --new-pdf "E:\path\new-outline.pdf" `
  --old-docx "E:\path\old-outline.docx" `
  --manifest-json ".\work\annotation_manifest.json" `
  --report-md ".\work\compare_report.md" `
  --output-dir ".\output"
```

## 6. Verify the PDF

Open the output PDF and check:

- visible yellow note boxes show Chinese correctly
- only structural changes are marked
- note boxes are outside the source text area

## Critical Windows Notes

- Do not do this:

```powershell
@'
print("中文")
'@ | python -
```

PowerShell often corrupts inline Chinese source before Python sees it.

- Do this instead:

```powershell
python .\scripts\build_outline_diff_outputs.py --help
```

or save any helper code into a real UTF-8 `.py` file first.

- If a viewer caches old PDFs, close the file before regenerating it.
