

set "CC=C:\Program Files\LLVM\bin\clang-cl.exe"
set "CXX=C:\Program Files\LLVM\bin\clang-cl.exe"

rd /s /q build
mkdir build
cmake . -G "Ninja" -B build
cd build 
ninja
cd ..
