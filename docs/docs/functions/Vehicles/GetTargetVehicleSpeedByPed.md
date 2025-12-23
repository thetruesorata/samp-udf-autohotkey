---
title: GetTargetVehicleSpeedByPed
---

Retrieve the speed of a ped's vehicle. 
The `speedMultiplier` parameter can be adjusted per server to get more accurate speed values.

**Parameters:**

- **dwPED**: PED pointer
- **speedMultiplier**: (float) Optional speed multiplier (default: 1.43)

**Returns:** Vehicle speed as float, or `-1` on failure

**Signature:**

```ahk
GetTargetVehicleSpeedByPed(dwPED, speedMultiplier := 1.43)
```
