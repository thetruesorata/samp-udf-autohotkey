---
title: GetChatLine
---

Get a specific line from the SAMP chat log.

**Parameters:**

- **Line**: Line number from the end (0 = last line)
- **Output**: variable to store the output line (*pass by reference*)
- **timestamp**: Optional boolean to include timestamp (default: `false|0` = no)
- **color**: Optional boolean to include color codes (default: `false|0` = no)

**Signature:**

```ahk
GetChatLine(Line, ByRef Output, timestamp=0, color=0)
```
