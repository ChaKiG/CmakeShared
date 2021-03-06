# Linking mutually dependents DLLs

## Why

During a project I wanted to integrate some new tools into our processes, and was kept back by a completely custom in-house toolchain. In order to integrate these "standard" tools, I had to create an equivalence between our build toolchain and a standard one. Since Cmake is currently the "de facto" toolchain configurator, I decided to go for it.

However, like most in-house custom tools, our toolchain is really flexible as to what it considers "Okay". As such, we have a lot of interdependent DLLs, that Cmake doesn't handle well (and I do not resent it...).

## How

Let's take as examples Lib1 and Lib2, where Lib1 uses symbols from Lib2, and Lib2 uses symbols from Lib1.  
In order to create the Lib1 DLL, we need exported symbols from Lib2, which in turn need exported symbols from Lib1. Currently we resolved this by linking in two phases, as described here : [Mutual Imports](https://docs.microsoft.com/en-us/cpp/build/mutual-imports?view=vs-2019).  
This gives us the following steps :

1. Compile sources
2. Create static libs

- Create lib1.lib/exp from objects
- Create lib2.lib/exp from objects

3. Create DLL

- Create lib1.DLL using lib1.obj and lib2.lib/lib2.exp 
- Create lib2.DLL using lib2.obj and lib1.lib/lib1.exp


The commands in order to do this can be seen in [custombuildcommand.bat](custombuildcommand.bat)

The following project aims at recreating this particular behavior using Cmake

## Try it

* if you already know cmake, then go for it !
* I tested this using:
  * Ninja generators
  * clang 9.0 for MSVC toolchain
* An example of such configuration can be found in [launchbuild.bat](launchbuild.bat)
