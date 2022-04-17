.data 
	myMsg: .asciiz "\nEXIT \n"
	myMsg1: .asciiz "START \n"
	newline: .asciiz "\n"

.text 
main:
	li $v0, 4 #print start string
	la $a0, myMsg1 
	syscall
	
	la $s0, 5
	la $s1, 5
	slt $t0, $s0, $s1 #if $s0 is less than $s1, $t0 becomes 1
	beq $t0, $zero, Exit
	
	la $t0, 4 #load the value 4 into $t0
	Loop: 
		bne $t0, $zero, Label1 #not equal $t0 and $zero, jump to label1
		j Exit
	Label1:
		li $v0, 1 #print an int
		addi $t0, $t0, -1 #subtract 1
		la $a0, 0($t0) #load it to $a0
		syscall #print
		
		li $v0, 4
		la $a0, newline
		syscall 
		
		j Loop #unconditional jump to Loop
	Exit: 
		li $v0, 4 #print end
		la $a0, myMsg
		syscall
		li $v0, 10
		syscall
