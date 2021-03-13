/*
 Author: Tirpitz
 Loads CBA settings and initialized recovery actions.

*/
#include "\a3\ui_f\hpp\definedikcodes.inc"
//CAB Settings
// SLIDER --- extra arguments: [_min, _max, _default, _trailingDecimals]
["TIRP_Ace_Recovery_Multiplier", "SLIDER",   ["Recovery position Multiplier",   "What factor the bleedout timer should be multplied with when patient is placed into recovery postion."], localize "STR_ACE_Recovery_Mod_name", [1, 10, 5, 2]] call cba_settings_fnc_init;


["TIRP_Ace_RecoveryLite_Multiplier", "SLIDER",   ["Stomach flip multiplier",   "What factor the bleedout timer should be multplied with when patient is rolled onto stomach."], localize "STR_ACE_Recovery_Mod_name", [1, 10, 5, 2]] call cba_settings_fnc_init;


/* CBA Keybinds ======================= */
[localize "STR_ACE_Recovery_Mod_name", "TIRP_ACE_Recovery", [localize "STR_ACE_Recovery_key_short", localize "STR_ACE_Recovery_key_long"], { }, { [player] spawn Tirp_recovery_fnc_recovery; }, [DIK_BACKSLASH, [false, false, false]]] call cba_fnc_addKeybind;

[localize "STR_ACE_Recovery_Mod_name", "TIRP_ACE_RecoveryLite", [localize "STR_ACE_RecoveryLite_key_short", localize "STR_ACE_RecoveryLite_key_long"], { }, { [player] spawn Tirp_recovery_fnc_recoveryLite; }, [DIK_BACKSLASH, [false, false, false]], True ] call cba_fnc_addKeybind;


_unconciousEH= ["ace_unconscious", {_this call TIRP_recovery_fnc_UnconciousEH}] call CBA_fnc_addEventHandler;