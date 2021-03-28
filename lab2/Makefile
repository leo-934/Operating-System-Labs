export
CROSS_= riscv64-unknown-elf-
AR=${CROSS_}ar
GCC=${CROSS_}gcc
LD=${CROSS_}ld
OBJCOPY=${CROSS_}objcopy
ISA ?= rv64imafd
ABI ?= lp64
INCLUDE = -I ../include
CF = -O3 -g -march=$(ISA) -mabi=$(ABI) -mcmodel=medany -ffunction-sections -fdata-sections -nostartfiles -nostdlib -nostdinc -static -lgcc -Wl,--nmagic -Wl,--gcsections
CFLAG = ${CF} ${INCLUDE}	
all:
	make -C ./lib
	make -C ./init
	make -C ./arch/riscv/kernel
	make -C ./arch/riscv
run: all
	qemu-system-riscv64 -nographic -machine virt -kernel vmlinux
debug: all
	qemu-system-riscv64 -nographic -machine virt -kernel vmlinux -S -s
clean:
	rm -f ./arch/riscv/kernel/head.o ./arch/riscv/vmlinux ./init/main.o ./init/test.o ./vmlinux  ./image ./arch/riscv/kernel/entry.o ./arch/riscv/kernel/strap.o ./lib/put.o
