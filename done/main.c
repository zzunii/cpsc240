/* ====================================================================================================================
Program name: "Array Management System". This program demonstrates how to pass an array
Through assembly language and gathers the sum of the array. The max array length is 8.
Copyright (C) 2023 Dylan Zuniga
=======================================================================================================================
Author Information
    Author Name: Dylan Zuniga
    Author Email: zuniga18dz@csu.fullerton.edu

Program Information
    Program Name: Array Management System
    Programming Languages: One module in C, four in x86
    Date Program Began: 2023-Sep-05
    Date Program Completed: 2023-Sep-24
    Date Comments Upgraded: 2023-Sep-24
    Files in the program: main.c, manage.asm, input_array.asm, output_array.asm, sum_array.asm, run.sh
    Status: Completed. Challenge Part not present in program.

Purpose (Academic)
    Allow's the user to input 8 numbers into an array and get the total sum of the array

This file
    File Name: main.c
    Langauge: C
    Assemble: gcc -c -m64 -Wall -fno-pie -no-pie -o c-output.o main.c -std=c17
    Link: gcc -m64 c-output.o manage-asm.o input-asm.o output-asm.o sum-asm.o -o arrayzz -fno-pie -no-pie -std=c++17
==== Begin code area ================================================================================================*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern double manage();

int main()
{
    printf("\nWelcome to the Array Management System\n");
    printf("This product is maintained by Dylan Zuniga at zuniga18dz@csu.fullerton.edu\n \n");

    double result = manage();

    printf("The main function received %.10f and will keep it for a while\n", result);
    printf("Please consider buying more software from our suite of commercial program.\n");
    printf("A zero will be returned to the operating system. Bye\n");

    return 0;
}