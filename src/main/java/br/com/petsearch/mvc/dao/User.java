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
    private String gender;

    public User(int id, String name, String email, String password, int telephone, String gender) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.telephone = telephone;
        this.gender = gender;
    }

    public static void insertUser(String name, String email, String password, int telephone, String gender) throws Exception {
        //inserir usuario

        String sql = "INSERT INTO  users (cd_user, nm_name, nm_email, nm_password, cd_telephone, sg_gender) VALUES (default, ?, ?, ?, ?, ?)";

        Object parameters[] = {name, email, password, telephone, gender};

        DatabaseConnector.execute(sql, parameters);

    }
    // modificar método

    public static ArrayList<User> getUserForId() throws Exception {

        String SQL = "SELECT * FROM users;";
        ArrayList<User> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User(
                    (int) row[0],
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (int) row[4],
                    (String) row[5]);
            usuarios.add(u);
        }
        return usuarios;
    }

    public static ArrayList<User> getUsers() throws Exception {
        String SQL = "SELECT * FROM users;";
        ArrayList<User> usuarios = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            User u = new User(
                    (int) row[0],
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (int) row[4],
                    (String) row[5]);
            usuarios.add(u);
        }
        return usuarios;
    }

    public static User getUser(String email, String pass) throws Exception {

        String SQL = "SELECT cd_user, nm_name , nm_email, nm_password, cd_telephone , sg_gender  FROM users  WHERE nm_email = ? AND nm_password = ? ";
        Object parameters[] = {email, pass};
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            User u = new User(
                    (int) row[0],
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (int) row[4],
                    (String) row[5]);
            return u;
        }
    }

    public static void updateUser(String name, String email, String password, int telephone, int cd_user) throws Exception {

        String SQL = "UPDATE users SET nm_name = ? , nm_email = ? , nm_password = ? , cd_telephone = ?  WHERE cd_user = ?";
        Object parameters[] = {name, email, password, telephone, cd_user};
        DatabaseConnector.execute(SQL, parameters);
    }
  
    public static void deleteUser(int cd_user) throws Exception {
       
        String SQL = "DELETE FROM users WHERE cd_user = ?";
        Object parameters[] = {cd_user};
        DatabaseConnector.execute(SQL, parameters);
     
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
