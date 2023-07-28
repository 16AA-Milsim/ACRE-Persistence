#include "script_component.hpp"

// information on this addon specifically
class CfgPatches {
    class ADDON {
        name = "ACRE";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"l6AA_main"};
        authors[] = {"Frederiksen", "Karlsson", "Mueller"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        author = "16 Air Assault Milsim Community"; // primary author name, either yours or your team's, considered for the whole mod
        VERSION_CONFIG;
    };
};

// configs go here
#include "CfgEventHandlers.hpp"
