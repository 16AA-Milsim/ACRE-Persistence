class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACRE_Interact {
                class RadioSettings {
                    displayName = "Radio Settings";
                    class Instructions {
                        displayName = "Instructions";
                        condition = "true";
                        statement = "call acre_api_fnc_openRadioSettings";
                    };
                    class showSavedRadios {
                        displayName = "Show Saved Radio Settings";
                        condition = "true";
                        statement = "call acre_api_fnc_showSavedRadios";
                    };
                    class restoreRadioSettings 
                    {
                        displayName = "<t color='#98d7ff'>Restore Radio Settings</t>";
                        class confirmRestoreRadioSettings 
                        {
                            displayName = "<t color='#98d7ff'>Confirm</t>";
                            condition = "true";
                            statement = "call acre_api_fnc_restoreRadioSettings";
                        };
                    };
                    class saveRadioSettings 
                    {
                        displayName = "<t color='#ffa4a4'>Save Radio Settings</t>";
                        class confirmSaveRadioSettings 
                        {
                            displayName = "<t color='#ffa4a4'>Confirm</t>";
                            condition = "true";
                            statement = "call acre_api_fnc_saveRadioSettings";
                        };
                    };
                };
            };
        };
    };
};
