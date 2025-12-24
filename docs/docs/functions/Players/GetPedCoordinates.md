---
title: GetPedCoordinates
---

Get the world coordinates for a given PED pointer. The underlying `CPed` struct 
is the GTA:SA native struct, so not tied to SA:MP. The position of the rendered 
ped is a vector of floats, stored at `PED+0x14 -> +0x30 (X), +0x34 (Y), +0x38 (Z)`. 
For more information, please consult [Memory Addresses (SA) - GTAMods Wiki](https://gtamods.com/wiki/Memory_Addresses_(SA)#General) 
<p> 
In SA:MP, if the ped is not streamed in, this function will fail. 
</p>

**Parameters:**

- **dwPED**: PED pointer

**Returns:** Array of coordinates `[X, Y, Z]` as floats or empty string on failure

**Signature:**

```autohotkey
GetPedCoordinates(dwPED)
```
