/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.model;

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

    public User(int id, String nome, String email, int celular /*char sexo*/) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.celular = celular;
        //this.sexo = sexo;
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
        public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /*   public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }*/
    public static boolean updateUser() {
        //atualiza user
        return false;
    }

    public static boolean disableUser() {
        //desabilita user
        return false;
    }

    public static void listUser() {
        //lista user
    }
  
 /*   public static ArrayList<User> getUser() throws Exception {
        String SQL = "SELECT * FROM usuario;";
        ArrayList<User> user = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User(
                    (int) row[0],
                    (String) row[1],
                    (String) row[2],
                    (int) row[3]);
            //(char) row[4]);
            user.add(u);
        }

        return user;
    }*/


}