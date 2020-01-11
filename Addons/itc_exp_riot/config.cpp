class CfgPatches
{
	class itc_exp_riot
	{
		author = "ITC Addons Team";
		authors[] = {"Herbiie","ToadBall","Yax","VKing"};
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F","ace_interaction","ace_interact_menu","ace_common"};
		weapons[] = {};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class itc_exp_modules: NO_CATEGORY
	{
		displayName = "ITC Experimental";
	};
};

#include "config\cfgMagazines.hpp"
#include "config\cfgAmmo.hpp"
#include "config\cfgWeapons.hpp"
#include "config\cfgFunctions.hpp"
#include "config\cfgVehicles.hpp"