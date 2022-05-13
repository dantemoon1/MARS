.data
	menu: .asciiz "Hello and welcome to hangman, please enter an option from below \n	1.Single Player\n	2.Multiplayer\n	3.Scoreboard\n	4.Exit\n"
	askname: .asciiz "Enter your name: \n"
	asknamep1: .asciiz "Player 1 enter your name: \n"
	asknamep2: .asciiz "Player 2 enter your name: \n"
	wordprompt1: .asciiz "Player 1 enter a word for player 2 to guess: \n"
	wordprompt2: .asciiz "Player 2 enter a word for player 1 to guess: \n"
	p1: .space 33
	p2: .space 33
		.align 2
	wordone: .space 33
		.align 2
	wordtwo: .space 33
	fn: .asciiz "/Users/dante/Documents/MARS/words.txt" #must include full filepath for words.txt
		.align 2
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
		j sp_word
		
		
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
		li $v0, 4
		la $a0, wordprompt1 #print prompt for player1 to enter a word
		syscall
		li $v0, 8
		la $a0, wordone #read in the word and store in wordone
		li $a1, 32
		syscall
		li $v0, 4
		la $a0, wordprompt2 #print prompt for player2 to enter a word
		syscall
		li $v0, 8
		la $a0, wordtwo #read in the word and store in wordtwo
		li $a1, 32
		syscall
		j multiplayer
		
	sp_word: #currently just loads the text file in, need to isolate a single word
		li $v0, 13
		la $a0, fn
		li $a1, 0 #file flag
		syscall
		move $s0, $v0
		li $v0, 14 #read in a file
		move $a0, $s0
		la $a1, wordlist
		la $a2, 1024
		syscall 
		li $v0, 16 #close the file
		move $a0, $s0
		syscall
		#li $v0, 4
		#la $a0, wordlist
		#syscall
		li $v0, 42 #generate a random number with upper range in a1
		li $a1, 83
		syscall
		#li $v0, 1
		#syscall
		move $t0, $a0 #put the random number into t0, we will pick the $t0'th word from the list of words
		#li $t0, 0 #this is the word number to pick 
		li $t1, 0 #counter for each byte in wordlist
		li $t4, 0 #counter for how many words we have search so far
		la $t5, wordone #space to store the selected word
		beq $t0, 0, found_word #if the picked word is the first word we can skip to the found function
		j isolate_word #we will parse the word list letter by letter
		
	isolate_word:
		#li $v0, 11 #testing 
		lb $a0, wordlist($t1) #load the byte at $t1
		#syscall #testing
		addiu $t1,$t1,1 #increment the counter ($1)
		beq $a0, 10, newline #if we reach the end of a word, jump to newline function
		j isolate_word #loop back around
		
	found_word:
		#li $v0, 11 #testing
		lb $a0, wordlist($t1) #load the byte
		#syscall #testing
		sb $a0, 0($t5) #store the byte
		addiu $t5, $t5, 1 #increment pointer
		addiu $t1, $t1, 1 #increment counter
		beq $a0, 10, singleplayer #if we reach a newline we have finished parsing and storing the correct word
		j found_word #loop
		
		
	newline:
		addiu $t4, $t4, 1 #increment the number of words we have parsed
		beq $t4, $t0, found_word #if we have reached the word we want to use, jump to found_word function
		j isolate_word #otherwise move to next word
		
		
	singleplayer:
		#word is stored in wordone
		li $v0, 4
		la $a0, wordone
		syscall
		li $t0, 0
		j reset_word #once we finished the game we need to reset the stored word
		
	reset_word: #store 0s in all the bytes in the word
		li $t2, 0
		sb $t2, 0($a0)
		#sb $t2, 0($a1)
		addiu $a0, $a0, 1
		#addiu $a1, $a1, 1
		addiu $t0, $t0, 1
		beq $t0, 33, menuloop
		j reset_word
		
	multiplayer: 
		li $v0, 4
		la $a0, wordone
		syscall
		li $v0, 4
		la $a0, wordtwo
		syscall
		j menuloop
			
	j menuloop
	
	exit:
		li $v0, 10
		syscall
