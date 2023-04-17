section .data
	msg db 'Upper Case:'
	msgl equ $ -msg
	
	msgn db 'Lower case:'
	msgnl equ $ -msgn
	
	msgi db 'INVALID INPUT'
	msgil equ $ -msgi
	
section .bss
	n resb 2
	n1 resb 2
	
section .text
	global _start

_start:
	;print stats of upper case
	mov edx,msgnl
	mov ecx,msgn
	mov ebx,1
	mov eax,4
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,n
	mov edx,2
	int 80h
	
	call uptolow

	;print stats of lower case
	mov edx,msgl
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,2
	mov ecx,n1
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
uptolow:
	mov al,[n]
	cmp al,'a'
	jb invalid
	
	cmp al,'z'
	ja invalid
	
	sub al,32
	mov [n1],al
	ret
	
invalid:
	mov edx,msgil
	mov ecx,msgi
	mov ebx,1
	mov eax,4
	int 80h
	jmp exit
exit:
	mov eax,1
	int 80h
	
	
	
	
