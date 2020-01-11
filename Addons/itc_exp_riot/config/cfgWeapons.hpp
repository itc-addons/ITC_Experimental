class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"itc_exp_riotMuzzle"};

        class ThrowMuzzle;
        class itc_exp_riotMuzzle: ThrowMuzzle {
            magazines[] = {"itc_exp_throwObject"};
			class EventHandlers
			{
				fired		= "_this call itc_exp_fnc_riot";
			};
        };
	};
};