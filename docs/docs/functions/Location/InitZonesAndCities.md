---
title: InitZonesAndCities
---

Initialize the zones and cities data. 
<p> 
As of right now, there is no way to find out if this function has been already called and thus 
having the default data set initialized. The functions that call this function 
for the first time will set alobal variable `bInitZaC` to `1` in order to avoid multiple 
initializations. This allows you to check whether the zones and cities data has been initialized. 
So theoretically, if you want to supply your own zones and cities data 
<ol> 
<li>you can set `bInitZaC` to `1`</li> 
<li>then call your own functions to add zones and cities</li> 
</ol> 
before calling any function that relies on zones and cities data. 
</p> 
<p> 
Functions that use this function: 
<ul> 
<li>[`CalculateZone`](CalculateZone)</li> 
<li>[`CalculateCity`](CalculateCity)</li> 
</ul> 
Please note that there may be implicit calls to these functions. In general, the list above 
may not be exhaustive, and not up-to-date. The best way to find out which functions invoke this 
function is to search in code! 
</p>

**Signature:**

```autohotkey
InitZonesAndCities()
```
