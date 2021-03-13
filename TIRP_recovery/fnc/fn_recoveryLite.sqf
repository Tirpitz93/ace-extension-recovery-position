/*
Author: Tirpitz
Fires on each frame while key is pressed. keep it fast.



*/

_multiplier = missionNamespace getVariable ["TIRP_Ace_Recovery_Multiplier",2];
_multiplierlite = missionNamespace getVariable ["TIRP_Ace_RecoveryLite_Multiplier",1.5];
//check if valid casualty is nearby
_target=  nearestObject [player, "man"];

if ({_target getVariable ["ace_isunconscious", false]}&& {_target getVariable ["TIRP_ace_recovery_status",0] == 0}) then { //nearest man is unconcious, and has not been rolled or put into recovery position.
    _timeLeft = _target getVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",0];

    _target setVariable ["ace_medical_statemachine_cardiacArrestTimeLeft",_multiplierlite * _timeLeft];
    hintSilent format ["%1 Rolled onto stomach.", name _target];
    _target setVariable ["TIRP_ace_recovery_status",1];
}



//check player velocity.
//roll patient over

