/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/

opt_nato_flags_pos = [
    [5488, 6935, west], // sektor 1 - arudy kirche
    [5617, 7043, west], // sektor 1 - arudy transformatoren
    [5538, 6982, west], // sektor 1 - arudy center
    [6572, 6059, west], // sektor 2 - Guran
    [7154, 6056, west], // sektor 2 - Houdan
    [7420, 6250, west], // sektor 2 - Houdan Farm
    [4553, 8082, west], // sektor 3 - Saint Jean
    [3540, 8498, west], // sektor 3 - Goisse
    [4669, 7381, west]  // sektor 3 - Saint Jean Farm

];

opt_csat_flags_pos = [
    [7544, 7834, east], // sektor 4 - La Trinite Farm
    [7242, 7930, east], // sektor 4 - La Trinite Center
    [7083, 8019, east], // sektor 4 - La Trinite Kirche
    [6010, 8572, east], // sektor 5 - Larche Center
    [5882, 8697, east], // sektor 5 - Larche Farm
    [6084, 8940, east], // sektor 5 - Larche Industrie
    [4997, 9494, east], // sektor 6 - Mont Chauve Kirche
    [5085, 9070, east], // sektor 6 - Tanke
    [5141, 9291, east]  // sektor 6 - Berg

];

// erzeuge für alle oben gelisteten Positionen einen Flaggenmast mit korrekter Flagge
if (isServer) then {
    {
        params ["_x", "_y", "_owner"];

        // Objekt erzeugen
        private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
        _flag setFlagTexture "\A3\Data_F\Flags\Flag_NATO_CO.paa";

        // notwendige Variablen fuer OPT
        _flag setVariable ["owner", _owner, true];        
        _flag setVariable ["opt_flag", true, true];
    } forEach opt_nato_flags_pos;

    {
        params ["_x", "_y", "_owner"];
        
        // Objekt erzeugen
        private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
        _flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

        // notwendige Variablen fuer OPT
        _flag setVariable ["owner", _owner, true];
        _flag setVariable ["opt_flag", true, true];
    } forEach opt_csat_flags_pos;

};
