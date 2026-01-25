---
title: GetVehicleId
---

Returns the ID of the player's current vehicle he's sitting in. 
:::warning[Do not mix up with model ID!] 
This returns the "server"/instance ID of the vehicle. If you need its 
model ID, you must use [`GetVehicleModelId`](GetVehicleModelId) instead! 
:::

**Returns:** ID (not model ID!) of the vehicle the player is sitting in, or `-1` on error

**Signature:**

```autohotkey
GetVehicleId()
```
