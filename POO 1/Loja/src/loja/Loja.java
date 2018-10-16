package loja;

import java.util.Scanner;

public class Loja {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        Scanner sc1 = new Scanner(System.in);
        Vendedor[] v = new Vendedor[5];
        Admin[] a = new Admin[5];
        
        for(int i=0; i<5; i++){
            System.out.print("Nome do vendedor " + (i+1) + ": ");
            String nome = sc1.nextLine();
            System.out.print("RG do vendedor " + (i+1) + ": ");
            String rg = sc1.nextLine();
            System.out.print("Salario base do vendedor " + (i+1) + ": ");
            float salario = sc.nextFloat();
            System.out.print("Total mensal do vendedor " + (i+1) + ": ");
            float total = sc.nextFloat();
            
            v[i] = new Vendedor(nome,rg,salario);
            v[i].somaVendas(total);
        }
        
        System.out.print("\n");
        
        for(int i=0; i<5; i++){
            System.out.print("Nome do administrador " + (i+1) + ": ");
            String nome = sc1.nextLine();
            System.out.print("RG do administrador " + (i+1) + ": ");
            String rg = sc1.nextLine();
            System.out.print("Salario base do administrador " + (i+1) + ": ");
            float salario = sc.nextFloat();
            System.out.print("Total de horas extras do administrador " + (i+1) + ": ");
            float horas = sc.nextFloat();
            
            a[i] = new Admin(nome,rg,salario);
            a[i].horasAcumuladas(horas);
        }
        
        System.out.print("\n");
        
        for(int i=0; i < 5; i++){
            System.out.println("O salario de " + v[i].getNome() + " eh " + v[i].getTotal());
        }
        
        System.out.print("\n");
        
        for(int i=0; i < 5; i++){
            System.out.println("O salario de " + a[i].getNome() + " eh " + a[i].getTotal());
        }
    }
    
}