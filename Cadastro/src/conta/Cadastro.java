package conta;
import java.util.Scanner;

public class Cadastro {
	private final int MAX = 20;
	private int cont = 0;
	private String[] nomes = new String[MAX];
	
	public void inserir(String nome){
		this.nomes[cont] = nome;
		cont++;
	}
	
	public String buscar(int posicao){
		return nomes[posicao];
	}
	
	public int posicao(String nome){
		for(int i=0;i<cont;i++){
			if(nomes[i].equals(nome)) return i;
		}
		return -1;
	}
	
	public boolean existe(String nome){
		for(int i=0;i<cont;i++){
			if(nomes[i].equals(nome)) return true;
		}
		return false;
	}
	
	public void excluir(int pos){
		if(pos!=MAX-1){
			for(int i=pos;i<cont;i++){
			nomes[i] = nomes[i+1];
			}
			cont--;
		}
		else cont--;
	}
	
	public void excluir(String nome){
		for(int i=0;i<cont;i++){
			if(nomes[i].equals(nome)){
				this.excluir(i);
			}
		}
	}
	
	public void printCadastros(){
		for(int i=0; i<cont; i++){
			System.out.println(nomes[i]);
		}
	}
	
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Cadastro c1 = new Cadastro();
				
		while(true){
			
		System.out.print("Cadastro: \n\nNome: ");
		String nome = sc.nextLine();
		c1.inserir(nome);
		
		System.out.print("\nDeseja efetuar outro cadastro? (sim ou nao) ");
		String op = sc.nextLine();
		if(!op.equals("sim")) break;
		System.out.print("\n");
		}
		
		System.out.println("\nClientes cadastrados ate o momento: ");
		c1.printCadastros();
		
		
		System.out.print("\nDeseja exluir qual? ");
		String nome = sc.nextLine();
		
		int pos = c1.posicao(nome);
		c1.excluir(pos);
		
		System.out.println("\nClientes cadastrados ate o momento: ");
		c1.printCadastros();
	}
}
	

