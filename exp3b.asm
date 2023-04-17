section .data
	msgn db 13,10, 'enter a number:'
	msgnl equ $-msgn
	
	msge db 13,10, 'NUMBER IS EVEN'
	msgel equ $-msge
	
	msgo db 13,10, 'NUMBER IS ODD'
	msgol equ $-msgo
	
	
section .bss
	n resb 1
	
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
	
	mov eax,[n]
	sub eax,'0'
	
	and eax,1
	jz even
	
	mov edx,msgol
	mov ecx,msgo
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
even:
	mov edx,msgel
	mov ecx,msge
	mov ebx,1
	mov eax,4
	int 80h
	
	jmp exit
	
exit:
	mov eax,1
	int 80h
	
	
	
	
	
	
	
	
	
