section .data 
    msg1: db "Numbers are equal ", 15
    str1: equ $ - msg1

    msg2: db "Numbers are not equal ", 15
    str2: equ $ - msg2

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
    mov edx,str2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

equal:
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,str1
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80