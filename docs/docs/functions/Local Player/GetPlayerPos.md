---
title: GetPlayerPos
---

Get the player's current coordinates. Compared to [`GetPlayerCoordinates`](GetPlayerCoordinates), 
this function assumes that the passed parameters are references (pass-by-reference). That means 
that the function updates the passed variables directly. 
:::note 
This function works as the same as [`GetPlayerCoordinates`](GetPlayerCoordinates). When in doubt, 
we recommend using [`GetPlayerCoordinates`](GetPlayerCoordinates) instead. 
:::

**Parameters:**

- **fX**: Variable to store X coordinate as float (pass-by-reference)
- **fY**: Variable to store Y coordinate as float (pass-by-reference)
- **fZ**: Variable to store Z coordinate as float (pass-by-reference)

**Returns:** `0` on success, `false` on failure

**Signature:**

```autohotkey
GetPlayerPos(ByRef fX, ByRef fY, ByRef fZ)
```
