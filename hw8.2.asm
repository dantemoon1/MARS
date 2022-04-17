#Dante Moon -- 03/27/2022 
# hw7ex2.asm--  
# ******************** Homework 7 Exercise 2 ******************** # 
# This program will collect the following user information and 
# display it back to the user in this format. 
# Each string will allow for 32 characters: 
# First Name: Dante 
# Last Name: Moon
# Date of Birth: 1/1/1911 #
# ******************** User Profile ******************** # 


.data   				# GLOBAL VARIABLES go in the data segment     
fname: .space 33
lname: .space 33
fname_prompt: .asciiz "Enter your first name: \n"
lname_prompt: .asciiz "Enter your last name: \n"
bmonth: .asciiz "Enter your birth month: \n"
bday: .asciiz "Enter the day number of your birthday: \n"
byear: .asciiz "Enter the year of your birthday: \n"
fstring: .asciiz "First name: "
lstring: .asciiz "Last name: "
dob: .asciiz "Date of birth: "
slash: .asciiz "/"


.text   				# All instructions go in the text segment 



# ***Begin the Main Program*** 

main:   

# Collect the user’s first name 
li $v0, 4
la $a0, fname_prompt
syscall
li $v0, 8
la $a0, fname
li $a1, 32
syscall
   
# Collect the user’s last name
li $v0, 4
la $a0, lname_prompt
syscall
li $v0, 8
la $a0, lname
li $a1, 32
syscall

# Collect the month number of the user’s birthday
li $v0, 4
la $a0, bmonth
syscall
li $v0, 5
syscall
move $t0, $v0
# Collect the day number of the user’s birthday
li $v0, 4
la $a0, bday
syscall
li $v0, 5
syscall
move $t1, $v0
# Collect the year number of the user’s birthday
li $v0, 4
la $a0, byear
syscall
li $v0, 5
syscall
move $t2, $v0
# Print out the user’s first name
li $v0, 4
la $a0, fstring
syscall 
li $v0, 4
la $a0, fname
syscall

# Print out the user’s last name
li $v0, 4
la $a0, lstring
syscall
li $v0, 4
la $a0, lname
syscall

# Print out the user’s birthday
li $v0, 4
la $a0, dob
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, slash
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, slash
syscall
li $v0, 1
move $a0, $t2
syscall

 
# ** terminate program **  
li $v0, 10     
syscall 
# ***End the Main Program***
