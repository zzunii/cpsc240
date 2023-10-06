global  asmfunction
extern  input_array
extern  output_array
extern  printf
extern  scanf
max_size equ 10

section .data
    intro db "This program will sort all of your doubles",0
    prompt db "Please enter floating point numbers seperated by white space. After the last numeric input enter at least one more white space and press ctrl-d.",0
    thanks db "Thank you. You entered these numbers",0
    end_output db "End of output array.",0
    sort_prompt db "The array is now being sorted without moving any numbers.",0
    print_array db "The data in the array are now ordered as follows",0
    finish db "The array will be sent back to the caller function.",0

    stringformat db "%s",10,0
    floatformat db "%lf",10,0
    formalfloat db "%.10f",10,0
    
    ; Debugs (DELETE WHEN FINISHED)
    debugStart db "~ director start ~",10,0


section .bss
    MyTwo resq 2
    items resq max_size

section .text
asmfunction:    
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

; =========================================================================


    mov rax, 0                                                              
    mov rdi, stringformat                                               ; '%s'
    mov rsi, debugStart                                                 ; '~ director start ~'
    call printf

    mov rax, 0
    mov rdi, stringformat                                               ; '%s'
    mov rsi, intro                                                      ; 'This program will sort all of your doubles'
    call printf                                                         

    mov rax, 0
    mov rdi, stringformat                                               ; '%s'
    mov rsi, prompt                                                     ; 'Please enter floating point numbers seperated by white space. After the last numeric input enter at least one more white space and press ctrl-d.'
    call printf

    ; block for input_array
    mov rax, 0
    mov rdi, items
    mov rsi, max_size
    call input_array
    mov rbx, rax

    mov rax, 0
    mov rdi, stringformat
    mov rsi, thanks
    call printf

    ; block for output_array for the unsorted array

    mov rax, 0
    mov rdi, items
    mov rsi, rbx
    call output_array

    ; block to return values to main driver
    mov [MyTwo + 0 * 8], rbx
    mov rax, items
    mov [MyTwo + 1 * 8], rax


; =========================================================================

    mov rax, MyTwo

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

