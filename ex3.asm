.global _start

.section .text
_start:
#your code here




        movq $array1 , %rax
        movq $array2 , %rbx
        movq $mergedArray , %rcx
        xor %rdx, %rdx

    LOOP_HW1:
        cmp $0 ,(%rax)   
        jz ARR1_DONE_HW1    #  /*if array1 is done*/

        cmp $0 ,(%rbx)
        jz ARR2_DONE_HW1    # /*if array1 isn't done, and array2 is done*/

        movl %edx, %ebp
        movl (%rax), %edx
        cmp %edx, (%rbx)
        jg ARR2_INC_HW1
        jl ARR1_INC_HW1
        jmp LOOP_HW1


    ARR1_INC_HW1:
        movl (%rax), %edx
        addq $4, %rax
        cmp %ebp, %edx
        jz LOOP_HW1
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp LOOP_HW1


    ARR2_INC_HW1:
        movl (%rbx), %edx
        addq $4, %rbx
        cmp %ebp, %edx
        jz LOOP_HW1
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp LOOP_HW1

        
    ARR1_DONE_HW1:
        cmp $0 ,(%rbx) 
        jz END_HW1    # /*both done*/

        movl %edx, %ebp
        movl (%rbx), %edx
        addq $4, %rbx
        cmp %ebp, %edx
        jz ARR1_DONE_HW1 
        movl %edx, (%rcx) 
        addq $4, %rcx
        jmp ARR1_DONE_HW1 



    ARR2_DONE_HW1:        # /*if array1 isn't done */
        cmp $0 ,(%rax)
        jz END_HW1
        movl %edx, %ebp
        movl (%rax), %edx
        addq $4, %rax
        cmp %ebp, %edx
        jz ARR2_DONE_HW1 
        movl %edx, (%rcx)
        addq $4, %rcx
        jmp ARR2_DONE_HW1



    END_HW1:
        movl $0x0, (%rcx)
        


.section .data
array1: .int 6,4,0
array2: .int 5,3,0
mergedArray: .zero 20




