params ["_player","_target"];

if ((_target getVariable ["TIRP_ace_recovery_status",0]) == 0) then { //make sure that multipliers dont stack if patient was first rolled over.
_target setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",_multiplier * _timeLeft];}
else {
_target setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",(_multiplier/_multiplierlite) * _timeLeft];};
hintSilent format ["%1 Placed into recovery position", name _target];
_target setVariable ["TIRP_ace_recovery_status",2];
[_target, "activity", localize "STR_ACE_Recovery", [[player, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;
[_target, "activity_view", localize "STR_ACE_Recovery", [[player, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;