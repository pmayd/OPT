// does not execute code on the client, Client To Server
// sends parameters only to the server
// ["eventname", var or array with vars]

if (isServer) then { // for hosted and HC environment
	_this call tcb_fnc_NetRunEventCTS;
} else {
	x_ncts = _this;
	publicVariableServer "x_ncts";
};