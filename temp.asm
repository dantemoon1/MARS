.data
    prompt: .asciiz "Enter F: "
    newLine: .asciiz "\n\n"
    msg: .asciiz "In celcius that is "
.text
main: 
    li $v0, 4
    la $a0, prompt
    syscall         # prompt
    
    li $v0, 6
    syscall
    move $s0, $v0       # input
    
    addi $sp, $sp, -8
    swc1 $f1, 4($sp)
    swc1 $f2, 0($sp)
    
    li $t0, 32
    mtc1 $t0, $f1
    cvt.s.w $f1, $f1
    li $t0, 5
    mtc1 $t0, $f2
    cvt.s.w $f2, $f2
    
    li $t0, 9
    mtc1 $t0, $f3
    cvt.s.w $f3, $f3
    div.s $f2, $f2, $f3
    sub.s $f0, $f0, $f1
    mul.s $f12, $f0, $f2 
    
    lwc1 $f2, 0($sp)
    lwc1 $f1, 4($sp)
    addi $sp, $sp, 8
    
    li $v0, 4
    la $a0, msg # prints message
    syscall
    
    li $v0, 2   # prints decimal
    syscall
    
    li $v0, 4   # prints newline
    la $a0, newLine
    syscall
    
    j main
