class CBAP {

    class AI {
        file = "Functions\CBA\AI";
        class addWaypoint {};
        class clearWaypoints {};
        class taskDefend {};
        class taskPatrol {};
    };

    class PFH {
        file = "Functions\CBA\PFH";
        class directCall {};
        class pfhPreInit { preInit = 1; };
        class addPerFrameHandler {};
        class removePerFrameHandler {};
        class execNextFrame {};
        class waitAndExecute {};
        class waitUntilAndExecute {};
        class pfhPostInit { postInit = 1; };
	};

    class Common {
        file = "Functions\CBA\Common";
        class createNamespace {};
        class formatNumber {};
        class getGroup {};
        class getPos {};
        class getTurret {};
    };

	class Hashes {
	    file = "Functions\CBA\Hashes";
        class hashCreate {};
	    class hashGet {};
	    class hashSet {};
	};

    class Events {
        file = "Functions\CBA\Events";

        class addEventHandler { description = "Registers an event handler for a specific CBA event."; };
        class addEventHandlerArgs { description = "Registers an event handler for a specific CBA event with arguments."; };
        class removeEventHandler { description = "Removes an event handler previously registered with CBAP_fnc_addEventHandler."; };
        class localEvent { description = "Raises a CBA event on the local machine."; };
        class globalEvent { description = "Raises a CBA event on all machines, including the local one."; };
        class globalEventJIP { description = "Raises a CBA event on all machines. Event is put on a stack that is executed on every future JIP machine. Stack can be overwritten by using the same JIP-Stack-ID."; };
        class removeGlobalEventJIP { description = "Removes a globalEventJIP ID. Optionaly will wait until an object is deleted."; };
        class serverEvent { description = "Raises a CBA event on the server machine."; };
        class remoteEvent { description = "Raises a CBA event on all machines, except the local one."; };
        class targetEvent { description = "Raises a CBA event on all machines where this object or at least one of these objects are local."; };
        class ownerEvent { description = "Raises a CBA event on the target client ID's machine."; };
        class preInit { preInit=1; };
        class postInit { postInit=1; };
    };
};
