call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set "CC=clang"
set "CXX=clang++"
REM set "CC=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"
REM set "CXX=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\cl.exe"


rd /s /q build
rd /s /q install
mkdir build
mkdir install
cmake . -G "Ninja" -B build
ninja -C build
