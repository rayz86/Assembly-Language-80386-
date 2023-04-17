section .data
	msg db 'to display stars',13,10
	msglgth equ $-msg
	stars db '*'
	strl equ $-stars
	st times 10 db '*'

section .text
	global _start
_start:
	mov edx,msglgth
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,strl
	mov ecx,stars
	mov ebx,1
	mov eax,4
	mov edx,10
	int 80h
	
	;to exit
	mov eax,1
	int 80h
