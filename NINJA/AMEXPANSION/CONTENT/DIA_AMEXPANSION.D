// *********************************************************
// 		  				      My Changes				
// *********************************************************
instance DIA_BRIAN_BUYRAWSTEEL_PATCHOC (C_INFO)
{
	npc			 =  VLK_457_Brian;
	nr			 =  4;
	condition	 = 	DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Condition;
	information	 = 	DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Info;
	permanent	 = 	FALSE;
	description	 = 	"Potøebuju více surové oceli.";
};
func int DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Condition ()
{	
	if (Kapitel >= 1)
	{
		return TRUE;
	};
};
func void DIA_BRIAN_BUYRAWSTEEL_PATCHOC_Info ()
{
    AI_Output(other, self, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_15_01"); //Potøebuju více surové oceli.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_02"); //Mùžu ti prodat nìjáke z mých osobních zásob, ale vyjde tì to draho.
    AI_Output(self, other, "DIA_BRIAN_BUYRAWSTEEL_PATCHOC_13_03"); //200 zlatých za jeden kus.
};
instance DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	3;
	condition	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Condition;
	information	 = 	DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi jeden kus surové oceli. (Cena: 200 zlatých).";
};
func int DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_BRIAN_BUYRAWSTEEL_PATCHOC))
	{
		return TRUE;
	};
};
func void DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_Info ()
{
	AI_Output(other, self, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_1"); //Prodej mi jeden kus surové oceli.
	
	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{	
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_2"); //Tady je.
		B_GiveInvItems (self, other, ItMiSwordraw, 1);	
	}
	else 
	{
		AI_Output(self, other, "DIA_PATCHOC_BRIAN_IWANNABUYSOMESTEEL_4_3"); //Pøijï až budeš mít u sebe dost zlata
	};
};
//-------------------------------------
//-------------------------------------
const string	TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST				=   "Lepší vybavení pro mìstskou stráž";
instance Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT (C_INFO)
{
	npc			 =  Mil_311_Andre;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Musím øíct že výbava stráže není zrovna to co jsem si pøedstavoval.";
};
func int Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Andre_Waffe))
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_15_01"); //Musím øíct že výbava stráže není zrovna to co jsem si pøedstavoval.
    AI_Output(self, other, "Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_13_02"); //Ujišuji tì že tvé vybavení je více než adekvátní pro tvá zadání.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT_15_03"); //Pokud s vybavením máš nìjáký problém, jdi za naším kováøem Mortisem. 
	Log_CreateTopic (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,LOG_RUNNING);
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Andre mì poslal za kováøem domobrany Mortisem pokud chci lepší vybavení.");
};

instance Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Nepøemýšlel si o lepší výbavì pro domobranu?";
};
func int Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Andre_BETTEREQUIPMENT))
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_15_01"); //Nepøemýšlel si o lepší výbavì pro domobranu?
    AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_13_02"); //Ne, není tøeba.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_15_03"); //A kdybych našel nìco co by zmìnilo tvùj názor? 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT_13_04"); //Jestli to Andre schválí, tak proè ne.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis souhlasil že pokud Andre schválí mùj návrh pro lepší výbavu tak jí zaène vyrábìt. Teï jen najít nìco co by se dalo použít, nejlépe nìjáký nákres. Mìl bych se zeptat nìkoho kdo má na starost nìjáký sklad.");
};

instance Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT (C_INFO)
{
	npc			 =  Mil_350_Addon_Martin;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"Hledám nákres pro lepší výbavu domobrany, nemáš nìco co by mi mohlo pomoct?";
};
func int Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_BETTEREQUIPMENT))
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_15_01"); //Hledám nákres pro lepší výbavu domobrany, nemáš nìco co by mi mohlo pomoct?
    AI_Output(self, other, "Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_13_02"); //Hmm, jeden by tu byl. Podle peèetì patøil domobranì na Archolu, to je co si chtìl?
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_15_03"); //Ano, zkusím ho ukázat Andremu, co za nìj chceš?
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_13_04"); //Nic, tohle je záležitost domobrany a ten nákres stejnì není tak cenný. Tady je.
	    B_GiveInvItems(self, other, ItWr_BluePrint_AMEXPANSION_NINJA_LightArmor, 1);
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Martin_BETTEREQUIPMENT_15_05"); //Díky.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Martin mi dal nákres, mìl bych ho ukázat Andremu.");
};

instance Ninja_AMExpansion_DIA_Andre_LightList (C_INFO)
{
	npc			 =  Mil_311_Andre;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Andre_LightList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Andre_LightList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe nákres pro novou zbroj domobrany.";
};
func int Ninja_AMExpansion_DIA_Andre_LightList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_LightArmor) > 0)
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Andre_LightList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Andre_LightList_15_01"); //Mám u sebe nákres pro novou zbroj domobrany.
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Andre_LightList_15_02"); //Mùžu dostat tvùj souhlas aby se mohl Mortis pustit do výroby?
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Andre_LightList_13_03"); //Ukaž mi ho.
				B_UseFakeScroll ();	
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Andre_LightList_13_04"); //V poøádku, to schvaluji. A vyøiï Mortisovi že od tìïka má tuhle záležitost na starost on.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Andre_LightList_15_05"); //Dobrá.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Andre mi dal souhlas že se mùže Mortis pustit do práce, a že od teï pøevezme tuhle záležitost on.");
};

instance Ninja_AMExpansion_DIA_Mortis_LightList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_LightList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_LightList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Andre schválil výrobu zbroje podle tohohle nákresu.";
};
func int Ninja_AMExpansion_DIA_Mortis_LightList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_LightArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Andre_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_LightList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_LightList_15_01"); //Andre schválil výrobu zbroje podle tohohle nákresu.
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_LightList_15_02"); //Také øíkal že od teï máš tuhle záležitost na starost ty.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_LightList_13_03"); //Dobrá, dej mi tedy ten nákres a dáme se do toho.
	B_GiveInvItems(other, self, ItWr_BluePrint_AMEXPANSION_NINJA_LightArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_LightList_15_04"); //Tady se píše že na výrobu je potøeba jeden kus surové oceli, 2 vlèí kùže a kùže divoèáka. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_LightList_15_05"); //Donést mi ty suroviny bude tvoje práce, protože já tady nemám nic nazbyt. Až je pøineseš tak zhodnotím tu zbroj a zamyslím se jestli stojí za to je vyrábìt ve velkém. Po té co nìjakou vyrobím tak si jí mùžeš nechat, alespoò ji otestuješ v praxi.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_LightList_15_06"); //Chápu, dám se tedy do toho.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí novvou lehkou zbroj z nákresu když mu pøinesu 1 kus surové oceli, 2 vlèí kùže a 1 kùži divoèáka.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_LightKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_LightKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_LightKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro novou lehkou zbroj.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_LightKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 1)
    && (Npc_HasItems(other, ItAt_wolffur) >= 2)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 1)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_LightKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_LightKM_15_01"); //Mám u sebe to co jsi potøeboval pro novou lehkou zbroj.	
        B_GivePlayerXP(20);			
        B_GiveInvItems(other, self, ItMiSwordraw, 1);
		B_GiveInvItems(other, self, ItAt_wolffur, 2);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 1);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_LightKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_LightKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_LightKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, Other, NINJA_AMEXPANSION_ITAR_KM_R, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_R);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_LightKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_LightKM_13_14"); //Nevypadá nejhùø, ale upøímnì si nemyslím že by se vyplatilo jí nahradit to co už nosí domobrana teï.       
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_LightKM_15_15"); //Zkusím se tedy ještì po neèem porozhlédnout, díky.
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil novou lehkou zbroj.");
};

instance Ninja_AMExpansion_DIA_Lutero_MediumList (C_INFO)
{
	npc			 =  VLK_404_Lutero;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Lutero_MediumList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Lutero_MediumList_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
	description	 = 	"";
};
func int Ninja_AMExpansion_DIA_Lutero_MediumList_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Lutero_MediumList_Info ()
{
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Lutero_MediumList_13_01"); //Slyšel jsem že hledáš nákres pro novou výbavu domobrany.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Lutero_MediumList_15_02"); //Vážnì? A odkdud?.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Lutero_MediumList_13_03"); //Mám své zdroje, ale na tom nezáleží.	
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Lutero_MediumList_13_04"); //Mám u sebe nákres pro zbroj dùstojníka, mùžu ti ho prodat.	
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Lutero_MediumList_15_05"); //Kolik za nìj chceš?	
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Lutero_MediumList_13_06"); //700 zlatých a je tvùj.	
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Lutero mi nabídl nákres pro zbroj dùstojníka za 700 zlatých.");
};

var int Ninja_AMExpansion_DIA_Lutero_MediumListBought_perm;
instance Ninja_AMExpansion_DIA_Lutero_MediumListBought (C_INFO)
{
	npc			 =  VLK_404_Lutero;
	nr			 =  5;
	condition	 = 	Ninja_AMExpansion_DIA_Lutero_MediumListBought_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Lutero_MediumListBought_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi ten nákres na zbroj dùstojníka (55/55, Bonus 20 bodù zdraví, Cena 700 zlatých)";
};
func int Ninja_AMExpansion_DIA_Lutero_MediumListBought_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Lutero_MediumList))
	&& (Ninja_AMExpansion_DIA_Lutero_MediumListBought_perm == FALSE)
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Lutero_MediumListBought_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 700))
	{
	  AI_Output(other, self, "Ninja_AMExpansion_DIA_Lutero_MediumListBought_15_01"); //Prodej mi ten nákres na zbroj.
	  AI_Output(self, other, "Ninja_AMExpansion_DIA_Lutero_MediumListBought_13_02"); //Dobøe, tady ho máš.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_MediumArmor,1);
		Ninja_AMExpansion_DIA_Lutero_MediumListBought_perm = TRUE;
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem od Lutera nákres pro zbroj dùstojníka, mìl bych ho pøinést Mortisovi.");
	}
	else
	{
		AI_Output (self, other, "Ninja_AMExpansion_DIA_Lutero_MediumListBought_13_03"); //Nemáš dost zlata.
	};
};
instance Ninja_AMExpansion_DIA_Mortis_MediumList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  5;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_MediumList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_MediumList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro zbroj dùstojníka domobrany Archolosu.";
};
func int Ninja_AMExpansion_DIA_Mortis_MediumList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_MediumArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_MediumList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_MediumList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro zbroj dùstojníka domobrany Archolosu.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_MediumList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(other, self, ItWr_BluePrint_AMEXPANSION_NINJA_MediumArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_MediumList_15_03"); //Takže, tady se píše že na výrobu jsou potøeba 3 kusy surové oceli, 2 vlèí kùže a 3 kùže divoèáka. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_MediumList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_MediumList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí zbroj dùstojníka domobrany Archolosu z nákresu když mu pøinesu 3 kusy surové oceli, 2 vlèí kùže a 3 kùže divoèáka.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_MediumKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_MediumKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_MediumKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro zbroj dùstojníka.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_MediumKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 3)
    && (Npc_HasItems(other, ItAt_wolffur) >= 2)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 3)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_MediumList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_MediumKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_MediumKM_15_01"); //Mám u sebe to co jsi potøeboval pro zbroj dùstojníka.	
        B_GivePlayerXP(20);			
        B_GiveInvItems(other, self, ItMiSwordraw, 3);
		B_GiveInvItems(other, self, ItAt_wolffur, 2);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 3);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_MediumKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_MediumKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_MediumKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, other, NINJA_AMEXPANSION_ITAR_KM_B, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_B);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_MediumKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_MediumKM_13_14"); //Tahle vypadá slušnì, dalo by se pøemýšlet o tom že by nahradila stávající výbavu. Uvidíme co na ní øekne Andre.       
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_MediumKM_15_15"); //Dobrá, zkusím jestli ještì nìco najdu.	
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil zbroj dùstojníka.");
};

instance Ninja_AMExpansion_DIA_Engor_MediumList (C_INFO)
{
	npc			 =  VLK_4108_Engor;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Engor_MediumList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Engor_MediumList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Hledám nákresy pro zbroj, nemùžeš mi v tom pomoct?";
};
func int Ninja_AMExpansion_DIA_Engor_MediumList_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Engor_MediumList_Info ()
{
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Engor_MediumList_15_02"); //Hledám nákresy pro zbroj, nemùžeš mi v tom pomoct?
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Engor_MediumList_13_03"); //No vlastnì ano, mám tu dva nákresy pro zbroj. Chtìl jsem aby je Dobar vyrobil ale zdaleka na to nemáme suroviny takže si je mùžeš koupit.		
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Engor_MediumList_15_05"); //Kolik za nì chceš?	
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Engor_MediumList_13_06"); //2500 zlatých za každý.	
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Engor mi nabídl nákres pro zbroj šermíøe a kušišníka domobrany Archolu, za každý chce 2500 zlatých.");
};
var int Ninja_AMExpansion_DIA_Engor_MediumList1Bought_perm;
var int Ninja_AMExpansion_DIA_Engor_MediumList2Bought_perm;
instance Ninja_AMExpansion_DIA_Engor_MediumListBought (C_INFO)
{
	npc			 =  VLK_4108_Engor;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Engor_MediumListBought_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Engor_MediumListBought_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi nákres na zbroj šermíøe domobrany Archolosu (70/70, Bonus pro zbranì na blízko, Cena: 2500 zlatých)";
};
func int Ninja_AMExpansion_DIA_Engor_MediumListBought_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Engor_MediumList))
	&& (Ninja_AMExpansion_DIA_Engor_MediumList1Bought_perm == FALSE)
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Engor_MediumListBought_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 2500))
	{
	  AI_Output(other, self, "Ninja_AMExpansion_DIA_Engor_MediumListBought_15_01"); //Prodej mi nákres na zbroj šermíøe domobrany Archolosu.
	  AI_Output(self, other, "Ninja_AMExpansion_DIA_Engor_MediumListBought_15_02"); //Tady je.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_SwordsmanArmor,1);
		Ninja_AMExpansion_DIA_Engor_MediumList1Bought_perm = TRUE;
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem od Engora nákres zbroje šermíøe, mìl bych ho pøinést Mortisovi.");
	}
	else
	{
		AI_Output (self, other, "Ninja_AMExpansion_DIA_Engor_MediumListBought_15_03"); //Nemáš dost zlata.
	};
};

instance Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow (C_INFO)
{
	npc			 =  VLK_4108_Engor;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prodej mi nákres na zbroj kušišníka domobrany Archolosu (65/65, Bonus pro zbranì na dálku, Cena: 2500 zlatých)";
};
func int Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_Condition ()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Engor_MediumList))
	&& (Ninja_AMExpansion_DIA_Engor_MediumList2Bought_perm == FALSE)
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 2500))
	{
	  AI_Output(other, self, "Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_15_01"); //Prodej mi nákres na zbroj kušišníka domobrany Archolosu.
	  AI_Output(self, other, "Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_15_02"); //Tady je.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowArmor,1);
		Ninja_AMExpansion_DIA_Engor_MediumList2Bought_perm = TRUE;
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem od Engora nákres zbroje kušišníka, mìl bych ho pøinést Mortisovi.");
	}
	else
	{
		AI_Output (self, other, "Ninja_AMExpansion_DIA_Engor_MediumListBoughtCrossbow_15_03"); //Nemáš dost zlata.
	};
};

instance Ninja_AMExpansion_DIA_Mortis_SwordsmanList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_SwordsmanList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_SwordsmanList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro zbroj šermíøe domobrany Archolosu.";
};
func int Ninja_AMExpansion_DIA_Mortis_SwordsmanList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_SwordArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_SwordsmanList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_SwordsmanList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro zbroj šermíøe domobrany Archolosu.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_SwordsmanList_13_03"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(other, self, ItWr_BluePrint_AMEXPANSION_NINJA_SwordArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_SwordsmanList_15_04"); //Takže, tady se píše že na výrobu je potøeba 5 kusù surové oceli, 2 kùže Warga a 3 kùže divoèáka. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_SwordsmanList_15_05"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_SwordsmanList_15_06"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí zbroj šermíøe domobrany Archolosu z nákresu když mu pøinesu 5 kusù surové oceli, 2 kùže Warga a 3 kùže divoèáka.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_SwordsmanKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_SwordsmanKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_SwordsmanKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro zbroj šermíøe.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_SwordsmanKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 5)
    && (Npc_HasItems(other, ItAt_wargfur) >= 2)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 3)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_SwordsmanList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_SwordsmanKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_15_01"); //Mám u sebe to co jsi potøeboval pro zbroj šermíøe.	
        B_GivePlayerXP(25);			
        B_GiveInvItems(other, self, ItMiSwordraw, 5);
		B_GiveInvItems(other, self, ItAt_wargfur, 2);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 3);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, Other, NINJA_AMEXPANSION_ITAR_KM_W1, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_W1);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_13_14"); //Vypadá dost dobøe, má dobrou ochranu a pøitom nebrání pohybu. Kdyby jsme mìli více surovin tak bych je zaèal vyrábìt.       
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_SwordsmanKM_15_15"); //Dobrá, zkusím jestli ještì nìco najdu.
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil zbroj šermíøe.");
};

instance Ninja_AMExpansion_DIA_Mortis_CrossbowmanList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro zbroj kušišníka domobrany Archolosu.";
};
func int Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro zbroj kušišníka domobrany Archolosu.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(other, self, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_15_03"); //Takže, tady se píše že na výrobu jsou potøeba 4 kusy surové oceli, 3 kùže Warga a 3 kùže divoèáka. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_CrossbowmanList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí zbroj kušišníka domobrany Archolosu z nákresu když mu pøinesu 4 kusy surové oceli, 3 kùže Warga a 3 kùže divoèáka.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_CrossbowmanKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_CrossbowmanKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_CrossbowmanKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro zbroj kušišníka.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_CrossbowmanKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 4)
    && (Npc_HasItems(other, ItAt_wargfur) >= 3)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 3)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_CrossbowmanList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_CrossbowmanKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_15_01"); //Mám u sebe to co jsi potøeboval pro zbroj kušišníka.	
        B_GivePlayerXP(25);			
        B_GiveInvItems(other, self, ItMiSwordraw, 4);
		B_GiveInvItems(other, self, ItAt_wargfur, 3);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 3);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, Other, NINJA_AMEXPANSION_ITAR_KM_C1, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_C1);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_13_14"); //Vypadá zajímavì, pøímo stvoøená pro kušišníky. Ruga by si jí urèitì oblíbil.      
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_CrossbowmanKM_15_15"); //Dobrá, zkusím jestli ještì nìco najdu.
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil zbroj kušišníka.");
};

instance Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro tìžkou zbroj šermíøe domobrany Archolosu.";
};
func int Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_SwordsmanArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro tìžkou zbroj šermíøe domobrany Archolosu.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(other, self, ItWr_BluePrint_AMEXPANSION_NINJA_SwordArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_15_03"); //Takže, tady se píše že na výrobu je potøeba 8 kusù surové oceli, 4 kùže Warga a 2 kùže trola. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí tìžkou zbroj šermíøe domobrany Archolosu z nákresu když mu pøinesu 8 kusù surové oceli, 4 kùže Warga a 2 kùže trola.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavySwordsmanKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavySwordsmanKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavySwordsmanKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro tìžkou zbroj šermíøe.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavySwordsmanKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 8)
    && (Npc_HasItems(other, ItAt_wargfur) >= 4)
    && (Npc_HasItems(other, ItAt_Trollfur) >= 1)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_HeavySwordsmanList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavySwordsmanKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_15_01"); //Mám u sebe to co jsi potøeboval pro tìžkou zbroj šermíøe.	
        B_GivePlayerXP(50);			
        B_GiveInvItems(other, self, ItMiSwordraw, 8);
		B_GiveInvItems(other, self, ItAt_wargfur, 4);
        B_GiveInvItems(other, self, ItAt_Trollfur, 1);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, Other, NINJA_AMEXPANSION_ITAR_KM_W2, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_W2);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_13_14"); //Tohle je opravdu kousek, øekl bych že je ale moc tìžká pro standartní výbavu, to ani nemluvím o tom kolik potøebuje surovin na výrobu.       
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_15_15"); //Dobrá, pochybuju že najdu nìco lepšího. Díky za tvojí pomoc.	
			AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavySwordsmanKM_13_16"); //Jasný, rádo se stalo. Doufám že budu mít šanci nìjáký z tìch nákresù pøece jenom využít.				
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil tìžkou zbroj šermíøe, nemyslím si že najdu nìco lepšího než tuhle zbroj.");
	          Log_SetTopicStatus (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,LOG_SUCCESS);
};

instance Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro tìžkou zbroj kušišníka domobrany Archolosu.";
};
func int Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowmanArmor) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro tìžkou zbroj kušišníka domobrany Archolosu.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(self, other, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowArmor, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_15_03"); //Takže, tady se píše že na výrobu je potøeba 6 kusù surové oceli, 5 kùží Warga a 2 kùže trola. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí tìžkou zbroj kušišníka domobrany Archolosu z nákresu když mu pøinesu Takže, tady se píše že na výrobu je potøeba 6 kusù surové oceli, 5 kùží Warga a 2 kùže trola.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavyCrossbowmanKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavyCrossbowmanKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavyCrossbowmanKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro tìžkou zbroj kušišníka.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavyCrossbowmanKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 6)
    && (Npc_HasItems(other, ItAt_wargfur) >= 5)
    && (Npc_HasItems(other, ItAt_Trollfur) >= 2)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_HeavyCrossbowmanList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_HeavyCrossbowmanKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_15_01"); //Mám u sebe to co jsi potøeboval pro tìžkou zbroj kušišníka.	
        B_GivePlayerXP(50);			
        B_GiveInvItems(other, self, ItMiSwordraw, 6);
		B_GiveInvItems(other, self, ItAt_wargfur, 5);
        B_GiveInvItems(other, self, ItAt_Trollfur, 2);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_13_12"); //Hotovo, zkus si jí
	B_GiveInvItems(self, Other, NINJA_AMEXPANSION_ITAR_KM_C2, 1);
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,NINJA_AMEXPANSION_ITAR_KM_C2);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_13_14"); //Každý kušišník by byl za tuhle zbroj vdìèný, je škoda že nemáme suroviny aby jsme jich mohly vyrobit víc.     
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_15_15"); //Dobrá, pochybuju že najdu nìco lepšího. Díky za tvojí pomoc.	
		AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_HeavyCrossbowmanKM_13_16"); //Jasný, rádo se stalo. Doufám že budu mít šanci nìjáký z tìch nákresù pøece jenom využít.		
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil tìžkou zbroj kušišníka, nemyslím si že najdu nìco lepšího než tuhle zbroj.");
	          Log_SetTopicStatus (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,LOG_SUCCESS);
};

INSTANCE DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_Condition;
	information = DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_Info;
	permanent   = FALSE;
	description = "";
	Important	= TRUE;
};
FUNC INT DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_Info()
{	
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_13_01"); //Hej, mám tu pro tebe lepší zbroj.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_13_02"); //Estaban nechtìl abych ji prodal, ale myslím si že teï už mu to vadit nebude.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_13_03"); //Za 2700 zlatých je tvá.		
		B_LogEntry (Topic_Addon_BDT_Trader,"Huno mi nabídl dobrou zbroj, chce za ní 2700 zlatých.");
};

instance DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_RSkaufen		(C_INFO)
{
	npc		 	 = 	BDT_1099_Addon_Huno;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_RSkaufen_Condition;
	information	 = 	DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_RSkaufen_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit tìžkou zbroj odpadlíka domobrany Archolosu (Ochrana: 70/70. Bonus 5 bodù obratnosti. Cena: 2700 zlatých)"; 
};
//--------------------------------------
var int DIA_Patch_AMExpansion_Addon_Huno_Armor_RSkaufen_perm;
//--------------------------------------
func int DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_RSkaufen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade))
	&& (DIA_Patch_AMExpansion_Addon_Huno_Armor_RSkaufen_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Addon_Huno_Armor_renegade_RSkaufen_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold,2700))
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Fan, tak já si tu zbroj vezmu.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Jasnì.
		B_GiveInvItems (self,other, NINJA_AMEXPANSION_ITAR_KM_WR,1);
		DIA_Patch_AMExpansion_Addon_Huno_Armor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Žádný zlato, žádná zbroj.
	};
};

//SKIP;
var int Skip_Sword_knows_perm; 

INSTANCE DIA_Patch_AMExpansion_Addon_Skip_Armor   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 3;
	condition   = DIA_Patch_AMExpansion_Addon_Skip_Armor_Condition;
	information = DIA_Patch_AMExpansion_Addon_Skip_Armor_Info;
	permanent   = FALSE;
	description = "Hledám nìjáky nákres pro zbroj, nemohl by jsi mi v tom nìjak pomoct?";
};
FUNC INT DIA_Patch_AMExpansion_Addon_Skip_Armor_Condition()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Andre_LightList))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Patch_AMExpansion_Addon_Skip_Armor_Info()
{	
	AI_Output(other, self, "DIA_Patch_AMExpansion_Addon_Skip_Armor_13_01"); //Hledám nìjáky nákres pro zbroj, nemohl by jsi mi v tom nìjak pomoct?	
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Skip_Armor_13_02"); //Nic takového u sebe nemám. Ale poèkat! Mám u sebe nákres na dva meèe, jednoruèní a obouruèní. Chceš je koupit?
	AI_Output(other, self, "DIA_Patch_AMExpansion_Addon_Skip_Armor_13_03"); //Možná.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Skip_Armor_13_04"); //Za každý budu chtít 1000 zlatých, myslím si že to je dobrá cena.	
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Skip mi mùže prodat nákres pro jednoruèní a obouruèní meè, za každý chce 1000 zlatých.");
		Skip_Sword_knows_perm = TRUE;
};

INSTANCE DIA_Patch_AMExpansion_Addon_Skip_AW_Armor   (C_INFO)
{
	npc         = PIR_1355_Addon_Skip;
	nr          = 3;
	condition   = DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_Condition;
	information = DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_Info;
	permanent   = TRUE;
	description = "Hledám nìjáky nákres pro zbroj, nemohl by jsi mi v tom nìjak pomoct?";
};
FUNC INT DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_Condition()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	&& (Skip_Sword_knows_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_Info()
{	
	AI_Output(other, self, "DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_13_01"); //Hledám nìjáky nákres pro zbroj, nemohl by jsi mi v tom nìjak pomoct?	
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_13_02"); //Nic takového u sebe nemám. Ale poèkat! Mám u sebe nákres na dva meèe, jednoruèní a obouruèní. Chceš je koupit?
	AI_Output(other, self, "DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_13_03"); //Možná.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Addon_Skip_AW_Armor_13_04"); //Za každý budu chtít 1000 zlatých, myslím si že to je dobrá cena.	
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Skip mi mùže prodat nákres pro jednoruèní a obouruèní meè, za každý chce 1000 zlatých.");
		Skip_Sword_knows_perm = TRUE;
};

instance DIA_Patch_AMExpansion_Addon_Skip_Sword1H		(C_INFO)
{
	npc		 	 = 	PIR_1301_Addon_Skip_NW;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Condition;
	information	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres pro vynikající meè domobrany Archolosu (poš. 75, dos. 90, síla 60 Bonus k dovednosti. Cena: 1000 zlatých)"; 
};
//--------------------------------------
var int Skip_Sword_Bouhgt1_perm;
//--------------------------------------
func int DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Condition ()
{
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Andre_LightList))
	&& (Skip_Sword_knows_perm == TRUE)
	&& (Skip_Sword_Bouhgt1_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 1000))
	{
		AI_Output (other, self, "DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Buy_15_00"); //Prodej mi nákres pro jednoruèní meè.
		AI_Output (self, other, "DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Buy_06_01"); //Jasnì.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword1H,1);
		Skip_Sword_Bouhgt1_perm = TRUE;
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem si od Skipa nákres pro jednoruèní meè.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Buy_06_02"); //Nemáš dost zlata.
	};
};

instance DIA_Patch_AMExpansion_Addon_Skip_Sword2H		(C_INFO)
{
	npc		 	 = 	PIR_1301_Addon_Skip_NW;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Condition;
	information	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres pro vynikající obouruèní meè domobrany Archolosu (poš. 90, dos. 110, síla 80 Bonus k dovednosti. Cena: 1000 zlatých)"; 
};
//--------------------------------------
var int Skip_Sword_Bouhgt2_perm;
//--------------------------------------
func int DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Condition ()
{
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Andre_LightList))
	&& (Skip_Sword_knows_perm == TRUE)
	&& (Skip_Sword_Bouhgt2_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 1000))
	{
		AI_Output (other, self, "DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Buy_15_00"); //Prodej mi nákres pro obouruèní meè.
		AI_Output (self, other, "DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Buy_06_01"); //Jasnì.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword2H,1);
		Skip_Sword_Bouhgt2_perm = TRUE;
		B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem si od Skipa nákres pro obouruèní meè.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Buy_06_02"); //Nemáš dost zlata.
	};
};

instance DIA_Patch_AMExpansion_Addon_Skip_AW_Sword1H		(C_INFO)
{
	npc		 	 = 	PIR_1355_Addon_Skip;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Condition;
	information	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword1H_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres pro vynikající meè domobrany Archolosu (poš. 75, dos. 90, síla 60 Bonus k dovednosti. Cena: 1000 zlatých)"; 
};

instance DIA_Patch_AMExpansion_Addon_Skip_AW_Sword2H		(C_INFO)
{
	npc		 	 = 	PIR_1355_Addon_Skip;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Condition;
	information	 = 	DIA_Patch_AMExpansion_Addon_Skip_Sword2H_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres pro vynikající obouruèní meè domobrany Archolosu (poš. 90, dos. 110, síla 80 Bonus k dovednosti. Cena: 1000 zlatých)"; 
};

//Bennet

INSTANCE DIA_Patch_AMExpansion_Bennet_Armornote   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 3;
	condition   = DIA_Patch_AMExpansion_Bennet_Armornote_Condition;
	information = DIA_Patch_AMExpansion_Bennet_Armornote_Info;
	permanent   = FALSE;
	description = "Hledám nìjáký nákres pro zbroj, náhodou tu nic takového nemáš?";
};
FUNC INT DIA_Patch_AMExpansion_Bennet_Armornote_Condition()
{	
	if (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	&& (MIS_RescueBennet == LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Patch_AMExpansion_Bennet_Armornote_Info()
{	
	AI_Output(other, self, "DIA_Patch_AMExpansion_Bennet_Armornote_13_01"); //Hledám nìjáky nákres pro zbroj, náhodou tu nic takového nemáš?	
	AI_Output(self, other, "DIA_Patch_AMExpansion_Bennet_Armornote_13_02"); //Shodou okolností mám, dostal jsem pod ruku dva nákresy na tìžké zbroje. Vypadají že ale patøí nìjáké domobranì, takže pro nì nemám využití. Tobì by se ale hodily že?
	AI_Output(other, self, "DIA_Patch_AMExpansion_Bennet_Armornote_13_03"); //Urèitì.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Bennet_Armornote_13_04"); //Hmm, dobrá prodám ti je. Za každý nákres budu chtít 4000 zlatých.	
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Bennet mi mùže prodat nákresy tìžkých zbrojí domobrany, za každý chce 4000 zlatých.");
};

instance DIA_Patch_AMExpansion_Bennet_Armorsword		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Bennet_Armorsword_Condition;
	information	 = 	DIA_Patch_AMExpansion_Bennet_Armorsword_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres na tìžkou zbroj šermíøe domobrany Archolosu (110/110 Bonus ke zbraním na blízko. Cena: 4000 zlatých)"; 
};
//--------------------------------------
var int Ninja_AMEXPANSION_Bennet_Bouhgt1_perm;
//--------------------------------------
func int DIA_Patch_AMExpansion_Bennet_Armorsword_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Patch_AMExpansion_Bennet_Armornote))
	&& (Ninja_AMEXPANSION_Bennet_Bouhgt1_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Bennet_Armorsword_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 4000))
	{
		AI_Output (other, self, "DIA_Patch_AMExpansion_Bennet_Armorsword_Buy_15_00"); //Prodej mi nákres na tìžkou zbroj šermíøe domobrany Archolosu.
		AI_Output (self, other, "DIA_Patch_AMExpansion_Bennet_Armorsword_Buy_06_01"); //Jasnì.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_SwordsmanArmor,1);
		Ninja_AMEXPANSION_Bennet_Bouhgt1_perm = TRUE;
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem si od Bennet nákres na tìžkou zbroj kušišníka domobrany Archolosu.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_AMExpansion_Bennet_Armorsword_Buy_06_02"); //Nemáš dost zlata.
	};
};

instance DIA_Patch_AMExpansion_Bennet_Armorcrossbow		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Condition;
	information	 = 	DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Info;
	permanent 	 =  TRUE;
	description	 = 	"Koupit nákres na tìžkou zbroj kušišníka domobrany Archolosu (95/95 Bonus ke zbraním na dálku. Cena: 4000 zlatých)"; 
};
//--------------------------------------
var int Ninja_AMEXPANSION_Bennet_Bouhgt2_perm;
//--------------------------------------
func int DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Patch_AMExpansion_Bennet_Armornote))
	&& (Ninja_AMEXPANSION_Bennet_Bouhgt2_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold, 4000))
	{
		AI_Output (other, self, "DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Buy_15_00"); //Prodej mi nákres na tìžkou zbroj kušišníka domobrany Archolosu.
		AI_Output (self, other, "DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Buy_06_01"); //Jasnì.
		B_GiveInvItems (self,other, ItWr_BluePrint_AMEXPANSION_NINJA_CrossbowmanArmor,1);
		Ninja_AMEXPANSION_Bennet_Bouhgt2_perm = TRUE;
		B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Koupil jsem si od Benneta nákres na tìžkou zbroj kušišníka domobrany Archolosu.");
	}
	else
	{
		AI_Output (self, other, "DIA_Patch_AMExpansion_Bennet_Armorcrossbow_Buy_06_02"); //Nemáš dost zlata.
	};
};

instance DIA_Patch_AMExpansion_Bennet_Ask		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr		 	 = 	2;
	condition	 = 	DIA_Patch_AMExpansion_Bennet_Ask_Condition;
	information	 = 	DIA_Patch_AMExpansion_Bennet_Ask_Info;
	permanent 	 =  FALSE;
	description	 = 	"Kde jsi k tìm nákresùm pøišel?"; 
};
func int DIA_Patch_AMExpansion_Bennet_Ask_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Patch_AMExpansion_Bennet_Armornote))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_Bennet_Ask_Info ()
{
	AI_Output(other, self, "DIA_Patch_AMExpansion_Bennet_Ask_13_01"); //Kde jsi k tìm nákresùm pøišel?	
	AI_Output(self, other, "DIA_Patch_AMExpansion_Bennet_Ask_13_02"); //Pøed pár dny se tu obìvil takový podivný chlápek, pøišel smìrem od kaple. Nabízel docela hodnì exotických vìcí ale hned mi došlo že to je bandita a ty vìci jsou nejspíš kradený.
	AI_Output(self, other, "DIA_Patch_AMExpansion_Bennet_Ask_13_03"); //Struènì jsem mu vysvìtlil že ho tu nechi vidìt. Vzal nohy na ramena takovým zpùsobem že mu tyhle dva nákresy vypadly a ztratil se nìkde v lese.
};

instance Ninja_AMExpansion_DIA_Mortis_1hSwordList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_1hSwordList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_1hSwordList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro vynikající meè domobrany.";
};
func int Ninja_AMExpansion_DIA_Mortis_1hSwordList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword1H) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_1hSwordList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_1hSwordList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro vynikající meè domobrany.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_1hSwordList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(self, other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword1H, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_1hSwordList_15_03"); //Takže, tady se píše že na výrobu jsou potøeba 2 kusy surové oceli, 2 kùže divoèáka a 4 tesáky. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_1hSwordList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_1hSwordList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí vynikající meè domobrany z nákresu když mu pøinesu 2 kusy surové oceli, 2 kùže divoèáka a 4 tesáky.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_1hSwordKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_1hSwordKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_1hSwordKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro vynikající meè domobrany.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_1hSwordKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 2)
    && (Npc_HasItems(other, ItAt_Teeth) >= 4)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 2)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_1hSwordList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_1hSwordKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_15_01"); //Mám u sebe to co jsi potøeboval pro vynikající meè domobrany.	
        B_GivePlayerXP(20);			
        B_GiveInvItems(other, self, ItMiSwordraw, 2);
		B_GiveInvItems(other, self, ItAt_Teeth, 4);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 2);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_13_12"); //Hotovo, tady ho máš.
	B_GiveInvItems(other, self, ItMw_1h_mil_AMEXPANSION, 1);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_13_14"); //Není špatný, ale je dùvod proè vìtšina z nás nosí rezavé široké meèe. Prostì na lepší není èas a suroviny.      
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_1hSwordKM_15_15"); //Dobrá, zkusím jestli ještì nìco najdu.
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil vynikající meè domobrany.");
};

instance Ninja_AMExpansion_DIA_Mortis_2hSwordList (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  7;
	condition	 = 	Ninja_AMExpansion_DIA_Mortis_2hSwordList_Condition;
	information	 = 	Ninja_AMExpansion_DIA_Mortis_2hSwordList_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu pro tebe další nákres, tenhle je pro vynikající obouruèní meè domobrany.";
};
func int Ninja_AMExpansion_DIA_Mortis_2hSwordList_Condition ()
{	
	if (Npc_Hasitems(other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword2h) > 0)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_LightList))
	
	{
		return TRUE;
	};
};
func void Ninja_AMExpansion_DIA_Mortis_2hSwordList_Info ()
{
    AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_2hSwordList_15_01"); //Mám tu pro tebe další nákres, tenhle je pro vynikající obouruèní meè domobrany.
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_2hSwordList_13_02"); //Dej mi tedy nákres a dáme se do toho.
	B_GiveInvItems(self, other, ItWr_BluePrint_AMEXPANSION_NINJA_Sword2h, 1);
				B_UseFakeScroll ();
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_2hSwordList_15_03"); //Takže, tady se píše že na výrobu jsou potøeba 3 kusy surové oceli, 3 kùže divoèáka a 8 tesákù. 
	AI_Output(self, other, "Ninja_AMExpansion_DIA_Mortis_2hSwordList_15_04"); //Dones mi suroviny, já se dám do práce.
	AI_Output(other, self, "Ninja_AMExpansion_DIA_Mortis_2hSwordList_15_05"); //Jdu na to.
	B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis vyrobí vynikající obouruèní meè domobrany z nákresu když mu pøinesu 3 kusy surové oceli, 3 kùže divoèáka a 8 tesákù.");
};

instance DIA_Patch_AMExpansion_MORTIS_MILITIA_2hSwordKM (C_INFO)
{
	npc			 =  MIL_314_MORTIS;
	nr			 =  8;
	condition	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_2hSwordKM_Condition;
	information	 = 	DIA_Patch_AMExpansion_MORTIS_MILITIA_2hSwordKM_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám u sebe to co jsi potøeboval pro vynikající obouruèní meè domobrany.";
};
func int DIA_Patch_AMExpansion_MORTIS_MILITIA_2hSwordKM_Condition ()
{	
	if (Npc_HasItems(other, ItMiSwordraw) >= 3)
    && (Npc_HasItems(other, ItAt_Teeth) >= 8)
    && (Npc_HasItems(other, ItAt_Addon_Keilerfur) >= 3)
	&& (Npc_KnowsInfo (other, Ninja_AMExpansion_DIA_Mortis_2hSwordList))
	{
		return TRUE;
	};
};
func void DIA_Patch_AMExpansion_MORTIS_MILITIA_2hSwordKM_Info ()
{
    AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_15_01"); //Mám u sebe to co jsi potøeboval pro vynikající obouruèní meè domobrany.	
        B_GivePlayerXP(20);			
        B_GiveInvItems(other, self, ItMiSwordraw, 3);
		B_GiveInvItems(other, self, ItAt_Teeth, 8);
        B_GiveInvItems(other, self, ItAt_Addon_Keilerfur, 3);
        AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_15_10"); //Tady to je.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_13_11"); //Vypadá to že máš všechno, já se tedy do toho pustím.
        
        B_LookAtNpc(other, self);
        AI_UseMob(self, "BSFIRE", 1);
        AI_UseMob(self, "BSFIRE", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSANVIL", 1);
        AI_UseMob(self, "BSANVIL", -1);
        B_TurnToNpc(other, self);

        AI_UseMob(self, "BSCOOL", 1);
        AI_UseMob(self, "BSCOOL", -1);
        B_TurnToNpc(other, self);
        B_TurnToNpc(self, other);
        
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_13_12"); //Hotovo, tady ho máš.
	B_GiveInvItems(other, self, ItMw_2h_mil_AMEXPANSION, 1);
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_13_13"); //Hmmm.
        AI_Output(self, other, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_13_14"); //Není špatný, ale je dùvod proè vìtšina z nás nosí rezavé široké meèe. Prostì na lepší není èas a suroviny.      
	   AI_Output(other, self, "DIA_Patch_AMExpansion_MORTIS_2hSwordKM_15_15"); //Dobrá, zkusím jestli ještì nìco najdu.
				B_LogEntry (TOPIC_Ninja_AMEXPANSION_Andre_AMQUEST,"Mortis mi vyrobil vynikající obouruèní meè domobrany.");
};