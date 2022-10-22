section .data
        msg1: db "Enter a Number:", 0x25
        str1: equ $ - msg1

section .bss
    var1:       resb 5

section .text
        global _start

_start:
        call askNumber1
        call readNumber
        call printTotal

        mov eax,1
        mov ebx,0
        int 0x80

readNumber:
    mov eax,3
    mov ebx,1
    mov ecx,var1
    mov edx,25
    int 0x80
    ret 

askNumber1:
        mov eax,4
        mov ebx,1
        mov ecx,msg1
        mov edx,str1
        int 0x80
        ret

printTotal:
        mov eax,4
        mov ebx,1
        mov esi,1
        add [var1],esi
        mov ecx,var1
        mov edx,25
        int 0x80
        ret