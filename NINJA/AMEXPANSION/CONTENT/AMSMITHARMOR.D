/*
 *  SMITHAM.d
 *   - forging AMs
 *
 *  [Damianut 26.04.2024]
 */


// --- OBSOLETE
/*
 *  [VARIABLES]
 *   - [AMS]
 *
 *  I create variables for each AM, to avoid extending already created `PLAYER_TALENT_SMITH[]` array.
 *  If a variable, which starts with `NINJA_AMEXPANSION_PLAYER_TALENT_SMITH` is true, it means, that player knows how to forge an AM with an instance name, which is written after `NINJA_AMEXPANSION_PLAYER_TALENT_SMITH_`.
 */
// var int NINJA_AMEXPANSION_PLAYER_TALENT_SMITH_ITAR_PAL_ST;
// --- END "OBSOLETE"


/*
 *  [CONSTANTS]
 *   - [MOBSI]
 *  Treat an anvil like another mobsi, when player wants to forge an AM from a packet.
 */
const int NINJA_AMEXPANSION_MOBSI_SmithWeapon = 109;


/*
 *  [CONSTANTS]
 *   - [INGREDIENTS]
 *
 *  Lists of ingredients needed to forge AMs.
 *  A name of an instance of a given ingredient, is written after `__` in each of a below constant.
 *
 *  IMPORTANT: To forge an AM, a blueprint itself is needed.
 */

/*
 *  instance `ITAR_PAL_ST`
 *      Description: in `Use_Plan_StewarkAM` called by `ItWr_BluePrint_StewarkAM` [IT_AMEXPANSION.D]
 */

const int NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_NH_C2__NINJA_AMEXPANSION_ITAR_KM_C2 = 1;
const int NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_C2__NINJA_AMEXPANSION_ITAR_KM_NH_C2 = 1;

const int NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_NH_C1__NINJA_AMEXPANSION_ITAR_KM_C1 = 1;
const int NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_C1__NINJA_AMEXPANSION_ITAR_KM_NH_C1 = 1;


/*
 *  [CONSTANTS]
 *   - [ALERTS]
 *
 *  The constants used to create an alert (print on a screen) about missing ingredient(s) or an forged AM.
 */
const string NINJA_AMEXPANSION_PRINT_ProdItemsMissing__SUBSTR_1 = "Chybí: ";
const string NINJA_AMEXPANSION_PRINT_ProdItemsMissing__SUBSTR_2 = " x";
const string NINJA_AMEXPANSION_PRINT_ForgeSuccess = " vyrobeno!";


/*
 *  [FUNCTIONS & INSTANCES]
 */

/*
 *  NINJA_AMEXPANSION_Func_Print_ProdItemsMissing
 *   - display information about missing ingredient(s)
 */
func void NINJA_AMEXPANSION_Func_Print_ProdItemsMissing(var string ingredientName, var int missingAmount)
{
    // Build a string
    var string str; str = NINJA_AMEXPANSION_PRINT_ProdItemsMissing__SUBSTR_1;
    str = ConcatStrings(str, ingredientName);
    str = ConcatStrings(str, NINJA_AMEXPANSION_PRINT_ProdItemsMissing__SUBSTR_2);
    str = ConcatStrings(str, IntToString(missingAmount));
    
    // Print a string
    Print(str);
};

/*
 *  NINJA_AMEXPANSION_Func_Print_ForgeSuccess
 *   - display information about an forged AM
 */
func void NINJA_AMEXPANSION_Func_Print_ForgeSuccess(var string AMName)
{
    // Build and print a string
    Print(ConcatStrings(AMName, NINJA_AMEXPANSION_PRINT_ForgeSuccess));
};


/*
 *  [DIALOGUES]
 */

/*
 *  Normal & Ore smithing
 *   - overwriting original condition, to take forging an AM into consideration
 */
func int Ninja_AMExpansion_PC_Common_Condition()
{
    // If player already selected forging an AM
    if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return false;
    };
    
    ContinueCall();
};
func int Ninja_AMExpansion_PC_Ore_Condition()
{
    // If player already selected forging an AM
    if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return false;
    };
    
    ContinueCall();
};


/*
 *  NINJA_AMEXPANSION_PC_FORGE_AM
 *   - select an AM forging
 */
instance NINJA_AMEXPANSION_PC_FORGE_AM(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= NINJA_AMEXPANSION_PC_FORGE_AM_Condition;
	information		= NINJA_AMEXPANSION_PC_FORGE_AM_Info;
	permanent		= true;
	description		= "Sundat helmu z kušišnické zbroje";
};
func int NINJA_AMEXPANSION_PC_FORGE_AM_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
        if (false == Normalwaffen)
        {
            if (false == Erzwaffen)
             && (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2)) ||	 (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C2)) ||	 (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C1)) ||	 (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2))
			{
                return TRUE;
            };
        };
    };
};
func void NINJA_AMEXPANSION_PC_FORGE_AM_Info()
{
    PLAYER_MOBSI_PRODUCTION = NINJA_AMEXPANSION_MOBSI_SmithWeapon;
};

/*
 *  NINJA_AMEXPANSION_PC_FORGE_AMBACK
 *   - unselect forging an AM
 */
instance NINJA_AMEXPANSION_PC_FORGE_AMBACK(C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= NINJA_AMEXPANSION_PC_FORGE_AMBACK_Condition;
	information		= NINJA_AMEXPANSION_PC_FORGE_AMBACK_Info;
	permanent		= true;
	description		= DIALOG_BACK;
};
func int NINJA_AMEXPANSION_PC_FORGE_AMBACK_Condition()
{
    if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        return true;
    };
};
func void NINJA_AMEXPANSION_PC_FORGE_AMBACK_Info()
{
    // Return to original constant.
	PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
};

/*
 *  NINJA_AMEXPANSION_PC_FORGE_AM_End
 *   - end mobsi dialogue
 */
instance NINJA_AMEXPANSION_PC_FORGE_AM_End(C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= NINJA_AMEXPANSION_PC_FORGE_AM_End_Condition;
	information		= NINJA_AMEXPANSION_PC_FORGE_AM_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};
func int NINJA_AMEXPANSION_PC_FORGE_AM_End_Condition()
{
	if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
	{
		return TRUE;
	};
};
func void NINJA_AMEXPANSION_PC_FORGE_AM_End_Info()
{
	CreateInvItems(self, ItMiSwordRaw, 1);
	B_ENDPRODUCTIONDIALOG();
    
    // For sure I reset it.
	Erzwaffen = FALSE;
	NormalWaffen = FALSE;
};

INSTANCE NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C2 (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C2_Condition;
	information		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C2_Info;
	permanent		= true;
    description     = "Odebrat Helmu z tìžké zbroje kušišníka domobrany Archolosu";
};
FUNC INT NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C2_Condition()
{	
	if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has AM
        if (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C2))
        {	
            return true;
        };
    };
};
FUNC VOID NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C2_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [Itar_Pal_A]
    amount_needed = NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_NH_C2__NINJA_AMEXPANSION_ITAR_KM_C2;
    amount_current = Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C2); // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_AMEXPANSION_Func_Print_ProdItemsMissing(NINJA_AMEXPANSION_ITAR_KM_C2.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
      
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, - 1);
        Npc_RemoveInvItems(hero, NINJA_AMEXPANSION_ITAR_KM_C2, 1);
        // Create an AM
        CreateInvItem(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2);
        CreateInvItem(hero, ItMiSwordrawhot);
		
        // Print an information about success
        NINJA_AMEXPANSION_Func_Print_ForgeSuccess(NINJA_AMEXPANSION_ITAR_KM_NH_C2.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C2 (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C2_Condition;
	information		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C2_Info;
	permanent		= true;
    description     = "Vrátit Helmu k tìžké zbroji kušišníka domobrany Archolosu";
};
FUNC INT NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C2_Condition()
{	
	if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has AM
        if (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2))
        {	
            return true;
        };
    };
};
FUNC VOID NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C2_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [Itar_Pal_A]
    amount_needed = NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_C2__NINJA_AMEXPANSION_ITAR_KM_NH_C2;
    amount_current = Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2); // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_AMEXPANSION_Func_Print_ProdItemsMissing(NINJA_AMEXPANSION_ITAR_KM_NH_C2.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
      
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, - 1);
        Npc_RemoveInvItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C2, 1);
        // Create an AM
        CreateInvItem(hero, NINJA_AMEXPANSION_ITAR_KM_C2);
        CreateInvItem(hero, ItMiSwordrawhot);
		
        // Print an information about success
        NINJA_AMEXPANSION_Func_Print_ForgeSuccess(NINJA_AMEXPANSION_ITAR_KM_C2.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C1 (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C1_Condition;
	information		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C1_Info;
	permanent		= true;
    description     = "Odebrat Helmu ze zbroje kušišníka domobrany Archolosu";
};
FUNC INT NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C1_Condition()
{	
	if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has AM
        if (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C1))
        {	
            return true;
        };
    };
};
FUNC VOID NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_NH_C1_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [Itar_Pal_A]
    amount_needed = NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_NH_C1__NINJA_AMEXPANSION_ITAR_KM_C1;
    amount_current = Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_C1); // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_AMEXPANSION_Func_Print_ProdItemsMissing(NINJA_AMEXPANSION_ITAR_KM_C1.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
      
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, - 1);
        Npc_RemoveInvItems(hero, NINJA_AMEXPANSION_ITAR_KM_C1, 1);
        // Create an AM
        CreateInvItem(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C1);
        CreateInvItem(hero, ItMiSwordrawhot);
		
        // Print an information about success
        NINJA_AMEXPANSION_Func_Print_ForgeSuccess(NINJA_AMEXPANSION_ITAR_KM_NH_C1.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C1 (C_INFO)
{
	npc				= PC_Hero;
	condition		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C1_Condition;
	information		= NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C1_Info;
	permanent		= true;
    description     = "Vrátit Helmu ke zbroji kušišníka domobrany Archolosu";
};
FUNC INT NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C1_Condition()
{	
	if (NINJA_AMEXPANSION_MOBSI_SmithWeapon == PLAYER_MOBSI_PRODUCTION)
    {
        // If has AM
        if (0 < Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C1))
        {	
            return true;
        };
    };
};
FUNC VOID NINJA_AMEXPANSION_PC_NINJA_AMEXPANSION_ITAR_KM_C1_Info()
{
	var int has_all_ingredients; has_all_ingredients = true;
    var int amount_needed;
    var int amount_current;
    var int amount_missing;
    
    // Check ingredients
    
    // [Itar_Pal_A]
    amount_needed = NINJA_AMEXPANSION_INGREDIENTS_NINJA_AMEXPANSION_ITAR_KM_C1__NINJA_AMEXPANSION_ITAR_KM_NH_C1;
    amount_current = Npc_HasItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C1); // IMPORTANT: An one of a raw steel is in a hand
    
    if (amount_needed > amount_current)
    {
        // Count missing ingredients
        amount_missing = amount_needed - amount_current;
    
        // Print message
        NINJA_AMEXPANSION_Func_Print_ProdItemsMissing(NINJA_AMEXPANSION_ITAR_KM_NH_C1.name, amount_missing);

        // Save an information, that player hasn't all ingredients
        has_all_ingredients = false;
    };
      
    // If player has all ingredients
    if (true == has_all_ingredients)
    {
        // Remove ingredients
        
        // [ItMiSwordrawhot]
        // IMPORTANT: An one raw steel will be removed by finishing using of an anvil
        Npc_RemoveInvItems(hero, ItMiSwordrawhot, - 1);
        Npc_RemoveInvItems(hero, NINJA_AMEXPANSION_ITAR_KM_NH_C1, 1);
        // Create an AM
        CreateInvItem(hero, NINJA_AMEXPANSION_ITAR_KM_C1);
        CreateInvItem(hero, ItMiSwordrawhot);
		
        // Print an information about success
        NINJA_AMEXPANSION_Func_Print_ForgeSuccess(NINJA_AMEXPANSION_ITAR_KM_C1.name);
    // If hasn't
    } else
    {
        // Restore a raw steel
        CreateInvItem(hero, ItMiSwordrawhot);
    };
    

    // Quit a dialogue window
	B_ENDPRODUCTIONDIALOG();
};

