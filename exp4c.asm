section .data
    numbers db 1,2,3,4,5,6,7
    msg1 db 'Even : '
    len1 equ $ - msg1
    msg2 db 'Odd : '
    len2 equ $ - msg2
    nl db 0ax
   
section .bss
    even1 resb 1
    odd1 resb 1


section .text
global _start      
_start:                    
        mov cl, 0
        mov dl, 7 ;total array elements
        mov esi,numbers
        
        call evenodd
       
        mov al, 7
        sub al, cl
       
        add al, '0'
        mov [even1], al
        add cl, '0'
        mov [odd1], cl
       
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1 ;display msg1
        mov edx, len1
        int 80h
       
        mov eax, 4
        mov ebx, 1
        mov ecx, even1 ;negative count
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
        mov ecx, odd1 ;postive count
        mov edx, 1
        int 80h
       
        mov eax, 1
        int 80h
       
evenodd: 
        mov al, [esi]
        and al, 1
        jz even
        inc cl
        inc esi
        dec dl
        jnz evenodd
        ret
       
even:    
        inc esi
        dec dl
        jnz evenodd
        ret
