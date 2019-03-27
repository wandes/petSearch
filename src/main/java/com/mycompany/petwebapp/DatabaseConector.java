/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.petwebapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 *
 * @author Wandes
 */
public class DatabaseConector {
    
    private static final String DRIVER = "org.postgresql.Driver";
    
    private static final String URL = "postgres://wtdfwklzzaoenv:a3c7fd4329d7e"
   + "+123ba36da9e6593aa2f7933344c4866cc24e5b7770725ea1f66@"
   + "ec2-50-19-109-120.compute-1.amazonaws.com:5432/df1vprb22k6md4";
    
    private static final String USER = "wtdfwklzzaoenv";
    
    private static final String PASS = "a3c7fd4329d7e123ba36da9e6593aa2f7933344c4866cc24e5b7770725ea1f66"; 
    
    public  static String conection() throws SQLException{
     
     try{   
     Class.forName(DRIVER);
     String status = null;
     Connection con = DriverManager.getConnection(URL, USER, PASS);       
     Statement customerStmt = con.createStatement();
   
    if (customerStmt != null) {
 
                status = "STATUS--->Conectado com sucesso!";
            } else {
                status = "STATUS--->Não foi possivel realizar conexão";
            }
            return status;
    
     } catch (ClassNotFoundException e) {  //Driver não encontrado
       return "Erro: "+ e;}
    } 
}
