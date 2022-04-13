.global _start

.section .text
_start:
#your code here
        xor %rbx, %rbx
        movq (num), %rax
        cmp $0 ,%rax
        je END_HW1
        movl (CountBits), %ebx
        movq $0x1, %rcx
        movq $64, %rdx

    LOOP_HW1:
        cmp %rdx, %rcx
        jg END_HW1
        ROR %rax    
        inc %rcx
        jb INC_HW1
        jmp LOOP_HW1

    INC_HW1:
        inc %ebx
        jmp LOOP_HW1
        
    END_HW1:
        movl %ebx, (CountBits)
