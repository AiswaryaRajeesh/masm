data segment
    msg1 db 10,13,"Enter the string:$"
    msg2 db 10,13,"Reversed string:$"
    str1 db 20 DUP("$")
    str2 db 20 DUP("$")
data ends

code segment
    assume cs:code,ds:data
    start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h

        lea si,str1
        mov cl,00h
        repeat:mov ah,01h
               int 21h
               cmp al,13
               je exit1
               mov [si],al
               inc si
               add cl,01h
               jmp repeat

               exit1:inc cl
               lea di,str2
               mov dl,'$'

               cmp [si],dl
               je exit2
               exit2:dec si
                     sub cl,01h
                     cmp cl,00h
                     je exit3
                     mov al,[si]
                     mov [di],al
                     inc di
                     jmp exit2

                     exit3:lea dx,msg2
                           mov ah,09h
                           int 21h


                           lea dx,str2
                           mov ah,09h
                           int 21h

                           mov ah,4ch
                           int 21h

                           code ends
                           end start