; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Train Army" tab under the "Builder Base" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: ProMac (03-2018)
; Remarks .......: This file is part of MultiBot, previously known as Mybot and ClashGameBot. Copyright 2015-2018
;                  MultiBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
#include-once
#CS - BBase - Team AIO Mod++
Global $g_alblBldBaseStats[4] = ["", "", ""]
Global $g_hChkCollectBuilderBase = 0, $g_hChkStartClockTowerBoost = 0, $g_hChkCTBoostBlderBz = 0, $g_hChkCleanBBYard = 0
Global $g_hChkCollectBldGE = 0, $g_hChkCollectBldGems = 0, $g_hChkActivateClockTower = 0
Global $g_hChkBBSuggestedUpgrades = 0, $g_hChkBBSuggestedUpgradesIgnoreGold = 0 , $g_hChkBBSuggestedUpgradesIgnoreElixir , $g_hChkBBSuggestedUpgradesIgnoreHall = 0
Global $g_hChkPlacingNewBuildings = 0, $g_hChkBBSuggestedUpgradesIgnoreWall = 0
Func CreateMiscBuilderBaseSubTab()
	Local $x = 15, $y = 45
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "Group_05", "Builders Base Stats"), $x - 10, $y - 20, $g_iSizeWGrpTab3, 50)

		_GUICtrlCreatePic($g_sIcnBldGold, $x, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootGoldBB] = GUICtrlCreateLabel("---", $x + 35, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)

		_GUICtrlCreatePic($g_sIcnBldElixir, $x + 140, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootElixirBB] = GUICtrlCreateLabel("---", $x + 175, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)

		_GUICtrlCreatePic($g_sIcnBldTrophy, $x + 280, $y - 2, 24, 24)
		$g_alblBldBaseStats[$eLootTrophyBB] = GUICtrlCreateLabel("---", $x + 315, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$y = 80
	Local $iBBAttackGroupSize = 110

	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "Group_13", "Builders Base Attacking"), $x - 10,  $y, $g_iSizeWGrpTab3, $iBBAttackGroupSize)
		$g_hChkEnableBBAttack = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkEnableBBAttack", "Attack"), $x + 20, $y + 30, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkEnableBBAttack_Info_01", "Uses the currently queued army to attack."))
			GUICtrlSetOnEvent(-1, "chkEnableBBAttack")
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "LblBBNextTroopDelay", "Next Troop Delay"), $x + 113, $y + 17)
		$g_hCmbBBNextTroopDelay = GUICtrlCreateCombo( "", $x+138, $y + 34, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "CmbBBNextTroopDelay_Info_01", "Set the delay between different troops. 1 fastest to 9 slowest."))
			GUICtrlSetOnEvent(-1, "cmbBBNextTroopDelay")
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9")
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlComboBox_SetCurSel($g_hCmbBBNextTroopDelay, 4) ; start in middle
		GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "LblBBSameTroopDelay", "Same Troop Delay"), $x + 113, $y + 63)
		$g_hCmbBBSameTroopDelay = GUICtrlCreateCombo( "", $x+138, $y + 80, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "CmbBBSameTroopDelay_Info_01", "Set the delay between same troops. 1 fastest to 9 slowest."))
			GUICtrlSetOnEvent(-1, "cmbBBSameTroopDelay")
			GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9")
			GUICtrlSetState(-1, $GUI_DISABLE)
			_GUICtrlComboBox_SetCurSel($g_hCmbBBSameTroopDelay, 4) ; start in middle
		$g_hBtnBBDropOrder = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrderAndArmy", "Army / Drop Order"), $x + 10, $y + 62, -1, -1) ; Custom army BB - Team AIO Mod++
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrder_Info", "Set a custom dropping order for your troops."))
			GUICtrlSetBkColor(-1, $COLOR_RED)
			GUICtrlSetOnEvent(-1, "btnBBDropOrder")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hChkBBTrophyRange = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBTrophyRange", "Trophies"), $x + 240, $y + 30)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBTrophyRange_Info_01", "Enable ability to set a trophy range."))
			GUICtrlSetOnEvent(-1, "chkBBTrophyRange")
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hTxtBBTrophyLowerLimit = _GUICtrlCreateInput($g_iTxtBBTrophyLowerLimit, $x + 310, $y + 30, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			

			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBTrophyLimit_Info_01", "If your trophies go below this number then attacking is stopped."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hTxtBBTrophyUpperLimit = _GUICtrlCreateInput($g_iTxtBBTrophyUpperLimit, $x + 360, $y + 30, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			

			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBTrophyLimit_Info_02", "If your trophies go above this number then the bot drops trophies"))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hChkBBAttIfLootAvail = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBAttIfLootAvail", "Only if loot is available"), $x + 240, $y + 55)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBAttIfLootAvail_Info_01", "Only attack if there is loot available."))
			GUICtrlSetState(-1, $GUI_DISABLE)
		$g_hChkBBWaitForMachine = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBWaitForMachine", "Wait For Battle Machine"), $x + 240, $y + 80, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBWaitForMachine_Info_01", "Makes the bot not attack while Machine is down."))
			GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $iOffset = $iBBAttackGroupSize + 5
	Local $x = 15, $y = 100 + $iOffset
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "Group_04", "Collect && Activate"), $x - 10, $y - 20, $g_iSizeWGrpTab3, 85)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnGoldMineL5, $x + 7, $y, 24, 24)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnElixirCollectorL5, $x + 32, $y, 24, 24)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnGemMine, $x + 57, $y, 24, 24)
		$g_hChkCollectBuilderBase = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCollectBuilderBase", "Collect Ressources"), $x + 100, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCollectBuildersBase_Info_01", "Check this to collect Ressources on the Builder Base"))
		$g_hChkCleanBBYard = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCleanBBYard", "Remove Obstacles"), $x + 260, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCleanBBYard_Info_01", "Check this to automatically clear Yard from Trees, Trunks, etc."))
			GUICtrlSetState (-1, $GUI_ENABLE)

	$y += 32
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnClockTower, $x + 32, $y, 24, 24)
		$g_hChkStartClockTowerBoost = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkActivateClockTowerBoost", "Activate Clock Tower Boost"), $x + 100, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkActivateClockTowerBoost_Info_01", "Check this to activate the Clock Tower Boost when it is available.\r\nThis option doesn't use your Gems"))
			GUICtrlSetOnEvent(-1, "chkStartClockTowerBoost")
		$g_hChkCTBoostBlderBz = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCTBoostBlderBz", "only when builder is busy"), $x + 260, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkCTBoostBlderBz_Info_01", "boost only when the builder is busy"))
			GUICtrlSetState (-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 15, $y = 190 + $iOffset
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "Group_06", "Suggested Upgrades"), $x - 10, $y - 20, $g_iSizeWGrpTab3, 233  - ($iOffset))

		_GUICtrlCreatePic($g_sIcnMBisland, $x , $y , 64, 64)
		$g_hChkBBSuggestedUpgrades = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBSuggestedUpgrades", "Suggested Upgrades"), $x + 70, $y + 25, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgrades")
		$g_hChkBBSuggestedUpgradesIgnoreGold = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBSuggestedUpgradesIgnore_01", "Ignore Gold values"), $x + 200, $y + 15, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")
		$g_hChkBBSuggestedUpgradesIgnoreElixir = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBSuggestedUpgradesIgnore_02", "Ignore Elixir values"), $x + 200, $y + 40, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesElixir")
		$g_hChkBBSuggestedUpgradesIgnoreHall = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBSuggestedUpgradesIgnore_03", "Ignore Builder Hall"), $x + 315, $y + 15, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")
		$g_hChkBBSuggestedUpgradesIgnoreWall = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBSuggestedUpgradesIgnore_04", "Ignore Wall"), $x + 315, $y + 40, -1, -1)
			GUICtrlSetOnEvent(-1, "chkActivateBBSuggestedUpgradesGold")

	Local $x = 15, $y = 200 + $iOffset
		$g_hChkPlacingNewBuildings = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkPlacingNewBuildings", "Build 'New' tagged buildings"), $x + 70, $y + 60, -1, -1)
			GUICtrlSetOnEvent(-1, "chkPlacingNewBuildings")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>CreateMiscBuilderBaseSubTab
#CE - BBase - Team AIO Mod++

Global $g_alblBldBaseStats[4] = ["", "", ""]
Global $g_hChkCollectBuilderBase = 0, $g_hChkStartClockTowerBoost = 0, $g_hChkCTBoostBlderBz = 0, $g_hChkCTBoostAtkAvailable = 0
Global $g_hChkCollectBldGE = 0, $g_hChkCollectBldGems = 0, $g_hChkActivateClockTower = 0, $g_hChkCleanBBYard = 0 
Global $g_hBtnBBAtkLogClear = 0,$g_hBtnBBAtkLogCopyClipboard=0

Func CreateMiscBuilderBaseSubTab()
	Local $x = 15, $y = 45

	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "Group_01", "Collect && Activate"), $x - 10, $y - 20, $g_iSizeWGrpTab2, 125)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnGoldMineL5, $x + 7, $y - 5, 24, 24)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnElixirCollectorL5, $x + 32, $y - 5, 24, 24)
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnGemMine, $x + 57, $y - 5, 24, 24)
		$g_hChkCollectBuilderBase = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCollectBuilderBase", "Collect Resources"), $x + 100, $y - 1, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCollectBuilderBase_Info_01", "Check this to collect Resources on the Builder Base"))

	$y += 22
		GUICtrlCreateIcon($g_sLibIconPath, $eIcnClockTower, $x + 32, $y, 24, 24)
		$g_hChkStartClockTowerBoost = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkActivateClockTowerBoost", "Activate Clock Tower Boost"), $x + 100, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkActivateClockTowerBoost_Info_01", "Check this to activate the Clock Tower Boost when it is available.\r\nThis option doesn't use your Gems"))
			GUICtrlSetOnEvent(-1, "chkStartClockTowerBoost")
	$y += 22
		$g_hChkCTBoostBlderBz = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCTBoostBlderBz", "Only when builder is busy"), $x + 100, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCTBoostBlderBz_Info_01", "Boost only when the builder is busy"))
			GUICtrlSetOnEvent(-1, "chkCTBoostBlderBz")
			GUICtrlSetState (-1, $GUI_DISABLE)
		$g_hChkCTBoostAtkAvailable = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCTBoostAtkAvailable", "Only when attack available"), $x + 260, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCTBoostAtkAvailable_Info_01", "Boost only when attack available"))
			GUICtrlSetOnEvent(-1, "chkCTBoostAtkAvailable")
			GUICtrlSetState (-1, $GUI_DISABLE)
	$y += 28
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnTree, $x + 20, $y, 24, 24)
		_GUICtrlCreateIcon($g_sLibIconPath, $eIcnBark, $x + 45, $y, 24, 24)
		$g_hChkCleanBBYard = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCleanBBYard", "Remove Obstacles"), $x + 100, $y + 4, -1, -1)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "ChkCleanYardBB_Info_01", "Check this to automatically clear Yard from Trees, Trunks etc. from Builder base."))
			;GUICtrlSetOnEvent(-1, "ChkCleanBBYard")
			GUICtrlSetState(-1, $GUI_UNCHECKED)

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$y += 57

	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "Group_02", "Builders Base Stats"), $x - 10, $y - 20, $g_iSizeWGrpTab2, 275)
		$y += 5
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnBBGold, $x , $y, 16, 16)
		$g_alblBldBaseStats[$eLootGoldBB] = GUICtrlCreateLabel("---", $x + 35, $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
		$y += 30
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnBBElixir, $x , $y, 16, 16)
		$g_alblBldBaseStats[$eLootElixirBB] = GUICtrlCreateLabel("---", $x + 35 , $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
		$y += 30
		_GUICtrlCreateIcon($g_sLibBBIconPath, $eIcnBBTrophies, $x , $y, 16, 16)
		$g_alblBldBaseStats[$eLootTrophyBB] = GUICtrlCreateLabel("---", $x + 35 , $y + 2, 100, -1)
			GUICtrlSetFont(-1, 9, $FW_BOLD, Default, "Arial", $CLEARTYPE_QUALITY)
		
		$y += 160

		$g_hBtnBBAtkLogClear = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "BtnBBAtkLogClear", "Clear Atk. Log"), $x + 245, $y - 1, 80, 23)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "BtnBBAtkLogClear_Info_01", "Use this to clear the Attack Log."))
			GUICtrlSetOnEvent(-1, "btnBBAtkLogClear")

		$g_hBtnBBAtkLogCopyClipboard = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "BtnBBAtkLogCopyClipboard", "Copy to Clipboard"), $x + 325, $y - 1, 100, 23)
			_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Builder Base - Misc", "BtnBBAtkLogCopyClipboard_Info_01", "Use this to copy the Attack Log to the Clipboard (CTRL+C)"))
			GUICtrlSetOnEvent(-1, "btnBBAtkLogCopyClipboard")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

EndFunc   ;==>CreateMiscBuilderBaseSubTab
