---
title: GetVehicleNumberPlate
---

Retrieve the vehicle number plate for the current vehicle. 
<p> 
The returned number plate may contain color codes in string, which you may strip 
if not needed. 
```autohotkey 
plate := GetVehicleNumberPlate() 
; RegEx for `{FF0000}` (any hexadecimal value in curly braces) 
plate := RegExReplace(plate, "\{[0-9A-Z]{6}\}", "") 
``` 
</p>

**Returns:** The vehicle number plate as string, or empty string on failure

**Signature:**

```autohotkey
GetVehicleNumberPlate()
```
