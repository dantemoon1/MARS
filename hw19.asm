.data
	msg1: .asciiz  "\nEnter your choice:\n"
	gc: .asciiz "\nGood Choice\n"
	bc: .asciiz "\nBad Choice\n"
	uc: .asciiz  "\nUnknown Choice.\n"
	ex: .asciiz "\EXIT"
	choice: .word
	
.text

	loop: 
		li $v0, 4 #print starting message
		la $a0, msg1
		syscall
		
		li $v0, 5 #read an int
		syscall
		move $t0, $v0
	
	blt $t0, 0, exit #if less thatn 0, exit
	beq $t0, 1, label1 #if == 1 go to label 1
	beq $t0, 2, label2 #if == 2 go to label2
	j else
	
	label2: #bad choice
		li $v0, 4
		la $a0, bc
		syscall
	
	move $v0, $0 #reset $v0
	j loop #start loop over
	
	label1: #good choice
		li $v0, 4
		la $a0, gc
		syscall
	
	move $v0, $0 #reset $v0
	j loop #start loop over
	
	else: #unknown choicce
		li $v0, 4
		la $a0, uc
		syscall
		
	move $v0, $0 #reset $v0
	j loop #start loop over
	
	
	exit:
		#li $v0, 4
		#la $a0, ex
		#syscall
		li $v0, 10
		syscall
	
	
	