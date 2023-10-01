; =====================================================================================================================
; Program name: "Array Management System". This program demonstrates how to pass an array
; Through assembly language and gathers the sum of the array. The max array length is 8.
; Copyright (C) 2023 Dylan Zuniga
;
; Author Information
;     Author Name: Dylan Zuniga
;     Author Email: zuniga18dz@csu.fullerton.edu
;
; Program Information
;     Program Name: Array Management System
;     Programming Languages: One module in C, four in x86
;     Date Program Began: 2023-Sep-05
;     Date Program Completed: 2023-Sep-24
;     Date Comments Upgraded: 2023-Sep-24
;     Files in the program: main.c, manage.asm, input_array.asm, output_array.asm, sum_array.asm, run.sh
;     Status: Completed. Challenge Part not present in program.
;
; Purpose (Academic)
;     Allow's the user to input 8 numbers into an array and get the total sum of the array
;
; This file
;     File Name: sum_array.asm
;     Langauge: x86
;     Syntax: Intel
;     Assemble: nasm -f elf64 -l sum_list.lis -o sum-asm.o sum_array.asm
;     Link: gcc -m64 c-output.o manage-asm.o input-asm.o output-asm.o sum-asm.o -o arrayzz -fno-pie -no-pie -std=c++17
; ===== Begin code area ===============================================================================================

extern manage
extern printf
extern scanf
global sum_array

section .data
    sum db "The sum of numbers in the array is %.10f",10,0
section .bss

section .text
sum_array:
; ======================================= 
;  * * * * * * * 16 PUSHES * * * * * * *  
; ======================================= 
    push       rbp                                              
    mov        rbp, rsp                                         
    push       rbx                                              
    push       rcx                                              
    push       rdx                                              
    push       rsi                                              
    push       rdi                                              
    push       r8                                               
    push       r9                                               
    push       r10                                              
    push       r11                                              
    push       r12                                              
    push       r13                                              
    push       r14                                              
    push       r15                                              
    pushf

; =======================================
;  * * * START OF THE APPLICATION * * *
; =======================================

    mov r13, rdi                ; array
    mov r14, rsi                ; array length
    xor r15, r15                ; count
    xorpd xmm8, xmm8            ; The sum of the array

sum_begin:

    cmp r15, r14
    jge sum_done

    movsd xmm9, [r13+8*r15]
    addsd xmm8, xmm9

    inc r15
    jmp sum_begin

sum_done:

    movsd xmm0, xmm8
; =======================================
; * * * * * * * * 16 POPS * * * * * * * *
; =======================================
    popf                                                        
    pop        r15                                              
    pop        r14                                              
    pop        r13                                              
    pop        r12                                              
    pop        r11                                              
    pop        r10                                              
    pop        r9                                               
    pop        r8                                               
    pop        rdi                                              
    pop        rsi                                              
    pop        rdx                                              
    pop        rcx                                              
    pop        rbx                                              
    pop        rbp      

    ret