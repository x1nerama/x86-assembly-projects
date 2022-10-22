section .data
    input: db "Enter your Name: ", 18    ; char input[100];

section .bss
    name:   resb 6


section .text
    global _start


_start:
        call askName
        call readName
        call printName

        mov eax,1
        mov ebx,0
        int 0x80

readName:
        mov eax,3
        mov ebx,1
        mov ecx,name
        mov edx,25
        int 0x80
        ret

askName: 
        mov eax,4
        mov ebx,1
        mov ecx,input
        mov edx,18
        int 0x80
        ret


printName:
    mov eax,4
    mov ebx,1
    mov ecx,name
    mov edx,25
    int 0x80
    ret