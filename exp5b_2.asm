	
	%macro write_str 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	
	%endmacro
	
	%macro get_num 2
	mov eax,3
	mov ebx,0
	mov ecx,%1
	mov edx,%2
	int 80h
	
	%endmacro
	
section .data
	msg1 db 13,10, 'Enter a number:'
	msg1l equ $-msg1
	
	msg2 db 13,10, 'The number entered was: '
	msg2l equ $-msg2
	
section .bss
	n1 resb 2

section .text
global _start

_start:
	write_str msg1,msg1l
	get_num n1,2
	write_str msg2,msg2l
	write_str n1,2
	
	mov eax,1
	int 80h
