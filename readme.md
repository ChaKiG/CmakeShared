# Linking mutually dependents DLLs

## Why

During a project, I wanted to integrate some new tools into our processes. In particular Clang. However, since we use a custom in-house, I had to completely reinvent our toolchain. Since Cmake is currently the "de facto" toolchain configurator, I decided to go for it.

However, like most in-house custom tools, our toolchain is really flexible as to what it considers "Okay". As such we have a lot of interdependant DLLs. 

## How

Let's take as examples Lib1 and Lib2, where Lib1 uses symbols from Lib2, and Lib2 uses symbols from Lib1.  
In order to to create the Lib1 DLL, we need exported symbols from Lib2, which in turn need exported symbols from Lib1. Currently we resolved this by linking in two phases, as described here : [Mutual Imports](https://docs.microsoft.com/en-us/cpp/build/mutual-imports?view=vs-2019).  
This gives us the following steps :

1. Compile sources
2. Create lib1.lib/exp AND lib2.lib/exp from source (without linking them together)
3. Create lib1.DLL using lib1.obj and lib2.lib/lib2.exp  
4. Create lib2.DLL using lib2.obj and lib1.lib/lib1.exp

The commands in order to do this can be seen in [custombuildcommand.bat](custombuildcommand.bat)

The following project aims at recreating this particular behavior using Cmake
