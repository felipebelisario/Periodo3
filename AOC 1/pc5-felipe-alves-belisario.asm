# Aluno: Felipe Alves Belisário
# Matrícula: 11721BCC030
# 3º período em Ciêcia da Computação

# Esse programa calcula uma sequencia de numeros a partir de um primeiro termo utilizando a Conjectura de Collatz


.data

	primeiro_termo: .asciiz "Primeiro termo: " 		# Declaracao de strings
	lista: .asciiz "Lista de Termos: "
	virgula: .asciiz ", "
	

	
.text
	.globl main
	
	main:
		
		li $a1, 2				# Declaração das constantes 2 e 3
		li $a3, 3
		
		li $v0, 4		
		la $a0, primeiro_termo 			# Syscall para printar a string primeiro_termo
		syscall
		
		move $a2,$a0		
	
		li $v0, 5	        		# Syscall para ler um inteiro que representa o primeiro termo da sequencia
        	syscall				
	
		move $a2, $v0				# Move o termo lido para $a2
	
		addi $sp, $sp, -4
		sw $a2, 0($sp)
	
		li $v0, 4				# Syscall para printar a string lista
		la $a0, lista		
		syscall
		
		j WHILE
		
		WHILE:			
		
		jal collatz
		
		li $s4, 1
		beq $a2, $s4, END
			
		j WHILE			# Chama a funcao calculaTermo para o calculo dos proximos termos
	
		END:
		
		li $v0, 10				# Encerra o programa
		syscall
	
	
	collatz:			# Declaracao da funcao calculaTermo	
		lw $a2,0($sp)
		
		j calculaTermo
		
	calculaTermo:
	
		li $s4, 1
		beq $a2, $s4, END_2
		
		div $a2,$a1			# Divide o termo por 2
		mfhi $s0				# Move resto da divisao para $s0
				
		beqz $s0, sePar				# Se o resto for igual a zero chama a funcao sePar
		bnez $s0, seImpar			# Se o resto for diferente de zero chama a funcao seImpar
			
			
	sePar:						# Declaracao da funcao sePar
		div $a2,$a1
		mflo $a2
		
		li $s4, 1
		beq $a2, $s4, END_2
		
		li $v0, 1				# ---
		move $a0, $a2				#    |
		syscall					#    |
							#    |
		move $a2,$a0				#    |-> Formatacao e print do termo
							#    |
		li $v0, 4				#    |
		la $a0, virgula				#    |
		syscall					# ---
	
		addi $sp,$sp, 4
		addi $sp,$sp,-4
		sw $a2, 0($sp)
		
		jr $ra			# Chama a funcao calculaTermo novamente para o calculo do proximo termo
		

		
	seImpar:
							# Declaracao da funcao seImpar
		li $s4, 1
		mul $s0,$a3,$a2				# Multiplica o termo por 3
		add $a2,$s0,$s4				# Soma 1 apos a multiplicacao
		
		li $s4, 1
		beq $a2, $s4, END_2
		
		li $v0, 1				# ---
		move $a0, $a2				#    |
		syscall					#    |
							#    |
		move $a2,$a0				#    |-> Formatacao e print do termo
							#    |
		li $v0, 4				#    |
		la $a0, virgula				#    |
		syscall					# ---

		addi $sp,$sp, 4
		addi $sp,$sp,-4
		sw $a2, 0($sp)		# Chama a funcao calculaTermo novamente para o calculo do proximo termo
			
		jr $ra
		
	END_2:
	
		li $v0, 1				
		move $a0, $a2				
		syscall
		
		jr $ra	
		
