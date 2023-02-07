; Assembly Program to show which of two numbers is greater or less


section .data
	msg1: 	db "nm1 > nm2", 15
	str1: equ $ - msg1

	msg2:	db "nm2 > nm1", 15
	str2: equ $ - msg2
	
section .text
	global _start

_start:
	mov edi,21
	mov esi,24
	cmp edi,esi	
	jge jumpGreater ; if (nm1 > nm2)
	jl jumpLess	; if (nm2 > nm1)	

jumpGreater:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,str1
	int 0x80
	
	mov eax,1
	mov ebx,0
	int 0x80

jumpLess:
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,str2
	int 0x80
	
	mov eax,1
	mov ebx,0
	int 0x80
