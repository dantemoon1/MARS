.data 
	msg1: .asciiz "Enter a number: "
	power: .asciiz "^3 + "
	powereq: .asciiz "^3 = "
	summsg: .asciiz "Sum of cubes = "
		.align 2 
	array: .space 40
	
	
	
.text
		
	
	loop:
		li $v0, 4 #print enter a number:
		la $a0, msg1
		syscall
		li $v0, 5 #read in an int
		syscall
		sw $v0, array($t1) #store the int in the array
		addi $t1, $t1, 4 #increment the address to store by 4
		addi $t0, $t0, 1 #count++
		beq $t0, 10, sumOfsetup #completed the read of 10 ints
		j loop
		
	sumOfsetup: #reset the counter variables and print the first statement
		li $t0, 0
		li $t1, 0 #reset counter vars
		li $v0, 4
		la $a0, summsg #print the "sum of cubes = " string
		syscall
		j sumOfCubes #call sumOfCubes
		
	sumOfCubes:	
		lw $a0, array($t1) #load the item from the array
		li $t2, 0 #used to store the product
		mul $t2, $a0, $a0 #item ^2
		mul $t2, $t2, $a0 #multiply * item one more time for ^3
		addu $v1, $v1, $t2 #keep track of sum in $v1
		li $v0, 1 #print the item
		syscall
		addi $t0, $t0, 1 #increment both the counters
		addi $t1, $t1, 4
		li $v0, 4 #print the string that shows ^3
		la $a0, power
		syscall
		beq $t0, 9, finalnum #when we get to the last number we need a different string
		j sumOfCubes #loop
	
	finalnum: 
		lw $a0, array($t1) #load the last item from the array
		li $t2, 0 #reset the product variable
		mul $t2, $a0, $a0 #^2
		mul $t2, $t2, $a0 #^3
		addu $v1, $v1, $t2 #add the product to the sum
		li $v0, 1
		syscall #print the item
		li $v0, 4
		la $a0, powereq #print ^3
		syscall
		li $v0, 1 #print the num
		move $a0, $v1
		syscall
		j exit #exit the program
		
	exit:
		li $v0, 10 #exits the program
		syscall
		

