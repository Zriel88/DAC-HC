class CfgPatches
{
	class DAC_Source
	{
		units[]={};
		weapons[]={};
      	name = "DAC_Source.pbo";
		mail = "silola@freenet.de";
		requiredAddons[]=	{
								"A3_Data_F","A3_Misc_F","A3_Structures_F","A3_Plants_F_Bush","A3_Roads_F","A3_Rocks_F","A3_Signs_F",
								"A3_Soft_F","A3_Structures_F_Wrecks","A3_Structures_F_Mil","A3_Structures_F_Ind","A3_Structures_F_Households"
							};
		requiredVersion=0.1;
		versionStr = "3.1";
		versionAr[] = {3,1};
		author = "Silola";
	};
};

class CfgVehicleClasses
{
	class DAC_Source		{displayName = "DAC";};
	class DAC_EUPlants		{displayName = "DAC: EU-Plants";};
	class DAC_EURocks		{displayName = "DAC: EU-Rocks";};
};

class CfgVehicles
{
	class Logic;
	class DAC_Source_Intern : Logic {
	displayName = "DAC_Intern";vehicleClass = "DAC_Source";
	class EventHandlers {Init = "_this execVM ""\DAC_Source\Init_Intern.sqf"" ";};
	};
	class DAC_Source_Extern : Logic {
	displayName = "DAC_Extern";vehicleClass = "DAC_Source";
	class EventHandlers {Init = "_this execVM ""\DAC_Source\Init_Extern.sqf"" ";};
	};
	#include <eu.hpp>
};
