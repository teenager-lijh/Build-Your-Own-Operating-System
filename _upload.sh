root=/home/lijh/Build-Your-Own-Operating-System

echo "gcc begin ------------------------"

gcc -m32 -c -I $root/lib/kernel -o $root/kernel/main.o $root/kernel/main.c 

echo "gcc end --------------------------"


echo "nasm begin -----------------------"

nasm -f elf -o $root/lib/kernel/print.o $root/lib/kernel/print.S

echo "nasm end -------------------------"


echo "ld begin -------------------------"

ld $root/kernel/main.o $root/lib/kernel/print.o -Ttext 0xc0001500 -e main -o $root/kernel/kernel.bin -m elf_i386

echo "ld end ---------------------------"


echo "dd begin -------------------------"

dd if=$root/kernel/kernel.bin of=$root/hd60M.img bs=512 count=200 seek=9 conv=notrunc

echo "dd end ---------------------------"
