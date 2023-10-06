#include <cstdio>
#include <iostream>
using namespace std;

extern "C" unsigned long* director();

int main()
{
    cout << "\nWelcome to a great program developed by Dylan Zuniga\n";

    unsigned long count;
    double** array;
    unsigned long* results;

    results = director();

    count = (unsigned long)results[0];
    array = (double**)results[1];

    cout << "The main function received this set of numbers:\n";

    for(int i = 0; i < count; ++i){
        printf("%1.10f\n", *array[i]);
    }

    cout << "Main will keep these and send a zero to the operating system.\n";

    return 0;
}