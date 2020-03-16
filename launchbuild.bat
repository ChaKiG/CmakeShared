call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set "CC=clang"
set "CXX=clang++"
REM set "CC=cl"
REM set "CXX=cl"

rd /s /q build
rd /s /q install

cmake -GNinja -B build -DCMAKE_INSTALL_PREFIX=.\install
cmake --build build
cmake --instal build
