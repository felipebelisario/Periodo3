package com.company;

public class ContaBancaria {
    private String proprietario;
    private double saldo = 0;
    private double limite_credito;

    public ContaBancaria(String nome, double limite){
        proprietario = nome;
        limite_credito = limite;
    }

    public double getSaldo() {
        return saldo;
    }

    public void depositar(double valor) throws IllegalArgumentException{
        if(valor<0){
            throw new IllegalArgumentException();
        } else{
            saldo += valor;
        }
    }

    public void sacar(double valor) throws IllegalArgumentException, EstouroDeLimiteException{
        if(valor<0){
            throw new IllegalArgumentException();
        }
        else{
            if(valor > saldo + limite_credito){
                throw new EstouroDeLimiteException();
            }
            else{
                    saldo -= valor;
            }
        }
    }

}
