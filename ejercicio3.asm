.data
	num1: .asciiz "Introduce un entero: "
	a: .word 0
	b1: .word 1
	c: .word 0
	msg1: .asciiz "contador: "
	msg2: .asciiz "numero ingresado: "
	msg3: .asciiz " , resultado: "
	newline:    .asciiz "\n"
.text
main: 
	lw $t1, a
	lw $t2, b1
	lw $t3, c
	li $t4,0
	li $v0, 4 # código de imprimir cadena
	la $a0, num1 # dirección de la cadena
	syscall # Llamada al sistema
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	move $t0, $v0
	li $v0, 4          # Código de llamada al sistema para imprimir una cadena
    	la $a0, newline    # Cargamos la dirección de la cadena newline en $a0
    	syscall
	li $v0,4
	la $a0, msg2
	syscall 
	li $v0, 1
	move $a0, $t0
	syscall
loop:
	ble $t4,$t0, operacion
	j fin

operacion:
    	#sumar a y b, guardar en c
    	add $t3,$t1,$t2
    	#salto de linea
	li $v0, 4          # Código de llamada al sistema para imprimir una cadena
    	la $a0, newline    # Cargamos la dirección de la cadena newline en $a0
    	syscall
	#imprimir a
	li $v0,4
	la $a0, msg1
	syscall 
	li $v0, 1
	move $a0, $t1
	syscall
	#mover datos
	move $t1 , $t2
	move $t2 , $t3
   	addi $t4,$t4,1
	j loop
fin:
	li $v0, 10
	syscall 
