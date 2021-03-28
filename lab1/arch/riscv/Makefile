all:
	${LD} -T ./kernel/vmlinux.lds -o ./../../vmlinux ../../init/main.o ../../init/test.o ./kernel/head.o
	${OBJCOPY} -O binary ./../../vmlinux ../../image
	
