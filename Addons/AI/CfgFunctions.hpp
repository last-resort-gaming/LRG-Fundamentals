class LRG_AI {

	tag = "LR";
	class AI {

		file = "z\LRG Fundamentals\addons\AI\Functions";
		class InfantryGarrison {};
		class moduleAISettings {};
		class moduleAISpawns {};
		class SetInitialAI {Postinit = 1;};
		class SetUnitSkill {};
		class SpawnAI {};		
	};

	class Factions {

		file = "z\LRG Fundamentals\addons\AI\Functions\Factions";
		class BLU_F {};
		class BLU_T_F {};
		class CUP_O_ChDKZ {};
		class CUP_O_RU {};
		class CUP_O_SLA {};
		class CUP_O_TK {};
		class CUP_O_TK_MILITIA {};
		class IND_C_F {};
		class IND_F {};
		class LOP_AFR_OPF {};
		class LOP_AM_OPF {};
		class LOP_BH {};
		class LOP_ChDKZ {};
		class LOP_IRA {};
		class LOP_IRAN {};
		class LOP_ISTS_OPF {};
		class LOP_NAPA {};
		class LOP_PESH_IND {};
		class LOP_PMC {};
		class LOP_RACS {};
		class LOP_SLA {};
		class LOP_TKA {};
		class LOP_UA {};
		class LOP_UKR {};
		class LOP_UN {};
		class LOP_US {};
		class LOP_UVF {};
		class OPF_F {};
		class OPF_T_F {};
		class OPTRE_Ins {};
		class rhs_faction_msv {};
		class rhs_faction_vdv {};
		class rhs_faction_vmf {};
		class rhsgref_faction_chdkz {};
		class TEC_CSAT {};
		class TEC_CSAT_Pacific {};
	};	
};

class DERP {
    tag = "DERP";

    class General {
        file = "z\LRG Fundamentals\addons\AI\Functions";
        class AIOccupyBuilding {};
        class randomPos {};
        class ZenOccupy {};
    };
};
