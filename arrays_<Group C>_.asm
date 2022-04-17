# arrays_<Group Cr>.asm
# <Dante Moon> - CST 237 Spring 22
# <Autumn Benton> - CST 237 Spring 22
# <Jose Diaz-Trinidad> - CST 237 Spring 22
# <Zihao Xu> - CST 237 Spring 22

.data  # global variables go below data
	# int fibonacci[7] = {1,1,2,3,5,8,13};
	fibonacci: .word 1,1,2,3,5,8,13
	
# int fib_length = 7;
fib_length: .word 7

.text  # start of instructions after .text
main:  # main function starts here
	# int i = 0; $t0 will be our index i
	li $t0, 0

while:
# while (i != fib_length) {; $t1 = fib_length 
	lw $t1, fib_length
	beq $t0, $t1, endwhile

# printf("%d",fibonacci[i]); $s0 = *fibonacci
la $s0, fibonacci
	# store the index offset in $t2 -> (i*4)
sll $t2, $t0, 2
	# get fibonacci[i] into $t3
# -> fibonacci address ($s0) + index offset ($t2)
	add $t3, $s0, $t2

# i++;
	addi $t0, $t0, 1
	j while
endwhile:	# } end while

# exit cleanly
exit:
	li $v0, 10  #exit code for MARS
	syscall
	
