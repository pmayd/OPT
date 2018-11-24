private _bewaffnungpreis=0;
if (_side == civilian) then 
    {
    //Box7 füllen
    private _index = lbAdd [10016,format ["Datalink $%1",GVAR(PreisDatalink)]];    
    _index = lbAdd [10016,"Leer"];    
    ctrlSetText [10043, "Datalink"];
    }
else
    {
    if (_side == west) then 
            {    
                for "_i" from 1 to count GVAR(Raktenheliwest) do
                {
                    {
                        if (((GVAR(Raktenheliwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Raktenheliwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunheliwest) do
                {
                    {
                        if (((GVAR(Gunheliwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunheliwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunvehwest) do
                {
                    {
                        if (((GVAR(Gunvehwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunvehwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };    
            }
        else
            {    
                for "_i" from 1 to count GVAR(Raktenhelieast) do
                {
                    {
                        if (((GVAR(Raktenhelieast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Raktenhelieast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunhelieast) do
                {
                    {
                        if (((GVAR(Gunhelieast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunhelieast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunveheast) do
                {
                    {
                        if (((GVAR(Gunveheast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunveheast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
            };