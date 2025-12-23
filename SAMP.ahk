; #### SAMP UDF R18 ####
; SAMP Version: 0.3.7, 0.3.7-R2, 0.3.7-R5, 0.3.DL
; Written by Chuck_Floyd 
; https://github.com/FrozenBrain
; Modified by Suchty112
; https://github.com/Suchty112
; Modified by: paul-phoenix
; https://github.com/paul-phoenix
; Modified by: Agrippa1994
; https://github.com/agrippa1994
; Modified by: RawDev and ELon
; Refactoring by: Peek
; https://github.com/pkfln
; Multifunctional by: Coderunner
; https://samp-udf.net/index.php?user/4-coderunner/
; Modified by: thetruesorata
; https://github.com/thetruesorata
; Do not remove these lines.
; ####################

; ######################### Error levels #########################
global ERROR_OK                     := 0
global ERROR_PROCESS_NOT_FOUND      := 1
global ERROR_OPEN_PROCESS           := 2
global ERROR_INVALID_HANDLE         := 3
global ERROR_MODULE_NOT_FOUND       := 4
global ERROR_ENUM_PROCESS_MODULES   := 5
global ERROR_ZONE_NOT_FOUND         := 6
global ERROR_CITY_NOT_FOUND         := 7
global ERROR_READ_MEMORY            := 8
global ERROR_WRITE_MEMORY           := 9
global ERROR_ALLOC_MEMORY           := 10
global ERROR_FREE_MEMORY            := 11
global ERROR_WAIT_FOR_OBJECT        := 12
global ERROR_CREATE_THREAD          := 13

; ######################### GTA addresses #########################
global ADDR_ZONECODE                := 0xA49AD4      ;Player Zone
global ADDR_POSITION_X              := 0xB6F2E4      ;Player X Position
global ADDR_POSITION_Y              := 0xB6F2E8      ;Player Y Position
global ADDR_POSITION_Z              := 0xB6F2EC      ;Player Z Position
global ADDR_CPED_PTR                := 0xB6F5F0      ;Player CPED Pointer
global ADDR_CPED_HPOFF              := 0x540         ;Player Health
global ADDR_CPED_ARMOROFF           := 0x548         ;Player Armour
global ADDR_CPED_MONEY              := 0x0B7CE54     ;Player Money
global ADDR_CPED_INTID              := 0xA4ACE8      ;Player Interior-ID
global ADDR_CPED_SKINIDOFF          := 0x22          ;Player Skin-ID
;
global ADDR_VEHICLE_PTR             := 0xBA18FC      ;Vehicle CPED Pointer
global ADDR_VEHICLE_HPOFF           := 0x4C0         ;Vehicle Health
global ADDR_VEHICLE_DOORSTATE       := 0x4F8         ;Vehicle Door Status
global ADDR_VEHICLE_ENGINESTATE     := 0x428         ;Vehicle Engine Status
global ADDR_VEHICLE_LIGHTSTATE      := 0x584         ;Vehicle Light Status
global ADDR_VEHICLE_MODEL           := 0x22          ;Vehicle Car-ID & Car-Name
global ADDR_VEHICLE_TYPE            := 0x590         ;Vehicle Typ-ID (1 = Car)
global ADDR_VEHICLE_DRIVER          := 0x460         ;Vehicle Driver
global ADDR_VEHICLE_X               := 0x44          ;Vehicle Speed X
global ADDR_VEHICLE_Y               := 0x48          ;Vehicle Speed Y
global ADDR_VEHICLE_Z               := 0x4C          ;Vehicle Speed Z
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]

; ########################## SAMP addresses ##########################

; SAMPAPI_VAR CGame*& RefGame() 
global ADDR_SAMP_INCHAT_PTR                 := [0x21A10C, 0x21A114, 0x2ACA3C, 0x26EBAC]
global ADDR_SAMP_INCHAT_PTR_OFF             := [0x55, 0x60, 0x60, 0x60]
global ADDR_SAMP_USERNAME                   := [0x219A6F, 0x219A77, 0x2AC187, 0x26E2F7]

global ADDR_SAMP_SERVERNAME                 := [0x121, 0x11D, 0x131, 0x121]
global ADDR_SAMP_SERVERIP                   := [0x20, 0x1C, 0x30, 0x20]
global ADDR_SAMP_SERVERPORT                 := [0x225, 0x221, 0x235, 0x225]
global ADDR_SAMP_VEHPOOL                    := [0x1C, 0xC, 0xC, 0x1C]

; SAMPAPI_VAR CScoreboard*& RefScoreboard()
global SAMP_SCOREBOARD_INFO_PTR 	        := [0x21A0B4, 0x21A0BC, 0x2AC9DC, 0x26EB4C]

global SAMP_REMOTEPLAYERDATA_OFFSET         := [0x0, 0xC, 0x8, 0x10]
global SAMP_REMOTEPLAYERDATA_ACTOR          := [0x0, 0x1C, 0x4, 0x1DD]
global SAMP_REMOTEPLAYERDATA_PED            := [0x25C, 0x40, 0x40, 0x0]
global SAMP_REMOTEPLAYERDATA_HEALTH	        := [0x1BC, 0x1BC, 0x1B0, 0x1B0]
global SAMP_REMOTEPLAYERDATA_ARMOR          := [0x1B8, 0x1AC, 0x1AC, 0x1AC]
global SAMP_REMOTEPLAYERDATA_GLOBALPOS      := [0x2A4, 0x17C, 0x120, 0x17C]
global SAMP_REMOTEPLAYERDATA_POS            := [0x2A4, 0x2A, 0x42, 0x17C]
; void CGame::SetCheckpoint(CVector* pPos, CVector* pSize)
global FUNC_SAMP_SETCHECKPOINT              := [0x9D340, 0x9D3F0, 0xA1C00, 0xA1DE0]
; TODO verify offset
global SAMP_CHECKPOINT_ACTIVE               := [0x24, 0x4D, 0x4D, 0x24]

global SAMP_PLAYER_COLOR_OFFSET 			:= [0x216378, 0x216380, 0x18F6C0, 0x151828]

global FUNC_SAMP_SENDCMD                    := [0x65C60, 0x65D30, 0x69340, 0x69900] 
global FUNC_SAMP_SENDSAY                    := [0x57F0, 0x57E0, 0x5860, 0x5A10]
global FUNC_SAMP_ADDTOCHATWND               := [0x64520, 0x645F0, 0x67B60, 0x68070]
; SAMPAPI_VAR CChat*& RefChat() 
global ADDR_SAMP_CHATMSG_PTR                := [0x21A0E4, 0x21A0EC, 0x2ACA10, 0x26EB80]
global FUNC_SAMP_SHOWGAMETEXT               := [0x9C2C0, 0x9C370, 0xA0B20, 0xA0CE0]
; BOOL CAudioStream::Play(const char* szUrl, CVector position, float fRadius, bool bIs3d)
global FUNC_SAMP_PLAYAUDIOSTR               := [0x62DA0, 0x62E70, 0x663E0, 0x66960]
; BOOL CAudioStream::Stop(bool bWait)
global FUNC_SAMP_STOPAUDIOSTR               := [0x629A0, 0x62A70, 0x65FE0, 0x66560]

; ########################## Dialog styles ##########################
global DIALOG_STYLE_MSGBOX                  := 0
global DIALOG_STYLE_INPUT                   := 1
global DIALOG_STYLE_LIST                    := 2
global DIALOG_STYLE_PASSWORD                := 3
global DIALOG_STYLE_TABLIST                 := 4
global DIALOG_STYLE_TABLIST_HEADERS         := 5


; ######################### Dialog structure #########################
; SAMPAPI_VAR CDialog*& RefDialog()
global SAMP_DIALOG_STRUCT_PTR               := [0x21A0B8, 0x21A0C0, 0x2AC9E0, 0x26EB50]
global SAMP_DIALOG_PTR1_OFFSET              := 0x1C
global SAMP_DIALOG_LINES_OFFSET             := 0x44C
global SAMP_DIALOG_INDEX_OFFSET             := 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET   := 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET    := 0x466
global SAMP_DIALOG_PTR2_OFFSET              := 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET         := 0x150
global SAMP_DIALOG_OPEN_OFFSET              := 0x28
global SAMP_DIALOG_STYLE_OFFSET             := 0x2C
global SAMP_DIALOG_ID_OFFSET                := 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET          := 0x34
global SAMP_DIALOG_CAPTION_OFFSET           := 0x40
; void CDialog::Show(int nId, int nType, const char* szCaption, const char* szText, const char* szLeftButton, const char* szRightButton, BOOL bServerside)
global FUNC_SAMP_SHOWDIALOG                 := [0x6B9C0, 0x6BA70, 0x6FA50, 0x6FFB0]
; void CDialog::Close(char nProcessButton)
global FUNC_SAMP_CLOSEDIALOG                := [0x6C040, 0x6B2C0, 0x6F2A0, 0x70630]


; ######################### Scoreboard #########################
; void CNetGame::UpdatePlayers()
global FUNC_UPDATESCOREBOARD                := [0x8A10, 0x8A20, 0x8C00, 0x8F10]
; SAMPAPI_VAR CNetGame*& RefNetGame()
global SAMP_INFO_OFFSET                     := [0x21A0F8, 0x21A100, 0x2ACA24, 0x26EB94]
; TODO find out
global ADDR_SAMP_CRASHREPORT                := [0x5CF2C, 0x5D00C, 0x604CC, 0]
global SAMP_PPOOLS_OFFSET                   := [0x3CD, 0x3C5, 0x3DE, 0x3DE]
global SAMP_PPOOL_PLAYER_OFFSET             := [0x18, 0x8, 0x8, 0x4]

global SAMP_SLOCALPLAYERID_OFFSET           := [0x4, 0x0, 0x0, 0x4]
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := [0x1A, 0x16, 0x16, 0x1A]
global SAMP_SZLOCALPLAYERNAME_OFFSET        := [0xA, 0x6, 0x6, 0xA]
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := [0xA, 0x6, 0x6, 0xA]
global SAMP_ILOCALPLAYERPING_OFFSET         := [0x26, 0x2F36, 0x2F36, 0x22]
global SAMP_ILOCALPLAYERSCORE_OFFSET        := [0x2A, 0x2F3A, 0x2F3A, 0x0]

global SAMP_PREMOTEPLAYER_OFFSET            := [0x2E, 0x26, 0x26, 0x1F8A]
; Capacity, not size!
global SAMP_ISTRLENNAME___OFFSET            := [0x1C, 0x24, 0x24, 0x28]
global SAMP_SZPLAYERNAME_OFFSET             := [0xC, 0x14, 0x14, 0x18]
global SAMP_PSZPLAYERNAME_OFFSET            := [0xC, 0x14, 0x14, 0x18]
global SAMP_IPING_OFFSET                    := [0x28, 0x4, 0xC, 0xC]
global SAMP_ISCORE_OFFSET                   := [0x24, 0x0, 0x0, 0x4]
global SAMP_ISNPC_OFFSET                    := [0x4, 0x8, 0x4, 0x8]

global SAMP_PLAYER_MAX                      := 1004


; ######################### Checkpoints #########################
global ADDR_CP_CHECK                        := 0xC7DEEA3
global ADDR_REDMARKER                       := [0xC7DEC8, 0xC7DECC, 0xC7DED0]


; ######################### Sizes #########################
global SIZE_SAMP_CHATMSG                    := 0xFC


; ######################### Internal #########################
global sampVersion							:= 0
global hGTA                                 := 0x0
global dwGTAPID                             := 0x0
global dwSAMP                               := 0x0
global pMemory                              := 0x0
global pParam1                              := 0x0
global pParam2                              := 0x0
global pParam3                              := 0x0
global pParam4                              := 0x0
global pParam5                              := 0x0
global pInjectFunc                          := 0x0
global nZone                                := 1
global nCity                                := 1
global bInitZaC                             := 0
global iRefreshScoreboard                   := 0
global oScoreboardData                      := ""
global iRefreshHandles                      := 0
global iUpdateTick                          := 2500 ;time in ms, used for GetPlayerNameById etc. to refresh data

/**
 * Check if SA:MP is loaded and chat is available
 *
 * @category SAMP
 * @returns `true` if SA:MP is available, `false` otherwise
 */ 
IsSAMPAvailable() {
    if(!checkHandles())
        return false
	
	dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR[sampVersion])
	
	if(dwChatInfo == 0 || dwChatInfo == "ERROR")
	{
		return false
	}
	else
	{
		return true
	}
}

/**
 * Check if the player has their chat open.
 *
 * @category SAMP
 * @returns `true` if chat is open, `false` otherwise
 */
IsInChat() {
    if(!checkHandles())
        return -1
    
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR[sampVersion]
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF[sampVersion]
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}

/**
 * Retrieves the player's name. This is directly read from memory.
 *
 * @category SAMP
 * @returns The player's name as a string, or an empty string on failure
 */
GetPlayerName() {
    if(!checkHandles())
        return ""
    
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME[sampVersion]
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return sUsername
}

/**
 * Retrieves the player's ID. First, the player's name is fetched 
 * using `GetPlayerName()`, and then the ID is obtained using `GetPlayerIdByName()`.
 * In the end, the ID is grabbed from the scoreboard.
 *
 * @category SAMP
 * @returns The player's ID as an integer, or -1 on failure
 */
GetPlayerId() {
    s := GetPlayerName()
    return GetPlayerIdByName(s)
}

/**
 * Send a chat message or command to the server
 *
 * @category SAMP
 * @param wText The text to send (prefix with "/" for commands)
 * @returns `true` if successful, `false` otherwise
 */
SendChat(wText) {
     wText := "" wText
    
    if(!checkHandles())
        return false
    
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD[sampVersion]
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY[sampVersion]
    }
    
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Add a message to chat window (only visible for the local player)
 *
 * @category SAMP
 * @param wText The text to add
 * @returns `true` if successful, `false` otherwise 
 */ 
AddChatMessage(wText) {
    wText := "" wText

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND[sampVersion]
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR[sampVersion])
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Show a game text in the middle of the screen.
 *
 * For more information about text colors, styles and formatting, please refer
 * to [GameText Styles | open.mp](https://open.mp/de/docs/scripting/resources/gametextstyles)
 *
 * @category SAMP
 * @param wText The text to show
 * @param dwTime Time in milliseconds the text should be displayed
 * @param dwTextstyle Text style (0-5)
 * @returns `true` if successful, `false` otherwise
 */
ShowGameText(wText, dwTime, dwTextstyle) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwTextstyle += 0
    dwTextstyle := Floor(dwTextstyle)

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT[sampVersion]
    
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwTextstyle]], false)
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Play an audio stream. Please note that
 * <ul>
 *   <li>your radio will be switched and locked to "User Track Player"</li>
 *   <li>audio can only be heard if your radio volume is not turned all the way down.</li>
 * </ul>
 *
 * @category SAMP
 * @param wUrl The URL of the audio stream to play
 * @returns `true` if successful, `false` otherwise
 */
PlayAudioStream(wUrl) {
    wUrl := "" wUrl
    
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR[sampVersion]
    
    PatchRadio()
    
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    
    UnPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Stops an audio stream.
 * <p>
 * Please note that even after stopping an audio stream, the in-game radio may still be locked
 * to "User Track Player". You can try to fix this by starting and stopping an audio stream consecutively.
 * However, this may not work very consistently and may need multiple iterations
 * in order to get the radio working again. If it still does not work, you can
 * <ul>
 *   <li>try lowering radio volume to 0, then resume your game and try to switch. Rinse and repeat
 *   in combination with stopping and starting audio streams.</li>
 *   <li>restart your game in doubt.</li>
 * </ul>
 * </p>
 *
 * @category SAMP
 * @returns `true` if successful, `false` otherwise
 */
StopAudioStream() {
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR[sampVersion]
    
    PatchRadio()
    
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    
    UnPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * TODO verify
 * Patch the radio functions to disable audio streams
 * This makes methods/functions to play and stop audio streams no-ops.
 *
 * @category SAMP
 * @returns `true` if successful, `false` otherwise
 */
PatchRadio() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR[sampVersion]
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR[sampVersion]
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}

/**
 * TODO verify
 * Patch the radio functions to revert their original behavior.
 *
 * @category SAMP
 * @returns `true` if successful, `false` otherwise
 */
UnPatchRadio() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(old, 4, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR[sampVersion]
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR[sampVersion]
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}

/**
 * Block chat input from the player. The chat can still be opened, but
 * no messages or commands can be sent.
 *
 * @category SAMP
 * @returns `true` if successful, `false` otherwise
 */
BlockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY[sampVersion]
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD[sampVersion]
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

/**
 * Unblock chat input from the player. The player can send messages and
 * commands again.
 *
 * @category SAMP
 * @returns `true` if successful, `false` otherwise
 */
UnBlockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY[sampVersion]
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD[sampVersion]
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

/**
 * Retrieve the server's name which the player is connected to.
 *
 * @category SAMP
 * @returns The server name as a string, or -1 on failure
 */
GetServerName() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion], 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerName := readString(hGTA, dwAdress + ADDR_SAMP_SERVERNAME[sampVersion], 200)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerName
}

/**
 * Retrieve the server's IP which the player is connected to.
 *
 * @category SAMP
 * @returns The server's IP as a string, or -1 on failure
 */
GetServerIp() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion], 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerIP := readString(hGTA, dwAdress + ADDR_SAMP_SERVERIP[sampVersion], 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerIP
}

/**
 * Retrieve the server's port which the player is connected to.
 *
 * @category SAMP
 * @returns The server's port as a integer, or -1 on failure
 */
GetServerPort() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion], 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerPort := readMem(hGTA, dwAdress + ADDR_SAMP_SERVERPORT[sampVersion], 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerPort
}

/**
 * Retrieve the current weather ID.
 *
 * @category SAMP
 * @returns The weather ID as a integer, or -1 on failure
 */
GetWeatherId() {
    if(!checkHandles())
        return -1

    WeatherID := readMem(hGTA, 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return WeatherID
}

/**
 * Retrieve the current weather's name.
 *
 * @category SAMP
 * @returns The weather's name as a string, or empty string on failure
 */
GetWeatherName() {
	id := getWeatherID()  
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}

/**
 * Retrieve the player's health
 *
 * @category Local Player
 * @returns The player's health as an integer or float, or -1 on failure
 */
GetPlayerHealth() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

/**
 * Retrieve the player's armor
 *
 * @category Local Player
 * @returns The player's armor as an integer or float, or -1 on failure
 */
GetPlayerArmor() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

/**
 * Retrieve the player's current interior ID
 *
 * @category Local Player
 * @returns The player's interior ID as an integer, or -1 on failure
 */
GetPlayerInteriorId() {
    if(!checkHandles())
        return -1
    
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return iid
}

/**
 * Retrieve the player's current skin ID
 *
 * @category Local Player
 * @returns The player's skin ID as an integer, or -1 on failure
 */
GetPlayerSkinId() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

/**
 * Retrieve the player's money
 *
 * @category Local Player
 * @returns The player's money as an integer, or -1 on failure
 */
GetPlayerMoney() {
    if(!checkHandles())
        return ""
    
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return "" ; TODO return -1
    }
    
    ErrorLevel := ERROR_OK
    return money
}

/**
 * Retrieve the player's wanted level
 *
 * @category Local Player
 * @returns The player's wanted level as an integer, or -1 on failure
 */
GetPlayerWanteds() {
    if(!checkHandles())
        return -1
 
    dwPtr := 0xB7CD9C ; TODO document meaning of this static address
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    ErrorLevel := ERROR_OK
    return Wanteds
}

/**
 * Retrieve the player's weapon ID
 *
 * @category Local Player
 * @returns The player's weapon ID as an integer, or -1 on failure
 */
GetPlayerWeaponId() {
    if(!checkHandles())
        return 0
    
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte") ; TODO english
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }

   return WaffenId
}

/**
 * Retrieve the player's weapon name
 *
 * @category Local Player
 * @returns The player's weapon name as string, or empty string on failure
 */
GetPlayerWeaponName() {
    id := GetPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}

/**
 * Retrieve the player's state, e.g. on foot, driving, dead, ...
 * <p>
 * See [Player States | open.mp](https://open.mp/en/docs/scripting/resources/playerstates)
 * for available states.
 * </p>
 *
 * @category Local Player
 * @returns (TODO verify) The player's state as an integer, or -1 on failure
 */
GetPlayerState() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return State
}

/**
 * Check if the player has their game paused (i.e., in the `ESC` menu)
 *
 * @category Local Player
 * @returns `true` if the game is paused, `false` otherwise
 */
IsPlayerInMenu() {
    if(!checkHandles())
        return -1
    
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return IsInMenu
}

/**
 * Get the player's X position on map
 *
 * @category Local Player
 * @returns position on X axis as float, or -1 on failure
 */
GetPlayerMapPosX() {
    if(!checkHandles())
        return -1
    
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosX
}

/**
 * Get the player's Y position on map
 *
 * @category Local Player
 * @returns position on Y axis as float, or -1 on failure
 */
GetPlayerMapPosY() {
    if(!checkHandles())
        return -1
    
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosY
}

/**
 * Get the player's map zoom level
 *
 * @category Local Player
 * @returns zoom level as float, or -1 on failure
 */
GetPlayerMapZoom() {
    if(!checkHandles())
        return -1
    
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapZoom
}


/**
 * Check if the player is frozen.
 *
 * @category Local Player
 * @returns `true` if the player is frozen, `false` otherwise
 */
IsPlayerFrozen() {
    if (!checkHandles())
        return -1
    
    IPF := readMem(hGTA, 0x690495, 2, "byte")    
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return IPF
}

/**
 * Check if the player is frozen.
 * <p>
 * While the method's name has a typo ("Freezed" instead of "Frozen"), it is kept
 * for backward compatibility for now.
 * </p>
 *
 * @category Local Player
 * @deprecated Use [`IsPlayerFrozen`](./IsPlayerFrozen) instead.
 * @returns `true` if the player is frozen, `false` otherwise
 */
IsPlayerFreezed() {
    return IsPlayerFrozen()
}

/**
 * Check if the player is in any vehicle.
 *
 * @category Local Player
 * @returns `true` if the player is in a vehicle, `false` otherwise
 */
IsPlayerInAnyVehicle()
{
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return (dwVehPtr > 0)
}

/**
 * Check if the player is the driver of the vehicle they are in.
 *
 * @category Local Player
 * @returns `true` if the player is the driver, `false` otherwise
 */
IsPlayerDriver() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}

/**
 * Retrieves the current health of the player's vehicle.
 *
 * @category Vehicles
 * @returns Numeric vehicle health value. Exact range/units depend on the server/API.
 */
GetVehicleHealth() {
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

/**
 * Determine the vehicle type for the current vehicle.
 *
 * @category Vehicles
 * @returns Integer vehicle type (1=car,2=boat,3=heli,4=truck,5=airplane,6=bike), or `0` on failure
 */
GetVehicleType() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := GetVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := GetVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

/**
 * Retrieve the vehicle model id for the current vehicle.
 *
 * @category Vehicles
 * @returns Model ID as integer, or `0` on failure
 */
GetVehicleModelId() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the model name for the current vehicle.
 *
 * @category Vehicles
 * @returns The vehicle model name as string, or empty string on failure
 */
GetVehicleModelName() {
    id:=GetVehicleModelId()
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

/**
 * Retrieve whether vehicle lights are on for the current vehicle.
 *
 * @category Vehicles
 * @returns `true` if lights are on, `false` otherwise, or `-1` on error
 */
GetVehicleLightState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

/**
 * Retrieve whether the current vehicle's engine is on.
 *
 * @category Vehicles
 * @returns `true` if engine is on, `false` otherwise, or `-1` on error
 */
GetVehicleEngineState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}



/**
 * Retrieve whether the current vehicle is locked.
 *
 * @category Vehicles
 * @returns `true` if locked, `false` otherwise, or `-1` on error
 */
GetVehicleLockState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

/**
 * Retrieve the first color index of the current vehicle.
 *
 * @category Vehicles
 * @returns Color index as integer, or `0` on failure
 */
GetVehicleColor1() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the second color index of the current vehicle.
 *
 * @category Vehicles
 * @returns Color index as integer, or `0` on failure
 */
GetVehicleColor2() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Calculate the current vehicle speed (approx.) for the vehicle the player is in.
 *
 * @category Vehicles
 * @returns Speed as float, or `-1` on failure
 */
GetVehicleSpeed() {
    if(!checkHandles())
        return -1
 
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhht bzw. verringert
 
	return fVehicleSpeed
}

/**
 * Get the current radio station id for player vehicle.
 *
 * @category Vehicles
 * @returns Station id as integer, or `-1` on failure
 */
GetPlayerRadiostationId() {
    if(!checkHandles())
        return -1
    
    if(IsPlayerInAnyVehicle() == 0)
        return -1
    
    RadioStationID := readMem(hGTA, 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return RadioStationID
}

/**
 * Get the current radio station name for the player vehicle.
 *
 * @category Vehicles
 * @returns Station name as string, or empty string on failure
 */
GetPlayerRadiostationName() {
    if(IsPlayerInAnyVehicle() == 0)
        return -1
    
    id := GetPlayerRadiostationID()
    
    if(id == 0)
        return -1
    
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}

/**
 * Retrieve the vehicle number plate for the current vehicle.
 *
 * @category Vehicles
 * @returns The vehicle number plate as string, or empty string on failure
 */
GetVehicleNumberPlate() {
    if(!checkHandles())
        return ""
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel || dwVehPtr==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    vehpool := readDWORD(hGTA, dwAddress + ADDR_SAMP_VEHPOOL[sampVersion])
    if(ErrorLevel || vehpool==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    Loop, 2000
    {
        i := A_Index-1
        
        listed := readDWORD(hGTA, vehpool + 0x3074 + i*4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return ""
        }
        
        if(listed==0)
            continue
        
        svehptr := readDWORD(hGTA, vehpool + 0x4FB4 + i*4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return ""
        }
        
        if(svehptr==dwVehPtr) {
            sampveh := readDWORD(hGTA, vehpool + 0x1134 + i*4)
            if(ErrorLevel || sampveh==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return ""
            }
            
            plate := readString(hGTA, sampveh + 0x93, 32)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return ""
            }
            
            ErrorLevel := ERROR_OK
            return plate
        }
    }
    
    ErrorLevel := ERROR_OK
    return ""
}

/**
 * Get the PED id the player is currently targeting.
 *
 * @category Players
 * @returns PED pointer/id as integer, or `0` on failure
 */
GetTargetPed() {
	if(!checkHandles())
        return 0
	
	dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	if(!dwAddress)
		return 0
		
	dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	
	ErrorLevel := ERROR_OK
	return dwAddress
}

/**
 * Convert world coordinates to screen coordinates.
 *
 * @category Players
 * @param fX X world coordinate
 * @param fY Y world coordinate
 * @param fZ Z world coordinate
 * @returns Array `[screenX, screenY, depth]` on success, or `false` on failure
 */
CalcScreenCoords(fX, fY, fZ) {
	if(!checkHandles())
		return false
	
	dwM := 0xB6FA2C
	
	m_11 := readFloat(hGTA, dwM + 0*4)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	m_12 := readFloat(hGTA, dwM + 1*4)
	m_13 := readFloat(hGTA, dwM + 2*4)
	m_21 := readFloat(hGTA, dwM + 4*4)
	m_22 := readFloat(hGTA, dwM + 5*4)
	m_23 := readFloat(hGTA, dwM + 6*4)
	m_31 := readFloat(hGTA, dwM + 8*4)
	m_32 := readFloat(hGTA, dwM + 9*4)
	m_33 := readFloat(hGTA, dwM + 10*4)
	m_41 := readFloat(hGTA, dwM + 12*4)
	m_42 := readFloat(hGTA, dwM + 13*4)
	m_43 := readFloat(hGTA, dwM + 14*4)
	
	dwLenX := readDWORD(hGTA, 0xC17044)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	dwLenY := readDWORD(hGTA, 0xC17048)
	
	frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
	frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
	frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
	
	fRecip := 1.0/frZ
	frX *= fRecip * dwLenX
	frY *= fRecip * dwLenY
    
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
        return [frX,frY,frZ]
}

/**
 * Get the game PED pointer for a scoreboard player id.
 *
 * @category Players
 * @param dwId Player id (0..)
 * @returns PED pointer (integer) or `0` if not found
 */
GetPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return 0
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
                return oScoreboardData[dwId].PED
        }
        return 0
    }
    
    if(!updateOScoreboardData())
        return 0
    
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
    }
    return 0
}

/**
 * Get the scoreboard player id for a given PED pointer.
 *
 * @category Players
 * @param dwPed PED pointer
 * @returns Player id as integer, or `-1` if not found
 */
GetIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
	if(!dwPed)
		return -1
	
	if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
		For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
				if(o.PED==dwPed)
					return i
            }
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
	For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
			if(o.PED==dwPed)
				return i
        }
    }
    return -1
}

/**
 * Return information about streamed-in players from the scoreboard.
 *
 * @category Players
 * @returns An array/object of streamed player info, or empty string/array on failure
 */
GetStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := GetPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    
    if(!updateOScoreboardData())
        return ""
    
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := GetPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}

/**
 * Call a callback function for every streamed-in player.
 *
 * @category Players
 * @param cfunc Function name to call for each player (receives the player object)
 * @param dist Optional max distance filter (default: large)
 * @returns `true` on success, `false` otherwise
 */
CallFuncForAllStreamedInPlayers(cfunc, dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
        return false
    p := GetStreamedInPlayersInfo()
    if(!p)
        return false
    if(dist<0x7fffffff)
    {
        lpos := GetPlayerCoordinates()
        if(!lpos)
            return false
        For i, o in p
        {
            if(dist>GetDist(lpos,o.POS))
                %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
            %cfunc%(o)
    }
    return true
}

/**
 * Calculate the Euclidean distance between two 3D positions.
 *
 * @category Players
 * @param pos1 First position array `[x,y,z]`
 * @param pos2 Second position array `[x,y,z]`
 * @returns Distance as float, or `0` if inputs invalid
 */
GetDist(pos1, pos2) {
 	if(!pos1 || !pos2)
 		return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}

/**
 * Return the PED pointer of the closest streamed-in player.
 *
 * @category Players
 * @returns PED pointer of closest player, or `-1` on error
 */
GetClosestPlayerPed() {
    dist := 0x7fffffff              ;max int32
    p := GetStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := GetPlayerCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=GetDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := GetPedById(id)
    return PED
}

/**
 * Return the id of the closest streamed-in player.
 *
 * @category Players
 * @returns Player id of closest player, or `-1` on error
 */
GetClosestPlayerId() {
    dist := 0x7fffffff              ;max int32
    p := GetStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := GetPlayerCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=GetDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}

/**
 * Retrieve the current number of online players from current SA:MP server.
 *
 * @category Scoreboard
 * @returns Number of online players as integer, or `-1` on failure
 */
CountOnlinePlayers() {
    if(!checkHandles())
        return -1
    
    dwOnline := readDWORD(hGTA, dwSAMP + SAMP_SCOREBOARD_INFO_PTR[sampVersion])
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return OnlinePlayers
}

/**
 * Get the world coordinates for a given PED pointer. The underlying `CPed` struct
 * is the GTA:SA native struct, so not tied to SA:MP. The position of the rendered
 * ped is a vector of floats, stored at `PED+0x14 -> +0x30 (X), +0x34 (Y), +0x38 (Z)`.
 * For more information, please consult [Memory Addresses (SA) - GTAMods Wiki](https://gtamods.com/wiki/Memory_Addresses_(SA)#General)
 *
 * <p>
 * In SA:MP, if the ped is not streamed in, this function will fail.
 * </p>
 * @category Players
 * @param dwPED PED pointer
 * @returns Array of coordinates `[X, Y, Z]` as floats or empty string on failure
 */
GetPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return ""
    
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

/**
 * Get the target player's position by scoreboard id.
 *
 * @category Players
 * @param dwId Player id
 * @returns Array of coordinates `[X, Y, Z]` as floats or empty string on failure
 */
GetTargetPosById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
			if(oScoreboardData[dwId].HasKey("PED"))
				return GetPedCoordinates(oScoreboardData[dwId].PED)
			if(oScoreboardData[dwId].HasKey("MPOS"))
				return oScoreboardData[dwId].MPOS
		}
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
    {
		if(oScoreboardData[dwId].HasKey("PED"))
			return GetPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
    return ""
}

/**
 * Retrieve the skin id for a target PED pointer.
 *
 * @category Players
 * @param dwPED PED pointer
 * @returns Skin id as integer, or `-1` on failure
 */
GetTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

/**
 * Retrieve the skin id for a player identified by scoreboard id.
 *
 * @category Players
 * @param dwId Player id
 * @returns Skin id as integer, or `-1` on failure
 */
GetTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
        return -1
 
    SkinID := readMem(hGTA, GetPedById(dwId) + ADDR_CPED_SKINIDOFF, 2, "UShort")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

; ##### Vehicles-Funktionen #####
/**
 * Get vehicle pointer for a PED pointer.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Vehicle pointer or `0` if none/failure
 */
GetVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return 0
	if(!checkHandles())
        return 0
	dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

/**
 * Get vehicle pointer for a player id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns Vehicle pointer or `0` if none/failure
 */
GetVehiclePointerById(dwId) {
    if(!dwId)
        return 0
	if(!checkHandles())
        return 0
    
    dwPed_By_Id := GetPedById(dwId)
    
	dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

/**
 * Check whether a given PED pointer is in any vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns `1` if in a vehicle, `0` if not, `-1` on error
 */
IsTargetInAnyVehicleByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwVehiclePointer := GetVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

/**
 * Check whether a player id is in any vehicle.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns `1` if in a vehicle, `0` if not, `-1` on error
 */
IsTargetInAnyVehicleById(dwId) {
    if(!checkHandles())
        return -1
    
    dwPedPointer := GetPedById(dwId)
    dwVehiclePointer := GetVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

/**
 * Retrieve vehicle health for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPed PED pointer
 * @returns Vehicle health (rounded) or `-1` on failure
 */
GetTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := GetVehiclePointerByPed(dwPed)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

/**
 * Retrieve vehicle health for a player's vehicle by id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns Vehicle health (rounded) or `-1` on failure
 */
GetTargetVehicleHealthById(dwId) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := GetVehiclePointerById(dwId)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

/**
 * Determine the vehicle type for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Integer vehicle type (1=car,2=boat,3=heli,4=truck,5=airplane,6=bike), or `0` on failure
 */
GetTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := GetVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := GetVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

/**
 * Determine the vehicle type for a player's vehicle by id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns Integer vehicle type (1=car,2=boat,3=heli,4=truck,5=airplane,6=bike), or `0` on failure
 */
GetTargetVehicleTypeById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := GetVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := GetVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

/**
 * Retrieve the vehicle model id for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Model id as integer, or `0` on failure
 */
GetTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the vehicle model id for a player's vehicle by id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns Model id as integer, or `0` on failure
 */
GetTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the vehicle model name for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Model name string, or empty on failure
 */
GetTargetVehicleModelNameByPed(dwPED) {
    id := GetTargetVehicleModelIdByPed(dwPED)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

/**
 * Retrieve the vehicle model name for a player's vehicle by id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns Model name string, or empty on failure
 */
GetTargetVehicleModelNameById(dwId) {
    id := GetTargetVehicleModelIdById(dwId)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

/**
 * Retrieve whether vehicle lights are on for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns `true` if lights on, `false` otherwise, or `-1` on error
 */
GetTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

/**
 * Retrieve whether vehicle lights are on for a player's vehicle by id.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns `true` if lights on, `false` otherwise, or `-1` on error
 */
GetTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := GetVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

/**
 * Retrieve whether a PED's vehicle is locked.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns `true` if locked, `false` otherwise, or `-1` on error
 */
GetTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

/**
 * Retrieve whether a player's vehicle (by id) is locked.
 *
 * @category Vehicles
 * @param dwId Player id
 * @returns `true` if locked, `false` otherwise, or `-1` on error
 */
GetTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := GetVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

/**
 * Retrieve the first color index for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Color index as integer, or `0` on failure
 */
GetTargetVehicleColor1ByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the first color index for a vehicle by player ID.
 *
 * @category Vehicles
 * @param dwID Player ID
 * @returns Color index as integer, or `0` on failure
 */
GetTargetVehicleColor1ById(dwID) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerById(dwID)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the second color index for a PED's vehicle.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @returns Color index as integer, or `0` on failure
 */
GetTargetVehicleColor2ByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the second color index for a vehicle by player ID.
 *
 * @category Vehicles
 * @param dwID Player ID
 * @returns Color index as integer, or `0` on failure
 */
GetTargetVehicleColor2ById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := GetVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

/**
 * Retrieve the speed of a ped's vehicle.
 * The `speedMultiplier` parameter can be adjusted per server to get more accurate speed values.
 *
 * @category Vehicles
 * @param dwPED PED pointer
 * @param speedMultiplier (float) Optional speed multiplier (default: 1.43)
 * @returns Vehicle speed as float, or `-1` on failure
 */
GetTargetVehicleSpeedByPed(dwPED, speedMultiplier := 1.43) {
    if(!checkHandles())
        return -1
 
    dwAddr := GetVehiclePointerByPed(dwPED)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed := sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * speedMultiplier
 
	return fVehicleSpeed
}

/**
 * Retrieve the speed of a player's vehicle by id.
 * The `speedMultiplier` parameter can be adjusted per server to get more accurate speed values.
 *
 * @category Vehicles
 * @param dwId Player id
 * @param speedMultiplier (float) Optional speed multiplier (default: 1.43)
 * @returns Vehicle speed as float, or `-1` on failure
 */
GetTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
        return -1
 
    dwAddr := GetVehiclePointerById(dwId)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed := sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * speedMultiplier
 
	return fVehicleSpeed
}


/**
 * Get a specific line from the SAMP chat log.
 *
 * @category Chat
 * @param Line Line number from the end (0 = last line)
 * @param Output variable to store the output line (*pass by reference*)
 * @param timestamp Optional boolean to include timestamp (default: `false|0` = no)
 * @param color Optional boolean to include color codes (default: `false|0` = no)
 */
GetChatLine(Line, ByRef Output, timestamp=0, color=0) {
	chatindex := 0
	FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	loop, Parse, file, `n, `r
	{
		if(A_LoopField)
			chatindex := A_Index
	}
	loop, Parse, file, `n, `r
	{
		if(A_Index = chatindex - line){
			output := A_LoopField
			break
		}
	}
	file := ""
	if(!timestamp)
		output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
	if(!color)
		output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
	return
}

/**
 * Patch SA:MP to prevent crash reports from being shown, which should suppress most crashes.
 *
 * While it may work for older SA:MP versions, this method won't likely work on `0.3.7-R5`.
 *
 * @category Utilities
 * @experimental
 * @returns `false` on failure
 */
AntiCrash() {
    If(!checkHandles())
        return false

    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}


/**
 * Returns a pointer to SA:MP dialog struct. This allows you to read
 * information in the currently opened dialog, such as type, text, caption, etc.
 * 
 * <p>
 * Usually, there's no need to use this function directly, as this library exposes
 * higher-level functions to get specific dialog information.
 * </p>
 *
 * @category Dialogs
 * @returns Pointer to dialog struct (DWord) or `false` on failure
 */
GetDialogStructPtr() {
	if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return false
	}

	dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR[sampVersion])
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return dwPointer
}

/**
 * Check whether a dialog is currently open.
 *
 * @category Dialogs
 * @returns `true` if a dialog is open, `false` otherwise
 */
IsDialogOpen() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
	return false

	dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	ErrorLevel := ERROR_OK
	return dwIsOpen ? true : false
}

/**
 * Get the style/type of the currently opened dialog.
 *
 * @category Dialogs
 * @returns Dialog style as integer, or `-1` on failure
 */
GetDialogStyle() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return style
}

/**
 * Get the ID of the currently opened dialog.
 *
 * @category Dialogs
 * @returns Dialog ID as integer, or `-1` on failure
 */
GetDialogId() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return id
}

/**
 * Set the ID of the currently opened dialog.
 *
 * @category Dialogs
 * @param id Dialog ID to set
 * @returns `true` on success, `false` on failure
 */
SetDialogId(id) {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
	if (ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return true
}

/**
 * Get the index of the currently selected dialog line.
 *
 * @category Dialogs
 * @returns Dialog line index as integer (1-based), or `0` on failure
 */
GetDialogIndex() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return 0

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	index := readMem(hGTA, dwPointer + SAMP_DIALOG_INDEX_OFFSET, 1, "Byte")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return index + 1
}

/**
 * Get the caption/title of the currently opened dialog.
 *
 * @category Dialogs
 * @returns Dialog caption as string, or empty string on failure
 */
GetDialogCaption() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	ErrorLevel := ERROR_OK
	return text
}

/**
 * Get the size of the dialog text at the text offset of a dialog struct.
 *
 * @category Dialogs
 * @param dwAddress Offset of the dialog text
 * @returns Size of the dialog text in bytes
 */
GetDialogTextSize(dwAddress) {
	i := 0
	Loop, 4096 {
		i := A_Index - 1
		byte := Memory_ReadByte(hGTA, dwAddress + i)
		if (!byte)
			break
	}

	return i
}

/**
 * Get the text/content of the currently opened dialog.
 *
 * @category Dialogs
 * @returns Dialog text as string, or empty string on failure
 */
GetDialogText() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	text := readString(hGTA, dwPointer, 4096)
	if (ErrorLevel) {
		text := readString(hGTA, dwPointer, GetDialogTextSize(dwPointer))
		if (ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
			return ""
		}
	}

	ErrorLevel := ERROR_OK
	return text
}

/**
 * Get the number of lines in the currently opened dialog.
 *
 * @category Dialogs
 * @returns Number of dialog lines as integer, or `0` on failure
 */
GetDialogLineCount() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return 0

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return count
}

/**
 * Get a specific line from the currently opened dialog.
 *
 * <p>
 * <b>Note:</b> It's currently not tested how this implementation really differs
 * from [`GetDialogLine`](GetDialogLine). It may return different results.
 * As this is suffixed with `__`, it's possible that this function has been considered deprecated.
 * </p>
 *
 * @experimental
 * @category Dialogs
 * @param index Line index (1-based)
 * @returns Dialog line as string, or empty string on failure
 */
GetDialogLine__(index) {
	if (GetDialogLineCount > index)
		return ""

	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
	line := readString(hGTA, dwLineAddress, 128)

	ErrorLevel := ERROR_OK
	return line
}

/**
 * Get a specific line from the currently opened dialog.
 *
 * @category Dialogs
 * @param index Line index (1-based)
 * @returns Dialog line as string, or empty string on failure
 */
GetDialogLine(index) {
	lines := GetDialogLines()
	if (index > lines.Length())
		return ""

	if (GetDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
		index++

	return lines[index]
}

/**
 * Get all lines from the currently opened dialog.
 *
 * @category Dialogs
 * @returns Array of dialog lines, or `-1` on failure
 */
GetDialogLines() {
	text := GetDialogText()
	if (text == "")
		return -1

	lines := StrSplit(text, "`n")
	return lines
}

/**
 * Check whether button 1 is currently selected in the dialog.
 *
 * @category Dialogs
 * @returns `true` if button 1 is selected, `false` otherwise
 */
IsDialogButton1Selected() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	selected := readMem(hGTA, dwPointer + SAMP_DIALOG_BUTTON_HOVERING_OFFSET, 1, "Byte")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return selected
}

/**
 * Get all lines from the currently opened dialog.
 *
 * <p>
 * <b>Note:</b> It's currently not tested how this implementation really differs
 * from [`GetDialogLines`](GetDialogLines). It may return different results.
 * As this is suffixed with `__`, it's possible that this function has been considered deprecated.
 * </p>
 *
 * @experimental
 * @category Dialogs
 * @returns Array of dialog lines, or `-1` on failure
 */
GetDialogLines__() {
	count := GetDialogLineCount()

	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	lines := []
	Loop %count% {
		dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
		lines[A_Index] := readString(hGTA, dwLineAddress, 128)
	}

	ErrorLevel := ERROR_OK
	return lines
}

/**
 * Show a dialog to the player.
 *
 * @category Dialogs
 * @param style Dialog style/type (For a full list of available dialog styles, please consult [Dialog Styles | open.mp](https://open.mp/docs/scripting/resources/dialogstyles))
 * @param caption Dialog caption/title
 * @param text Dialog text/content
 * @param button1 Text for button 1
 * @param button2 Text for button 2 (optional)
 * @param id Dialog ID (optional)
 * @returns `true` on success, `false` on failure
 */
ShowDialog(style, caption, text, button1, button2 := "", id := 1) {
	style += 0
	style := Floor(style)
	id += 0
	id := Floor(id)
	caption := "" caption
	text := "" text
	button1 := "" button1
	button2 := "" button2

	if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
		return false

	if (!checkHandles())
		return false

	dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG[sampVersion]

	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR[sampVersion])
	if (ErrorLevel || !dwAddress) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	writeString(hGTA, pParam5, caption)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam1, text)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam5 + 512, button1)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
	if (ErrorLevel)
		return false

	;mov + 7 * push + call + retn
	dwLen := 5 + 7 * 5 + 5 + 1
	VarSetCapacity(injectData, dwLen, 0)

	NumPut(0xB9, injectData, 0, "UChar")							;0 + 1	;mov ecx
	NumPut(dwAddress, injectData, 1, "UInt")						;1 + 4
	NumPut(0x68, injectData, 5, "UChar")							;5 + 1	;push send
	NumPut(1, injectData, 6, "UInt")								;6 + 4
	NumPut(0x68, injectData, 10, "UChar")							;10 + 1	;push button2
	NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")	;11 + 4
	NumPut(0x68, injectData, 15, "UChar")							;15 + 1	;push button1
	NumPut(pParam5 + 512, injectData, 16, "UInt")					;16 + 4
	NumPut(0x68, injectData, 20, "UChar")							;20 + 1	;push text
	NumPut(pParam1, injectData, 21, "UInt")							;21 + 4
	NumPut(0x68, injectData, 25, "UChar")							;25 + 1	;push caption
	NumPut(pParam5, injectData, 26, "UInt")							;26 + 4
	NumPut(0x68, injectData, 30, "UChar")							;30 + 1	;push style
	NumPut(style, injectData, 31, "UInt")							;31 + 4
	NumPut(0x68, injectData, 35, "UChar")							;35 + 1	;push id
	NumPut(id, injectData, 36, "UInt")								;36 + 4

	NumPut(0xE8, injectData, 40, "UChar")							;40 + 1 ;call
	offset := dwFunc - (pInjectFunc + 45)
	NumPut(offset, injectData, 41, "Int")							;41 + 4
	NumPut(0xC3, injectData, 45, "UChar")							;45 + 1	;retn

	writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)

	return true
}

/**
 * Get player name by player's id. The data is retrieved from the server's scoreboard.
 *
 * @category Scoreboard
 * @param dwId Player id
 * @returns Player name as string, or empty string on failure
 */
GetPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].NAME
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
    return ""
}

/**
 * Get player id by player's name. The data is retrieved from the server's scoreboard.
 *
 * @category Scoreboard
 * @param wName Player name
 * @returns Player id as integer, or `-1` on failure
 */
GetPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
                return i
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
            return i
    }
    return -1
}

/**
 * Get player score by player's id. The data is retrieved from the server's scoreboard.
 *
 * @category Scoreboard
 * @param dwId Player id
 * @returns Player score as string, or empty string on failure
 */
GetPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].SCORE
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
    return ""
}

/**
 * Get player ping by player's id. The data is retrieved from the server's scoreboard.
 *
 * @category Scoreboard
 * @param dwId Player id
 * @returns Player ping as integer, or `-1` on failure
 */
GetPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
        
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].PING
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
    return -1
}

/**
 * Check whether a player is an NPC by player's id. The data is retrieved from the server's scoreboard.
 *
 * @category Scoreboard
 * @param dwId Player id
 * @returns `1` if NPC, `0` if not, or `-1` on failure
 */
IsNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].ISNPC
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
    return -1
}


/**
 * Invoke SA:MP's internal function to update scoreboard data.
 *
 * @category Scoreboard
 * @returns `true` on success, `false` on failure
 */
UpdateScoreboardDataEx() {
    if(!checkHandles())
        return false
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])            ;g_SAMP
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD[sampVersion]
    
    VarSetCapacity(injectData, 11, 0) ;mov + call + retn
    
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

/**
 * Update the local scoreboard data cache. The data is stored in a global object array `oScoreboardData`.
 * Before actually caching, this function calls [`UpdateScoreboardDataEx`](UpdateScoreboardDataEx) in order 
 * to fetch latest scoreboard data first. Then, the local player's data is read and cached, and finally, 
 * all remote players' data.
 *
 * <p>
 * <b>Note</b> 
 * <ul>
 *   <li>This function is automatically called by other scoreboard-related functions when needed.</li>
 *   <li>Most functions that invoke this function check whether the scoreboard data is still fresh by comparing
 *   the current tick count with the last refresh tick count plus an update interval (`iUpdateTick`).</li>
 *   <li>If the logic errors occur during memory reading,<ul><li>the function will return `false`</li><li>eventually, the global error level `ErrorLevel` will be set to `ERROR_READ_MEMORY`</li><li>the global scoreboard data cache may not be complete</li></ul></li>
 * </ul>
 * </p>
 *
 * @category Scoreboard
 * @returns `true` on success, `false` on failure (SA:MP not available, `UpdateScoreboardDataEx` failed, memory read error, etc.)
 */
UpdateOScoreboardData() {
    if(!checkHandles())
        return 0
    
    oScoreboardData := []
    
    if(!UpdateScoreboardDataEx())
        return 0

    iRefreshScoreboard := A_TickCount
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET[sampVersion])
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET[sampVersion])
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET[sampVersion], 2, "Short")    ;sLocalPlayerID
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET[sampVersion], 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET[sampVersion], 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET[sampVersion], 4, "Int")    ;iStrlen_LocalPlayerName
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET[sampVersion], 15)       ;szLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET[sampVersion])        ;pszLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }

    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        dwRemoteplayer := readDWORD(hGTA, dwPlayers + SAMP_PREMOTEPLAYER_OFFSET[sampVersion] + i * 0x4)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        if(dwRemoteplayer==0)
            continue
        
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET[sampVersion], 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }

        
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET[sampVersion], 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET[sampVersion], 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET[sampVersion], 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }

        sUsername := ""
        if (dwTemp >= 0 && dwTemp <= 0x0f) {
            sUsername := readString(hGTA, dwRemoteplayer + SAMP_SZPLAYERNAME_OFFSET[sampVersion], 15)
            if (ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                continue
            }
        } else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET[sampVersion])
            if (ErrorLevel || dwAddress == 0) {
                ErrorLevel := ERROR_READ_MEMORY
                continue
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if (ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                continue
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o

        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + SAMP_REMOTEPLAYERDATA_OFFSET[sampVersion])                ;pPlayerData
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)		;this ever happen?
            continue
        
		dwAddress := readFloat(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_GLOBALPOS[sampVersion])        ;iGlobalMarkerLoaded
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		if(dwAddress)
		{
			ix := readMem(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_GLOBALPOS[sampVersion], 4, "Float")        ;x map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iy := readMem(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_GLOBALPOS[sampVersion] + 0x4, 4, "Float")        ;y map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iz := readMem(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_GLOBALPOS[sampVersion] + 0x8, 4, "Float")        ;z map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			o.MPOS := [ix, iy, iz]
		}
        
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_ACTOR[sampVersion])                ;pSAMP_Actor
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)               ;not streamed in
            continue

        dwPed := readDWORD(hGTA, dwpSAMP_Actor + SAMP_REMOTEPLAYERDATA_PED[sampVersion])              ;pGTA_Ped_
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
            continue

        o.PED := dwPed
		fHP := readFloat(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_HEALTH[sampVersion])
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		fARMOR := readFloat(hGTA, dwRemoteplayerData + SAMP_REMOTEPLAYERDATA_ARMOR[sampVersion])

		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		o.HP := fHP
		o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}

/**
 * Set a checkpoint at the specified coordinates with the given size.
 *
 * @category Checkpoints
 * @param fX X coordinate of the checkpoint as float
 * @param fY Y coordinate of the checkpoint as float
 * @param fZ Z coordinate of the checkpoint as float
 * @param fSize Size of the checkpoint as float
 * @returns `true` on success, `false` on failure
 */
SetCheckpoint(fX, fY, fZ, fSize) {
    if(!checkHandles())
        return false

    dwFunc := dwSAMP + FUNC_SAMP_SETCHECKPOINT[sampVersion]
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR[sampVersion]) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    writeRaw(hGTA, pParam1, &buf, 16)
    dwLen := 31
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(pParam1+12, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam1, injectData, 11, "UInt")
    NumPut(0xE8, injectData, 15, "UChar")
    offset := dwFunc - (pInjectFunc + 20)
    NumPut(offset, injectData, 16, "Int")
    NumPut(0x05C7, injectData, 20, "UShort")
    NumPut(dwAddress+SAMP_CHECKPOINT_ACTIVE[sampVersion], injectData, 22, "UInt")
    NumPut(1, injectData, 26, "UInt")
    NumPut(0xC3, injectData, 30, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Disable the currently active checkpoint.
 *
 * @category Checkpoints
 * @returns `true` on success, `false` on failure
 */
DisableCheckpoint() {
    if(!checkHandles())
        return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR[sampVersion]) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+SAMP_CHECKPOINT_ACTIVE[sampVersion], &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Check whether a map marker currently exists.
 *
 * @category Checkpoints
 * @returns `1` if a marker is created, `0` if not, or `false` on failure
 */
IsMarkerCreated() {
    If(!checkHandles())
        return false
    active := readMem(hGTA, ADDR_CP_CHECK, 1, "byte")
    If(!active)
        return 0
    else return 1
}

/**
 * Get the coordinates of the currently active map marker.
 *
 * @category Checkpoints
 * @returns Array of coordinates `[X, Y, Z]` as floats, or `false` on failure
 */
CoordsFromRedmarker() {
    if(!checkhandles())
        return false
    for i, v in ADDR_REDMARKER
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}

/**
 * Get the player's current coordinates.
 *
 * @category Local Player
 * @returns Array of coordinates `[X, Y, Z]` as floats, or `false` on failure
 */
GetPlayerCoordinates() {
    if(!checkHandles())
        return ""
    
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

/**
 * Get the player's current coordinates. Compared to [`GetPlayerCoordinates`](GetPlayerCoordinates),
 * this function assumes that the passed parameters are references (pass-by-reference). That means
 * that the function updates the passed variables directly.
 *
 * :::note
 *
 * This function works as the same as [`GetPlayerCoordinates`](GetPlayerCoordinates). When in doubt,
 * we recommend using [`GetPlayerCoordinates`](GetPlayerCoordinates) instead.
 *
 * :::
 *
 * @category Local Player
 * @param fX Variable to store X coordinate as float (pass-by-reference)
 * @param fY Variable to store Y coordinate as float (pass-by-reference)
 * @param fZ Variable to store Z coordinate as float (pass-by-reference)
 * @returns `0` on success, `false` on failure
 */
GetPlayerPos(ByRef fX, ByRef fY, ByRef fZ) {
    if(!checkHandles())
        return 0

    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }

    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }

    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }

    ErrorLevel := ERROR_OK
}

/**
 * Calculate the zone name based on the provided coordinates.
 *
 * :::warning[Initialization]
 *
 * The first time this function is called, it initializes the zones and 
 * cities data using [`InitZonesAndCities`](InitZonesAndCities).
 *
 * :::
 *
 * :::warning[Return Value For Unknown Zone]
 *
 * If the zone cannot be determined, the function returns `"Unbekannt"`. It's the German word for <em>Unknown</em>.
 * This return value may change in future versions to more universal English term <em>Unknown</em>.
 *
 * :::
 *
 * @category Location
 * @param posX X coordinate as float
 * @param posY Y coordinate as float
 * @param posZ Z coordinate as float
 * @returns Zone name as string, or `"Unbekannt"` if not found
 */
CalculateZone(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        InitZonesAndCities()
        bInitZaC := 1
    }
        
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unbekannt"
}

/**
 * Calculate the city name based on the provided coordinates. Compared to [`CalculateZone`](CalculateZone),
 * cities define larger areas (actual cities) than zones, which can be smaller parts of cities or rural areas.
 *
 * :::warning[Initialization]
 *
 * The first time this function is called, it initializes the zones and 
 * cities data using [`InitZonesAndCities`](InitZonesAndCities).
 *
 * :::
 *
 * :::warning[Return Value For Unknown City]
 *
 * If the city cannot be determined, the function returns `"Unbekannt"`. It's the German word for <em>Unknown</em>.
 * This return value may change in future versions to more universal English term <em>Unknown</em>.
 *
 * :::
 *
 * @category Location
 * @param posX X coordinate as float
 * @param posY Y coordinate as float
 * @param posZ Z coordinate as float
 * @returns City name as string, or `"Unbekannt"` if not found
 */
CalculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        InitZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unbekannt"
    currentCitySize := 0
    smallestCitySize := 0
    
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    
    if(smallestCity == "Unbekannt") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}

/**
 * Check whether the player is within a certain range of a point in 3D space.
 *
 * @category Local Player
 * @param _posX X coordinate of the point as float
 * @param _posY Y coordinate of the point as float
 * @param _posZ Z coordinate of the point as float
 * @param _posRadius Radius around the point as float
 * @returns `true` if the player is within range, `false` otherwise
 */
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius) {
	GetPlayerPos(posX, posY, posZ)
	X := posX -_posX
	Y := posY -_posY
	Z := posZ -_posZ
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
		return TRUE
	return FALSE
}

/**
 * Check whether the player is within a certain range of a point in 2D space.
 *
 * @category Local Player
 * @param _posX X coordinate of the point as float
 * @param _posY Y coordinate of the point as float
 * @param _posRadius Radius around the point as float
 * @returns `true` if the player is within range, `false` otherwise
 */
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius) {
	GetPlayerPos(posX, posY, posZ)
	X := posX - _posX
	Y := posY - _posY
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
		return TRUE
	return FALSE
}

/**
 * Get the player's current zone name.
 *
 * :::warning[Return Value For Unknown Zone]
 *
 * If the zone cannot be determined, the function returns `"Unbekannt"`. 
 * It's the German word for <em>Unknown</em>. This return value may change in future versions to 
 * more universal English term <em>Unknown</em>.
 *
 * Please refer to [`CalculateZone`](CalculateZone) as its return value is returned here.
 *
 * :::
 *
 * @category Location
 * @returns Zone name as string, or `"Unbekannt"` if not found
 */
GetPlayerZone() {
	aktPos := GetPlayerCoordinates()
	return CalculateZone(aktPos[1], aktPos[2], aktPos[3])
}

/**
 * Get the player's current city name.
 *
 * :::warning[Return Value For Unknown City]
 *
 * If the city cannot be determined, the function returns `"Unbekannt"`. 
 * It's the German word for <em>Unknown</em>. This return value may change in future versions to 
 * more universal English term <em>Unknown</em>.
 *
 * Please refer to [`CalculateCity`](CalculateCity) as its return value is returned here.
 *
 * :::
 *
 * @category Location
 * @returns City name as string, or `"Unbekannt"` if not found
 */
GetPlayerCity() {
	aktPos := GetPlayerCoordinates()
	return CalculateCity(aktPos[1], aktPos[2], aktPos[3])
}

/**
 * Get the color of a player by player's id.
 *
 * @category Scoreboard
 * @param playerId Player id
 * @returns Player color as hexadecimal string (e.g., "FF0000" for red), or "FFFFFF" on failure
 */
GetPlayerColor(playerId) {
    defaultColor = "FFFFFF"

    if (!checkHandles())
        return defaultColor

    playerColor := readDWORD(hGTA, dwSAMP + SAMP_PLAYER_COLOR_OFFSET[sampVersion] + playerId * 4)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return defaultColor
    }

    hexCode := _intToHex(idColor)
    rgbhex := SubStr(_intToHex(idColor), 3, 6)
    if (StrLen(hexCode) = 6){
        rgbhex := "0000" rgbhex
        StringTrimRight, rgbhex, rgbhex, 2
    }
    else if(StrLen(hexCode) = 8){
        rgbhex := "00" rgbhex
        StringTrimRight, rgbhex, rgbhex, 2
    }
    StringUpper, playercolor, rgbhex
    return playercolor
}

_intToHex(int)
{
    CurrentFormat := A_FormatInteger
    SetFormat, integer, hex
    int += 0
    SetFormat, integer, %CurrentFormat%
    return int
}

/**
 * Initialize the zones and cities data.
 *
 * <p>
 * As of right now, there is no way to find out if this function has been already called, thus
 * this function having initialized its default data set. The functions that call this function
 * for the first time will set a global variable `bInitZaC` to `1` in order to avoid multiple
 * initializations. This allows you to check whether the zones and cities data has been initialized.
 * So theoretically, if you want to supply your own zones and cities data
 * <ol>
 *   <li>you can set `bInitZaC` to `1`</li>
 *   <li>then call your own functions to add zones and cities</li>
 * </ol>
 * before calling any function that relies on zones and cities data.
 * </p>
 * <p>
 * Functions that use this function:
 * <ul>
 *   <li>[`CalculateZone`](CalculateZone)</li>
 *   <li>[`CalculateCity`](CalculateCity)</li>
 * </ul>
 * Please note that there may be implicit calls to these functions. In general, the list above
 * may not be exhaustive, and not up-to-date. The best way to find out which functions invoke this
 * function is to search in code!
 * </p>
 *
 * @category Location
 */
InitZonesAndCities() {
    AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
}

/**
 * Add a zone to the zone list.
 * 
 * @category Location
 * @param sName The name of the zone.
 * @param x1 The X coordinate of the first corner.
 * @param y1 The Y coordinate of the first corner.
 * @param z1 The Z coordinate of the first corner.
 * @param x2 The X coordinate of the opposite corner.
 * @param y2 The Y coordinate of the opposite corner.
 * @param z2 The Z coordinate of the opposite corner.
 */
AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}

/**
 * Add a city to the city list.
 * 
 * @category Location
 * @param sName The name of the city.
 * @param x1 The X coordinate of the first corner.
 * @param y1 The Y coordinate of the first corner.
 * @param z1 The Z coordinate of the first corner.
 * @param x2 The X coordinate of the opposite corner.
 * @param y2 The Y coordinate of the opposite corner.
 * @param z2 The Z coordinate of the opposite corner.
 */
AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}

; internal stuff
writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
  if(!hProcess) {
    ErrorLevel := ERROR_INVALID_HANDLE
    return false
  }

  VarSetCapacity(finalvalue,length, 0)
  NumPut(writevalue,finalvalue,0,datatype)
  dwRet :=  DllCall(  "WriteProcessMemory"
              ,"Uint",hProcess
              ,"Uint",address
              ,"Uint",&finalvalue
              ,"Uint",length
              ,"Uint",0)
  if(dwRet == 0) {
    ErrorLevel := ERROR_WRITE_MEMORY
    return false
  }

  ErrorLevel := ERROR_OK
  return true
}

; internal stuff
checkHandles() {
    if (iRefreshHandles + 500 > A_TickCount)
        return true

    if (!refreshGTA() || !refreshSAMP() || !refreshMemory())
        return false

    iRefreshHandles := A_TickCount
    return true
}

; internal stuff
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {                            ; GTA not found
        if(hGTA) {                            ; open handle
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    
    if(!hGTA || (dwGTAPID != newPID)) {        ; changed PID, closed handle
        hGTA := openProcess(newPID)
        if(ErrorLevel) {                    ; openProcess fail
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}

; internal stuff
refreshSAMP() {
    if(dwSAMP)
        return true
    
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
        return false

    versionByte := readMem(hGTA, dwSAMP + 0x1036, 1, "UChar")
    sampVersion := versionByte == 0xD8 ? 1 : (versionByte == 0xA8 ? 2 : (versionByte == 0x78 ? 3 : (versionByte == 0x40 ? 4 : 0)))
    if (!sampVersion)
    	return false

    return true
}

; internal stuff
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
    return true
}

; internal stuff
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}

; internal stuff
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
                        , "UInt", dwRights
                        , "int",  0
                        , "UInt", dwPID
                        , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return hProcess
}

; internal stuff
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CloseHandle"
                        , "Uint", hProcess
                        , "UInt")
    ErrorLevel := ERROR_OK
}

; internal stuff
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwSize = 1024*4                    ; 1024 * sizeof(HMODULE = 4)
    VarSetCapacity(hMods, dwSize)    
    VarSetCapacity(cbNeeded, 4)        ; DWORD = 4
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
                        , "UInt", hProcess
                        , "UInt", &hMods
                        , "UInt", dwSize
                        , "UInt*", cbNeeded
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    
    dwMods := cbNeeded / 4            ; cbNeeded / sizeof(HMDOULE = 4)
    i := 0
    VarSetCapacity(hModule, 4)        ; HMODULE = 4
    VarSetCapacity(sCurModule, 260)    ; MAX_PATH = 260
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
                , "UInt", hProcess
                , "UInt", hModule
                , "Str", sCurModule
                , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}

; internal stuff
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sRead
                        , "UInt", dwLen
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if A_IsUnicode
        return __ansiToUnicode(sRead)
    return sRead
}

; internal stuff
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; float = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}

; internal stuff
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; DWORD = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}

; internal stuff
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  dwLen
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}

; internal stuff
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    sString := wString
    if A_IsUnicode
        sString := __unicodeToAnsi(wString)
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sString
                        , "UInt", StrLen(wString) + 1
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

; internal stuff
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt", pBuffer
                        , "UInt", dwLen
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

/**
 * Read a byte from the specified address in the process memory.
 *
 * @internal
 */
Memory_ReadByte(process_handle, address) {
	VarSetCapacity(value, 1, 0)
	DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
	return, NumGet(value, 0, "Byte")
}

; internal stuff
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    
    i := aParams.MaxIndex()
    
    ;         i * PUSH + CALL + RETN
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
        dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                    return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                    return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

; internal stuff
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualAllocEx"
                        , "UInt", hProcess
                        , "UInt", 0
                        , "UInt", dwSize
                        , "UInt", flAllocationType
                        , "UInt", flProtect
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualFreeEx"
                        , "UInt", hProcess
                        , "UInt", lpAddress
                        , "UInt", dwSize
                        , "UInt", dwFreeType
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CreateRemoteThread"
                        , "UInt", hProcess
                        , "UInt", lpThreadAttributes
                        , "UInt", dwStackSize
                        , "UInt", lpStartAddress
                        , "UInt", lpParameter
                        , "UInt", dwCreationFlags
                        , "UInt", lpThreadId
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "WaitForSingleObject"
                        , "UInt", hThread
                        , "UInt", dwMilliseconds
                        , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
__ansiToUnicode(sString, nLen = 0) {
   If !nLen
   {
      nLen := DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", 0
      , "int",  0)
   }

   VarSetCapacity(wString, nLen * 2)

   DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", &wString
      , "int",  nLen)
      
    return wString
}

; internal stuff
__unicodeToAnsi(wString, nLen = 0) {
   pString := wString + 1 > 65536 ? wString : &wString

   If !nLen
   {
      nLen := DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "Uint", 0
      , "int",  0
      , "Uint", 0
      , "Uint", 0)
   }

   VarSetCapacity(sString, nLen)

   DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "str",  sString
      , "int",  nLen
      , "Uint", 0
      , "Uint", 0)
    return sString
}

/**
 * Recursively prints an array (including nested arrays) up to a specified depth.
 *
 * @category Utilities
 * @param array The array to print.
 * @param depth The maximum depth to recurse into nested arrays (default is 5).
 * @param indentLevel The current indentation level (used for formatting).
 * @return A formatted string representation of the array.
 */
PrintArray(array, depth=5, indentLevel="") {
   for k,v in Array {
      list.= indentLevel "[" k "]"
      if (IsObject(v) && depth>1)
         list.="`n" PrintArray(v, depth-1, indentLevel . "    ")
      Else
         list.=" => " v
      list.="`n"
   }
   return rtrim(list, "`n")
}
