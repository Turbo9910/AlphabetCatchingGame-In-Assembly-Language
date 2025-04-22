[org 0x100]

jmp start


start:

call green
call orange
call pur
call red
call print
input:
mov ah, 0x01
int 21h
cmp al,0x0d
jne input
call blue
call print2
call print5
xor ax,ax
mov es,ax
mov ax,[es:9*4]
mov [oldkbisr],ax
mov ax,[es:9*4+2]
mov [oldkbisr+2],ax
cli
mov word[es:9*4],mykeyboard
mov [es:9*4+2],cs
mov word[es:8*4],myalphabet
mov [es:8*4+2],cs
sti
mov ax,0x3100
int 21h

print:
mov ax,0xb800
mov es,ax
mov ax,0
mov di,2140
mov ah,0x0A
mov si,message
mov cx,19
cld
nextchar:
lodsb
stosw
loop nextchar
ret


print2:
push di
mov ax,0xb800
mov es,ax
mov ax,0
mov di,302
mov ah,0x0A
mov si,message2
mov cx,6
cld
nextchar2:
lodsb
stosw
loop nextchar2
pop di
ret




print5:
push di
mov ax,0xb800
mov es,ax
mov ax,0
mov di,462
mov ah,0x0A
mov si,message4
mov cx,7
cld
nextchar3:
lodsb
stosw
loop nextchar3
pop di
ret



clrscr:
mov ax, 0xb800
mov es, ax
mov di, 0
NextChar:
mov word [es:di], 0x0720
add di, 2
cmp di,3840
jne NextChar
mov di,2156
mov word[es:di],0x0A47
add di,2
mov word[es:di],0x0A61
add di,2
mov word[es:di],0x0A6d
add di,2
mov word[es:di],0x0A65
add di,2
mov word[es:di],0x0720
add di,2
mov word[es:di],0x0A4f
add di,2
mov word[es:di],0x0A76
add di,2
mov word[es:di],0x0A65
add di,2
mov word[es:di],0x0A72
add di,2
mov word[es:di],0x0A21

mov di,2316
mov word[es:di],0x0A53
add di,2
mov word[es:di],0x0A63
add di,2
mov word[es:di],0x0A6F
add di,2
mov word[es:di],0x0A72
add di,2
mov word[es:di],0x0A65
add di,2
mov word[es:di],0x0A3A
push word[cs:score]
call printnum3

ret

red:
 push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov di, 800 ; point di to top left column
 mov ax, 0x4620 ; space char in normal attribute
 mov cx, 480 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; func3ar the whole screen
 pop di 
 pop cx
 pop ax
 pop es
 ret

blue:
 push es
 push ax
 push cx
 push di
 mov ax, 0xb800


 mov es, ax ; point es to video base
 mov di, 0 ; point di to top left column
 mov ax, 0x1120 ; space char in normal attribute
 mov cx, 2000 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; func3ar the whole screen
 pop di 
 pop cx
 pop ax
 pop es
 ret

orange: 
push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov di, 2560 ; point di to top left column
 mov ax, 0x6020 ; space char in normal attribute
 mov cx,2000; 800 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; clear the whole screen
 pop di 
 pop cx
 pop ax
 pop es
 ret

green:
 push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov di, 0 ; point di to top left column
 mov ax, 0x2120 ; space char in normal attribute
 mov cx, 400 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; clear the whole screen
 pop di 
 pop cx
 pop ax
 pop es
 ret

pur: 
push es
 push ax
 push cx
 push di
 mov ax, 0xb800
 mov es, ax ; point es to video base
 mov di, 1760; 2560
;point di to top left column
 mov ax, 0x5020 ; space char in normal attribute
 mov cx,720; 2000 ; number of screen locations
 cld ; auto increment mode
 rep stosw ; clear the whole screen
 pop di 
 pop cx
 pop ax
 pop es
 ret

mykeyboard:
push ax


xor ax, ax
xor bx,bx
mov ax, 0xb800
mov es, ax
mov ax, 0



in al, 0x60
mov dx,[cs:col]

cmp al, 0x4D

jne nextcmp
add dx,1
cmp dx,81
je exit
mov di,[cs:loc]
mov word [es:di], 0x1120
mov word[cs:col],dx
add word[cs:loc], 2
mov di,[cs:loc]

mov word [es:di], 0x17DC
jmp exit
nextcmp:
cmp al, 0x4B
jne nomatch
sub dx,1
cmp dx,0
je exit
mov word[cs:col],dx
mov word [es:di], 0x1120
sub word[cs:loc], 2
mov di,[cs:loc]

mov word [es:di], 0x17DC
jmp exit

nomatch:
pop ax
jmp far [cs:oldkbisr]

exit:
pop ax
mov al, 0x20
out 0x20, al
iret

printcolor:
mov ax,0xb800
mov es,ax
mov ax,0x0A20
mov di,3840
mov cx,80
rep stosw
ret

printnum:
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax
mov ax, [bp+4]
mov bx, 10
mov cx, 0
nextdigit: mov dx, 0
div bx ; divide by 10
add dl, 0x30
push dx
inc cx
cmp ax, 0 ; is the quotient zero
jnz nextdigit ; if no divide it again
mov di, 154
nextpos:
pop dx
mov dh, 0x0A
mov [es:di], dx
add di, 2
loop nextpos
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2


printnum3:
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax
mov ax, [bp+4]
mov bx, 10
mov cx, 0
nextdigit3: mov dx, 0
div bx ; divide by 10
add dl, 0x30
push dx
inc cx
cmp ax, 0 ; is the quotient zero
jnz nextdigit3 ; if no divide it again
mov di, 2328
nextpos3:
pop dx
mov dh, 0x0A
mov [es:di], dx
add di, 2
loop nextpos3
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2


printnum2:
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax
mov ax, [bp+4]
mov bx, 10
mov cx, 0
nextdigit2: mov dx, 0
div bx ; divide by 10
add dl, 0x30
push dx
inc cx
cmp ax, 0 ; is the quotient zero
jnz nextdigit2 ; if no divide it again
mov di, 316
nextpos2:
pop dx
mov dh, 0x0A
mov [es:di], dx
add di, 2
loop nextpos2
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2

;num2 for cols
;num for the random position
myalphabet:
push ax
cmp word[cs:flag],1
je finish
mov si,word[cs:num]
mov ax,0xb800
mov es,ax
cmp word[cs:miss],10
je terminate
add word[cs:tick],10
cmp word[cs:tick],18
jna new
mov word[cs:tick],0
mov si,[cs:num]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha]
inc bx
cmp bx,25
jna nochangealpha
mov bx,0
nochangealpha:
mov al,[cs:buffer+bx]
mov ah,0x1A
mov word[es:si],ax
add si,160
mov word[cs:num],si
add word[cs:num2],1
cmp word[cs:num2],25
je restart
new:
jmp nextmatch

finish:
call clrscr
jmp exi


terminate:
mov word[cs:flag],1
jmp exi


restart:
mov word[cs:alpha],bx
sub si,160
cmp word[cs:loc],si
je printscore
jmp o
printscore:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp ncolor
o:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
ncolor:
mov word[cs:num2],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num],dx


nextmatch:
mov si,word[cs:num+2]
cmp word[cs:miss],10
je terminate2
add word[cs:tick+2],10
cmp word[cs:tick+2],36
jna new2
mov word[cs:tick+2],0
mov si,[cs:num+2]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha+2]
inc bx
cmp bx,25
jna nochangealpha2
mov bx,0
nochangealpha2:
mov al,[cs:buffer+bx]
mov ah,0x14
mov word[es:si],ax
add si,160
mov word[cs:num+2],si
add word[cs:num2+2],1
cmp word[cs:num2+2],25
je restart2
new2:
jmp nextmatch2

terminate2:
mov word[cs:flag],1
jmp exi


restart2:
mov word[cs:alpha+2],bx
sub si,160
cmp word[cs:loc],si
je printscore2
jmp g
printscore2:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp gcolor
g:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
gcolor:
mov word[cs:num2+2],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num+2],dx



nextmatch2:
cmp word[cs:miss],10
je terminate3
add word[cs:tick+4],10
cmp word[cs:tick+4],54
jna new3
mov word[cs:tick+4],0
mov si,word[cs:num+4]
mov si,[cs:num+4]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha+4]
inc bx
cmp bx,25
jna nochangealpha3
mov bx,0
nochangealpha3:
mov al,[cs:buffer+bx]
mov ah,0x17
mov word[es:si],ax
add si,160
mov word[cs:num+4],si
add word[cs:num2+4],1
cmp word[cs:num2+4],25
je restart3
new3:
jmp nextmatch3

terminate3:
mov word[cs:flag],1
jmp exi


restart3:
mov word[cs:alpha+4],bx
sub si,160
cmp word[cs:loc],si
je printscore3
jmp n
printscore3:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp mcolor
n:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
mcolor:
mov word[cs:num2+4],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num+4],dx



nextmatch3:
cmp word[cs:miss],10
je terminate4
add word[cs:tick+6],10
cmp word[cs:tick+6],72
jna new4
mov word[cs:tick+6],0
mov si,word[cs:num+6]
mov si,[cs:num+6]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha+6]
inc bx
cmp bx,25
jna nochangealpha4
mov bx,0
nochangealpha4:
mov al,[cs:buffer+bx]
mov ah,0x16
mov word[es:si],ax
add si,160
mov word[cs:num+6],si
add word[cs:num2+6],1
cmp word[cs:num2+6],25
je restart4
new4:
jmp nextmatch4

terminate4:
mov word[cs:flag],1
jmp exi


restart4:
mov word[cs:alpha+6],bx
sub si,160
cmp word[cs:loc],si
je printscore4
jmp m
printscore4:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp kcolor
m:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
kcolor:
mov word[cs:num2+6],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num+6],dx




nextmatch4:
cmp word[cs:miss],10
je terminate5
add word[cs:tick+8],10
cmp word[cs:tick+8],90
jne new5
mov word[cs:tick+8],0
mov si,word[cs:num+8]
cmp word[cs:loc],si
je printscore4
mov si,[cs:num+8]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha+8]
inc bx
cmp bx,25
jna nochangealpha5
mov bx,0
nochangealpha5:
mov al,[cs:buffer+bx]
mov ah,0x1B
mov word[es:si],ax
add si,160
mov word[cs:num+8],si
add word[cs:num2+8],1
cmp word[cs:num2+8],25
je restart5
new5:
jmp nextmatch5

terminate5:
mov word[cs:flag],1
jmp nextmatch5

restart5:
mov word[cs:alpha+8],bx
sub si,160
cmp word[cs:loc],si
je printscore5
jmp k

printscore5:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp hcolor
k:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
hcolor:
mov word[cs:num2+8],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num+8],dx


nextmatch5:
cmp word[cs:miss],10
je terminate6
add word[cs:tick+10],10
cmp word[cs:tick+10],60
jne new6
mov word[cs:tick+10],0
mov si,word[cs:num+10]
cmp word[cs:loc],si
je printscore5
mov si,[cs:num+10]
sub si,160
mov word[es:si],0x1120
add si,160
mov bx,[cs:alpha+10]
inc bx
cmp bx,25
jna nochangealpha6
mov bx,0
nochangealpha6:
mov al,[cs:buffer+bx]
mov ah,0x17
mov word[es:si],ax
add si,160
mov word[cs:num+10],si
add word[cs:num2+10],1
cmp word[cs:num2+10],25
je restart6
new6:
jmp exi

terminate6:
mov word[cs:flag],1
jmp exi

restart6:
mov word[cs:alpha+10],bx
sub si,160
cmp word[cs:loc],si
je printscore6
jmp kl

printscore6:
inc word[cs:score]
push word[cs:score]
call printnum
mov word[es:si],0x17DC
jmp hkscolor
kl:
inc word[cs:miss]
push word[cs:miss]
call printnum2
mov word[es:si],0x1120
hkscolor:
mov word[cs:num2+10],1
sub sp,2
push 70
call randG
pop dx
mov word[cs:num+10],dx



exi:
pop ax
mov al,0x20
out 0x20,al
iret


randG:
   push bp
   mov bp, sp
   pusha
   cmp word [rand], 0
   jne next

  MOV     AH, 00h   ; interrupt to get system timer in CX:DX 
  INT     1AH
  inc word [rand]
  mov     [randnum], dx
  jmp next1

  next:
  mov     ax, 25173          ; LCG Multiplier
  mul     word  [randnum]     ; DX:AX = LCG multiplier * seed
  add     ax, 13849          ; Add LCG increment value
  ; Modulo 65536, AX = (multiplier*seed+increment) mod 65536
  mov     [randnum], ax          ; Update seed = return value

 next1:xor dx, dx
 mov ax, [randnum]
 mov cx, [bp+4]
 inc cx
 div cx
 shl dx,1
 mov word[bp+6], dx
 popa
 pop bp
 ret 2


oldkbisr: dd 0
loc: dw 3760
message: db "Press Enter to play$"
score:dw 0
message2: db "Score:$"
col: dw 41
alpha: dw 25,17,10,15,23,20
buffer: db "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
num2: dw 1,1,1,1,1,1
num: dw 20,50,60,110,120,2
rand: dw 0
randnum: dw 0
flag: dw 0
message3: db "Game Over!$"
miss: dw 0
message4: db "Misses:$"
tick: dw 0,0,0,0,0,0

