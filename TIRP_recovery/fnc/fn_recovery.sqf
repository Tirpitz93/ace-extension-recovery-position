// check target is valid
//check target is in a valid animation and not already in recovery
//check if another player is already doing another action
//start rolling patient

_multiplier = missionNamespace getVariable ["TIRP_Ace_Recovery_Multiplier",2];
_multiplierlite = missionNamespace getVariable ["TIRP_Ace_RecoveryLite_Multiplier",1.5];
_target= cursortarget;

if ((_target getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",0]) >0&& {_target getVariable ["TIRP_ace_recovery_status",0] <=1}) then {
_timeLeft = _target getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",0];
_target switchMove "AinjPpneMstpSnonWnonDnon_rolltofront";
player switchMove "AinvPknlMstpSnonWnonDnon_medic4";
[localize "STR_ACE_Recovery_Progress", 5, {true}, {hint format [localize "STR_ACE_Recovery", cursorTarget]}, {hint "aborted"}, [player, _target], true, false, true] call CBA_fnc_progressBar;
_target switchMove "";
if ((_target getVariable ["TIRP_ace_recovery_status",0]) == 0) then { //make sure that multipliers dont stack if patient was first rolled over.
_target setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",_multiplier * _timeLeft];}
else {
_target setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",(_multiplier/_multiplierlite) * _timeLeft];};

hintSilent format ["%1 Placed into recovery position", name _target];
_target setVariable ["TIRP_ace_recovery_status",2];
[_target, "activity", localize "STR_ACE_Recovery", [[player, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;
[_target, "activity_view", localize "STR_ACE_Recovery", [[player, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;

};

