
rd /s /q custoBuild
mkdir custoBuild\cl
mkdir custoBuild\link1
mkdir custoBuild\link2


rem compile
call cl lib1.m\SRC\lib1help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /W1 /WX- /diagnostics:column /Od /Ob0 /D WIN32 /D _WINDOWS /D __LIB1 /D _MBCS /MDd /GS /GR /Fo"custoBuild\cl\lib1" /Fd"custoBuild\cl\lib1" /Gd /TP
call cl lib2.m\SRC\lib2help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /W1 /WX- /diagnostics:column /Od /Ob0 /D WIN32 /D _WINDOWS /D __LIB2 /D _MBCS /MDd /GS /GR /Fo"custoBuild\cl\lib2" /Fd"custoBuild\cl\lib2" /Gd /TP
call cl main.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /D WIN32 /D _WINDOWS /D _MBCS /Gm- /EHsc /RTC1 /MDd /GS /GR /Fo"custoBuild\cl\\" /Fd"custoBuild\cl\\" /Gd /TP

rem create lib + exp symbols
call lib /NOLOGO /MACHINE:X64 /machine:x64 /DEF custoBuild\cl\lib1.obj /OUT:custoBuild\link1\lib1.lib
call lib /NOLOGO /MACHINE:X64 /machine:x64 /DEF custoBuild\cl\lib2.obj /OUT:custoBuild\link1\lib2.lib

rem create mutual dependant dll using exp
call link /NOLOGO custoBuild\cl\lib1.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\link1 lib2.lib /DLL /OUT:custobuild\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call link /NOLOGO custoBuild\cl\lib2.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\link1 lib1.lib /DLL /OUT:custobuild\link2\lib2.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call link /NOLOGO custoBuild\cl\main.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\link2 lib1.lib lib2.lib /OUT:custobuild\link2\main.exe KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB




link /NOLOGO build\lib1.m\CMakeFiles\lib1_obj.dir\src\lib1help.cpp.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:build\lib2.m lib2_s.lib /DLL /OUT:custobuild\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
