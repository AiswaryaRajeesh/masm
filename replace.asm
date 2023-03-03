data segment 
str1 db 20 dup("$")
msg1 db 10,13, "enter the string:$"
msg2 db 10,13, "enter the character to replace:$"
msg3 db 10,13, "enter the character to be replaced:$"
msg4 db 10,13, "replaced string:$"
data ends

code segment
assume cs:code,ds:data
start
mov ax,data
mov dx,ax

mov ah,09h
lea dx,msg1
int 21h


       


mov ah,4ch
int 21h

code ends
end start
