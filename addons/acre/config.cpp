#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"l6AA_main", "acre_main", "acre_ace_interact", "CBA_settings"};
        authors[] = {"Darojax, KrippeJaevel, Mildly_Interested, 3Mydlo3"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        author = "16 Air Assault Milsim Community"; // primary author name, either yours or your team's, considered for the whole mod
        VERSION_CONFIG;
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
