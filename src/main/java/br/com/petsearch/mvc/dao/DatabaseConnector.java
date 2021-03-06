/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 *
 * @author Wandes
 */
public class DatabaseConnector {

   private static final String DRIVER = "org.postgresql.Driver";

    private static final String URL = "jdbc:postgresql://ec2-50-19-109-120.compute-1.amazonaws.com:5432/df1vprb22k6md4?ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";

    private static final String USER = "wtdfwklzzaoenv";

    private static final String PASS = "a3c7fd4329d7e123ba36da9e6593aa2f7933344c4866cc24e5b7770725ea1f66";
    
    
     public static final ArrayList<Object[]> getQuery(String SQL, Object[] parameters) throws Exception{
        ArrayList<Object[]> list = new ArrayList<>();
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        PreparedStatement stmt = con.prepareStatement(SQL);
        for (int i = 0; i < parameters.length; i++) {
            stmt.setObject(i+1, parameters[i]);
        }
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            Object row[] = new Object[rs.getMetaData().getColumnCount()];
            for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
                row[i] = rs.getObject(i+1);
            }
            list.add(row);
        }
        rs.close(); stmt.close(); con.close();
        return list;
    }
    
     //insere um objeto no banco
    public static void execute (String SQL, Object[] parameters) throws Exception{
        ArrayList<Object[]> list = new ArrayList<>();
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        PreparedStatement stmt = con.prepareStatement(SQL);
        for (int i = 0; i < parameters.length; i++) {
            stmt.setObject(i+1, parameters[i]);
        }
        stmt.execute();
        stmt.close(); 
        con.close();
    }
    
    
    
}
