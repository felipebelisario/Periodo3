package com.company;
import java.util.Scanner;

public class Sistema {
    public static void main(String[] args) throws IllegalArgumentException {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nome do proprietario: ");
        String nome = sc.nextLine();

        System.out.print("Limite de credito: ");
        double lim = sc.nextDouble();
        System.out.print("\n");

        ContaBancaria c = new ContaBancaria(nome, lim);

        while (true) {
            try {


                System.out.print("1- Depositar\n2- Sacar\n3- Saldo\n4- Sair\n\nEscolha: ");
                int op = sc.nextInt();
                switch (op) {
                    case 1:
                        System.out.print("Valor a depositar: ");
                        double valor = sc.nextDouble();
                        c.depositar(valor);
                        System.out.print("\n");
                        break;
                    case 2 :
                        System.out.print("Valor a sacar: ");
                        valor = sc.nextDouble();
                        c.sacar(valor);
                        System.out.print("\n");
                        break;
                    case 3 :
                        System.out.println("O saldo atual é: " + c.getSaldo() + " reais \n");
                        break;
                    case 4 :
                        System.exit(0);
                    default :
                        System.out.print("\nDigite uma opção valida!\n\n");
                        break;
                }

            } catch (IllegalArgumentException e) {
                System.out.println("\nErro! Valor negativo!\n");
            } catch (EstouroDeLimiteException e){
                System.out.println("\nErro! Estouro de limite de crédito!\n");
            }
        }
    }
}
