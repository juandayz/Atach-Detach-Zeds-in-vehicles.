private ["_zbody","_ppos","_zombies","_zombie","_random","_count"];

area = 2;
_ppos = getPos player;
_zombies = _ppos nearEntities ["zZombie_Base",area];
_count = count _zombies;
for "_i" from 0 to (_count -1) do {
            _zombie = _zombies select _i;			
             detach _zombie;
			_random = round(random(3));
		switch (_random) do { 
		case 0 :{
       	_zombie setpos [(_ppos select 0) + 2, (_ppos select 1)+2,0];
        };
        case 1 :{
        _zombie setpos [(_ppos select 0) + 1, (_ppos select 1)+2,0];
        };
        case 2 :{
        _zombie setpos [(_ppos select 0) + 2, (_ppos select 1)+1,0]; 
        };
        case 3 :{
        _zombie setpos [(_ppos select 0) + 3, (_ppos select 1)+1,0];   
        };
        case 4 :{
         _zombie setpos [(_ppos select 0) + 1, (_ppos select 1)+3,0]; 
        };
		};
		
			_zombie setVariable["zattached",false,false]; 
			systemChat("Zed release");           
        };