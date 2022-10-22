section .data
    output1:  db "Negative", 10
    str1: equ $ - output1

    output2: db "Positive", 10
    str2: equ $ - output2

section .text
    global _start

_start:
        mov eax,10
        mov ebx,5
        cmp eax,ebx ; SF = 0
        js sign         ; jump if sign 
        jns notSign     ; jump if not sign

sign:
    mov eax,4
    mov ebx,1
    mov ecx,output1
    mov edx,str1
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

notSign:
    mov eax,4
    mov ebx,1
    mov ecx,output2
    mov edx,str2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80