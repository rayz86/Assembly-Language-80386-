section .data
	msg db "Displaying nos from 0-9" ,13,10
	msgl equ $-msg
	
section .bss
	num resb 1
	
section .text
global _start

_start:
	mov edx,msgl
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	mov ecx,'9'
	sub ecx,'0'
	mov eax,'1'
	
up:
	mov [num],eax
	push ecx
	mov eax,4
	mov ecx,num
	mov edx,1
	int 80h
	
	mov eax,[num]
	sub eax,'0'
	
	inc eax
	add eax,'0'
	pop ecx
	loop up
	
	mov eax,1
	int 80h
