---
title: GetPlayerPos
---

Get the player's current coordinates and Z rotation. Compared to [`GetPlayerCoordinates`](GetPlayerCoordinates), 
this function assumes that the passed parameters are references (pass-by-reference). That means 
that the function updates the passed variables directly. 
The Z rotation is queried by calling [`GetPlayerRotation`](GetPlayerRotation). 
:::note 
This function works as the same as [`GetPlayerCoordinates`](GetPlayerCoordinates). When in doubt, 
we recommend using [`GetPlayerCoordinates`](GetPlayerCoordinates) instead. 
:::

**Parameters:**

- **fX**: Variable to store X coordinate as float (pass-by-reference)
- **fY**: Variable to store Y coordinate as float (pass-by-reference)
- **fZ**: Variable to store Z coordinate as float (pass-by-reference)
- **fR**: Variable to store Z rotation as float (pass-by-reference) (optional)

**Returns:** `0` on success, `false` on failure

**Signature:**

```autohotkey
GetPlayerPos(ByRef fX, ByRef fY, ByRef fZ, ByRef fR := "")
```
