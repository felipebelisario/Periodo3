package com.company;

public class Admin extends Funcionario{

    private float total;

    public Admin(String nome, String rg, float salario) {
        setNome(nome);
        setRg(rg);
        setSalario(salario);
    }

    public void horasAcumuladas(float horas){
        float comissao = 0.01f * getSalario() * horas;
        total = comissao + getSalario();
    }

    public float getTotal() {
        float t = total;
        total = 0;
        return t;
    }
}
