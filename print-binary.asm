section .data
	inputMsg: db "Enter a Binary: ",0x0A
	inputLen: equ $ - inputMsg

section .bss
	binary: resb 32
    	currentBinaryLocation: resb 32
    	loopCounter: resb 32

section .text
    global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,inputMsg
	mov edx,inputLen
	int 0x80

	mov eax,3
	mov ebx,1
	mov ecx,binary
	mov edx,32
	int 0x80

	mov ecx,0
	mov edi,binary
	jmp _loop

_exit:
	mov eax,1
	xor ebx,ebx
	int 0x80

_nextBinary:
	; In this section, bit 1 is advanced when 0 is detected in the binary input
	inc ecx
_loop:
	; in this section, if the end of the string is reached, the program is terminated
	cmp byte [edi + ecx],0
	je _exit

	; Important Section. If the user enters a number greater than 1 in the input, it is advanced by 1 bit to skip this value.
	cmp byte [edi + ecx],'1'
	jg _nextBinary

	; In this section, if there is a 0 in the input, 1 bit is advanced.
	cmp byte [edi + ecx],'0'
	je _nextBinary

	; The program is directed to the _printOneBinary function to print the value 1 on the screen
	call _printOneBinary

	mov ecx,[loopCounter]
	mov dl,byte [currentBinaryLocation]
	mov byte [edi + ecx],dl
	inc ecx
	
	jmp _loop

_printOneBinary:
	mov dl,byte [edi + ecx]
	mov [currentBinaryLocation],dl
	mov [loopCounter],ecx
	
	mov eax,4
	mov ebx,1
	mov ecx,currentBinaryLocation
	mov edx,32
	int 0x80
	ret
