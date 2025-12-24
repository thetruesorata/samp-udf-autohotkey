---
title: GetDialogStructPtr
---

Returns a pointer to SA:MP dialog struct. This allows you to read 
information in the currently opened dialog, such as type, text, caption, etc. 
<p> 
Usually, there's no need to use this function directly, as this library exposes 
higher-level functions to get specific dialog information. 
</p>

**Returns:** Pointer to dialog struct (DWord) or `false` on failure

**Signature:**

```autohotkey
GetDialogStructPtr()
```
