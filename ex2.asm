.global _start

.section .text
_start:
#your code here
    leaq (source), %rax
    leaq (destination), %rbx
    movl num, %ecx
    cmp $0, %ecx
	je END_HW1
    jl NEG_HW1
    movq %rax, %r8
    movq %rbx, %r9
    cmp %rax,%rbx
    ja DOWN_TO_UP_HW1
    jb UP_TO_DOWN_HW1
    jmp END_HW1

NEG_HW1:
    xor $0xffffffff, %ecx
    inc %ecx
    movq %rax, %r9
    movq %rbx, %r8
    cmp %rax,%rbx
    ja UP_TO_DOWN_HW1
    jb DOWN_TO_UP_HW1
    jmp END_HW1

UP_TO_DOWN_HW1:
    cmp $0, %ecx
    je END_HW1
    movb (%r8), %dl
    movb %dl, (%r9)
    inc %r8
    inc %r9
    dec %ecx
    jmp UP_TO_DOWN_HW1

DOWN_TO_UP_HW1:
    cmp $0, %ecx
    je END_HW1
    movb -1(%r8, %rcx), %dl
    lea -1(%r9, %rcx), %r10
    movb %dl, (%r10)
    dec %ecx
    jmp DOWN_TO_UP_HW1

END_HW1: