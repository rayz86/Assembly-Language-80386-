	%macro write 2
	mov eax,4
    	mov ebx,1
    	mov ecx,%1
    	mov edx,%2
    	int 80h
    	%endmacro
	
	%macro scan 2
	mov eax,3
    	mov ebx,0
    	mov ecx,%1
    	mov edx,%2
    	int 80h
    	%endmacro
    	
section .data
	num equ 8
	
	msg1 db "enter 8 elements:"
	msgl1 equ $-msg1
	
	msg3 db "entered elements are :",13,10
	msgl3 equ $-msg3
	
	space db " "
	
section .bss
	arr resb 8
	extr resb 1

section .text
global _start

_start:
	write msg1,msgl1
	mov edi,arr
    	mov ecx,num
input :
    	push ecx
    	scan edi,1
    	scan extr, 1 
    	inc edi
    	pop ecx
    	loop input
    
    write msg3,msgl3 
    mov esi,arr
    mov ecx,num
output:
    	push ecx ; push ecx
    	write esi,1
    	write space,1
    	inc esi
    	pop ecx
    	loop output
	
    	mov eax,1
    	int 80h
