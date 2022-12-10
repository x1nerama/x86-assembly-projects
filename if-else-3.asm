section .data
	input1:	db "1.Sayiyi Giriniz: ",10
	str1:	equ $ - input1

	input2: db "2.Sayiyi Giriniz: ",10
	str2:	equ $ - input2
	
	msg1:	db "nm1 > nm2", 10
	str3:	equ $ - msg1

	msg2:	db "nm2 > nm1", 10
	str4:	equ $ - msg2

section .bss
	var1:	resb 4
	var2:	resb 4

section .text
	global _start

_start:
	call userinput1
	call readInput1

	call userinput2
	call readInput2

	mov edi,[var1]
	mov esi,[var2]
	cmp esi,edi
	jl jumpGreater
	jnl jumpLess

jumpGreater:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,str3
	int 0x80

	mov eax,1
	mov ebx,0
	int 0x80

jumpLess:
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,str4
	int 0x80

	mov eax,1
	mov ebx,0
	int 0x80

readInput1:
	mov eax,3
	mov ebx,1
	mov ecx,var1
	mov edx,10
	int 0x80
	ret

readInput2:
	mov eax,3
	mov ebx,1
	mov ecx,var2
	mov edx,10
	int 0x80
	ret

userinput1:
	mov eax,4
	mov ebx,1
	mov ecx,input1
	mov edx,str1
	int 0x80
	ret

userinput2:
	mov eax,4
	mov ebx,1
	mov ecx,input2
	mov edx,str2
	int 0x80
	ret
