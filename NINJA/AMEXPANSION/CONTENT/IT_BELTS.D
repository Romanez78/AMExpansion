func void Ninja_AMExpansion_Equip_ItBE_Addon_MIL_01()
{
    if (true == Npc_IsPlayer(self))
    {
        if (true == Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped)
        {
            self.protection[PROT_EDGE] += BA_Bonus01;
            self.protection[PROT_BLUNT] += BA_Bonus01;
            self.protection[PROT_POINT] += BA_Bonus01;
            self.protection[PROT_MAGIC] += BA_Bonus01;
            self.protection[PROT_FIRE] += BA_Bonus01;
        };
    };
    
    ContinueCall();
};
func void Ninja_AMExpansion_UnEquip_ItBE_Addon_MIL_01()
{
    if (true == Npc_IsPlayer(self))
    {
        if (true == Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped)
        {
            self.protection[PROT_EDGE] -= BA_Bonus01;
            self.protection[PROT_BLUNT] -= BA_Bonus01;
            self.protection[PROT_POINT] -= BA_Bonus01;
            self.protection[PROT_MAGIC] -= BA_Bonus01;
            self.protection[PROT_FIRE] -= BA_Bonus01;
        };
    };
    
    ContinueCall();
};