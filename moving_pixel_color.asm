org 0x7c00

mov ax, 013h	; 13h video mode, 320x200 256 colors
int 0x10

mov ax, 0xA000 	; setting video memory
mov es, ax

main_loop:

mov ah,0
int 16h		; key check

cmp al, 'w'
	je move_up
cmp al, 'a'
	je move_left
cmp al, 's'
	je move_down
cmp al, 'd'
	je move_right
cmp al, 'q'
	je color_decrease
cmp al, 'e'
	je color_increase
	
draw_it:

mov ax, [screen_height]		; taking the screen height 200
shr ax, 1					; /2 = 100, Y center 
sub ax, [pos_Y]				; vertical line number
mov bx, [screen_width]		; 320 width
mul bx			 			; ax*bx; getting the vertical offset

mov cx, [screen_width]		; width
shr cx, 1					; half of width
add cx,[pos_X]				; adding horisontal offset

add ax, cx
mov di, ax ; center

mov al, [color]
mov [es:di], al

jmp main_loop


move_up: 
add word [pos_Y], 1
jmp draw_it

move_down: 
sub word [pos_Y], 1
jmp draw_it

move_right: 
add word [pos_X], 1
jmp draw_it

move_left: 
sub word [pos_X], 1
jmp draw_it

color_increase:
	inc byte [color]
	jmp draw_it 
	
color_decrease:
	dec byte [color] 
	jmp draw_it


pos_X dw 0
pos_Y dw 0
screen_width dw 320
screen_height dw 200
color db 15

times 510-($-$$) db 0x00	; 510 zeros 
dw 0xAA55					; 55 AA at the end

 