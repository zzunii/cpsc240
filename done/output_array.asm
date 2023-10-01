; =====================================================================================================================
; Program name: "Array Management System". This program demonstrates how to pass an array
; Through assembly language and gathers the sum of the array. The max array length is 8.
; Copyright (C) 2023 Dylan Zuniga
; =====================================================================================================================
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
;     File Name: output_array.asm
;     Langauge: x86
;     Syntax: Intel
;     Assemble: nasm -f elf64 -l output_list.lis -o output-asm.o output_array.asm
;     Link: gcc -m64 c-output.o manage-asm.o input-asm.o output-asm.o sum-asm.o -o arrayzz -fno-pie -no-pie -std=c++17
; ===== Begin code area ===============================================================================================

global output_array
extern input_array
extern sum_array
extern manage
extern printf
extern scanf

section .data
    newline db "",10,0
    floatformat db "%.10f" ,10, 0
    stringformat db "%s" , 0
    printnumbers db "Thank you, The numbers in the array are: " ,10,0,
    print_array db "%.10f" ,10,0 

section .bss

section .text
output_array:
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
;  * *  * START OF THE APPLICATION * * * 
; =======================================

    mov r13, rdi                        ; Array
    mov r14, rsi                        ; max num
    xor r15, r15                        ; r15 = 0

begin_loop:

    cmp r15, r14
    jge loop_done

    mov rax, 1
    mov rdi, print_array
    movsd xmm0, [r13+8*r15]
    call printf

    inc r15

    jmp begin_loop

loop_done:

    xor rax, rax

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



