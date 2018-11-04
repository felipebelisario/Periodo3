# Aluno: Felipe Alves Belisário
# Matrícula: 11721BCC030
# 3º período em Ciêcia da Computação

# Esse programa lê um numerador e um denominador do teclado e devolve o resultado da divisão e o resto


.data

	Numerador: .asciiz "Numerador: " 		# Armazena a string Numerador na data
	Denominador: .asciiz "Denominador: " 		# Armazena a string Denominador na data
	Quociente: .asciiz "\nQuociente: " 		# Armazena a string Quociente na data
	Resto: .asciiz "\nResto: " 			# Armazena a string Resto na data
	
.text

	li $v0, 4		# Codigo que faz o registrador v0 entrar no modo de printar uma string
	la $a0, Numerador  	# Armazena a string Numerador no registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 5		# Codigo que faz o registrador v0 entrar no modo de ler um inteiro
	syscall			# Ativa o serviço declarado
	
	move $t0,$v0		# Move o conteudo do registrador v0 para o registrador t0
	
	li $v0, 4		# Codigo que faz o registrador v0 entrar no modo de printar uma string
	la $a0, Denominador	# Armazena a string Denominador no registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 5		# Codigo que faz o registrador v0 entrar no modo de ler um inteiro
	syscall			# Ativa o serviço declarado
	
	move $t1,$v0		# Move o conteudo do registrador v0 para o registrador t1
	
	div $t0,$t1		# Efetua a divisao entre os conteudos de t0 e t1 e armazena o quociente em lo e o resto em hi
	
	mflo $s3		# Armazena o quociente no registrador s3
	mfhi $s4		# Armazena o resto no registrador s4
	
	li $v0, 4		# Codigo que faz o registrador v0 entrar no modo de printar uma string
	la $a0, Quociente	# Armazena a string Quociente no registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 1		# Codigo que faz o registrador v0 entrar no modo de printar um inteiro
	move $a0, $s3		# Move o conteudo do registrador s3 para o registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 4		# Codigo que faz o registrador v0 entrar no modo de printar uma string
	la $a0, Resto		# Armazena a string Resto no registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 1		# Codigo que faz o registrador v0 entrar no modo de printar um inteiro
	move $a0, $s4		# Move o conteudo do registrador s4 para o registrador a0
	syscall			# Ativa o serviço declarado
	
	li $v0, 10		# Fim do programa
	syscall
