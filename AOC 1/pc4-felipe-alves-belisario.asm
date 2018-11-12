# Aluno: Felipe Alves Belisário
# Matrícula: 11721BCC030
# 3º período em Ciêcia da Computação

# Esse programa calcula os dois digitos finais de virificacao a partir dos 9 primeiros digitos de um CPF


.data

	input: .asciiz "Input ID Digits: " 				# Declaracao de strings
	output: .asciiz "Output CPF: "
	newline: .asciiz "\n"
	traco: .byte '-'						# Declaracao do char -
	iddigit: .space 36						# Declaracao do array id-digit com 36 bytes de espaco (int = 4 bytes) 
	cpfdigit: .space 45						# Declaracao do array id-digit com 45 bytes de espaco (char = 1 byte)
		

	
.text
	.globl main
	
	main:
		
		li $v0, 4		
		la $a0, input 						# Syscall para printar a string input
		syscall
		
		li $v0, 5						# Syscall para ler um inteiro
		syscall
		
		move $a0, $v0						# Move o inteiro lido para $a0

		li $a2, 10						# Atribuicao de valor a uma constante e do indicie do array 
		addi $a3, $zero, 36
		
		armazenar_elem:						# While que pega o inteiro lido e a cada loop divide ele por 10, pega o resto dessa divisao e armazena no fim de id-digit
		
			beqz $a3, exit					# Se $a3 = 0 vai para exit
			
			div $a0, $a2
			mflo $a0					# Operacoes
			mfhi $s0
			
			subi $a3, $a3, 4				# A cada loop decrementa em 4 bytes o indice do array
			sb $s0, iddigit($a3)				# Armazena na posicao $a3 do array
			
			
			j armazenar_elem
			
		exit:
		
		jal calcula_primeiro_termo				# Chama a funcao calcula_primeiro_termo
		jal calcula_segundo_termo				# Chama a funcao calcula_segundo_termo
		
		li $v0, 4		
		la $a0, output 						# Syscall para printar a string output
		syscall
		
		li $a3, 0
		li $a1, 45						# Atribuicao de valores a constantes e variaveis 
		li $t0, 36
		
		print:							# While para printar elementos de cpf-digit
			
			lb $a0, cpfdigit($a3)
			
			
			li $v0,1
			syscall
			
			addi $a3, $a3, 4
			
			beq $a3, $t0, print_traco			# Caso o elemento atual seja o traco (-) va para print_traco 
			beq $a3, $a1, end_print
			
			j print
			
		print_traco:						# Print especifico para o traco (-) ja que o mesmo nao eh um inteiro
		
			li $v0, 4		
			la $a0, traco 					
			syscall
			addi $a3, $a3, 1
			
			j print
			
		end_print:
		
		li $v0, 4		
		la $a0, newline 					
		syscall

		li $v0, 10						# Fim do programa
		syscall
		
		
		
		
	
	calcula_primeiro_termo:						# Definicao da funcao calcula_primeiro_termo
	
				addi $a1, $zero, 36
				li $a2, 10
				li $t0, 10				# Atribuicao de valores a constantes e variaveis 
				li $t1, 11				
				li $s3, 0
				
				while2:
					lb $s2, iddigit($a3)		# Copia o valor do elemento do array de indice $a3 para $s2
					sb $s2, cpfdigit($a3)		# Nesse while, copia os valores de id-digit para cpf-digit
					
					mul $s0, $s2, $a2
					add $s3, $s0, $s3
							
					subi $a2, $a2, 1			
					addi $a3, $a3, 4		
					
					beq $a3, $a1 , exit2		# Se $a3 = $a1 vai para exit2
					
					j while2
				
					
				exit2:
				
				la $a0, traco
				sb $a0, cpfdigit($a3)			# Insere o char traco (-) apos o nono elemento do array
				addi $a3, $a3, 1
					
				mul $s3, $s3, $t0
				div $s3, $t1
					
				mfhi $s0
					
				beq $s0, $t0, trata_primeiro_10		# Caso o primeiro digito = 10 vai para trata_primeiro_10
					
				sb $s0, cpfdigit($a3)
				
				jr $ra
				
				trata_primeiro_10:			# Substitui 10 por 0
					li $s0, 0
					sb $s0, cpfdigit($a3)
				
					jr $ra
					
		
		
	calcula_segundo_termo:						# Definicao da funcao calcula_primeiro_termo
				addi $a1, $zero, 41
				li $a2, 11
				li $a3, 0
				li $t0, 10				# Atribuicao de valores a constantes e variaveis
				li $t1, 11
				li $t2, 36				
				li $s3, 0
				
				while3:
					lb $s2, cpfdigit($a3)		# Copia o valor do elemento do array de indice $a3 para $s2
					
					mul $s0, $s2, $a2
					add $s3, $s0, $s3
					
					subi $a2, $a2, 1
					addi $a3, $a3, 4
					
					beq $a3, $t2, trata_traco	# Caso o elemento atual seja o traco (-) va para trata_traco
					beq $a3, $a1 , exit3
					
					j while3
				
				trata_traco:				# Pula o traco ja que nao eh um inteiro
					addi $a3, $a3, 1
					j while3
				
				exit3:
					
				mul $s3, $s3, $t0
				div $s3, $t1
					
				mfhi $s0
				
				beq $s0, $t0, trata_segundo_10		# Caso o primeiro digito = 10 vai para trata_segundo_10
					
				sb $s0, cpfdigit($a3)
				
				jr $ra
				
				trata_segundo_10:			# Substitui 10 por 0
					li $s0, 0
					sb $s0, cpfdigit($a3)
				
					jr $ra
					
		
