#include "lib1help.h"
#include "lib2help.h"
#include <iostream>

using namespace std;

Lib1Help::Lib1Help()
{
    cout << "ctor lib1" << endl;
}

Lib1Help::~Lib1Help()
{
    cout << "dtor lib1" << endl;
}

void Lib1Help::Lib1Help_Print()
{
    cout << "Print lib1" << endl;
    cout << "Using Lib2 : " << endl;
    Lib2Help help2;
    help2.Lib2Help_RemotePrint();
}

void Lib1Help::Lib1Help_RemotePrint()
{
    cout << "Print lib1 remote" << endl;
}


