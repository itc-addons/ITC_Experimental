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
	class itc_exp_modulesIEDs: Module_F
	{
		author = "Herbiie";
		scope = 2;
		displayName = "ITC Experimental IEDs";
		category = "itc_exp_modules";
		function = "itc_exp_fnc_moduleIEDs";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		is3DEN = 0;
		curatorInfoType = "RscDisplayAttributeModuleIEDs";
		class Attributes: AttributesBase
		{
			class IEDClass: Combo
			{
				property = "itc_exp_moduleIED_IEDSize";
				displayName = "Type of IED";
				tooltip = "Select which type of IED to place";
				typeName = "STRING";
				defaultValue = "ACE_IEDLandSmall_Command_Ammo";
				class Values
				{
					class DugInSmall {name = "Dug In (Small)";value = "ACE_IEDLandSmall_Command_Ammo";};
					class DugInLarge {name = "Dug In (Large)";value = "ACE_IEDLandBig_Command_Ammo";};
					class urbanSmall {name = "Urban (Small)";value = "ACE_IEDUrbanSmall_Command_Ammo";};
					class urbanLarge {name = "Urban (Large)";value = "ACE_IEDUrbanBig_Command_Ammo";};
				};
			};
			class IEDType: Combo
			{
				property = "itc_exp_moduleIED_IEDType";
				displayName = "Type of Switch";
				tooltip = "Select which type of switch the IED will have";
				typeName = "STRING";
				defaultValue = "RCIED";
				class Values
				{
					class RC {name = "Remote Control";value = "RCIED"};
					class CW {name = "Command Wire";value = "CWIED"};
				};
			};
			class AntiTamper: Checkbox
			{
				property = "itc_exp_moduleIED_AntiTamper";
				displayName = "Anti Tamper";
				tooltip = "Select whether or not the IED will explode when defused";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "ITC Experimental IEDs places an advanced IED at the modole location with several methods of initiation including remote control, command wire and anti-tamper. The module will need to be synced to at least 1 AI unit to act as trigger.";
				position = 1;
				direction = 1;
				optional = 1;
				duplicate = 1;
				synced[] = {"AnyAI"}; 
		};
	};
	
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class ITC_Exp_ECM {
				  displayName = "ECM";
				  condition = "[ACE_player] call itc_exp_fnc_hasECM";
				  statement = "";
				  exceptions[] = {"isNotDragging"};
				  showDisabled = 0;
				  priority = 0;
				  
				  class ITC_Exp_ECMLon {
					displayName = "Turn on: ECM (Light)";
					condition = "('itc_exp_ecmL' in (items _player)) && !(_player getVariable ['itc_exp_hasECMOn',false])";
					statement = "[_player,5] call itc_exp_fnc_ecmON"; 
					priority = 1;
					showDisabled = 1;
					exceptions[] = {"isNotDragging"};
					enableInside = 1;
				  };
				  class ITC_Exp_ECMLoff: ITC_Exp_ECMLon {
					displayName = "Turn off: ECM (Light)";
					condition = "('itc_exp_ecmL' in (items _player)) && (_player getVariable ['itc_exp_hasECMOn',true])";
					statement = "[_player,5] call itc_exp_fnc_ecmOff"; 
				  };   
				  class ITC_Exp_ECMMon: ITC_Exp_ECMLon {
					displayName = "Turn on: ECM (Medium)";
					condition = "('itc_exp_ecmM' in (items _player)) && !(_player getVariable ['itc_exp_hasECMOn',false])";
					statement = "[_player,25] call itc_exp_fnc_ecmON"; 
				  };  
				  class ITC_Exp_ECMMoff: ITC_Exp_ECMLon {
					displayName = "Turn off: ECM (Medium)";
					condition = "('itc_exp_ecmM' in (items _player)) && (_player getVariable ['itc_exp_hasECMOn',true])";
					statement = "[_player,25] call itc_exp_fnc_ecmOff"; 
				  };       
				  class ITC_Exp_ECMHon: ITC_Exp_ECMLon {
					displayName = "Turn on: ECM (Heavy)";
					condition = "('itc_exp_ecmH' in (items _player)) && !(_player getVariable ['itc_exp_hasECMOn',false])";
					statement = "[_player,50] call itc_exp_fnc_ecmON"; 
				  };   
				  class ITC_Exp_ECMHoff: ITC_Exp_ECMLon {
					displayName = "Turn off: ECM (Heavy)";
					condition = "('itc_exp_ecmH' in (items _player)) && (_player getVariable ['itc_exp_hasECMOn',true])";
					statement = "[_player,50] call itc_exp_fnc_ecmOff"; 
				  }; 
				};
			};
		};
	  };
	

};