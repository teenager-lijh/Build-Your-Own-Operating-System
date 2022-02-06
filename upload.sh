root=/home/lijh/Build-Your-Own-Operating-System

echo "gcc begin ------------------------"

gcc -m32 -c -fno-builtin \
    -fno-stack-protector \
    -I $root/lib \
    -I $root/lib/kernel \
    -I $root/kernel \
    -o $root/build/main.o \
    $root/kernel/main.c

gcc -m32 -c -fno-builtin \
    -fno-stack-protector \
    -I $root/lib \
    -I $root/lib/kernel \
    -I $root/kernel \
    -o $root/build/interrupt.o \
    $root/kernel/interrupt.c

gcc -m32 -c -fno-builtin \
    -fno-stack-protector \
    -I $root/lib \
    -I $root/lib/kernel \
    -I $root/kernel \
    -o $root/build/init.o \
    $root/kernel/init.c

echo "gcc end --------------------------"


echo "nasm begin -----------------------"

nasm -f elf \
    -o $root/build/print.o \
    $root/lib/kernel/print.S

nasm -f elf \
    -o $root/build/kernel.o \
    $root/kernel/kernel.S

echo "nasm end -------------------------"


echo "ld begin -------------------------"

ld -Ttext 0xc0001500 \
    -e main \
    -m elf_i386 \
    -o $root/build/kernel.bin \
    $root/build/main.o \
    $root/build/print.o \
    $root/build/kernel.o \
    $root/build/interrupt.o \
    $root/build/init.o

echo "ld end ---------------------------"


echo "dd begin -------------------------"

dd if=$root/build/kernel.bin of=$root/configuration/hd60M.img bs=512 count=200 seek=9 conv=notrunc

echo "dd end ---------------------------"
