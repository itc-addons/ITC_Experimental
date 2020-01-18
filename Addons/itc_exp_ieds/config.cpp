class CfgPatches
{
	class itc_exp_ieds
	{
		author = "ITC Addons Team";
		authors[] = {"Herbiie","ToadBall","Yax","VKing"};
		units[] = {"itc_exp_moduleIEDs"};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F","ace_interaction","ace_interact_menu","ace_common"};
		weapons[] = {"itc_exp_ecmL","itc_exp_ecmM","itc_exp_ecmH"};
	};
};

#include "configs\cfgFunctions.hpp"

#include "configs\cfgWeapons.hpp"



class CfgFactionClasses
{
	class NO_CATEGORY;
	class itc_exp_modules: NO_CATEGORY
	{
		displayName = "ITC Experimental";
	};
};


#include "configs\cfgVehicles.hpp"


