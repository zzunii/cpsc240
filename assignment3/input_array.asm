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
;     File Name: input_array.asm
;     Langauge: x86
;     Syntax: Intel
;     Assemble: nasm -f elf64 -l input_list.lis -o input-asm.o input_array.asm
;     Link: gcc -m64 c-output.o manage-asm.o input-asm.o output-asm.o sum-asm.o -o arrayzz -fno-pie -no-pie -std=c++17
; ===== Begin code area ===============================================================================================

global input_array
extern scanf
extern printf
extern malloc


section .data
    newline db " ", 10, 0
    floatformat db "%lf", 0
    stringformat db "%s", 0 

section .bss

section .text
input_array:

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

; Print prompt

    mov r13, rdi            ; r13 is the array
    mov r14, rsi            ; r14 is the number of cells
    xor r15, r15            ; r15 == 0
    jmp input_begin
input_begin:

    cmp r15, r14             ;if r15 >= r14
    je input_done            ;     then we are done

    mov rdi, 8
    call malloc
    mov r12, rax
    mov rdi, floatformat
    mov rsi, r12
    call scanf
    mov [r13 + 8 * r15], r12
  
    cdqe                   
    cmp rax, -1                 ;checks for control_d
    je input_done               ;control_d is pressed
    
    inc r15

    jmp input_begin                ;Repeat the loop

input_done:

    mov rdi, newline
    call printf

    mov rax, r15            ; returns the count of the array
    

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