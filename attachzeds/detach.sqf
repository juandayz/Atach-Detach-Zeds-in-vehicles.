private ["_zbody","_zattached"];
_zbody = _this select 3;
_zattached = _zbody getVariable["zattached",true];
if(_zattached) then {
player addMagazine "equip_rope";
detach _zbody;
systemChat("Freedom");
_zbody setVariable["zattached",false,false];
sleep 15;
systemChat("Zed normalized");
_zbody addEventHandler ["handleDamage", {true}];
};