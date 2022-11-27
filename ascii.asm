; ASCII Table kullanılarak "beko" kelimesi yazdıran asm projesi (basic project)

section .bss
	var1: resb 4 

section .text
	global _start

_start:
	call bChar
	call eChar
	call kChar
	call oChar

	mov eax,0x1
	mov ebx,0x0
	int 0x80

bChar:
	mov esi,97
	mov edi,1
	add esi,edi
	mov [var1],esi
	
	mov eax,0x4
	mov ebx,0x1
	mov ecx,var1
	mov edx,0x10
	int 0x80
	ret

eChar:
	mov esi,100
	mov edi,1
	add esi,edi
	mov [var1],esi

	mov eax,0x4
	mov ebx,0x1
	mov ecx,var1
	mov edx,10
	int 0x80
	ret

kChar:
	mov esi,106
	mov edi,1
	add esi,edi
	mov [var1],esi

	mov eax,0x4
	mov ebx,0x1
	mov ecx,var1
	mov edx,10
	int 0x80
	ret

oChar:
	mov esi,110
	mov edi,1
	add esi,edi
	mov [var1],esi

	mov eax,0x4
	mov ebx,0x1
	mov ecx,var1
	mov edx,10
	int 0x80
	ret
