func int Ninja_AMEXPANSION_C_PlayerHasFakeGuild (var C_NPC slf, var C_NPC oth)
{
	var C_Item itm; itm = Npc_GetEquippedArmor(oth);
	
	if (slf.aivar[AIV_IgnoresArmor] == TRUE)
	{
		return false;
	};
	
	if (slf.aivar[aiv_IgnoresFakeGuild] == TRUE)
	{
		return false;
	};
	
	if (C_NpcIsGateGuard(self) == TRUE)
	{
		return false;
	};	
		
    // Check, that player has an proper armor from the patch.
    var int Ninja_AMEXPANSION_HasProperArmorFromPatch;
	if  (slf.guild == oth.guild)
	{
		if (oth.guild == GIL_MIL)
		&&	((Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_W2) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_C2) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_NH_C2) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_W1) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_C1) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_NH_C1) == TRUE)
		||	 (Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_B) == TRUE)				
		||	(Hlp_IsItem(itm, NINJA_AMEXPANSION_ITAR_KM_R) == TRUE))
		{
			Ninja_AMEXPANSION_HasProperArmorFromPatch = true;
		}
        else
        {
            Ninja_AMEXPANSION_HasProperArmorFromPatch = false;
        };
	};
    
    // If has, player hasn't fake guild
    if (true == Ninja_AMEXPANSION_HasProperArmorFromPatch)
    {
        return false;
    };
    
    PassArgumentN(slf);
    PassArgumentN(oth);
    ContinueCall();
};		
