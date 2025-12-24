---
title: GetDialogLine__
---

:::experimental

This function is experimental and its implementation may involve 
    breaking changes or deprecation, or may not be tested throughly. Use at your own risk.

:::

Get a specific line from the currently opened dialog. 
<p> 
<b>Note:</b> It's currently not tested how this implementation really differs 
from [`GetDialogLine`](GetDialogLine). It may return different results. 
As this is suffixed with `__`, it's possible that this function has been considered deprecated. 
</p>

**Parameters:**

- **index**: Line index (1-based)

**Returns:** Dialog line as string, or empty string on failure

**Signature:**

```autohotkey
GetDialogLine__(index)
```
