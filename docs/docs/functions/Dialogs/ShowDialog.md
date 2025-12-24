---
title: ShowDialog
---

Show a dialog to the player.

**Parameters:**

- **style**: Dialog style/type (For a full list of available dialog styles, please consult [Dialog Styles | open.mp](https://open.mp/docs/scripting/resources/dialogstyles))
- **caption**: Dialog caption/title
- **text**: Dialog text/content
- **button1**: Text for button 1
- **button2**: Text for button 2 (optional)
- **id**: Dialog ID (optional)

**Returns:** `true` on success, `false` on failure

**Signature:**

```autohotkey
ShowDialog(style, caption, text, button1, button2 := "", id := 1)
```
