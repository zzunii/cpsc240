#!/bin/bash

# Author: Dylan Zuniga
# Program name:

rm *.o
rm *.out

echo "Compiling director.asm file..."
nasm -f elf64 -l manage_list.lis -o director-asm.o director.asm

echo "Compiling input_array.asm file..."
nasm -f elf64 -l input_list.lis -o input-asm.o input_array.asm

echo "Compiling output_array.asm file..."
g++ -c -m64 -Wall -o output-cpp.o output_array.cpp -fno-pie -no-pie -std=c++17

#echo "Compiling sum_array file..."
#nasm -f elf64 -l sort_list.lis -o sum-asm.o sort_array.asm

echo "Compiling main.cpp file..."
g++ -c -m64 -Wall main.cpp -o main-driver.o -fno-pie -no-pie -std=c++17

echo "Compiling sort_array.cpp file..."
g++ -c -m64 -Wall sort_array.cpp -o cpp-sort-array.o -fno-pie -no-pie -std=c++17

echo "Linking the five object files..."
g++ -m64 main-driver.o director-asm.o input-asm.o output-cpp.o -o sortarray -fno-pie -no-pie -std=c++17

echo "===== Running the program =========================================================================="
echo ""
./sortarray