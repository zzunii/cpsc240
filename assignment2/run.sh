#!/bin/bash

# Author: Dylan Zuniga
# Program name:

rm *.o
rm *.out

echo "Compiling manage file..."
nasm -f elf64 -l manage_list.lis -o manage-asm.o manage.asm

echo "Compiling input_array file..."
nasm -f elf64 -l input_list.lis -o input-asm.o input_array.asm

echo "Compiling output_array file..."
nasm -f elf64 -l output_list.lis -o output-asm.o output_array.asm

#echo "Compiling sum_array file..."
#nasm -f elf64 -l sum_list.lis -o sum-asm.o sum_array.asm

echo "Compiling C file..."
gcc -c -m64 -Wall -fno-pie -no-pie -o c-output.o main.c -std=c17


#echo "Linking the five object files..."
g++ -m64 c-output.o manage-asm.o input-asm.o output-asm.o -o arrayzz -fno-pie -no-pie -std=c++17

#g++ -m64 manage-asm.o input-asm.o output-asm sum-asm c-output -o arrayzz -fno-pie -no-pie -std=c++17

echo "======= Running the program ===================================================="
echo ""
./arrayzz