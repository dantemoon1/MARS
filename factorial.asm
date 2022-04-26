.data
	welcome: .asciiz "Please enter the number you would like to find the factorial of: "
	factorialof: .asciiz "\nThe factorial of "
	is: .asciiz " is: "
	
.text
	main:
		li $v0, 4 #printf("Please enter the number you would like to calculate the factorial of: ");
		la $a0, welcome
		syscall
		li $v0, 5 #scanf("%d",&num);
		syscall
		la $s1, 0($v0)
		li $v0, 4
		la $a0, factorialof
		syscall #print the factorial of 
		li $v0, 1
		la $a0, 0($s1) #print the number the user entered
		syscall
		li $v0, 4 
		la $a0, is
		syscall #print the string is
		la $a0, 0($s1)
		jal factorial #call the facotorial function with input saved in $a0
		la $s2, 0($v0) #store the output in $s2
	ans:
		li $v0, 1 #print the answer
		la $a0, 0($s1)
		syscall
		li $s1, 0 #restore the registers
		li $a1, 0 #restore the registers
		li $v0, 10
		syscall
		
	factorial:
		addi $sp, $sp, -8 #allocate space on stack
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		beq $a0, 1, exit #if(n==1) jump to exit
		addi $a0, $a0, -1 #decrement before multiplication
		mul $s1, $s1, $a0 #n=n*n-1
		jal factorial #factorial(n-1)
		addi $s2, $s0, 0 #save the answer
		j ans #return to main and print the answer
		
		
	exit:
		lw $ra, 0($sp) #restore stack
		lw $s0, 4($sp)
		addi $sp, $sp, 8
		jr $ra #return to ra
		
		