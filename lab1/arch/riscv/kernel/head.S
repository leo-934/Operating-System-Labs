.text
.align 2
.globl _start
.globl supervisor_continue
.globl supervisor_trap_entry
.globl machine_trap_entry
_start:
	li		t0,0x00000008
	csrc		mstatus,t0
	la		t0,machine_trap_entry
	csrw		mtvec,t0
	la		t0,supervisor_continue
	csrw		mepc,t0
	li		t0,0x00000800
	csrs		mstatus,t0
	li		t0,0x00001000
	csrc		mstatus,t0
	mret
supervisor_continue:
	la		t0,supervisor_trap_entry
	csrw		stvec,t0
	la		sp,stack_top
	jal		start_kernel
supervisor_trap_entry:
machine_trap_entry:
	
