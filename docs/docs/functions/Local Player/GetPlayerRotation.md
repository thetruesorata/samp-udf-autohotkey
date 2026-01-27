---
title: GetPlayerRotation
---

Get the player's current Z rotation. The returning rotation is value in Degree between `-180° < x <= 180°`, where 
angle `x` starts at `0` when facing North, `-+180°` when facing South, and counterclockwise rotation is positive. 
If you need an example usage, you can take a look at [`GetPlayerFacingDirection`](GetPlayerFacingDirection), which 
returns a string representing the player's facing direction in compass style.

**Returns:** Z rotation as float, or `false` on failure

**Signature:**

```autohotkey
GetPlayerRotation()
```
