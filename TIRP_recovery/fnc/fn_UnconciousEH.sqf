params ["_unit","_unconcious"];


//reset the recovery position status to 0 each time the unconcious state changes.
_unit setVariable ["TIRP_ace_recovery_status",0];
