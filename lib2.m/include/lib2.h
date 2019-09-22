#ifdef __LIB2
    #define ExportedByLib2 __declspec(dllexport)
#else
    #define ExportedByLib2 __declspec(dllimport)
#endif