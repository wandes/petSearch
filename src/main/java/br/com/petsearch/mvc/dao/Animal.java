/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import java.util.ArrayList;

/**
 *
 * @author Wandes
 */
public class Animal {

    protected static String msgConnection;
    private int idAnimal;
    private int statusAnimal;
    private String nameAnimal;
    private String nameSpeciesAnimal;
    private String nameRace;
    private String nameColor;
    private int ageAnimal;
    private String comments;
    private int cd_user;

    public Animal(int idAnimal, int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments, int cd_user) {
        this.idAnimal = idAnimal;
        this.statusAnimal = statusAnimal;
        this.nameAnimal = nameAnimal;
        this.nameSpeciesAnimal = nameSpeciesAnimal;
        this.nameRace = nameRace;
        this.nameColor = nameColor;
        this.ageAnimal = ageAnimal;
        this.comments = comments;
        this.cd_user = cd_user;
    }

    public static void updateAnimal(int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments, int cd_user) throws Exception {

        String SQL = "UPDATE animal SET cd_status_animal = ?, nm_animal = ? , nm_species_animal = ? , nm_race = ? , nm_color = ?, qt_age_animal = ?, ds_comments = ?  WHERE cd_user = ?";
        Object parameters[] = {statusAnimal, nameAnimal, nameSpeciesAnimal, nameRace, nameColor, ageAnimal, comments, cd_user};
        DatabaseConnector.execute(SQL, parameters);
    }

    public static Animal getAnimal(int cd_user) throws Exception {
        try {
            String SQL = "SELECT cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, nm_color, qt_age_animal, ds_comments, cd_user FROM animal WHERE cd_user = ?";
            Object parameters[] = {cd_user};
            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

            if (list.isEmpty()) {
                msgConnection = "Não existe dados cadastrados ";
                return null;
            } else {
                Object row[] = list.get(0);
                Animal a = new Animal(
                        (int) row[0],
                        (int) row[1],
                        (String) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5],
                        (int) row[6],
                        (String) row[7],
                        (int) row[8]);
                return a;
            }
        } catch (Exception ex) {
            msgConnection = "Error conexao " + ex;
            return null;
        }
    }

    public static void insertAnimal(int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments, int cd_user) throws Exception {
        //inserir animal

        String sql = "INSERT INTO  animal( cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, nm_color, qt_age_animal, ds_comments, cd_user) VALUES (default,?, ?, ?, ?, ?, ?,?,?)";

        Object parameters[] = {statusAnimal, nameAnimal, nameSpeciesAnimal, nameRace, nameColor, ageAnimal, comments, cd_user};

        DatabaseConnector.execute(sql, parameters);

    }

    public static String getMsgConnection() {
        return msgConnection;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getStatusAnimal() {
        return statusAnimal;
    }

    public void setStatusAnimal(int statusAnimal) {
        this.statusAnimal = statusAnimal;
    }

    public String getNameAnimal() {
        return nameAnimal;
    }

    public void setNameAnimal(String nameAnimal) {
        this.nameAnimal = nameAnimal;
    }

    public String getNameSpeciesAnimal() {
        return nameSpeciesAnimal;
    }

    public void setNameSpeciesAnimal(String nameSpeciesAnimal) {
        this.nameSpeciesAnimal = nameSpeciesAnimal;
    }

    public String getNameRace() {
        return nameRace;
    }

    public void setNameRace(String nameRace) {
        this.nameRace = nameRace;
    }

    public String getNameColor() {
        return nameColor;
    }

    public void setNameColor(String nameColor) {
        this.nameColor = nameColor;
    }

    public int getAgeAnimal() {
        return ageAnimal;
    }

    public void setAgeAnimal(int ageAnimal) {
        this.ageAnimal = ageAnimal;
    }

    public int getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    public int getCd_user() {
        return cd_user;
    }

    public void setCd_user(int cd_user) {
        this.cd_user = cd_user;
    }

}
