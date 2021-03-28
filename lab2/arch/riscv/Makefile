all:
	${LD} -T ./kernel/vmlinux.lds -o ./../../vmlinux ../../init/main.o ../../init/test.o ./kernel/head.o ./kernel/entry.o ./kernel/strap.o ./../../lib/put.o
	${OBJCOPY} -O binary ./../../vmlinux ../../image
	
