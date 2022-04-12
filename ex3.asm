.global _start

.section .text
_start:
#your code here

    movq $array1 , %rax
    movq $array2 , %rbx
    movq $mergedArray , %rcx
    xor %rdx, %rdx
    xor %r8, %r8

    LOOP_HW1:
        cmp $0 ,(%rax)   
        jz ARR1_DONE_HW1    #  /*if array1 is done*/

        cmp $0 ,(%rbx)
        jz ARR2_DONE_HW1    # /*if array1 isn't done, and array2 is done*/

        movl %edx, %r8d     # /*neither are zeros
        movl (%rax), %edx
        cmp %edx, (%rbx)
        ja ARR2_INC_HW1
        jb ARR1_INC_HW1
        jmp EQUAL_HW1

    EQUAL_HW1:
        addq $4, %rax
        addq $4, %rbx
        cmp %r8d, %edx
        jz LOOP_HW1
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp LOOP_HW1 

    ARR1_INC_HW1:
        movl (%rax), %edx
        addq $4, %rax
        cmp %r8d, %edx
        jz LOOP_HW1
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp LOOP_HW1

    ARR2_INC_HW1:
        movl (%rbx), %edx
        addq $4, %rbx
        cmp %r8d, %edx
        jz LOOP_HW1
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp LOOP_HW1

    ARR1_DONE_HW1:
        cmp $0 ,(%rbx) 
        jz END_HW1          # /*both done*/
        movl %edx, %r8d
        movl (%rbx), %edx
        addq $4, %rbx
        cmp %r8d, %edx
        jz ARR1_DONE_HW1 
        movl %edx, (%rcx) 
        addq $4, %rcx
        jmp ARR1_DONE_HW1 

    ARR2_DONE_HW1:        # /*if array1 isn't done */
        cmp $0 ,(%rax)
        jz END_HW1
        movl %edx, %r8d
        movl (%rax), %edx
        addq $4, %rax
        cmp %r8d, %edx
        jz ARR2_DONE_HW1 
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp ARR2_DONE_HW1

    END_HW1:
        movl $0x0, (%rcx)