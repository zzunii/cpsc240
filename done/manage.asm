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
;     File Name: manage.asm
;     Langauge: x86
;     Syntax: Intel
;     Assemble: nasm -f elf64 -l manage_list.lis -o manage-asm.o manage.asm
;     Link: gcc -m64 c-output.o manage-asm.o input-asm.o output-asm.o sum-asm.o -o arrayzz -fno-pie -no-pie -std=c++17
; ===== Begin code area ===============================================================================================

global manage
extern input_array
extern output_array
extern sum_array
extern printf
extern callf

max_size equ 8

section .data
    intro_ db "We will take care of all of your array needs.", 10, 0
    prompt db "Please input float numbers seperated by WS. After the last number, press WS followed by control-d", 10, 0
    thanks db "Thank you. The numbers in the array are: ",10, 0
    final1 db "The sum of numbers in the array is %.10f",10, 0
    final2 db "Thank you for using Array Management System.",10, 0

    stringformat db "%s", 0
    floatformat db "%lf", 0

section .bss
    array resq max_size

section .text


manage:
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

; Print intro_
    mov rax, 0
    mov rdi, stringformat
    mov rsi, intro_
    call printf

; Print first prompt

    mov rax, 0
    mov rdi, stringformat
    mov rsi, prompt
    call printf

; block to call input_array

    mov rax, 0
    mov rdi, array              ; Sends array
    mov rsi, max_size           ; Sends number of cells
    call input_array
    mov rbx, rax                ; stores array length in rbx

; Input Arrary done check
    mov rdi, stringformat
    mov rsi, thanks
    call printf

    mov rax, 0
    mov rdi, array
    mov rsi, rbx
    call output_array

    mov rax, 0
    mov rdi, array
    mov rsi, rbx
    call sum_array
    push qword 0
    movsd [rsp], xmm8

    push qword 0
    mov rax, 1
    mov rdi, final1
    movsd xmm0, xmm8 
    call printf
    pop rax

    movsd xmm0, xmm8
    pop rax


; =======================================
;  * * * * * * * 16 PUSHES * * * * * * *
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


