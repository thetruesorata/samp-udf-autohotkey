---
title: GetPlayerCity
---

Get the player's current city name. 
:::warning[Return Value For Unknown City] 
If the city cannot be determined, the function returns `"Unbekannt"`. 
It's the German word for <em>Unknown</em>. This return value may change in future versions to 
more universal English term <em>Unknown</em>. 
Please refer to [`CalculateCity`](CalculateCity) as its return value is returned here. 
:::

**Returns:** City name as string, or `"Unbekannt"` if not found

**Signature:**

```ahk
GetPlayerCity()
```
