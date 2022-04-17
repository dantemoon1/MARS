.data
.text
main:
	li $v0, 5
	syscall
	
	add $t2, $v0, $v0
	
	move $a0, $t2
	li $v0, 1
	syscall 