section .data
	msg1 db 13,10, 'enter 1st number:'
	msg1l equ $-msg1
	
	msg2 db 13,10, 'enter 2nd number:'
	msg2l equ $-msg2
	
	msgs db 13,10, 'SUM:'
	msgsl equ $-msgs
	
section .bss
	num1 resb 2
	num2 resb 2
	sum1 resb 1
	
section .text
global _start

_start:
	;printf
	mov edx,msg1l
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 80h
	
	;scanf
	mov eax,3
	mov ebx,0
	mov ecx,num1
	mov edx,2
	int 80h
	
	mov edx,msg2l
	mov ecx,msg2
	mov ebx,1
	mov eax,4
	int 80h
	
	mov eax,3
	mov ebx,0
	mov ecx,num2
	mov edx,2
	int 80h
	
	;--------------ADDITION-------------
	mov eax,[num1]
	sub eax,'0'
	
	mov ebx,[num2]
	sub ebx,'0'
	
	add eax,ebx
	add eax,'0'
	
	mov [sum1],eax
	
	mov edx,msgsl
	mov ecx,msgs
	mov ebx,1
	mov eax,4
	int 80h
	
	mov edx,1
	mov ecx,sum1
	mov ebx,1
	mov eax,4
	int 80h
	;---------------------------------
	
	mov eax,1
	int 80h
