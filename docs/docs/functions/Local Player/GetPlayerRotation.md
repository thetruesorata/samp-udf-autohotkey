---
title: GetPlayerRotation
---

Get the player's current Z rotation. The returning rotation is a Radian value between `-π < x <= π`, where 
angle `x` starts at `0` when facing North, `-+π` when facing South, and counterclockwise rotation is positive. 
If you need an example usage, you can take a look at [`GetPlayerFacingDirection`](GetPlayerFacingDirection), which 
returns a string representing the player's facing direction in compass style.

**Returns:** Z rotation as float, or `false` on failure

**Signature:**

```autohotkey
GetPlayerRotation()
```
