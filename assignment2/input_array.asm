global input_array
extern scanf
extern printf

section .data
    newline db " ", 10, 0
    floatformat db "%lf", 0
    stringformat db "%s", 0 
    prompt db "Please input float numbers seperated by WS. After the last number, press WS followed by control-d", 10, 0
    debug db "inputted number: %lf",10, 0
    testy db "Reached end of loop", 0

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

    mov rax, 0
    mov rdi, stringformat
    mov rsi, prompt
    call printf

    mov r14, rdi            ; r14 is the array
    mov r15, rsi            ; r15 is the number of cells
    xor r13, r13   
begin:
         
    cmp r13, r15            ; if r13 > r15
    jge done                 ; then we are done
    mov rax, 0              ; clear rax
    mov rdi, floatformat    ; first incoming parameter
    ;push qword 0        
    ;push qword 0           ; segfault -_-
    mov rsi, rsp            ; second incoming parameter
    call scanf

    cdqe                    ; 
    cmp rax, -1             ; checks for control_d
    je done                 ; control_d is pressed
    
    ;pop rbx
    mov [r14 + r13 * 8], rbx
    inc r13                 ; increment r13 by one OR r13++
    ;pop rax

    jmp begin

done:

    mov rax, r13

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