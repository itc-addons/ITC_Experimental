class cfgAmmo {
	class GrenadeHand_stone;
	class submunitionBase;
	class itc_exp_riotBase: GrenadeHand_stone {
		ace_frag_enabled = 0;
		explosionSoundEffect = "";
		explosionForceCoef = 0;
		explosive = 0;
		SoundSetExplosion[] = {};
		explosionEffects = "";
		CraterEffects = "";
		explosionType = "";
		multiSoundHit[] = {};
	};
	class itc_exp_riotStart: itc_exp_riotBase {
		triggerTime = 0.05;
        triggerDistance = 0.1;
		fuseDistance = 0.05;
		ace_frag_enabled = 0;
		submunitionAmmo[] = {"itc_exp_riot1",0.2,"itc_exp_riot2",0.2,"itc_exp_riot3",0.2,"itc_exp_riot4",0.2,"itc_exp_riot5",0.2};
		submunitionConeAngle = 3;
		submunitionConeType[] = {"poissondisccenter",1};
		aiAmmoUsageFlags = "64 + 128"; 
		
	};
	class itc_exp_riot1: submunitionBase {
		model = "\A3\Props_F_Orange\Humanitarian\Supplies\WaterBottle_01_empty_F.p3d";
	};
	class itc_exp_riot2: submunitionBase {
		model = "\A3\Props_F_Orange\Humanitarian\Supplies\WaterBottle_01_full_F.p3d";
	};
	class itc_exp_riot3: submunitionBase {
		model = "\A3\Structures_F_Heli\Items\Food\Ketchup_01_F.p3d";
	};
	class itc_exp_riot4: submunitionBase {
		model = "\A3\Structures_F_Heli\Items\Food\Mustard_01_F.p3d";
	};
	class itc_exp_riot5: submunitionBase {
		model = "\A3\Structures_F\Civ\Camping\CampingChair_V2_F.p3d";
	};
};