.global _start

.section .text
_start:
#your code here

        movq $source, %rax
        movq $destination, %rbx
        movl num, %ecx
        movl $0x0, %edx
        cmp %ecx, %edx
        jg NEG_HW1
        jmp END_HW1

    NEG_HW1:
        xor $0xffffffff, %ecx
        inc %ecx

    END_HW1:
        destination: .quad 0xdeadbeee