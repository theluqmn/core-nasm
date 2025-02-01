nasm -f elf64 -o build/test.o test.asm
nasm -f elf64 -o build/console.o src/console.asm
ld -o core-nasm.o build/test.o build/console.o