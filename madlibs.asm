.data
	msg1: .asciiz "Enter a name\n"
	name: .space 50
	msg2: .asciiz "Enter a place\n"
	place: .space 50
	msg3: .asciiz "Enter a food\n"
	food: .space 50
	msg4: .asciiz "Enter a quantity\n"
	pt1: .asciiz "this is the story of "
	pt2: .asciiz "\nhe lives in "
	pt3: .asciiz "\nand loves to eat "
	pt4: .asciiz "\nin fact he eats "
	pt5: .asciiz "per day\n"
	quantity: .space 50
.text
main:
	
	li $v0, 4 #read in a name 
	la $a0, msg1
	syscall
	li $v0, 8
	la $a0, name
	li $a1, 100
	syscall
	
	li $v0, 4 #read in a place 
	la $a0, msg2
	syscall
	li $v0, 8
	la $a0, place
	li $a1, 100
	syscall
	
	li $v0, 4 #read in a food 
	la $a0, msg3
	syscall
	li $v0, 8
	la $a0, food
	li $a1, 100
	syscall
	
	li $v0, 4 #read in an amount
	la $a0, msg4
	syscall
	li $v0, 8
	la $a0, quantity
	li $a1, 100
	syscall
	
	#print the story
	li $v0,4
	la $a0, pt1 
	syscall
	li $v0,4
	la $a0,name 
	syscall
	li $v0,4
	la $a0, pt2 
	syscall
	li $v0,4
	la $a0,place 
	syscall
	la $a0, pt3
	syscall
	li $v0,4
	la $a0, food 
	syscall
	la $a0, pt4
	syscall
	li $v0,4
	la $a0, quantity
	syscall
	la $a0, pt5
	syscall
	

    	li $v0, 10      # end program
    	syscall