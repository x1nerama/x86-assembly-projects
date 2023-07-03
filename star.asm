; Author: devTBenoth
; This program lists stars according to the given value
; For example, if we consider that we give 5 to ecx, the output of the program will be as follows:
; *
; **
; ***
; ****
; *****
; ****
; ***
; **
; *
; After increasing the number of stars according to the value you give, the program decreases the ecx value until it reaches 1.

section .bss
  	var: resb 32

section .text
  	global _start

_start:
  	xor ecx, ecx

_loop:
  	cmp ecx, 20
  	je _decEcx

	mov eax, 42
  	mov [var + ecx], eax
  	inc ecx
  	mov byte [var + ecx], 0x0A
  	call _printMessage
  	jmp _loop

_decEcx:
	cmp ecx, 1
	je _exit
	dec ecx
	mov [var + ecx],ecx
	mov byte [var + ecx],0x0A
	call _printMessage
  	jmp _decEcx

_printMessage:
  	mov esi,ecx
  	mov eax,4
  	mov ebx,1
  	mov ecx,var
  	mov edx,32
  	int 0x80
  	mov ecx,esi
	ret

_exit:
  	mov eax,1
  	xor ebx,ebx
  	int 0x80
