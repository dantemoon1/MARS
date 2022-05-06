.data 
	msg1: .asciiz "Please enter a number: "
	msg2: .asciiz "\nYour number is "
	pos: .asciiz "positive"
	neg: .asciiz "negative"
	
.text
	main:
		li $v0, 4 #print the welcome message
		la $a0, msg1
		syscall
		
		li $v0, 5 #read in an int
		syscall
		
		move $a0, $v0 #save the value to a0
		jal isPositive #call the function
		li $v0, 4
		la $a0, msg2 #print the next message
		syscall
		beqz $v1, negative #if the function return is 0 the number is negative
		li $v0, 4
		la $a0, pos #otherwise print positive
		syscall
		j exit #exit the program
		
		
	isPositive: #checks if the number is positive
		bltz $a0, isNegative #if the number is negative jump
		addi $v1, $zero, 1 #set v1 to 1
		jr $ra #return
		
	isNegative:
		addi $v1, $zero, 0 #set the return to 0
		jr $ra #return
		
	negative: #prints the negative word
		li $v0, 4
		la $a0, neg
		syscall #print the word negative
		j exit #exit the program
		
	exit: #exits the program
		li $v0, 10
		syscall