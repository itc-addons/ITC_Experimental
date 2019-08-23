class CfgPatches
{
	class itc_ieds
	{
		units[] = {"itc_moduleIEDs"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};

class CfgFunctions 
{
	class itc
	{
		class IEDs
		{
			file = "\itc_ieds\functions\ied.sqf";
			class moduleIEDs{};
		};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class itc_modules: NO_CATEGORY
	{
		displayName = "ITC";
	};
};

class Extended_PreInit_EventHandlers {
	class itc_functions {
		init = "call ('preInit.sqf' call SLX_XEH_COMPILE)";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};
		class ModuleDescription
		{
		};
	};
	class itc_modulesIEDs: Module_F
	{
		scope = 2;
		displayName = "ITC IEDs";
		category = "ITC";
		function = "itc_fnc_moduleIEDs";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		is3DEN = 0;
		curatorInfoType = "RscDisplayAttributeModuleIEDs";
		class Attributes: AttributesBase
		{
			class IEDClass: Combo
			{
				property = "itc_moduleIED_IEDSize";
				displayName = "Type of IED";
				tooltip = "Select which type of IED to place";
				typeName = "STRING";
				defaultValue = "ACE_IEDLandSmall_Command_Ammo";
				class Values
				{
					class DugInSmall {name = "Dug In (Small)",value = "ACE_IEDLandSmall_Command_Ammo"};
					class DugInLarge {name = "Dug In (Large)",value = "ACE_IEDLandBig_Command_Ammo"};
					class urbanSmall {name = "Urban (Small)",value = "ACE_IEDUrbanSmall_Command_Ammo"};
					class urbanLarge {name = "Urban (Large)",value = "ACE_IEDUrbanBig_Command_Ammo"};
				};
			};
			class IEDType: Combo
			{
				property = "itc_moduleIED_IEDType";
				displayName = "Type of Switch";
				tooltip = "Select which type of switch the IED will have";
				typeName = "STRING";
				defaultValue = "RCIED";
				class Values
				{
					class RC {name = "Remote Control",value = "RCIED"};
					class CW {name = "Command Wire",value = "CWIED"};
				};
			};
			class AntiTamper: Checkbox
			{
				displayName = "Anti Tamper?";
				tooltip = "Select whether or not the IED withh explode when defused";
				defaultValue = false;
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "ITC IEDs places an advanced IED at the modole location with several methods of initiation including remote control, command wire and anti-tamper. The module will need to be synced to at least 1 AI unit to act as trigger.";
			sync[] = {};
	};
	

};

