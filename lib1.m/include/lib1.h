#if __LIB1
    #define ExportedByLib1 __declspec(dllexport)
#else
    #define ExportedByLib1 __declspec(dllimport)
#endif