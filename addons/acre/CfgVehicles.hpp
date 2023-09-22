class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACRE_Interact {
                class RadioSettings {
                    displayName = "Radio Settings";
                    class showSavedRadioSettings {
                        displayName = "Show Saved Radio Settings";
                        condition = "true";
                        statement = QUOTE(call FUNC(showSavedRadioSettings));
                    };
                    class restoreRadioSettings
                    {
                        displayName = "<t color='#98d7ff'>Restore Radio Settings</t>";
                        class confirmRestoreRadioSettings
                        {
                            displayName = "<t color='#98d7ff'>Confirm</t>";
                            condition = "true";
                            statement = QUOTE(call FUNC(restoreRadioSettings));
                        };
                    };
                    class saveRadioSettings
                    {
                        displayName = "<t color='#ffa4a4'>Save Radio Settings</t>";
                        class confirmSaveRadioSettings
                        {
                            displayName = "<t color='#ffa4a4'>Confirm</t>";
                            condition = "true";
                            statement = QUOTE(call FUNC(saveRadioSettings));
                        };
                    };
                };
            };
        };
    };
};
