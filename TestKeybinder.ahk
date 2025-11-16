; https://github.com/paul-phoenix/SAMP-UDF-for-AutoHotKey/blob/2b8a567ad29550bfce9196c182f58fa85c0f4d78/SAMP.ahk
SendMode Input
SetWorkingDir %A_ScriptDir%
#Warn
#UseHook
#NoEnv
#SingleInstance force
#include %A_ScriptDir%\SAMP.ahk

Hotkey, Enter, Off
Hotkey, Escape, Off

bchat:=0
return

+T:: 
~t::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return

~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return

~Escape::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return


;#########################################################################################################


;Type in a nickname and it shows some info about this player
Numpad1::
SendInput tName:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varName, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
varID := GetPlayerIdByName(varName)
ShowGameText(GetPlayerNameById(varID) "~n~Score: " GetPlayerScoreById(varID) "~n~Ping: " GetPlayerPingById(varID), 2000, 5)
return

;Type in a ID and it shows some info about this player
Numpad2::
SendInput tID:{Space}
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Input varID, V I M,{enter}
SendInput {end}+{home}{Del}{esc}
;updateScoreboardData()     ;wird nun implizit aufgerufen
ShowGameText(GetPlayerNameById(varID) "~n~Score: " GetPlayerScoreById(varID) "~n~Ping: " GetPlayerPingById(varID) "~n~IsNPC: " IsNPCById(varID), 2000, 5)
return

;play an "audio stream"
Numpad3::
PlayAudioStream("http://breakz.us/radio/listen.pls")
return

;stopp an "audio stream"
Numpad4::
StopAudioStream()
return

;show some info about the local player, use some functions
Numpad5::
; if ( IsInChat() )
;   	return
AddChatMessage("{FFFFFF}IP: {FF0000}" GetServerIp() "{FFFFFF}, Hostname: {FF0000}" GetServerName())
AddChatMessage("{FFFFFF}Players: {FF0000}" CountOnlinePlayers())
AddChatMessage("{FFFFFF}Name: {FF0000}" GetPlayerName())
AddChatMessage("{FFFFFF}HP: {FF0000}" GetPlayerHealth() "{FFFFFF}, ARMOR: {FF0000}" GetPlayerArmor())
AddChatMessage("{FFFFFF}Money: {FF0000}" GetPlayerMoney())
AddChatMessage("{FFFFFF}Interior id: {FF0000}" GetPlayerInteriorId())
pos := GetPlayerCoordinates()
AddChatMessage("{FFFFFF}Zone: {FF0000}" CalculateZone(pos[1],pos[2],pos[3]) "{FFFFFF}, Stadt: {FF0000}" CalculateCity(pos[1],pos[2],pos[3]))
return

;shows a dialog-box
Numpad6::
ShowDialog(5, "Titel", "Weapon`tPrice`tAmmo`nDeagle`t$5000`t100`nSawnoff`t$5000`t100`nPistol`t$1000`t50", "OK" )
return

;show some info about the current vehicle
Numpad7::
AddChatMessage("{FFFFFF}Vehicle Type:" GetVehicleType())
AddChatMessage("{FFFFFF}Model:" GetVehicleModelId())
AddChatMessage("{FFFFFF}Model Name:" GetVehicleModelName())
AddChatMessage("{FFFFFF}Is Driver:" IsPlayerDriver())
AddChatMessage("{FFFFFF}Light State:" GetVehicleLightState())
AddChatMessage("{FFFFFF}Engine State:" GetVehicleEngineState())
AddChatMessage("{FFFFFF}Door State:" GetVehicleLockState())
return

Numpad8::
AddChatMessage("{FFFFFF}block chat " (bchat ? "{FF0000}off" : "{00FF00}on"))
if(bchat)
	UnBlockChatInput()
else
	BlockChatInput()
bchat:=!bchat
return