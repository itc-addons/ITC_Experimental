class cfgWeapons {
	class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    
	class itc_exp_ecmL : ACE_ItemCore {
		scope = 2;
        scopeArsenal = 2;        
		displayName = "ECM Light";
		descriptionShort = "Protects agaisnt RCIEDs up to 5m.";
		author = "Herbiie";
		model = "\a3\Weapons_F\Ammo\mag_radio.p3d";
		picture = "\A3\Weapons_F\Data\UI\gear_item_radio_ca.paa";
		class itemInfo: CBA_MiscItem_ItemInfo  {
			mass = 10;
		};
	};
	class itc_exp_ecmM : ACE_ItemCore {
		scope = 2;
        scopeArsenal = 2;        
		displayName = "ECM Medium";
		descriptionShort = "Protects agaisnt RCIEDs up to 25m.";
		author = "Herbiie";
		model = "\a3\Weapons_F\Ammo\mag_radio.p3d";
		picture = "\A3\Weapons_F\Data\UI\gear_item_radio_ca.paa";
		class itemInfo: CBA_MiscItem_ItemInfo  {
			mass = 40;
		};
	};
	class itc_exp_ecmH : ACE_ItemCore {
		scope = 2;
        scopeArsenal = 2;
		displayName = "ECM Heavy";
		descriptionShort = "Protects agaisnt RCIEDs up to 50m.";
		author = "Herbiie";
		model = "\a3\Weapons_F\Ammo\mag_radio.p3d";
		picture = "\A3\Weapons_F\Data\UI\gear_item_radio_ca.paa";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 80;
        };        
	};
};