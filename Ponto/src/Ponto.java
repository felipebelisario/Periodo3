
public class Ponto {
	private double x,y;
	
	public void setPonto(double a, double b){
		this.x = a;
		this.y = b;
	}
	
	public double[] getPonto(){
		double[] v = new double[2];
		v[0] = x;
		v[1] = y;
		return v;
	}
	
	public double distancia(Ponto p){
		
		return Math.sqrt(Math.pow(p.x - this.x, 2) + Math.pow(p.y - this.y, 2));
		
	}
	
	public double distancia(double a, double b){
		
		return Math.sqrt(Math.pow(a - this.x, 2) + Math.pow(b - this.y, 2));
		
	}
	
}
