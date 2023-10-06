#!/bin/bash

# Debugger

rm *.o
rm sortarray.out

nasm -f elf64 -g -gdwarf -l manage_list.lis -o director-asm.o director.asm
nasm -f elf64 -g -gdwarf -l input_list.lis -o input-asm.o input_array.asm

g++ -c -m64 -Wall -std=c++17 -g -o output-cpp.o output_array.cpp -fno-pie -no-pie
g++ -c -m64 -Wall -std=c++17 -g -o main-driver.o main.cpp -fno-pie -no-pie
g++ -c -m64 -Wall -std=c++17 -g -o cpp-sort.o sort_array.cpp -fno-pie -no-pie

g++ -m64 -o sortarray.out main-driver.o output-cpp.o cpp-sort.o input-asm.o director-asm.o -fno-pie -no-pie -std=c++17 -g

gdb ./sortarray.out
