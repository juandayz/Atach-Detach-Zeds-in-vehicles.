private ["_zbody","_objects","_allowedVehicles","_zattached"];
_zbody = _this select 3;
_zattached = _zbody getVariable["zattached",false];
_objects = nearestObjects [getPos player, _allowedVehicles, 10];
_objects = _objects select 0;


_allowedVehicles = [
"hilux1_civil_3_open_DZE",
"datsun1_civil_3_open_DZE",
"hilux1_civil_1_open_DZE",
"datsun1_civil_1_open_DZE",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1",
"KamazOpen_DZE"
];
if(_zattached) exitWith {systemchat "you cannot do it";};
if ((player distance _objects > 10) or (_zbody distance _objects > 10))  exitWith {systemchat "to farway from the vehicle";};

_zbody attachTo [_objects, [0, -1.5, -1]];
player removeMagazine "equip_rope";
_zbody addEventHandler ["handleDamage", {false}];
[objNull, _zbody, rSwitchMove,""] call RE;
_zbody setVariable["zattached",true,true];		
systemChat("Zed tied up");
	
