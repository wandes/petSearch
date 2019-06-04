/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import static br.com.petsearch.mvc.dao.Animal.msgConnection;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.util.Date;

import java.util.ArrayList;

/**
 *
 * @author Wandes
 */
public class Publication {

    private int codPublication;
    private int codStatusAnimal;
    private int codUser;
    private int codAnimal;
    protected static String msgConnection;

    public Publication(int codPublication, int codStatusAnimal, int codUser, int codAnimal) {
        this.codPublication = codPublication;
        this.codStatusAnimal = codStatusAnimal;
        this.codUser = codUser;
        this.codAnimal = codAnimal;
    }

    public static void insertPublication(int codStatusAnimal, int codUser) throws Exception {
        //inserir animal
        String sql = "INSERT INTO  publication( cd_publication, cd_status_animal , cd_user, cd_animal) VALUES (default,?, ?, default)";

        Object parameters[] = {codStatusAnimal, codUser};

        DatabaseConnector.execute(sql, parameters);

    }

    public static ArrayList<Publication> getPublication() throws Exception {

        try {
            String SQL = "SELECT * FROM publication ORDER BY cd_animal DESC;";
            ArrayList<Publication> publication = new ArrayList<>();
            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
            for (int i = 0; i < list.size(); i++) {
                Object row[] = list.get(i);
                Publication p = new Publication(
                        (int) row[0],
                        (int) row[1],
                        (int) row[2],
                        (int) row[3]);
                publication.add(p);
            }
            return publication;

        } catch (Exception ex) {
            msgConnection = "Error conexao " + ex;
        }
        return null;
    }

    public static String getMsgConnection() {
        return msgConnection;
    }

    public int getCodAnimal() {
        return codAnimal;
    }

    public void setCodAnimal(int codAnimal) {
        this.codAnimal = codAnimal;
    }

    public int getCodPublication() {
        return codPublication;
    }

    public void setCodPublication(int codPublication) {
        this.codPublication = codPublication;
    }

    public int getCodStatusAnimal() {
        return codStatusAnimal;
    }

    public void setCodStatusAnimal(int codStatusAnimal) {
        this.codStatusAnimal = codStatusAnimal;
    }

    public int getCodUser() {
        return codUser;
    }

    public void setCodUser(int codUser) {
        this.codUser = codUser;
    }

}
