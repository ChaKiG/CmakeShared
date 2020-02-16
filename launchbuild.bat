call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

rem set "CC=C:\Program Files\LLVM\bin\clang-cl.exe"
rem set "CXX=C:\Program Files\LLVM\bin\clang-cl.exe"
set "CC=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"
set "CXX=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"


rd /s /q build
rd /s /q install
mkdir build
mkdir install
rem cmake . -G "Visual Studio 16 2019" -B build
cmake . -G "Ninja" -B build
cd build 
ninja
rem msbuild ALL_BUILD
cd ..
