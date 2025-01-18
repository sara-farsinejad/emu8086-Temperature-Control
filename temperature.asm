org 100h             
CONTROL EQU 8006H    
A	EQU 0080H        
B	EQU 0082H        
C	EQU 0084H                                     
inic1:                                        
mov dx,C
in al,dx
cmp al,11111110b 
je stop1
cmp al,11111101b 
je decision
jmp inic1
decision:
mov dx,B
in al,dx
cmp al,00010001b 
jge enfriar 
cmp al,00001011b 
jle warm
jmp stop
enfriar: 
mov dx,A
mov al,11111110b 
out dx,al
nop
nop 
nop 
jmp emergency
warm:
mov dx,A
mov al,11111101b
out dx,al
nop
nop
nop
nop 
jmp emergency
stop:
mov dx,A
mov al,11111111b 
out dx,al 
nop
nop
nop 
mov dx,B
in al,dx
cmp al,00010001b 
jge enfriar 
cmp al,00001011b 
jle warm
jmp stop  
stop1:
mov dx,A
mov al,11111111b  
out dx,al 
nop
nop
nop 
mov dx,C
in al,dx
cmp al,11111110b 
je stop1
cmp al,11111101b 
je inic1
jmp stop1
emergency:                                        



mov dx,C
in al,dx
cmp al,11111110b 
je stop1
cmp al,11111101b 
je inic1 
jmp decision

ret               
