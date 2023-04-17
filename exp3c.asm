section .data
	msgn db 13,10, 'enter a number:'
	msgnl equ $-msgn
	
	msge db 13,10, 'NUMBER IS positive'
	msgel equ $-msge
	
	msgo db 13,10, 'NUMBER IS negative'
	msgol equ $-msgo
	
	
section .bss
	n resb 2
	
section .text
global _start

_start:
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
	
	mov al,[n]
	sub al,'0'
	rol al,1
	
	jc neg
	
	mov edx,msgel
	mov ecx,msge
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
neg:
	mov edx,msgol
	mov ecx,msgo
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
exit:
	mov eax,1
	int 80h
