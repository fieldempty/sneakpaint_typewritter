Bootsector application made to showcase x86 computer 13h video mode (320x200, 256 colors). It utilizes bios keyboard and video interrupts.

This repository includes standalone versions of both colored typewritter and snake paint, which are more coherent by itself. This program was made by putting them together.

![screenshot](pics/pic1.jpg)
![screenshot](pics/pic2.jpg)
![screenshot](pics/pic3.jpg)

# Compilation

`nasm -f bin snekpaint_typewritter.bin -o binary.bin`

# Running

`qemu-system-x86_64 binary.bin`

# Controls
Special symbols are typable with ctrl or alt hold. Enter does just CR, to LF use Ctrl+j.

Here some references for scancodes: [stanislavs.org](https://stanislavs.org/helppc/scan_codes.html),  [Nox-rhea wiki](https://wiki.nox-rhea.org/back2root/ibm-pc-ms-dos/hardware/informations/keyboard-scan-code)

Move pixel with arrows, change it color with Page Up and Page Down.
