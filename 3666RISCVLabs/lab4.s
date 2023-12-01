#       CSE 3666 Lab 4

#	TAG: 61ed0598ed0f3e3e43c5abc168c4387d


	.data

	.align	2	

word_array:     .word

        0,   10,   20,  30,  40,  50,  60,  70,  80,  90, 

        100, 110, 120, 130, 140, 150, 160, 170, 180, 190,

        200, 210, 220, 230, 240, 250, 260, 270, 280, 290,

        300, 310, 320, 330, 340, 350, 360, 370, 380, 390,

        400, 410, 420, 430, 440, 450, 460, 470, 480, 490,

        500, 510, 520, 530, 540, 550, 560, 570, 580, 590,

        600, 610, 620, 630, 640, 650, 660, 670, 680, 690,

        700, 710, 720, 730, 740, 750, 760, 770, 780, 790,

        800, 810, 820, 830, 840, 850, 860, 870, 880, 890,

        900, 910, 920, 930, 940, 950, 960, 970, 980, 990


        # code

        .text

        .globl  main

main:   

	addi	s0, x0, -1

	addi	s1, x0, -1

	addi	s2, x0, -1

	addi	s3, x0, -1

	addi	s4, x0, -1

	addi	s5, x0, -1

	# help to check if any saved registers are changed during the function call

	# could add more...


        # la      s1, word_array

        lui     s1, 0x10010      # starting addr of word_array in standard memory config

        addi    s2, x0, 100      # 100 elements in the array


        # read an integer from the console

        addi    a7, x0, 5

        ecall


        addi    s3, a0, 0       # keep a copy of v in s3

        

        # call binary search

        addi	a0, s1, 0

        addi	a1, s2, 0

        addi	a2, s3, 0

        jal	ra, binary_search


	# print the return value

        jal	ra, print_int


	# set a breakpoint here and check if any saved register was changed

        # exit

exit:   addi    a7, x0, 10      

        ecall


# a function that prints an integer, followed by a newline

print_int: 

        addi    a7, x0, 1

        ecall

 

        # print newline

        addi    a7, x0, 11

        addi    a0, x0, '\n'

        ecall        

         

        jalr    x0, ra, 0

	

#### Do not change lines above

binary_search:

        # TODO

        #a0 = a

        #a1 = n

        #a2 = v

        

        addi sp, sp, -8	 

        sw s1, 0(sp)

        sw ra, 4(sp)

        

	bne a1, x0, if1

	addi a0, x0, -1   # rv= -1

	beq x0, x0, f_exit

	

	

	

if1:	

	srai t0, a1, 1     # calculating midpoint  --> t0=half

	slli t6, t0, 2

	add t1, a0, t6   # a + [half] ----> a[half]

	lw t5, 0(t1)

	#sw t2, 0(t1)   # half_v = a[half]

	bne t5, a2, elseif

	addi a0, t0, 0

	beq x0,x0, f_exit

	

	

elseif:

	blt t5, a2, else # half_v =! v --> go to next branch

	addi a1,t0, 0

	jal ra, binary_search

	beq x0, x0, f_exit

	

else:

	addi s1, t0, 1   # half + 1  = t3

	slli t6, s1, 2

	add a0, t6, a0

	sub a1, a1, s1

	jal ra, binary_search

	

	blt a0, x0, f_exit

	add a0, a0, s1


	

f_exit:

	lw s1, 0(sp)  #restore return address

	lw ra, 4(sp)

	addi sp, sp, 8   #restore sp

	jalr x0, ra, 0   # and return
