Bootsector application made to showcase x86 computer 13h video mode (320x200, 256 colors). Utilizes bios keyboard and video interrupts.


# Compilation

nasm -f bin snekpaint_typewritter.bin -o binary.bin

# Running

qemu-system-x86_64 binary.bin

# Controls
Some special symbols are typable with ctrl or alt hold. Enter does just CR, to LF use Ctrl+j.

Move pixel with arrows, change color with Page Up and Page Down.
