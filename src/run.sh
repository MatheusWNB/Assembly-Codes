nasm -f elf64 include.asm -o ../build/include.o
nasm -f elf64 pratica5.asm -o ../build/pratica5.o
ld ../build/pratica5.o ../build/include.o -o ../build/pratica5
./../build/pratica5