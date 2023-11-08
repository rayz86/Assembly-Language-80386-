	
	%macro write_str 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	%endmacro
	
section .data
	msg1 db 13,10, 'Hello' ,13,10
	msg1l equ $-msg1
	
	msg2 db 13,10, 'Welcome to Micoprocessors and Microcontrollers Lab!' ,13,10
	msg2l equ $-msg2
	
	
section .text
global _start

_start:
	write_str msg1,msg1l
	write_str msg2,msg2l
	
	mov eax,1
	int 80h
