
public class Circulo {
	private Ponto centro;
	private double raio;
	private String nome;
	
	public Circulo(double raio, Ponto ct, String nome){
		double[] v = new double[2];
		v = ct.getPonto();
		this.raio = raio;
		centro.setPonto(v[0],v[1]);
		this.nome = nome;
	}
	
	public void setCirculo(double r, Ponto ct, String nome){
		double[] v = new double[2];
		v = ct.getPonto();
		this.raio = r;
		centro.setPonto(v[0], v[1]);
		this.nome = nome;
	}
	public double getRaio(){
		return this.raio;
	}
	public Ponto getCentro() {
		return centro;
	}
	public String getNome() {
		return nome;
	}
	public double diametro(){
		return 2*raio;
	}
	public double area(){
		return Math.PI*Math.pow(raio, 2);
	}
	public double circunferencia(){
		return 2*Math.PI*raio;
	}
}