section .data
	msg1 db 13,10, 'enter 1st number:'
	msg1l equ $-msg1
	
	msg2 db 13,10, 'enter 2nd number:'
	msg2l equ $-msg2
	
	msg3 db 13,10, 'enter 3rd number:'
	msg3l equ $-msg3
	
	msgn1 db 13,10, '1st number is greatest'
	msgn1l equ $-msgn1
	
	msgn2 db 13,10, '2nd number is greatest'
	msgn2l equ $-msgn2
	
	msgn3 db 13,10, '3rd number is greatest'
	msgn3l equ $-msgn3
	
section .bss
	n1 resb 1
	n2 resb 1
	n3 resb 1

section .text
global _start

_start:
	mov edx,msg1l
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,n1
	mov edx,2
	int 80h
	
	mov edx,msg2l
	mov ecx,msg2
	mov ebx,1
	mov eax,4
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,n2
	mov edx,2
	int 80h
	
	mov edx,msg3l
	mov ecx,msg3
	mov ebx,1
	mov eax,4
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,n3
	mov edx,2
	int 80h
	
	mov eax,n1
	mov ebx,n2
	
	cmp eax,ebx
	jg l1
	mov eax,n2
	cmp eax,ebx
	jg ln2
	
	mov edx,msgn3l
	mov ecx,msgn3
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
l1:
	mov eax,n1
	mov ebx,n3
	cmp eax,ebx
	jg ln1
	
	mov edx,msgn3l
	mov ecx,msgn3
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
ln1:
	mov edx,msgn1l
	mov ecx,msgn1
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
ln2:
	mov edx,msgn2l
	mov ecx,msgn2
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
exit:
	mov eax,1
	int 80h
	
	
	
	
	
	
