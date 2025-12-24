---
title: UpdateOScoreboardData
---

Update the local scoreboard data cache. The data is stored in a global object array `oScoreboardData`. 
Before actually caching, this function calls [`UpdateScoreboardDataEx`](UpdateScoreboardDataEx) in order 
to fetch latest scoreboard data first. Then, the local player's data is read and cached, and finally, 
all remote players' data. 
<p> 
<b>Note</b> 
<ul> 
<li>This function is automatically called by other scoreboard-related functions when needed.</li> 
<li>Most functions that invoke this function check whether the scoreboard data is still fresh by comparing 
the current tick count with the last refresh tick count plus an update interval (`iUpdateTick`).</li> 
<li>If the logic errors occur during memory reading,<ul><li>the function will return `false`</li><li>eventually, the global error level `ErrorLevel` will be set to `ERROR_READ_MEMORY`</li><li>the global scoreboard data cache may not be complete</li></ul></li> 
</ul> 
</p>

**Returns:** `true` on success, `false` on failure (SA:MP not available, `UpdateScoreboardDataEx` failed, memory read error, etc.)

**Signature:**

```autohotkey
UpdateOScoreboardData()
```
