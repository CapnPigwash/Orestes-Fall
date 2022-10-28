 _Spawner = _this select 0;

if ((!isServer) and hasInterface) exitwith {};

_Spawner setvariable ["Dead",0];

_ZombieArray =  ["Max_xeno"];

_Team = east;
_DelayBetweenEachZombie = 0.5;
_HordeSize = 4;
_HordesToSpawn = 1;
_Density = 30;

_CurrentAmount = 0;
_HordesSpawned = 0;

sleep 1;

while {true} do
{
	if (_HordesSpawned >= _HordesToSpawn) exitwith {};
	_ZombiesKilled = (_Spawner getvariable ["dead",0]);

	if (_CurrentAmount <= _ZombiesKilled) then
	{
		_grp = creategroup _Team;
		
		sleep 1;
		if !(isnull _grp) then
		{
			_HordesSpawned = _HordesSpawned + 1;

			for "_x" from 1 to _HordeSize do
			{
				_RandomUnit = selectRandom _ZombieArray;
				sleep _DelayBetweenEachZombie;
				format ["%1",_RandomUnit] createunit [getposATL _Spawner, _grp, "this setvariable ['not_acid_effects',true]; this setdamage 0.55;  if (isserver) then {this setposATL [(getposATL this select 0) + random _density - random _density, (getposATL this select 1) + random _density - random _density, (getPosATL this select 2)]; if (alive this) then {_CurrentAmount = _CurrentAmount + 1; this setvariable ['_Spawner',_Spawner]; this addEventHandler ['Killed', {_amountdead = ((_this select 0) getvariable ['_Spawner',objNull]) getvariable ['Dead',0]; ((_this select 0) getvariable ['_Spawner',objNull]) setvariable ['Dead',_amountdead + 1];}];};};"];
			};
		};
	} else
	{
		sleep 1;
	};
	
};