/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.petwebapp;

/**
 *
 * @author Wandes
 */
public class User {
    private String nome; 
    private String email;
    private int celular;

    public void User(String nome, String email, int celular) {
        this.nome = nome;
        this.email = email;
        this.celular = celular;
    }
    
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCelular() {
        return celular;
    }

    public void setCelular(int celular) {
        this.celular = celular;
    }
    
    public static boolean updateUser(){
    //atualiza user
        return false;
    }
    
    public static boolean disableUser(){
    //desabilita user
    return false;
    }
    
    public static void listUser(){
    //lista user
    }
    
     
}
