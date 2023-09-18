global output_array
extern manage
extern printf
extern scanf

section .data
    floatformat db "%lf" , 0
    stringformat db "%s" , 0
    printnumbers db "Thank you, The numbers in the array are: " ,10,0, 

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
    
    mov rax, 0
    mov rdi, stringformat
    mov rsi, printnumbers
    call printf             ; prints prompt

    mov r14, rdi            ; r14 is the array
    mov r15, rsi            ; r15 is the number of cells
    xor r13, r13  

; Begin loop to print array
begin:
    ; test 1 - print 1st element    
    


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



