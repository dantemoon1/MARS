.data
	menu: .asciiz "Hello and welcome to hangman, please enter an option from below \n	1.Single Player\n	2.Multiplayer\n	3.Scoreboard\n	4.Exit\n"
	askname: .asciiz "Enter your name: \n"
	asknamep1: .asciiz "Player 1 enter your name: \n"
	asknamep2: .asciiz "Player 2 enter your name: \n"
	p1: .space 33
	p2: .space 33
	wordone: .space 33
	wordtwo: .space 33
	fn: .asciiz "/Users/dante/Documents/MARS/words.txt" #must include full filepath for words.txt
	wordlist: .space 1024
	
.text
	menuloop:
		li $v0, 4 #print the menu
		la $a0, menu
		syscall
		li $v0, 5 #menu input
		syscall
		move $t0, $v0
		beq $t0, 1, name_SP
		beq $t0, 2 name_MP
		#beq $t0, 3 scoreboard
		beq $t0, 4, exit
		beq $t0, 5 sp_word #testing function for picking a word
		
	name_SP: #name prompt for singleplayer
		li $v0, 4 
		la $a0, askname
		syscall
		li $v0, 8
		la $a0, p1 #save the name in p1
		li $a1, 32
		syscall
		
		
	name_MP: 
		li $v0, 4 #prompt player 1 for name
		la $a0, asknamep1
		syscall
		li $v0, 8
		la $a0, p1 #save the name in p1
		li $a1, 32
		syscall
		li $v0, 4 #prompt player 2 for name
		la $a0, asknamep2
		syscall
		li $v0, 8
		la $a0, p2 #save the name p2
		li $a1, 32
		syscall
		#li $v0, 4 #printing the names to test they are saved correctly
		#la $a0, p1
		#syscall
		#li $v0, 4
		#la $a0, p2
		#syscall 
		
	sp_word: #currently just loads the text file in, need to isolate a single word
		li $v0, 13
		la $a0, fn
		li $a1, 0 #file flag
		syscall
		move $s0, $v0
		li $v0, 14
		move $a0, $s0
		la $a1, wordlist
		la $a2, 1024
		syscall 
		li $v0, 16
		move $a0, $s0
		syscall
		#li $v0, 4
		#la $a0, wordlist
		#syscall
			
	j menuloop
	
	exit:
		li $v0, 10
		syscall