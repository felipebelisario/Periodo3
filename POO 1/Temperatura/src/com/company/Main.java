package com.company;

public class Main {

    public static void main(String[] args) {
	    int temperature = 0;
	    if (args.length > 0){
	        try{
	            temperature = Integer.parseInt(args[0]);
            } catch(NumberFormatException e){
	            System.out.println("Tem que passar um inteiro como argumento.");
	            return;
            }
        }
        else{
            System.out.println("Tem que passar uma temperatura.");
            return;
        }

        CoffeeCup cup = new CoffeeCup();
        cup.setTemperature(temperature);

        VirtualPerson cust = new VirtualPerson();
        try{

            cust.drinkCoffee(cup);
            System.out.println("Coffee is just right.");

        } catch(TooColdException e){
            System.out.println("Coffee is too cold.");
        } catch(TooHotException e){
            System.out.println("Coffe is too hot");
        }
    }


}
