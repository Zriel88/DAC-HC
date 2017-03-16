DAC_Basic_Value = 0;

//Check for HC
if (isNil "mission_AI_controller") then {
    //If not multiplayer, then no HC possible and Server controls AI
    if (!isMultiplayer) then {mission_enable_hc = false; if (isServer) then {mission_AI_controller = true; mission_HC_enabled = false; publicVariable "mission_HC_enabled"};};

    //If no HC, then Server controls AI
    if (count ((allUnits + allDead) select {!isPlayer _x && {(_x isKindOf "HeadlessClient_F")}}) == 0) then {
        if (isServer) then {mission_AI_controller = true; mission_HC_enabled = false; publicVariable "mission_HC_enabled"};
    };

    //If no HC, then HC controls AI
    if (count ((allUnits + allDead) select {!isPlayer _x && {(_x isKindOf "HeadlessClient_F")}}) != 0) then {
        if (local ((allUnits + allDead) select {!isPlayer _x && {(_x isKindOf "HeadlessClient_F")}} select 0)) then {
            mission_AI_controller = true; mission_HC_enabled = true; publicVariable "mission_HC_enabled";
        };
    };
    //Everyone else, no AI_Controller
    if (isNil "mission_AI_controller") then {mission_AI_controller = false;};
};

DAC_Zone 		= compile preprocessFile "\DAC_Source\Scripts\DAC_Init_Zone.sqf";
DAC_Objects		= compile preprocessFile "\DAC_Source\Scripts\DAC_Create_Objects.sqf";
DAC_Activate 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Activate_Zone.sqf";
DAC_Deactivate 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Deactivate_Zone.sqf";
DAC_Weapons 	= compile preprocessFile "\DAC_Source\Scripts\DAC_Change_Weapons.sqf";

DAC_Path = "DAC\";
_scr = [] spawn (compile preprocessFile "\DAC_Source\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};
[] execVM "DAC\DAC_Config_Creator.sqf";
