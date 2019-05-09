/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import static br.com.petsearch.mvc.dao.Animal.msgConnection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Wandes
 */
public class Publication {

    private int codPublication;
    private int codStatusAnimal;
    private String dataPublication;
    private int codUser;
    private int codAddress;
    private int codAnimal;
    protected static String msgConnection;

    public Publication(int codPublication, int codStatusAnimal, String dataPublication, int codUser, int codAddress, int codAnimal) {
        this.codPublication = codPublication;
        this.codStatusAnimal = codStatusAnimal;
        this.dataPublication = dataPublication;
        this.codUser = codUser;
        this.codAddress = codAddress;
        this.codAnimal = codAnimal;
    }

    public static void insertPublication(int codStatusAnimal, String dataPublication, int codUser, int codAddress, int codAnimal) throws Exception {
        //inserir animal
        String sql = "INSERT INTO  publication( cd_publication, cd_status_animal , dt_publication, cd_user, cd_address, cd_animal) VALUES (default,?, ?, ?, ?, ?)";

        Object parameters[] = {codStatusAnimal, dataPublication, codUser, codAddress, codAnimal};

        DatabaseConnector.execute(sql, parameters);

    }

    public static Publication getPublication(int cd_user) throws Exception {
        try {
            String SQL = "SELECT u.nm_user, a.nm_animal, a.nm_species_animal, a.nm_color, a.qt_age_animal, e.nm_street FROM users u, animal a, address e WHERE"
                    + "u.cd_user = a.cd_user AND u.user = e.cd_user ";
            Object parameters[] = {cd_user};
            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

            if (list.isEmpty()) {
                msgConnection = "Não existe dados cadastrados ";
                return null;
            } else {
                Object row[] = list.get(0);
                Publication p = new Publication(
                        (int) row[0],
                        (int) row[1],
                        (String) row[2],
                        (int) row[3],
                        (int) row[4],
                        (int) row[5]);
                return p;
            }
        } catch (Exception ex) {
            msgConnection = "Error conexao " + ex;
            return null;
        }
    }

    public static ArrayList<Publication> getPublications() throws Exception {

        String SQL = "SELECT u.nm_user, a.nm_animal, a.nm_species_animal, a.nm_color, a.qt_age_animal, e.nm_street FROM users u, animal a, address e WHERE"
                + "u.cd_user = a.cd_user AND u.user = e.cd_user ";
        ArrayList<Publication> publication = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Publication p = new Publication(
                    (int) row[0],
                    (int) row[1],
                    (String) row[2],
                    (int) row[3],
                    (int) row[4],
                    (int) row[5]);
            publication.add(p);
        }
        return publication;
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

    public String getDataPublication() {
        return dataPublication;
    }

    public void setDataPublication(String dataPublication) {
        this.dataPublication = dataPublication;
    }

    public int getCodUser() {
        return codUser;
    }

    public void setCodUser(int codUser) {
        this.codUser = codUser;
    }

    public int getCodAddress() {
        return codAddress;
    }

    public void setCodAddress(int codAddress) {
        this.codAddress = codAddress;
    }

}
