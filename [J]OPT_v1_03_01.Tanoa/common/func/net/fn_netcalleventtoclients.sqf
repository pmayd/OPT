// does send a normal publicVariable to all clients from server
// ["eventname", var or array with vars]
// prevents that netrun is also running on the server

x_nstc = _this;
publicVariable "x_nstc";
if (isServer && {!isDedicated}) then {
	_this call tcb_fnc_NetRunEventToClients;
};