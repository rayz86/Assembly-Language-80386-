section .data
	msg db 'enter a number:'
	msglgth equ $-msg
	msg1 db 13,10,'the entered number is:'
	msgl equ $-msg1

section .bss
	num resb 1
	
section .text
	global _start
_start:
	mov edx,msglgth
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,1
	mov ecx,num
	mov ebx,0
	mov eax,3
	int 80h
	
	mov edx,msgl
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,1
	mov ecx,num
	mov ebx,1
	mov eax,4
	int 80h
	
	;to exit
	mov eax,1
	int 80h
