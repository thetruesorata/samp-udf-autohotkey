---
title: GetPlayerFacingDirection
---

Returns the player's facing direction in compass style ("N", "W", ...). 
The compass is divided in 8 sectors "S", "SE", "E", "NE", "N", "NW", "W", "SW" (=> 1/8 of a circle). 
If you want to have a higher or lower resolution, take a look at or copy the implementation of this 
method and consider 
- increasing or decreasing the amount of sectors 
- and adjusting the `dirs` array to match its elements count with the amount of sectors.

**Returns:** one of the string values: `["S","SE","E","NE","N","NW","W","SW"]`, or `Unknown`

**Signature:**

```autohotkey
GetPlayerFacingDirection()
```
