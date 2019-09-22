#include "lib2help.h"
#include "lib1help.h"
#include <iostream>

using namespace std;

Lib2Help::Lib2Help()
{
    cout << "ctor lib2" << endl;
}

Lib2Help::~Lib2Help()
{
    cout << "dtor lib2" << endl;
}

void Lib2Help::Lib2Help_Print()
{
    cout << "Print lib2" << endl;
    cout << "Using Lib1 : " << endl;
    Lib1Help help1;
}