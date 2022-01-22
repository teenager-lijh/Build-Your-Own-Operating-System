gcc -m32 -c -o /home/lijh/Build-Your-Own-Operating-System/kernel/main.o /home/lijh/Build-Your-Own-Operating-System/kernel/main.c

echo "gcc success \n"

ld /home/lijh/Build-Your-Own-Operating-System/kernel/main.o -Ttext 0xc0001500 -e main -o /home/lijh/Build-Your-Own-Operating-System/kernel/kernel.bin -m elf_i386

echo "ld success"

dd if=/home/lijh/Build-Your-Own-Operating-System/kernel/kernel.bin of=/home/lijh/Build-Your-Own-Operating-System/hd60M.img bs=512 count=200 seek=9 conv=notrunc


echo "dd success"



