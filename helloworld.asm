section .data
	msg db 'Hello World',13,10
	msglgth equ $-msg

section .text
	global _start
_start:
	mov edx,msglgth
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	
	;to exit
	mov eax,1
	int 80h
