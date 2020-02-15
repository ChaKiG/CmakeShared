#if __LIB2
    #define ExportedByLib2 __declspec(dllexport)
#else
    #if __clang__
        #define ExportedByLib2
    #else
        #define ExportedByLib2 __declspec(dllimport)
    #endif
#endif