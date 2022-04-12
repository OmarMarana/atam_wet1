.global _start

.section .text
_start:
#your code here

        xorq %rbx, %rbx
        xorq %rax, %rax
        movq (root), %rax
        movq (new_node), %rbx
            
        cmp $0, %rax
        jne ASSESS_NEW_NODE_HW1

        movq $new_node, (root)
        jmp END_HW1
        

    ASSESS_NEW_NODE_HW1:
        cmp (%rax) ,%rbx
        je END_HW1
        jl NEW_NODE_LESS_THAN_ROOT_HW1
        jg NEW_NODE_GREATER_THAN_ROOT_HW1

    NEW_NODE_LESS_THAN_ROOT_HW1:
        cmp $0, 8(%rax)
        je LOAD_INTO_LEFT_NODE_HW1
        # addq $0x8, %rax
        movq 8(%rax), %rax
        jmp ASSESS_NEW_NODE_HW1


    NEW_NODE_GREATER_THAN_ROOT_HW1:
        cmp $0, 16(%rax)
        je LOAD_INTO_RIGHT_NODE_HW1
        # addq $0x16, %rax
        movq 16(%rax), %rax
        jmp ASSESS_NEW_NODE_HW1

    LOAD_INTO_LEFT_NODE_HW1:
        movq $new_node, 8(%rax)
        jmp END_HW1 

    LOAD_INTO_RIGHT_NODE_HW1:
        movq $new_node, 16(%rax)
        jmp END_HW1

        
        
    END_HW1: