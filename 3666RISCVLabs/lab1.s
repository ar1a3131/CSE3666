#       CSE 3666 Lab 1


        .globl  main


        .text

main:   


        # GCD examples:

        #     gcd(11, 121) = 11

        #     gcd(24, 60) = 12

        #     gcd(192, 270) = 6

        #     gcd(14, 97) = 1


        # read two positive integers from the console and 

        # save them in s1 and s2 

	addi	a7, x0, 5

	ecall

	addi	s1, a0, 0

	

	addi	a7, x0, 5

	ecall

	addi	s2, a0, 0

	

        # use system call 5 to read integers

        # TODO

        # Add you code here

        # compute GCD(a, b) and print it


loop:

	beq s1, s2, print

	bgt s1, s2, if

	blt s1, s2, else

	

if:

	sub s1, s1, s2

	beq x0, x0, loop

	

else:

	sub s2, s2, s1

	beq x0, x0, loop

	

print:

	addi a0, s1, 0

	addi a7, x0, 1

	ecall

        # sys call to exit

exit:		

	addi	a7, x0, 10

	ecall


