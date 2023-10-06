#include <cstdio>
#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" void sort_array(double* myarr[], long size);

// myarr[i]     = pointer address
// (*myarr[i])  = double value
void sort_array(double* myarr[], long size){
    int j;
    double* key;
    for(int i = 1; i < size; i++){
        key = myarr[i];
        j = i - 1;
        while(j >= 0 && (*myarr[j]) > (*key)){
            myarr[j + 1] = myarr[j];
            --j;
        }
        myarr[j + 1] = key;
    }
}