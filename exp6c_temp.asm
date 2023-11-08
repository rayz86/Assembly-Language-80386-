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
	
	msg1 db "enter 8 elements: "
	msgl1 equ $-msg1
	
	msg2 db "entered elements are: "
	msgl2 equ $-msg2
	
	msg3 db "greater element found",13,10
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
    
    write msg2,msgl2
    mov esi,arr
    mov ecx,num
output:
    	push ecx
    	write esi,1
    	write space,1
    	inc esi
    	pop ecx
    	loop output

    mov edi,arr
    mov ecx,num
    
    push ecx
    mov eax,edi
    cmp eax,[arr+1]
    jg greater
    inc edi
    
greater:
    write 
    
    mov eax,1
    int 80h