package leitura;
import java.util.Scanner;

public class Main {
	private int preto = 127;
	
	public char verificaLetra(int[] alternativas) {
		int cont = 0, num=0;
		for(int i=0;i<5;i++) {
			if(alternativas[i]<=this.preto) {
				cont++;
				num = i+1;
			} 
		}
		if(cont>1) return '*';
		else 
			switch(num) {
			case 1 : return 'A';
			case 2 : return 'B';
			case 3 : return 'C';
			case 4 : return 'D';
			case 5 : return 'E';
			}
		return '*';
	}
	
		public static void main(String[] args) {
			Scanner sc = new Scanner(System.in);
			Main opcoes = new Main();

			
			while(true) {
				int qnt = sc.nextInt();
				char[] letra = new char[qnt];
				if(qnt==0) break;
				else {
					for(int j=0;j<qnt;j++) {
						int[] alt = new int[5];
						for(int i=0; i<5;i++) {
							alt[i] = sc.nextInt();
						}
						letra[j] = opcoes.verificaLetra(alt);
				
					}
					for(int j=0;j<qnt;j++) {
						System.out.println(letra[j]);
					}
				}
				
			}
		}
}
