package com.company;

public class Vendedor extends Funcionario {
    private float comissao;
    private float total = 0;

    public Vendedor(String nome, String rg, float salario) {
        setNome(nome);
        setRg(rg);
        setSalario(salario);
    }

    public void somaVendas(float valor){
        total = total + valor;
    }

    public float getTotal(){
        comissao = total * 0.05f;
        float s = getSalario();
        total = 0;
        return (comissao + s);
    }
}
