.global _start

.section .text
_start:
#your code here
	movq head(%rip), %rax
	testq %rax, %rax
	je END_HW1
	movq $head, %rbx
	movq (src), %rcx
	movq (dst), %rdx
    cmp %rcx, %rdx
    jz END_HW1
	movq $0, %rsi
	movq $0, %rdi
	jmp LOOP_HW1

LOOP_HW1:
	cmp (%rax), %rcx
	je SRC_inc_HW1
	cmp (%rax), %rdx
	je DST_inc_HW1
	movq %rax, %rbx
	movq 8(%rax), %rax
	test %rax, %rax
	je END_LOOP_HW1
	jmp LOOP_HW1 

SRC_inc_HW1:
	inc %rsi
	movq %rbx, %r8
	movq %rax, %rbx
	movq 8(%rax), %rax
	jmp LOOP_HW1

DST_inc_HW1:
	inc %rdi
	movq %rbx, %r9
	movq %rax, %rbx
	movq 8(%rax), %rax
	jmp LOOP_HW1

END_LOOP_HW1:
	test %rsi, %rsi
	je END_HW1
	test %rdi, %rdi
	je END_HW1
	cmp $1, %rsi
	ja END_HW1
	cmp $1, %rdi
	ja END_HW1
	cmp $head, %r8
	je SRC_HEAD_HW1
	cmp $head, %r9
	je DST_HEAD_HW1
	jmp SWAP_2_HW1

SRC_HEAD_HW1:
	movq (head), %r10
    movq 8(%r9), %r11
	movq %r11, (head)
	movq %r10, 8(%r9)
	movq (%r8), %r8
	movq 8(%r9), %r9
	jmp SWAP_1_HW1

DST_HEAD_HW1:
	movq (head), %r10
    movq 8(%r8), %r11
	movq %r11, (head)
	movq %r10, 8(%r8)
	movq (%r9), %r9
	movq 8(%r8), %r8
	jmp SWAP_1_HW1

SWAP_1_HW1:
	movq 8(%r8), %r10
    movq 8(%r9), %r11
	movq %r11, 8(%r8)
	movq %r10, 8(%r9)
	jmp END_HW1

SWAP_2_HW1:
	movq 8(%r8), %r10
    movq 8(%r9), %r11
	movq %r11, 8(%r8)
	movq %r10, 8(%r9)
	movq 8(%r8), %r8
	movq 8(%r9), %r9
	movq 8(%r8), %r10
    movq 8(%r9), %r11
	movq %r11, 8(%r8)
	movq %r10, 8(%r9)
	jmp END_HW1

END_HW1: