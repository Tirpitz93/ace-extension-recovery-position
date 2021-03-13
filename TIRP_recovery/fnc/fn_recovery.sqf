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
	[localize "STR_ACE_Recovery_Progress", 5, {true}, {_this call TIRP_Recovery_fnc_RecoveryCallbackSuccess}, {hint "aborted"}, [player, _target], true, false, true] call CBA_fnc_progressBar;

};

