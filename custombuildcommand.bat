
rd /s /q custoBuild
mkdir custoBuild

mkdir custoBuild\clang
mkdir custoBuild\clang\cl
mkdir custoBuild\clang\link1
mkdir custoBuild\clang\link2

rem compile
call clang-cl lib1.m\SRC\lib1help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__LIB1 /D_MBCS /MDd /GS /GR /Fo"custoBuild\clang\cl\lib1" /Fd"custoBuild\cl\lib1" /Gd /TP 
call clang-cl lib2.m\SRC\lib2help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__LIB2 /D_MBCS /MDd /GS /GR /Fo"custoBuild\clang\cl\lib2" /Fd"custoBuild\cl\lib2" /Gd /TP 
call clang-cl main.m\src\main.cpp     /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__MAIN /D_MBCS /MDd /GS /GR /Fo"custoBuild\clang\cl\main" /Fd"custoBuild\cl\main" /Gd /TP 

rem METHOD 1 : call msvc with "lib /def" 
rem and then call lld-link with ocrrect import libs
call lib /def /NOLOGO /MACHINE:X64 /machine:x64 custoBuild\clang\cl\lib1.obj /OUT:custoBuild\clang\link1\lib1.lib
call lib /def /NOLOGO /MACHINE:X64 /machine:x64 custoBuild\clang\cl\lib2.obj /OUT:custoBuild\clang\link1\lib2.lib
call lld-link /NOLOGO custoBuild\clang\cl\lib1.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link1 lib2.lib /DLL /OUT:custobuild\clang\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call lld-link /NOLOGO custoBuild\clang\cl\lib2.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link1 lib1.lib /DLL /OUT:custobuild\clang\link2\lib2.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call lld-link /NOLOGO custoBuild\clang\cl\main.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link2 lib1.lib lib2.lib /OUT:custobuild\clang\link2\main.exe KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB

rem METHOD 2 : call lld-link with /force:unresolved to allow incomplete dll
rem and then link with import libs created 
call lld-link /NOLOGO custoBuild\clang\cl\lib1.obj /opt:noref /INCREMENTAL /MACHINE:X64 /DLL /OUT:custobuild\clang\link1\lib1.dll /force:unresolved 
call lld-link /NOLOGO custoBuild\clang\cl\lib2.obj /opt:noref /INCREMENTAL /MACHINE:X64 /DLL /OUT:custobuild\clang\link1\lib2.dll /force:unresolved 
call lld-link /NOLOGO custoBuild\clang\cl\lib1.obj /opt:noref /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link1 lib2.lib /DLL /OUT:custobuild\clang\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call lld-link /NOLOGO custoBuild\clang\cl\lib2.obj /opt:noref /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link1 lib1.lib /DLL /OUT:custobuild\clang\link2\lib2.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call lld-link /NOLOGO custoBuild\clang\cl\main.obj /opt:noref /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\clang\link2 lib1.lib lib2.lib /OUT:custobuild\clang\link2\main.exe KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB





mkdir custoBuild\msvc
mkdir custoBuild\msvc\cl
mkdir custoBuild\msvc\link1
mkdir custoBuild\msvc\link2

rem compile
call cl lib1.m\SRC\lib1help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__LIB1 /D_MBCS /MDd /GS /GR /Fo"custoBuild\msvc\cl\lib1" /Fd"custoBuild\msvc\cl\lib1" /Gd /TP
call cl lib2.m\SRC\lib2help.cpp /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__LIB2 /D_MBCS /MDd /GS /GR /Fo"custoBuild\msvc\cl\lib2" /Fd"custoBuild\msvc\cl\lib2" /Gd /TP
call cl main.m\src\main.cpp     /c /Ilib1.m\include /Ilib2.m\include /Zi /nologo /Od /Ob0 /DWIN32 /D_WINDOWS /D__MAIN /D_MBCS /MDd /GS /GR /Fo"custoBuild\msvc\cl\main" /Fd"custoBuild\msvc\cl\main" /Gd /TP
rem create lib + exp symbols
call lib /def /NOLOGO /MACHINE:X64 /machine:x64 custoBuild\msvc\cl\lib1.obj /OUT:custoBuild\msvc\link1\lib1.lib
call lib /def /NOLOGO /MACHINE:X64 /machine:x64 custoBuild\msvc\cl\lib2.obj /OUT:custoBuild\msvc\link1\lib2.lib
rem create mutual dependant dll using exp
call link /NOLOGO custoBuild\msvc\cl\lib1.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\msvc\link1 lib2.lib /DLL /OUT:custobuild\msvc\link2\lib1.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call link /NOLOGO custoBuild\msvc\cl\lib2.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\msvc\link1 lib1.lib /DLL /OUT:custobuild\msvc\link2\lib2.dll KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB
call link /NOLOGO custoBuild\msvc\cl\main.obj /INCREMENTAL /MACHINE:X64 /LIBPATH:custobuild\msvc\link2 lib1.lib lib2.lib /OUT:custobuild\msvc\link2\main.exe KERNEL32.LIB USER32.LIB GDI32.LIB WINSPOOL.LIB SHELL32.LIB OLE32.LIB OLEAUT32.LIB UUID.LIB COMDLG32.LIB ADVAPI32.LIB


