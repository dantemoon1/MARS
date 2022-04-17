.data 
	myMsg: .asciiz "Hello world 3\n"
	num: .word 1, 2, 4, 8
	
.text
main:
	li $v0, 4
	
	addi $a0, $t0, 6 #adding 3 to the address of msMsg since its stored in t0 and saving it to a0
	syscall #prints lo world 3
	
	li $v0, 11 #print a letter
	lb $a0, 6($t0) 
	syscall
	
	li $v0, 11
	li $a0, '\n'
	syscall #just prints newline
	
	li $v0, 1
	la $t0, num
	lw $a0, 12($t0)
	syscall #prints item 2 in the list of num
	
	
	li $v0, 10
	syscall