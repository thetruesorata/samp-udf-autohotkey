---
title: CalculateZone
---

Calculate the zone name based on the provided coordinates. 
:::warning[Initialization] 
The first time this function is called, it initializes the zones and 
cities data using [`InitZonesAndCities`](InitZonesAndCities). 
::: 
:::warning[Return Value For Unknown Zone] 
If the zone cannot be determined, the function returns `"Unbekannt"`. It's the German word for <em>Unknown</em>. 
This return value may change in future versions to more universal English term <em>Unknown</em>. 
:::

**Parameters:**

- **posX**: X coordinate as float
- **posY**: Y coordinate as float
- **posZ**: Z coordinate as float

**Returns:** Zone name as string, or `"Unbekannt"` if not found

**Signature:**

```autohotkey
CalculateZone(posX, posY, posZ)
```
