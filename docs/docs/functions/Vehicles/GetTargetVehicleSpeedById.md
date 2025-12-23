---
title: GetTargetVehicleSpeedById
---

Retrieve the speed of a player's vehicle by id. 
The `speedMultiplier` parameter can be adjusted per server to get more accurate speed values.

**Parameters:**

- **dwId**: Player id
- **speedMultiplier**: (float) Optional speed multiplier (default: 1.43)

**Returns:** Vehicle speed as float, or `-1` on failure

**Signature:**

```ahk
GetTargetVehicleSpeedById(dwId)
```
