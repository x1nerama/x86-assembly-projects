section .data 
    msg: db "Numbers are equal", 25
    str: equ $ - msg

    msg2: db "Numbers are not equal ", 25


section .bss   
    var1:       resb 4


section .text 
    global _start

_start:
        mov eax,10
        mov ebx,10
        cmp eax,ebx 
        jz equal       ; if ZF = 0
        jnz notEqual    ; else ZF = 1
       
notEqual:
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,25
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

equal:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,str
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

    ;