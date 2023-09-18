global manage
extern input_array
extern output_array
extern sum_array
extern printf
extern callf

max_size equ 8

section .data
    intro1 db "We will take care of all of your array needs.", 10, 0
    thanks db "Thank you. The numbers in the array are: ", 0
    final1 db "The sum of numbers in the array is %lf", 0
    final2 db "Thank you for using Array Management System.", 0

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

; Print intro1
    
    mov rax, 0
    mov rdi, stringformat
    mov rsi, intro1
    call printf

; block to call input_array

    mov rax, 0
    mov rdi, array
    mov rsi, max_size
    call input_array

; block to call output_array

    mov rax, 0
    mov rdi, array
    mov rsi, max_size
    call output_array


; block to call sum_array

; block to print & return sum_array results

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


