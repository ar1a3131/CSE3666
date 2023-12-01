#       CSE 3666 Lab 2


        .globl  main


        .text

main:   

        # use system call 5 to read integer

        addi    a7, x0, 5

        ecall

        addi    s1, a0, 0       # copy to s1


        # TODO

        # Add you code here

        #   reverse bits in s1 and save the results in s2

        #   print s1 in binary, with a system call

        #   print newline

        #   print s2 in binary

        #   print newline

        addi t0, s1, 0

        addi s2, x0, 0

        addi s3, x0, 0

        addi s4, x0, 32

        

loop:

	bge s3, s4, print

	slli s2,s2, 1

	andi t1, t0, 1

	or s2, s2, t1

	srli t0, t0, 1

	addi s3, s3, 1

	beq x0, x0, loop

        


print:

	addi a0, s1, 0

	addi a7, x0, 35

	ecall


	addi a0, x0, '\n'

	addi a7, x0, 11

	ecall


	addi a0, s2, 0

	addi a7, x0, 35

	ecall


	addi a0, x0, '\n'

	addi a7, x0, 11

	ecall


        # exit

exit:   addi    a7, x0, 10      

        ecall
