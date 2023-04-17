section .data
    numbers db 3,10,-69,2,-1,-8
    msg1 db 'Positive : '
    len1 equ $ - msg1
    msg2 db 'Negative : '
    len2 equ $ - msg2
    nl db 0ax
   
section .bss
    ne resb 1
    pos resb 1


section .text
global _start      
_start:                    
        mov cl, 0
        mov dl, 6 
        mov esi,numbers
       
  	call posneg
        mov al, 6
        sub al, cl
       
        add al, '0'
        mov [pos], al
        add cl, '0'
    mov [ne], cl
       
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1 ;display msg1
        mov edx, len1
        int 80h
       
        mov eax, 4
        mov ebx, 1
        mov ecx, ne ;negative count
        mov edx, 1
        int 80h
       
        mov eax, 4
        mov ebx, 1
        mov ecx, nl
        mov edx, 1
        int 80h
       
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2 ;display msg2
        mov edx, len2
        int 80h
       
        mov eax, 4
        mov ebx, 1
        mov ecx, pos ;postive count
        mov edx, 1
        int 80h
       
        mov eax, 1
        int 80h
       
 posneg: mov al, [esi]
        rcl al, 1
        jc negetive
        inc cl
        inc esi
        dec dl
        jnz posneg
        ret
       
negetive:inc esi
         dec dl
         jnz posneg
         ret
