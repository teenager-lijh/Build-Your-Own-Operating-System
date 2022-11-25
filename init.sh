# 启动项目需要创建如下的三个二进制代码
# 1. loader.S 生成 loader.bin
# 2. mbr.S 生成 mbr.bin
# 3. make all 生成 kernel.bin 并将其写入 第9号 扇区


# 使用 bximage 命令创建 虚拟hd 
# mbr.bin 写入 第 0 号扇区 对应 seek=0 => seek 的默认值就是 0 => mbr.bin 用来加载 loader.bin
dd if=/home/blueberry/boot/mbr.bin of=/home/blueberry/configuration/hd60M.img bs=512 count=1 seek=0 conv=notrunc

# loader.bin 写入 第 2 号扇区 对应 seek=2 => loader.bin 用来加载 kernal.bin
dd if=/home/blueberry/boot/loader.bin of=/home/blueberry/configuration/hd60M.img bs=512 count=5 seek=2 conv=notrunc

# kernal.bin 写入第 9 号扇区 
dd if=/home/blueberry/build/kernel.bin of=/home/blueberry/configuration/hd60M.img bs=512 count=200 seek=9 conv=notrunc

