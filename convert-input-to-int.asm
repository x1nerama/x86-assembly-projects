;    *********************************************************************************
;    *                                                                               *
;    *  A program that converts user-entered data to integer in x86 Linux assembly.  *
;    *                                                                               *
;    *                            author: x1nerama                                   *
;    *                                                                               *
;    *********************************************************************************


; --> In assembly projects, inputs from the user are taken as strings. 
; --> So the purpose of this project is to have the user convert his input to int.

section .data
	inmsg: db "Enter a String: "
	instr: equ $ - inmsg

	totalmsg: db "Total: "
	totalStr: equ $ - totalmsg

section .bss
	var: resb 10

section .text
	global _start

_start:
  ; The message asking the user to input a string is printed on the screen
	mov eax,4
	mov ebx,1
	mov ecx,inmsg
	mov edx,instr
	int 0x80

  ; The string input by the user is read and saved in variable named var
	mov eax,3
	mov ebx,1
	mov ecx,var
	mov edx,10
	int 0x80

  ; The values in the 4 registers here are reset
	xor eax,eax ; => eax = 0
	xor ebx,ebx ; => ebx = 0
	xor ecx,ecx ; => ecx = 0
	xor edx,edx ; => edx = 0
	mov ecx,var   ; => Here var's variable is moved to ecx
	mov esi,[ecx] ; => Here ecx's address is moved to esi

; This part is an important part of the project
; Here, the loop is started to convert individual characters of the input string to int
_loopForConvert:
  
	cmp esi,0 ; => The 0 specified here indicates the end of the string. Like '\0' in C language
	je _end   ; => If the end of the character in esi is reached, go to the _end label

	sub esi,'0' ; => Subtract the ASCII value of character '0' from the value stored in the ESI register
	mov ebx,10  ; => Load the value 10 into the EBX register
	mul ebx     ; => Multiply the value in the EAX register with the value in the EBX register, and store the result in the EAX register
	add eax,edx ; => Add the value in the EDX register to the value in the EAX register, and store the result in the EAX register

	inc ecx             ; => Increment the value stored in the ECX register
	mov esi,[ecx]       ; => Load the value stored at the memory location pointed to by the ECX register into the ESI register
	jmp _loopForConvert ; => Jump to the label "_loopForConvert"

_end:
  ; Prints the user's input converted to an int
	mov eax,4
	mov ebx,1
	mov ecx,totalmsg
	mov edx,totalStr
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,var
	mov edx,10
	int 0x80
  
	mov eax,1
	xor ebx,ebx
	int 0x80
