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
	class itc_exp_modulesRioters: Module_F
	{
		author = "Herbiie";
		scope = 2;
		displayName = "ITC Experimental Rioters";
		category = "itc_exp_modules";
		function = "itc_exp_fnc_riotmodule";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		is3DEN = 0;
		curatorInfoType = "RscDisplayAttributeModuleRiot";
		class Attributes: AttributesBase
		{
			class RiotSide: Combo
			{
				property = "itc_exp_moduleRiot_RiotSide";
				displayName = "Rioters Side";
				tooltip = "Select which side the rioters will be affiliated with";
				typeName = "STRING";
				defaultValue = "East";
				class Values
				{
					class east {name = "OpFor (East)";value = "East";};
					class west {name = "BluFor (West)";value = "West";};
					class Independent {name = "Independent";value = "Independent";};
				};
			};
		class ModuleDescription: ModuleDescription
			{
				description = "Syncing this module to civilian units will turn that unit into a rioter. Rioters will throw random objects at units in an opposing side. Rioters will still run around, if you want your rioters to remain station put this disableai 'path' into their init field";
					position = 1;
					direction = 1;
					optional = 1;
					duplicate = 1;
					synced[] = {"AnyAI"}; 
			};
		};
	};
};