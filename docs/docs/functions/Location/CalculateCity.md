---
title: CalculateCity
---

Calculate the city name based on the provided coordinates. Compared to [`CalculateZone`](CalculateZone), 
cities define larger areas (actual cities) than zones, which can be smaller parts of cities or rural areas. 
:::warning[Initialization] 
The first time this function is called, it initializes the zones and 
cities data using [`InitZonesAndCities`](InitZonesAndCities). 
::: 
:::warning[Return Value For Unknown City] 
If the city cannot be determined, the function returns `"Unbekannt"`. It's the German word for <em>Unknown</em>. 
This return value may change in future versions to more universal English term <em>Unknown</em>. 
:::

**Parameters:**

- **posX**: X coordinate as float
- **posY**: Y coordinate as float
- **posZ**: Z coordinate as float

**Returns:** City name as string, or `"Unbekannt"` if not found

**Signature:**

```autohotkey
CalculateCity(posX, posY, posZ)
```
