.data
	msg1: .asciiz "Enter F: "
.text
main: #int main() {
#    float fahrenheit; $f1
#    printf("Enter F: ");
	la $a0, msg1
	li $v0, 4
	syscall
#    scanf("%f", &fahrenheit);
li $v0, 6
syscall
# calcCelsius takes in fahrenheit $f0
# and returns celsius on $f12
#    printf("In celsius that is %f", calcCelsius(fahrenheit));
	jal calcCelsius
exit: #    return 0;
	li $v0, 10  #exit code for MARS
	syscall
#}
calcCelsius: #float calcCelsius(float f) {
# f is passed in on $f0; return on $f12
#    float offset = 32;
#    float mul = 5;
#    mul = mul/9;  
#    return (f-offset)*mul;
return:
	jr $ra
#}
