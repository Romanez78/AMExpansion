/*
 * Adds new armors.
 *
 * - Requires Ikarus, LeGo
 * - Compatible with Gothic 2 (Addon)
 *
 * Instructions
 * - Initialize from Init_Global with
 *     Patch_AM_Init();
 */

/*
 * Initialization function to be called from Init_Global
 */
func void Patch_AM_Init() {
    HookDaedalusFuncS("C_PlayerHasFakeGuild", "Ninja_AMExpansion_C_PlayerHasFakeGuild");
    HookDaedalusFuncS("PC_Common_Condition", "Ninja_AMExpansion_PC_Common_Condition");
    HookDaedalusFuncS("PC_Ore_Condition", "Ninja_AMExpansion_PC_Ore_Condition");
    
    // Equipping bonuses
    HookDaedalusFuncS("Equip_ItBE_Addon_MIL_01", "Ninja_AMExpansion_Equip_ItBE_Addon_MIL_01");
    HookDaedalusFuncS("UnEquip_ItBE_Addon_MIL_01", "Ninja_AMExpansion_UnEquip_ItBE_Addon_MIL_01");
};
