---
title: GetPlayerId
---

Retrieves the player's ID. First, the player's name is fetched 
using `GetPlayerName()`, and then the ID is obtained using `GetPlayerIdByName()`. 
In the end, the ID is grabbed from the scoreboard.

**Returns:** The player's ID as an integer, or -1 on failure

**Signature:**

```ahk
GetPlayerId()
```
