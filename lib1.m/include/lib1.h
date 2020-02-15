#if __LIB1
    #define ExportedByLib1 __declspec(dllexport)
#else
    #if __clang__
        #define ExportedByLib1
    #else
        #define ExportedByLib1 __declspec(dllimport)
    #endif
#endif