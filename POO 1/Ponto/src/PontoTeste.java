import java.util.Scanner;

public class PontoTeste {
	public static void main(String[] args){
		Ponto p = new Ponto();
		Ponto p2 = new Ponto();
		
		Scanner scx = new Scanner(System.in);
		Scanner scy = new Scanner(System.in);
		
		System.out.print("Valor de x: ");
		double x = scx.nextDouble();
		System.out.print("Valor de y: ");
		double y = scy.nextDouble();
		
		p.setPonto(x,y);
		
		System.out.print("\nValor de x2: ");
		x = scx.nextDouble();
		System.out.print("Valor de y2: ");
		y = scy.nextDouble();
		
		p2.setPonto(x,y);
		
		System.out.print("\nA distancia eh " + p.distancia(p2));
		
		scx.close();
		scy.close();
		
	}
}
