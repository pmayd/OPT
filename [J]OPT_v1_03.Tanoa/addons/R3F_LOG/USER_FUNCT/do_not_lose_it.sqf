
private ["_objet", "_pos_respawn"];

_objet = _this select 0;
_pos_respawn = if (count _this > 1) then {_this select 1} else {"spawn_pos"};

if (!isNull _objet) then
{
	waitUntil {!isNil "R3F_LOG_active"};
	
	if (R3F_LOG_active) then
	{
		_objet addEventHandler ["HandleDamage", {0}];
		
		if (isServer) then
		{
			// Attendre le mutex
			waitUntil
			{
				if (R3F_LOG_mutex_local_verrou) then
				{
					false
				}
				else
				{
					R3F_LOG_mutex_local_verrou = true;
					true
				}
			};
			
			R3F_LOG_liste_objets_a_proteger pushBack _objet;
			
			R3F_LOG_mutex_local_verrou = false;
			
			if (_pos_respawn == "spawn_pos" || _pos_respawn == "exact_spawn_pos") then
			{
				_objet setVariable ["R3F_LOG_pos_respawn", getPosASL _objet, false];
				
				if (_pos_respawn == "exact_spawn_pos") then
				{
					_objet setVariable ["R3F_LOG_dir_respawn", getDir _objet, false];
				};
			}
			else
			{
				_objet setVariable ["R3F_LOG_pos_respawn", _pos_respawn, false];
			};
		};
	};
};