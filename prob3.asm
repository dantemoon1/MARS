.data
	msg1: .asciiz "Please enter 1 for circle or 2 for triangle: "
	msg2: .asciiz "Please enter a float value: "
	circle1: .asciiz "The circumference of the circle with radius = "
	circle2: .asciiz "The area of the circle with radius = "
	triangle1: .asciiz "The perimeter of the triangle with side = "
	triangle2: "The area of the triangle with side = "
	meters: .asciiz " meters"
	sqmeters: .asciiz " square meters.\n"
	is: .asciiz " is "
	dot: .asciiz ".\n"
	pi: .float 3.14
	two: .float 2.0
	areaconstant: .float 0.4330127019 #using formula sqrt(3)/4 * (side)^2 for triangle
	three: .float 3.0
	
	
.text
	main:
		li $v0, 4
		la $a0, msg1 #print the input message
		syscall
		li $v0, 5 #read in the int for shape choice
		syscall
		move $t0, $v0
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 6 #read in the float value
		syscall
		move $a0, $t0 #save the shape in $a0
		jal shape
		li $v0, 10 #exit the program
		syscall
		
	shape:
		beq $a0, 1, circle #if user input is 1, then jump to circle
		beq $a0, 2, triangle #if user input is 2, then jump to triange
		jr $ra #return
	
	circle:
		li $v0, 4 #print the circle message
		la $a0, circle1
		syscall
		mov.s $f12, $f0 #move the radius before print
		li $v0, 2
		syscall #print radius
		li $v0, 4
		la $a0, meters #print meters
		syscall
		li $v0, 4
		la $a0, is #print is
		syscall
		l.s $f1, pi #load constants for pi and 2
		l.s $f2, two
		mul.s $f1, $f1, $f2 #circumference = 2*pi*rad
		mul.s $f1, $f1, $f0
		mov.s $f12 $f1
		li $v0, 2
		syscall #print the circumference
		li $v0, 4
		la $a0, meters
		syscall
		li $v0, 4 #finish printing the string
		la $a0, dot
		syscall
		li $v0, 4 #print the start of the area message for cicle
		la $a0, circle2
		syscall
		mov.s $f12, $f0 #print the radius
		li $v0, 2
		syscall
		li $v0, 4
		la $a0, meters #print meters
		syscall
		li $v0, 4
		la $a0, is #print is
		syscall
		l.s $f1, pi
		mul.s $f2, $f0, $f0 #radius squared
		mul.s $f1, $f1, $f2 #pi*r^2
		mov.s $f12, $f1
		li $v0, 2
		syscall #print the area
		li $v0, 4
		la $a0, sqmeters #print sqaure meters
		syscall
		jr $ra #return
		
	triangle:
		li $v0, 4
		la $a0, triangle1 #print the first part of the perimeter string
		syscall
		mov.s $f12, $f0
		li $v0, 2 #print the side
		syscall
		li $v0, 4
		la $a0, meters #print meters
		syscall
		li $v0, 4
		la $a0, is #print is
		syscall
		mov.s $f1, $f0 #move the side into $f1
		l.s $f3, three
		mul.s $f1, $f1, $f3
		mov.s $f12, $f1 #get ready for print
		li $v0, 2
		syscall #print the perimeter
		li $v0, 4
		la $a0, meters #print meters
		syscall
		li $v0, 4
		la $a0, dot #print the end of the line
		syscall
		li $v0, 4
		la $a0, triangle2 #print the area of the triangle string
		syscall
		li $v0, 2
		mov.s $f12, $f0 #move and print the side
		syscall
		li $v0, 4
		la $a0, is #print is
		syscall
		#compute area of triangle
		l.s $f1, areaconstant
		mul.s $f0, $f0, $f0 #side^2
		mul.s $f0, $f0, $f1 #(side^2)(sqrt(3)/4) = area of triange
		mov.s $f12, $f0
		li $v0, 2
		syscall #print the area
		li $v0, 4
		la $a0, sqmeters #print square meters
		syscall
		jr $ra #return
		
		