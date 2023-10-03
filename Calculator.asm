.data
	Num1: .asciiz "\nEnter First Number: "
	Num2: .asciiz "\nEnter Second Number: "

	promptMsg: .asciiz "\nEnter Number To Find Factorial: "
	resultMsg: .asciiz "\nResult Is: "
	theNumber: .word 0
	theAnswer: .word 0
	
	promptX: .asciiz "Enter a number for X: "
	promptY: .asciiz "Enter a number for Y: "
 	promptR: .asciiz "The result of the exponential funcion: F(x,y) = x^y is "

	ADD: .asciiz "\nPress 1 For Addition: "
	SUB: .asciiz "\nPress 2 For Subtractin: "
	MUL: .asciiz "\nPress 3 For Multiplication: "
	DIV: .asciiz "\nPress 4 For Division: "
	FACT: .asciiz "\nPress 5 For Factorial: "
	EXP: .asciiz "\nPress 6 For Exponent: "
	
	UserCH: .asciiz "\nPlease Enter Your Choice: "
	
	#Input Number
	
	Result: .asciiz "\nHere Is Your Result: "
	
.text

.globl Addition
.globl Subtraction
.globl Multiplication
.globl Division
.globl Factorial
.globl Exponential


.globl main

main:

#Addition
	la	 $a0,ADD  
	li	 $v0, 4	
	syscall
	
#Subtraction
	la	 $a0,SUB  
	li	 $v0, 4	
	syscall

#Multiplication
	la	 $a0,MUL  
	li	 $v0, 4	
	syscall

#Division
	la	 $a0,DIV  
	li 	$v0, 4	
	syscall

#Factorial
	la	 $a0,FACT  
	li	 $v0, 4	
	syscall

#Factorial
	la	 $a0,EXP  
	li	 $v0, 4	
	syscall

 #For User Input For Choice
 
	la	 $a0, UserCH  
	li 	$v0, 4	
	syscall
	
#for input
	
	li 	$v0, 5
	syscall
	
	move 	$t0, $v0
	
#For user choice comparison

	addi 	$t1, $zero, 1

	addi 	$t2, $zero, 2

	addi 	$t3, $zero, 3

	addi 	$t4, $zero, 4

	addi 	$t5, $zero, 5

	addi 	$t6, $zero, 6

			
	#for Addition
	beq 	$t0, $t1, Addition
	
	#for subtraction
	beq 	$t0, $t2, Subtraction
 	
	#for multiply
	beq	 $t0, $t3, Multiplication
	
	#for Divide
	beq 	$t0, $t4, Division
	
	#for Factorail
	beq	 $t0, $t5, Factorial
	
	#for Exponent
	beq	 $t0, $t6, Exponential
	
#program ENDS

	li,	$v0 , 10
	syscall


#From User Choice



	
Addition:

	#User Input Number 1
	la 	$a0, Num1  
	li 	$v0, 4	
	syscall

	li 	$v0, 7 
	syscall
	
	mov.d 	$f4, $f0 #if user entered doubled value

#User Input 2
	la 	$a0, Num2  
	li 	$v0, 4		
	syscall
	
	li 	$v0, 7 
	syscall
	
	mov.d 	$f6, $f0 #if user entered doubled value
	

	#adding variables value
	add.d 	$f4, $f4, $f6
	
	la	 $a0, Result
	li	 $v0, 4
	syscall
	
	#print sum
	
	mov.d	 $f12, $f4 #move result
	li	 $v0, 3
	syscall

#end process
	
	li 	$v0, 10
	syscall
	
Subtraction:

	#User Input Number 1
	la 	$a0,Num1  
	li 	$v0, 4	
	syscall

	li 	$v0, 7 
	syscall
	
	mov.d 	$f4, $f0 	#if user entered doubled value

#User Input 2
	la	 $a0,Num2  
	li	 $v0, 4		
	syscall
	
	li 	$v0, 7 
	syscall
	
	mov.d 	$f6, $f0
	
	
	#subtracting variable
	sub.d	 $f4, $f4, $f6
	
	la	$a0, Result
	li 	$v0, 4
	syscall
	
	#print Difference
	mov.d 	$f12, $f4
	li 	$v0, 3
	syscall

#end process
	
	li 	$v0, 10
	syscall
	

Multiplication:
	
	#User Input Number 1
	la 	$a0,Num1  
	li 	$v0, 4	
	syscall

	li 	$v0, 7 
	syscall
	
	mov.d	 $f4, $f0

#User Input 2
	la 	$a0,Num2  
	li	 $v0, 4		
	syscall
	
	li	 $v0, 7 
	syscall
	
	mov.d	 $f6, $f0
	


	
	mul.d	 $f4, $f4, $f6
	
	la 	$a0, Result
	li 	$v0, 4
	syscall
	
	#print Multiple
	mov.d 	$f12, $f4
	li 	$v0, 3
	syscall

#end process
	
	li 	$v0, 10
	syscall
	
Division:
	
	#User Input Number 1
	la	 $a0,Num1  
	li	 $v0, 4	
	syscall

	li 	$v0, 7 
	syscall
	
	mov.d 	$f4, $f0

#User Input 2
	la	 $a0,Num2  
	li 	$v0, 4		
	syscall
	
	li	 $v0, 7 
	syscall
	
	mov.d 	$f6, $f0
	


	
	div.d 	$f4, $f4, $f6
	
	la 	$a0, Result
	li 	$v0, 4
	syscall
	
	#print Division
	mov.d	 $f12, $f4
	li 	 $v0, 3
	syscall

#end process
	
	li 	$v0, 10
	syscall
	
	
Factorial:
	
	
	#Read the number from the user
	li 	$v0, 4
	la 	$a0, promptMsg
	syscall
	
	li 	$v0, 5
	syscall
	
	sw	 $v0, theNumber #number stored
	
	#Call the functiojn\
	lw 	$a0, theNumber #argument send
	jal 	findFactorial #jump to function
	sw	 $v0, theAnswer #answer
	
	#dsiplay The result
	li	 $v0, 4	
	la	 $a0, resultMsg
	syscall
	
	li 	$v0, 1
	lw 	$a0, theAnswer
	syscall
	
	li	 $v0, 10
	syscall


 findFactorial:
 	subu	 $sp, $sp, 8 #locate new word
 	sw	 $ra, ($sp)  #push the content/ stack value stored
 	sw	 $s0, 4($sp) #pop the contents
	
	# Base Case
	li	 $v0, 1 #if argument is zero then goto factorial done
	beq	 $a0, 0, factorialDone
	
	#if not then go ahead
	#then subtract -1
	
	move	 $s0, $a0
	sub	 $a0, $a0, 1
	jal	 findFactorial #then again called function
	
	mul	 $v0, $s0, $v0 #when function is recalling this line is execute
	
	factorialDone: 
		lw	 $ra, ($sp)	#Returning adress
		lw	 $s0, 4($sp)	#load local vV back to register
		addu	 $sp, $sp, 8	#restore stack itself by subtract
		jr	 $ra		#return the function

		

Exponential:
	
	li	 $v0,	4		# System call code for print string
	la 	 $a0,	promptX 	# Load address of the promptX string
	syscall 			# call OS to Print promptX
	
	li	 $v0,	5 		# System call code for read integer
	syscall 			# call OS to Read integer into $v0
	
	move 	$s0,	$v0 		# Move the integer into $s0
	
	li	$v0,	4		# System call code for print string
	la	$a0,	promptY		# Load address of the promptY string
	syscall 			# call OS to Print promptY
	
	li 	$v0,	5 		# System call code for read integer
	syscall 			# call OS to Read integer into $v0
	move 	$s1,	$v0 		# Move the integer into $s1
	
	move	$a0,	$s0		# Move the integer in $s0 into $a0
	move	$a1,	$s1		# Move the integer in $s1 into $a1
	
	jal	exponential		# Jum and link to exponential sub routine
	
	# Print out the result
	li $v0, 4
	la $a0, Result
	syscall

	
	move	$a0,	$v0
	li	$v0,	1
	syscall 
	
	
	
	# End the Program
	li 	$v0,	10		#System call code to Exit
	syscall				#call OS to Exit the program
exponential: 
	addi	$sp,	$sp,	-4	#locate stack
	sw	$t0,	4($sp)		#pop the contents
	
	move	$t0,	$zero
	li	$v0,	1
loop: 
	beq	$t0,	$a1,	end	# Checks to see if $t0 is equal to $a1 if not
					# it continues, if it is it jumps to end
	mul	$v0,	$v0,	$a0	# Multiplies the value in $a0 by the value in $v0
	addi	$t0,	$t0,	1	# Adds 1 to $t0 and stores it in $t0 because
					# $t0 is the loop counter
	j	loop			# Jumps to the beginning of the loop to start
					# the process over
end:
	#restore $t0 and the stack
	lw	$t0,	4($sp)
	addi	$sp,	$sp,	4
	jr	$ra
