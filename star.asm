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
