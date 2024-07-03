/*
 *  [BONUSES]
 */
var int Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped;

func void Ninja_AMExpansion_ItemsWithBonuses_HPMana_UnEquipping(var int attribute, var int bonus)
{
    // NOTE: There is a pitfall, that in vanilla scripts you can't use variables as parameters of arrays, only constants.
    // I reminded it already. So I have to do comparisions.
    if (ATR_HITPOINTS_MAX == attribute)
    {
        self.attribute[ATR_HITPOINTS_MAX] -= bonus;
        if (self.attribute[ATR_HITPOINTS] > bonus + 1)
        {
            self.attribute[ATR_HITPOINTS] -= bonus;
        }
        else
        {
            self.attribute[ATR_HITPOINTS] = 2;
        };
    };
};


const int NINJA_AMEXPANSION_ITAR_KM_B_BONUS_HP = 20;



INSTANCE NINJA_AMEXPANSION_ITAR_KM_W2 (C_Item)
{
	name 					=	"Tìžká zbroj šermíøe domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	110;
	protection [PROT_BLUNT] = 	110;
	protection [PROT_POINT] = 	110;
	protection [PROT_FIRE] 	= 	55;
	protection [PROT_MAGIC] = 	20;
	
	value 					=	10000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_W2.3ds";
	visual_change 			=	"KM_MIL_W2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_W2;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_W2;	
	
	description				=	name;

	TEXT[0]					= 	"+6% šermíøský talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_W2()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_2H, 6);
    B_RaiseFightTalent(self, NPC_TALENT_1H, 6);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_W2()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_2H, -6);
    B_RaiseFightTalent(self, NPC_TALENT_1H, -6);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_C2 (C_Item)
{
	name 					=	"Tìžká zbroj kušišníka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	95;
	protection [PROT_BLUNT] = 	95;
	protection [PROT_POINT] = 	95;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	25;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_C2.3ds";
	visual_change 			=	"KM_MIL_C2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_C2;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_C2;	
	
	description				=	name;

	TEXT[0]					= 	"+7% støelecký talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_C2()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_CROSSBOW, 7);
	B_RaiseFightTalent(self, NPC_TALENT_BOW, 7);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_C2()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_CROSSBOW, -7);
	B_RaiseFightTalent(self, NPC_TALENT_BOW, -7);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_NH_C2 (C_Item)
{
	name 					=	"Tìžká zbroj kušišníka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	95;
	protection [PROT_BLUNT] = 	95;
	protection [PROT_POINT] = 	95;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	25;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_C2.3ds";
	visual_change 			=	"CROSSBOWHEAVY_NH.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_C2;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_C2;	
	
	description				=	name;

	TEXT[0]					= 	"+7% støelecký talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_W1 (C_Item)
{
	name 					=	"Zbroj šermíøe domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	75;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_W1.3ds";
	visual_change 			=	"KM_MIL_W1.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_W1;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_W1;	
	
	description				=	name;

	TEXT[0]					= 	"+4% šermíøský talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_W1()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, 4);
	B_RaiseFightTalent(self, NPC_TALENT_2H, 4);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_W1()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, -4);
	B_RaiseFightTalent(self, NPC_TALENT_2H, -4);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_C1 (C_Item)
{
	name 					=	"Zbroj kušišníka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	10;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_C1.3ds";
	visual_change 			=	"KM_MIL_C1.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_C1;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_C1;	
	
	description				=	name;

	TEXT[0]					= 	"+6% støelecký talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_C1()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_CROSSBOW, 6);
	B_RaiseFightTalent(self, NPC_TALENT_BOW, 6);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_C1()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_CROSSBOW, -6);
	B_RaiseFightTalent(self, NPC_TALENT_BOW, -6);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_NH_C1 (C_Item)
{
	name 					=	"Zbroj kušišníka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	65;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	10;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_C1.3ds";
	visual_change 			=	"CROSSBOW2_NH.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_C1;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_C1;	
	
	description				=	name;

	TEXT[0]					= 	"+6% støelecký talent";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE NINJA_AMEXPANSION_ITAR_KM_B (C_Item)
{
	name 					=	"Zbroj dùstojníka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	55;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	5;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_B.3ds";
	visual_change 			=	"KM_MIL_B.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_B;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_B;	
	
	description				=	name;

	TEXT[0]					= 	"+20 bonus k maximálnímu zdraví";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_B()
{
    self.attribute[ATR_HITPOINTS_MAX] += NINJA_AMEXPANSION_ITAR_KM_B_BONUS_HP;    
    self.attribute[ATR_HITPOINTS] += NINJA_AMEXPANSION_ITAR_KM_B_BONUS_HP;   
	if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_B()
{
    // "self" it is C_NPC which is unequipping armor
    Ninja_AMExpansion_ItemsWithBonuses_HPMana_UnEquipping(ATR_HITPOINTS_MAX, NINJA_AMEXPANSION_ITAR_KM_B_BONUS_HP);
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};
INSTANCE NINJA_AMEXPANSION_ITAR_KM_R (C_Item)
{
	name 					=	"Lehká Zbroj domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45;
	protection [PROT_BLUNT] = 	45;
	protection [PROT_POINT] = 	45;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_R_01.3ds";
	visual_change 			=	"KM_MIL_R.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_R;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_R;
	
	description				=	name;

	TEXT[0]					= 	"";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_R()
{    
	if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = true;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
    };
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_R()
{
    if (true == Npc_IsPlayer(self))
    {
        Ninja_AMExpansion__NINJA_AMEXPANSION_ITAR_KM_W2_Equipped = false;
    
        if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
    };
};
INSTANCE NINJA_AMEXPANSION_ITAR_KM_WR (C_Item)
{
	name 					=	"Zbroj šermíøe odpadlíka domobrany Archolosu";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	70;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	5;
	
	value 					=	20000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_MIL_W1R.3ds";
	visual_change 			=	"KM_MIL_W1_RENEGADE.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

		on_equip    			=    Equip_NINJA_AMEXPANSION_ITAR_KM_WR;
    on_unequip    			=    UnEquip_NINJA_AMEXPANSION_ITAR_KM_WR;	
	
	description				=	name;

	TEXT[0]					= 	"+5 Bonus k obratnosti a +3% k jednoruèním zbraním";
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE];
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT];
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
func void Equip_NINJA_AMEXPANSION_ITAR_KM_WR()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, 3);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,+ 5);
};
func void UnEquip_NINJA_AMEXPANSION_ITAR_KM_WR()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, -3);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,- 5);
	};
INSTANCE ItMw_1h_mil_AMEXPANSION (C_Item)
{	
	name 				=	"Vynikající Meè Strážného";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal  		= 	75;
	damagetype 			=	DAM_EDGE;
	range    			=  	90;		

	on_equip			=	Equip_ItMw_1h_mil_AMEXPANSION;
	on_unequip			=	UnEquip_ItMw_1h_mil_AMEXPANSION;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	60;
	visual 				=	"KM_ITMW_1H_LEATHERSWORD_01.3DS";

	description			= name;
	TEXT[0]             =       "+5% Bonus k jednoruèní dovednosti";	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
func void Equip_ItMw_1h_mil_AMEXPANSION()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, 5);
};
func void UnEquip_ItMw_1h_mil_AMEXPANSION()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, -5);
	};
	INSTANCE ItMw_2h_mil_AMEXPANSION (C_Item)
{	
	name 				=	"Vynikající obouruèní meè stráže";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal  		= 	90;
	damagetype 			=	DAM_EDGE;
	range    			=  	110;		

	on_equip			=	Equip_ItMw_2h_mil_AMEXPANSION;
	on_unequip			=	UnEquip_ItMw_2h_mil_AMEXPANSION;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	80;
	visual 				=	"KM_ITMW_2H_LEATHERSWORD_01.3DS";

	description			= name;
	TEXT[0]             =       "+5% Obouruèní talent.";	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
func void Equip_ItMw_2h_mil_AMEXPANSION()
{
    B_RaiseFightTalent(self, NPC_TALENT_2H, 5);
};
func void UnEquip_ItMw_2h_mil_AMEXPANSION()
{
    B_RaiseFightTalent(self, NPC_TALENT_2H, -5);
};
	INSTANCE ItMw_Rozjemca (C_Item)
{	
	name 				=	"Rozjemca";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	3000;

	damageTotal  		= 	250;
	damagetype 			=	DAM_MAGIC;
	range    			=  	110;		

	cond_atr[2]   		=	ATR_MANA;
	cond_value[2]  		=	10;
	visual 				=	"KM_SWORD_PEACEKEEPER.3DS";

	description			= name;
	TEXT[0]             ="Legendarny miecz z twierdzy Vardhal. Czuæ jak emanuje energi¹.";	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
func void Equip_ItMw_Rozjemca()
{
    // "self" it is C_NPC which is equipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, 35);
};
func void UnEquip_ItMw_Rozjemca()
{
    // "self" it is C_NPC which is unequipping armor
    B_RaiseFightTalent(self, NPC_TALENT_1H, -35);
	};
	
	instance ItWr_BluePrint_AMEXPANSION_NINJA_LightArmor(C_Item)
{
	name = "Nákres na výrobu lehké zbroje stráže Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_MediumArmor(C_Item)
{
	name = "Nákres na výrobu zbroje dùstojníka stráže Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};
	
	instance ItWr_BluePrint_AMEXPANSION_NINJA_SwordArmor(C_Item)
{
	name = "Nákres na výrobu zbroje šermíøe domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowArmor(C_Item)
{
	name = "Nákres na výrobu zbroje kušišníka domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_SwordsmanArmor(C_Item)
{
	name = "Nákres na výrobu tìžké zbroje šermíøe domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowmanArmor(C_Item)
{
	name = "Nákres na výrobu tìžké zbroje kušišníka domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_Sword1H(C_Item)
{
	name = "Nákres na výrobu vynikajícího meèe domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};

	instance ItWr_BluePrint_AMEXPANSION_NINJA_Sword2H(C_Item)
{
	name = "Nákres na výrobu vynikajícího obouruèního meèe domobrany Archolosu";

	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;

	value = 100;

	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;

	scemeName = "MAP";

	description = name;
};
