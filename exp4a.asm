section .data

	ecnt dw 31h

	msg db 'the converted number is '
	msglength equ $ -msg

	msg1 db ' '
	msgl1 equ $-msg1
	
section .bss
	space resb 2

section .text
	global _start

_start:
	mov bx,word[ecnt]
	mov ecx,2
	mov edi,space

DUP: 	rol bl,04
	mov al,bl
	and al,0fh
	cmp al,09h
	jbe NEXT
	add al,07h

NEXT: 	add al,30h
	mov [edi],al
	inc edi
	loop DUP

	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,msglength
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,space
	mov edx,2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,msgl1
	int 80h

	mov eax, 1
	int 80h 
		
	
