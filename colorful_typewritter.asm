; Bootsector typewritter 
mov ax, 0x0013  ; set video mode 13h, 320x200 256 colors
int 0x10 	; video interrupt

color_reset:
mov bx, 64	; some nice color
jmp reseted

main_loop:
cmp bx, 96	; last available color
ja color_reset	; reset color counter

reseted:
mov ah, 0	; int 16h: "read key press" service
int 0x16	; keyboard interrupt, puts key to al

mov ah, 0x0E	; BIOS TTY output
int 0x10	; video interrupt, print al to screen
inc bx		; increase color counter
jmp main_loop	; loop back

times 510-($-$$) db 0x00	; 510 zeros 
dw 0xAA55			; 55 AA at the end
