.data
.text 
main:
	addi $t1, $zero, 7
	li $t2, 3
	add $t0, $t1, $t2
	#sub $t0, $t1, $t2
	
	li $v0, 1
	move $a0, $t0
	syscall
	