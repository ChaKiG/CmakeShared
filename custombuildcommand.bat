


rd /S /Q custoBuild

# compile to obj
cl lib1\SRC\lib1help.cpp /c /Ilib1\include /Ilib2\include /Zi /nologo /W1 /WX- /diagnostics:column /Od /Ob0 /D WIN32 /D _WINDOWS /D __LIB1 /D _MBCS /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /GR /Fo"custoBuild\cl\\" /Fd"custoBuild\cl\\" /Gd /TP
cl lib2\SRC\lib2help.cpp /c /Ilib1\include /Ilib2\include /Zi /nologo /W1 /WX- /diagnostics:column /Od /Ob0 /D WIN32 /D _WINDOWS /D __LIB2 /D _MBCS /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /GR /Fo"custoBuild\cl\\" /Fd"custoBuild\cl\\" /Gd /TP
cl main.cpp /c /Ilib1\include /Ilib2\include /Zi /nologo /W1 /WX- /diagnostics:column /Od /Ob0 /D WIN32 /D _WINDOWS /D _MBCS /Gm- /EHsc /RTC1 /MDd /GS /fp:precise /Zc:wchar_t /Zc:forScope /Zc:inline /GR /Fo"custoBuild\cl\\" /Fd"custoBuild\cl\\" /Gd /TP

# create lib + exp symbols
lib /NOLOGO /MACHINE:X64 /machine:x64 /DEF custoBuild\cl\lib1.obj /OUT:custoBuild\link1\lib1.lib
lib /NOLOGO /MACHINE:X64 /machine:x64 /DEF custoBuild\cl\lib2.obj /OUT:custoBuild\link1\lib2.lib



# create mutual dependant dll using exp
link /NOLOGO custoBuild\cl\lib1.obj /INCREMENTAL /MACHINE:X64 custobuild\link1\lib2.lib /DLL /OUT:custobuild\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
link /NOLOGO custoBuild\cl\lib2.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\link1 lib1.lib /DLL /OUT:custobuild\link2\lib2.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
link /NOLOGO custoBuild\cl\main.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\link2 lib1.lib lib2.lib /OUT:custobuild\link2\main.exe KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB




# compile to obj
cl lib1\SRC\lib1help.cpp ... /Fo"build\cl\lib1.obj"
cl lib2\SRC\lib2help.cpp ... /Fo"build\cl\lib2.obj"

# create lib + exp symbols
lib /DEF build\cl\lib1.obj /OUT:build\link1\lib1.lib
lib /DEF build\cl\lib2.obj /OUT:build\link1\lib2.lib

# create mutual dependant dll using exp
link build\cl\lib1.obj /LIBPATH:build\link1 lib2.lib /DLL /OUT:build\link2\lib1.dll 
link build\cl\lib2.obj /LIBPATH:build\link1 lib1.lib /DLL /OUT:build\link2\lib2.dll

