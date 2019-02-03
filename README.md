# Atach-Detach-Zeds-in-vehicles.

PLEASE DONATE: https://github.com/juandayz/Atach-Detach-Zeds-in-vehicles./blob/master/DONATION.md

Allow players to attach zombies in open vehicles class. They can detach from into vehicles too.

To attach players gonna need an "equipe_rope" in inventory. 

Be near of a vehicle type in this list

_allowedVehicles = [
"hilux1_civil_3_open_DZE",
"datsun1_civil_3_open_DZE",
"hilux1_civil_1_open_DZE",
"datsun1_civil_1_open_DZE",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1",
"KamazOpen_DZE"
];

Aim to a zed to get the option "attachZed"

*When players detach zeds, they (zeds) comes with 15seconds of godmode. and while they are attached have a godmode.

*Vehicles in _allowedVehicles have the option to release zeds from inside. 

INSTALL:

1-Drop attachzeds folder into mpmissions\yourinstance\

2-go to your custom fn_selfactions.sqf

A-find:
```ruby
//Towing with tow truck
	/*
	if(_typeOfCursorTarget == "TOW_DZE") then {
		if (s_player_towing < 0) then {
			if(!(_cursorTarget getVariable ["DZEinTow", false])) then {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_ATTACH" "\z\addons\dayz_code\actions\tow_AttachStraps.sqf",_cursorTarget, 0, false, true];				
			} else {
				s_player_towing = player addAction [localize "STR_EPOCH_ACTIONS_DETACH", "\z\addons\dayz_code\actions\tow_DetachStraps.sqf",_cursorTarget, 0, false, true];				
			};
		};
	} else {
		player removeAction s_player_towing;
		s_player_towing = -1;
	};
	*/
  ```
  paste below:
  ```ruby
  if (_isAlive && {(_cursorTarget isKindOf "zZombie_base")}) then {
_zattached = _cursorTarget getVariable["zattached",false];
if (!_zattached) then {
if ("equip_rope" in magazines player) then {

if (s_player_zhide4 < 0) then {
s_player_zhide4 = player addAction [format["<t color='#0096ff'>TieUp Zed</t>"], "attachzeds\attach.sqf",_cursorTarget,0, false,true];
};
} else {
player removeAction s_player_zhide4;
s_player_zhide4 = -1;	
};	
};

if (_zattached) then {
if (s_player_zhide5 < 0) then {
s_player_zhide5 = player addAction [format["<t color='#0096ff'>detach zed</t>"], "attachzeds\detach.sqf",_cursorTarget,0, true,true];
};
} else {
player removeAction s_player_zhide5;
s_player_zhide5 = -1;	
};
};
```

B-find:
```ruby
} else {
	//Engineering
```
below add
```ruby
player removeAction s_player_zhide5;
s_player_zhide5 = -1;
player removeAction s_player_zhide4;
s_player_zhide4 = -1;
```
C-find:
```ruby
//Grab Flare
if (_canPickLight && !dayz_hasLight && !_isPZombie) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};
```
below paste:
```ruby
_allowedVehiclesA = typeOf _vehicle in[
"hilux1_civil_3_open_DZE",
"datsun1_civil_3_open_DZE",
"hilux1_civil_1_open_DZE",
"datsun1_civil_1_open_DZE",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1",
"KamazOpen_DZE"
];


if (_inVehicle && _allowedVehiclesA && (driver _vehicle == player)) then {
        dayz_addrelease = _vehicle;
    if (s_player_zedsr < 0) then {
        s_player_zedsr = dayz_addrelease addAction ["Release Zeds","attachzeds\detach_from_veh.sqf",dayz_addrelease,2,false,true,"",""];
        };
    } else {
        dayz_addrelease removeAction s_player_zedsr;
        s_player_zedsr = -1;
    };
```
3-in a custom variables.sqf 
find:
```ruby
dayz_resetSelfActions = {
```
below add:
```
s_player_zhide4 = -1;
s_player_zhide5 = -1;
s_player_zedsr = -1;
```
