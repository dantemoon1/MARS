.data
	myMsg: .asciiz "Hello world\n"
	
.text 

main:
	li $v0, 1
	li $t0, 4
	li $t1, -5
	mult $t0, $t1
	mflo $a0
	#mfhi $a0
	syscall 
	
	li $v0, 10
	syscall 