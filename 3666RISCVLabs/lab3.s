#       CSE 3666 Lab 3: remove spaces


        .data

        # allocating space for both strings

str:    .space  128

res:    .space  128


        .globl  main


        .text

main:   

        # load address of strings 

        la      s0, str

        la      s1, res


        # we do not need LA pseudoinstructions from now on


        # read a string into str

        addi    a0, s0, 0 

        addi    a1, x0, 120

        addi    a7, x0, 8

        ecall


        # str's address is already in s0

        # copy res's address to a1

        addi    a1, s1, 0


        # TODO

	# remove spaces in str

	# print res

        # your code assumes str's address is in a0 and res's address is in a1

	addi s2, x0, 0  # i

	addi s3, x0, 0 # j

	li t4, 32

	

loop: 

	add t1, s2, a0 # storing A[i]

	lb t5, 0(t1) # c = A[i]

	

	addi s2, s2, 1 # i += 1

	

	beq t5, t4, check # if c == "", go to check

	

	add t3, s3, a1 # storing res[j] into t3 temp.

	sb t5, 0(t3) #res[j] = c

	

	addi s3, s3, 1 # j += 1

	

	

check: bne t5, x0, loop

	

	li a7, 4

	addi a0, a1, 0

	ecall


exit:   addi    a7, x0, 10

        ecall
