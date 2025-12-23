# generate-docs.ts

This script parses `SAMP.ahk` (AHK v1.1) and generates a Markdown file per function into `docs/docs/functions` for use with Docusaurus.

Usage (no global install needed):

PowerShell (Windows):

```powershell
# from repository root (d:\Development\samp-udf-ahk)
npx ts-node scripts/generate-docs.ts
```

Notes:
- The script expects `SAMP.ahk` to be at the repository root.
- Comment blocks must use semicolons (`;`) immediately above the function declaration. You can use `@param`, `@returns`/`@return`, and `@example` tags in the comments.
- Example comment style:

```
; Brief description of the function
; @param playerId The player id
; @param health The health value to set
; @returns True on success
MyFunction(playerId, health) {
    ; ...
}
```

If you prefer to compile first:

```powershell
npx tsc scripts/generate-docs.ts --outDir build
node build/scripts/generate-docs.js
```
