package com.company;

public class TooHotException extends Exception{
    public String toString(){
        return "A temperatura está muito quente!";
    }
}