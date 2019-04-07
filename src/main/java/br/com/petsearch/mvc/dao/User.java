/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.postgresql.core.ConnectionFactory;

/**
 *
 * @author Wandes
 */
public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private int telephone;
    private String sex;
   

    /*public User(int id, String name, String email, String password, int telephone, String sex) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.password = password;
    this.telephone = telephone;
    this.sex = sex;
    }*/
    public static void insertUser(String name, String email, String password, int telephone, String sex) throws SQLException, Exception {
        //inserir usuario
        try {

            String sql = "INSERT INTO users (default, nome, email, celular, sexo) values ( ?, ?, ?, ?);";

            Object parameters[] = {name, email, password, telephone, sex};
            DatabaseConnector.execute(sql, parameters);

        } catch (SQLException e) {
            System.out.println(e);

        }

    }

    public List<User> getUsers() throws SQLException {
        //mostrar

 

        String sql = "SELECT * FROM users;";
        return null;

    }

    public static boolean updateUser() {
        //atualiza user
        return false;
    }

    public static boolean disableUser() {
        //desabilita user
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getTelephone() {
        return telephone;
    }

    public void setTelephone(int telephone) {
        this.telephone = telephone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

}
