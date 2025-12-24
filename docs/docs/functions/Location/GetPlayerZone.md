---
title: GetPlayerZone
---

Get the player's current zone name. 
:::warning[Return Value For Unknown Zone] 
If the zone cannot be determined, the function returns `"Unbekannt"`. 
It's the German word for <em>Unknown</em>. This return value may change in future versions to 
more universal English term <em>Unknown</em>. 
Please refer to [`CalculateZone`](CalculateZone) as its return value is returned here. 
:::

**Returns:** Zone name as string, or `"Unbekannt"` if not found

**Signature:**

```autohotkey
GetPlayerZone()
```
