# Aluno: Felipe Alves Belisário
# Matrícula: 11721BCC030
# 3º período em Ciêcia da Computação

# Esse programa lê os valores de A, B e C de uma equação de segundo grau e devolve as raízes de delta


.data

	A: .asciiz "A= " 		# Armazena strings e floats na data
	B: .asciiz "B= " 		
	C: .asciiz "C= " 		
	r1: .asciiz "\nr1= "
	r2: .asciiz "\nr2= "
	ret_1: .asciiz "\n-1"
	constant_4: .float 4.0
	num_2: .float 2.0
	

	
.text
	.globl main
	
	main:
	
		li $v0, 4		# Printa a string "A=" com o syscall 4
		la $a0, A 		
		syscall			
	
		li $v0, 6	        # Le um float com o syscall 6
        	syscall				
	
		mov.s $f1, $f0		# Armazena o float lido em f1
	
		li $v0, 4		# Printa a string "B=" com o syscall 4
		la $a0, B		
		syscall			
	
		li $v0, 6	        # Le um float com o syscall 6
        	syscall				
	
		mov.s $f2, $f0		# Armazena o float lido em f2
		
		li $v0, 4		# Printa a string "C=" com o syscall 4
		la $a0, C		
		syscall
	
		li $v0, 6	        # Le um float com o syscall 6
        	syscall			
	
		mov.s $f3, $f0		# Armazena o float lido em f3
	
		jal sqrtDelta		# Chama a funcao sqrtDelta para o calculo da raiz quadrada de delta
		mov.s $f4, $f0
		
		l.s $f7, num_2		# Move a constante num_2 para f7
		
		neg.s $f5, $f2		# Nega B
		add.s $f6, $f5, $f4	# Soma B com a raiz quadrada positiva de delta
		div.s $f8,$f6,$f7 	# Divide a soma acima por 2*A e salva em f8
		
		li $v0, 4		# Printa a string "r1=" com o syscall 4
		la $a0, r1		
		syscall
		
		li $v0, 2		# Printa um float com syscall 2
		mov.s $f12, $f8
        	syscall
        	
        	neg.s $f5, $f2		# Nega B
        	neg.s $f9, $f4		# Nega delta
		add.s $f6, $f5, $f9	# Soma B com a raiz quadrada negativa de delta
		div.s $f8,$f6,$f7	# Divide a soma acima por 2*A e salva em f8
		
		li $v0, 4		# Printa a string "r2=" com o syscall 4
		la $a0, r2		
		syscall
		
		li $v0, 2		# Printa um float com syscall 2
		mov.s $f12, $f8
        	syscall
	
		li $v0, 10		# Fim do programa
		syscall
	
	
	sqrtDelta:			# Declaracao da funcao sqrtDelta
		l.s $f6, constant_4	# Move constant_4 para f6
		mul.s $f4,$f2,$f2	# Multiplicacao B*B
		mul.s $f5,$f1,$f3	# Multiplicacao A*C
		mul.s $f7,$f6, $f5	# Multiplicacao 4*A*C
		sub.s $f8,$f4,$f7	# Subtracao B^2 - 4*A*C
		
		sqrt.s $f0, $f8
		
			
		mfc1   $t1, $f8     		# Armazena delta em $t1
		bltz   $t1, delta_negativo	# Se delta<0 chama a funcao delta_negativo que retorna -1 e encerra o programa
		
		sqrt.s $f0, $f8
		jr $ra
	
	delta_negativo:			# Declaracao da funcao delta_negativo
		
		li $v0, 4		# Printa a string "-1" com o syscall 4
		la $a0, ret_1		
		syscall
		
		li $v0, 10		# Fim do programa
		syscall
