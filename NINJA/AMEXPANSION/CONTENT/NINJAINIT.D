const string Ninja_AMExpansion_Version = "AMExpansion 1.0";

/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_AMExpansion_Init() {
    // Init Ikarus&Lego
    LeGo_MergeFlags(LeGo_PermMem);
    
    MEM_Info(ConcatStrings(ConcatStrings("Initialize ", Ninja_AMExpansion_Version), "."));
    Patch_AM_Init();
    MEM_Info(ConcatStrings(Ninja_AMExpansion_Version, " was initialized successfully."));
};
