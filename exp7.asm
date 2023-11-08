%macro display 2
	mov edx,%2
	mov ecx,%1
	mov ebx,1
	mov eax,4
	int 80h
%endmacro

%macro read 2
	mov edx,%2
	mov ecx,%1
	mov ebx,0
	mov eax,3
	int 80h
%endmacro

section .data

	msg db 10,"The array contains the elements",10,13
	msglen equ $-msg
	msg1 db 10,"Enter element to be searched :"
	len1 equ $-msg1
	msg2 db 10,"The element is present in array at position : "
	len2 equ $-msg2
	msg3 db 10,"The element is not present in array",10,13
	len3 equ $-msg3
	array db 14h, 18h, 28h, 69h, 91h
	newline db 10,13
	space db " "

section .bss
	num1 resb 3
	temp resb 1
	pos resb 1
	counter1 resb 1
	counter2 resb 1
	result resb 4

section .text
	global _start
_start: display msg,msglen
	mov byte[counter1],05
	mov esi,array
	
next: 	mov al,[esi]
	push esi
	call disp

	pop esi
	inc esi
	dec byte[counter1]
	jnz next
	display msg1,len1
	read num1,3
	call convert

	mov [temp],bl
	xor eax,eax
	xor ebx,ebx
	mov al,00h
	mov bl,04h

up: 	mov esi,array
	xor edx,edx
	mov dl,al
	xor eax,eax
	mov al,dl
	add al,bl
	xor edx,edx
	mov dl,02h
	div dl
	xor ecx,ecx
	mov cl,al
	add esi,ecx
	xor edx,edx
	mov dl,[temp]
	cmp dl,[esi]
	je next1
	jb next2
	add al,01h
	jmp under

next2:  xor ebx,ebx
	mov bl,al
	dec bl
	xor eax,eax
	mov al,00h
	jmp under

next1:  inc al
	add al,30h
	mov [pos],al
	display msg2,len2
	display pos,1
	display newline,1
	jmp exit

under:  js low
	cmp al,bl
	jbe up

low:    display msg3,len3
	display newline,1

exit: 	mov eax,1
	mov ebx,0
	int 80h


convert: mov edi,num1
	xor ecx,ecx
	mov cl,02h
	xor ebx,ebx

above:  rol bl,04
	mov al,[edi]
	cmp al,39h
	jbe below
	sub al,07h

below: sub al,30h
	add bl,al
	inc edi
	loop above
	ret

disp: 	mov bl,al
	mov edi,result
	mov cx,02

again:	rol bl,4
	mov al,bl
	and al,0fh
	cmp al,09
	jg down
	add al,30h
	jmp skip

down: 	add al,37h
	
skip:   mov[edi],al
	inc edi
	dec cx
	jnz again
	display result,2
	display space,2
	ret
