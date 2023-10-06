#include <cstdio>
#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" void output_array(double* myarr[], long size);

void output_array(double* myarr[], long size){
    for (int i = 0; i < size; i++){
        printf("%.10f\n", (*myarr[i]));
    }
}