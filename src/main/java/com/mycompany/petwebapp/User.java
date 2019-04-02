/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.petwebapp;
import java.util.ArrayList;

/**
 *
 * @author Wandes
 */
public class User {
   
    private int id;
    private String nome; 
    private String email;
    private int celular;
    private char sexo;

    public User(int id, String nome, String email, int celular, char sexo) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.celular = celular;
        this.sexo = sexo;
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
    
     public static ArrayList<User> getUsers() throws Exception {
        String SQL = "SELECT * FROM USERS";
        ArrayList<User> users = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User(
                    (int) row[0], 
                    (String) row[1], 
                    (String) row[2], 
                    (int) row[3], 
                    (char) row[4]);
            users.add(u);
        }
        return users;
    }
   
     
}
