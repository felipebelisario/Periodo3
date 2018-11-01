package com.company;
import javax.swing.JOptionPane;
import java.util.Scanner;

public class Sistema {
    public static void main(String[] args) {
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
                        JOptionPane.showMessageDialog(null,"O dinheiro foi depositado!","Sucesso!",JOptionPane.PLAIN_MESSAGE);
                        System.out.print("\n");
                        break;
                    case 2 :
                        System.out.print("Valor a sacar: ");
                        valor = sc.nextDouble();
                        c.sacar(valor);
                        JOptionPane.showMessageDialog(null,"O dinheiro foi sacado!","Sucesso!",JOptionPane.PLAIN_MESSAGE);
                        System.out.print("\n");
                        break;
                    case 3 :
                        JOptionPane.showMessageDialog(null,"O saldo atual é: " + c.getSaldo() + " reais","Informação:",JOptionPane.INFORMATION_MESSAGE);
                        System.out.print("\n");
                        break;
                    case 4 :
                        System.exit(0);
                    default :
                        System.out.print("\nDigite uma opção valida!\n\n");
                        break;
                }

            } catch (IllegalArgumentException e) {
                JOptionPane.showMessageDialog(null,e.toString(),"ERRO!",JOptionPane.ERROR_MESSAGE);
            } catch (EstouroDeLimiteException e){
                JOptionPane.showMessageDialog(null,e.toString(),"ERRO!",JOptionPane.ERROR_MESSAGE);
            }
        }
    }
}
