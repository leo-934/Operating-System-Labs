.section .text.entry
.align 2
.extern handle_s
.globl supervisor_trap_entry
supervisor_trap_entry:
	csrr            t0,scause
        andi            t0,t0,0x3f
        li              t1,5
	bne		t0,t1,not_interrupt
	call		handle_s
not_interrupt:
	ecall
	sret


