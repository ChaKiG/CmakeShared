call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set "CC=C:\Program Files\LLVM\bin\clang-cl.exe"
set "CXX=C:\Program Files\LLVM\bin\clang-cl.exe"
rem set "CC=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"
rem set "CXX=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"


rd /s /q build
rd /s /q install
mkdir build
mkdir install
cmake . -G "Ninja" -B build
cd build 
ninja
cd ..
