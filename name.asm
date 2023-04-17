section .data
	msg db 'hello world',13,10
	msglgth equ $-msg
	msg1 db 13,10,'my name is Rayyan'
	msgl equ $-msg1
	
section .text
	global _start
_start:
	mov edx,msglgth
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,msgl
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 80h
	
	;to exit
	mov eax,1
	int 80h
