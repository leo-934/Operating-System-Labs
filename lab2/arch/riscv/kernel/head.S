.section .text.init
.align 2
.globl _start
.globl supervisor_continue
.globl machine_trap_entry
.equ mtimecmp,0x2004000
.equ mtime,0x200bff8
_start:
	li		t0,0x00000008
	csrc		mstatus,t0
	la		t0,machine_trap_entry
	csrw		mtvec,t0
	la		t0,supervisor_continue
	csrw		mepc,t0
	la		t0,bss_start
	la		t1,bss_end
loop_judge:
	beq		t0,t1,loop_end
clean_loop:
	sd		x0,0(t0)
	addi		t0,t0,1
	j		loop_judge
loop_end:
	li		t0,mtime
	ld		t1,0(t0)
	li		t3,1000000
	add		t1,t1,t3
	li		t2,mtimecmp
	sd		t1,0(t2)
	li		t0,0x00000020
	csrs		mideleg,t0
	li		t0,0x00000008
	csrs		mstatus,t0
	li		t0,0x00000002
	csrs		sstatus,t0
	li		t0,0x00000080
	csrs		mie,t0
	li		t0,0x00000020
	csrs		sie,t0
	li		t0,0x00000800
	csrs		mstatus,t0
	li		t0,0x00001000
	csrc		mstatus,t0
	mret
supervisor_continue:
	la		t0,supervisor_trap_entry
	csrw		stvec,t0
	la		sp,stack_top
	jal		x0,start_kernel
machine_trap_entry:
        csrr            t0,mcause
        andi            t0,t0,0x3f
        li              t1,7
        beq             t0,t1,timer_trap
        li              t1,9
        beq             t0,t1,ecall_s
handle_end:
	mret
timer_trap:
        li              t0,0x00000080
        csrc            mie,t0
        li              t0,0x00000020
        csrs            mip,t0
        jal             x0,handle_end
ecall_s:
        li              t0,mtimecmp
        ld              t1,0(t0)
	li		t3,100000
	add		t1,t1,t3
        sd              t1,0(t0)
	li		t0,0x00000080
	csrs		mie,t0
	li		t0,0x000000a0
	csrc		mip,t0
	csrr		t0,mepc
	add		t0,t0,4
	csrw		mepc,t0
	jal		x0,handle_end
	
