/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import static br.com.petsearch.mvc.dao.Animal.msgConnection;
import java.sql.Connection;
import java.sql.Date;
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

    protected static String msgConnection;
    private int id;
    private String name;
    private String email;
    private String password;
    private String telephone;
    private String gender;

    public User(int id, String name, String email, String password, String telephone, String gender) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.telephone = telephone;
        this.gender = gender;
    }

    public static void insertUser(String name, String email, String password, String telephone, String gender) throws Exception {
        //inserir usuario

        String sql = "INSERT INTO  users (cd_user, nm_name, nm_email, nm_password, cd_telephone, sg_gender) VALUES (default, ?, ?, ?, ?, ?)";

        Object parameters[] = {name, email, password, telephone, gender};

        DatabaseConnector.execute(sql, parameters);

    }

    public static void insertUserAnimal(int codUser) throws Exception {
        //inserir animal
        String sql = "INSERT INTO  users_animal( cd_users_animal, cd_user, cd_animal) VALUES (default,?,default)";

        Object parameters[] = {codUser};

        DatabaseConnector.execute(sql, parameters);

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
                    (String) row[4],
                    (String) row[5]);
            usuarios.add(u);
        }
        return usuarios;
    }

    public static User getUser(String email, String pass) throws Exception {
        try {
            String SQL = "SELECT cd_user, nm_name , nm_email, nm_password, cd_telephone , sg_gender  FROM users  WHERE nm_email = ? AND nm_password = ? ";
            Object parameters[] = {email, pass};
            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

            if (list.isEmpty()) {
                msgConnection = "Não existe dados cadastrados ";
                return null;
            } else {
                Object row[] = list.get(0);
                User u = new User(
                        (int) row[0],
                        (String) row[1],
                        (String) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5]);
                return u;
            }
        } catch (Exception ex) {
            msgConnection = "Problemas com a conexao: " + ex;
            return null;
        }
    }

    public static User getUserForId(int cod) throws Exception {
        try {
            String SQL = "SELECT cd_user, nm_name , nm_email, nm_password, cd_telephone , sg_gender  FROM users  WHERE cd_user = ? ";
            Object parameters[] = {cod};
            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

            if (list.isEmpty()) {
                msgConnection = "Não existe dados cadastrados ";
                return null;
            } else {
                Object row[] = list.get(0);
                User u = new User(
                        (int) row[0],
                        (String) row[1],
                        (String) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5]);
                return u;
            }
        } catch (Exception ex) {
            msgConnection = "Problemas com a conexao: " + ex;
            return null;
        }
    }

    public static void updateUser(String name, String email, String password, String telephone, int cd_user) throws Exception {

        String SQL = "UPDATE users SET nm_name = ? , nm_email = ? , nm_password = ? , cd_telephone = ?  WHERE cd_user = ?";
        Object parameters[] = {name, email, password, telephone, cd_user};
        DatabaseConnector.execute(SQL, parameters);
    }

    public static void deleteUser(int cd_user) throws Exception {

        String SQL = "DELETE FROM users WHERE cd_user = ?";
        Object parameters[] = {cd_user};
        DatabaseConnector.execute(SQL, parameters);

    }

    public static String getMsgConnection() {
        return msgConnection;
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

}
