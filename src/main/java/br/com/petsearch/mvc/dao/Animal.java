/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import static br.com.petsearch.mvc.dao.User.msgConnection;
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
    private String nameGenderAnimal;
    private String nameColor;
    private int ageAnimal;
    private String comments;
  

    public Animal(int idAnimal, int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameGenderAnimal, String nameColor, int ageAnimal, String comments) {
        this.idAnimal = idAnimal;
        this.statusAnimal = statusAnimal;
        this.nameAnimal = nameAnimal;
        this.nameSpeciesAnimal = nameSpeciesAnimal;
        this.nameRace = nameRace;
        this.nameColor = nameColor;
        this.ageAnimal = ageAnimal;
        this.comments = comments;
        this.nameGenderAnimal = nameGenderAnimal;
    }

    public static void updateAnimal(int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameGenderAnimal ,String nameColor, int ageAnimal, String comments, int cd_animal) throws Exception {

        String SQL = "UPDATE animal SET cd_status_animal = ?, nm_animal = ? , nm_species_animal = ? , nm_race = ? ,sg_gender_animal = ? , nm_color = ?, qt_age_animal = ?, ds_comments = ?  WHERE cd_animal= ?";
        Object parameters[] = {statusAnimal, nameAnimal, nameSpeciesAnimal, nameRace,nameGenderAnimal , nameColor, ageAnimal, comments, cd_animal};
        DatabaseConnector.execute(SQL, parameters);
    }

    public static Animal getAnimal(int cd_user) throws Exception {
        try {
            String SQL = "SELECT cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, sg_gender_animal, nm_color, qt_age_animal, ds_comments FROM animal WHERE cd_animal = ?; ";
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
                        (String) row[6],
                        (int) row[7],
                        (String) row[8]);
                     
                return a;
            }
        } catch (Exception ex) {
            msgConnection = "Problemas com a conexao: " + ex;
           return null;
        }
    }
    
    public static ArrayList<Animal> getAnimais (int cod)throws Exception{
      String SQL = "SELECT a.cd_animal, a.cd_status_animal, a.nm_animal, a.nm_species_animal, a.nm_race, a.sg_gender_animal, a.nm_color, a.qt_age_animal, a.ds_comments FROM animal a, users_animal u WHERE a.cd_animal = u.cd_animal AND u.cd_user = ?  ";
        ArrayList<Animal> animal = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{cod});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Animal a = new Animal(
                        (int) row[0],
                        (int) row[1],
                        (String) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5],
                        (String) row[6],
                        (int) row[7],
                        (String) row[8]);
            animal.add(a);
        }
        return animal;
    }

 
  

    
     public static void deleteAnimal(int cd_animal) throws Exception {
       
        String SQL = "DELETE FROM animal WHERE cd_animal = ?";
        Object parameters[] = {cd_animal};
        DatabaseConnector.execute(SQL, parameters);
        
    }
     

    public static void insertAnimal(int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameGenderAnimal, String nameColor, int ageAnimal, String comments) throws Exception {
        //inserir animal

        String sql = "INSERT INTO  animal( cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, sg_gender_animal, nm_color, qt_age_animal, ds_comments) VALUES (default,?, ?, ?, ?, ?, ?,?,?)";

        Object parameters[] = {statusAnimal, nameAnimal, nameSpeciesAnimal, nameRace, nameGenderAnimal, nameColor, ageAnimal, comments};

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

  

    public String getNameGenderAnimal() {
        return nameGenderAnimal;
    }

    public void setNameGenderAnimal(String nameGenderAnimal) {
        this.nameGenderAnimal = nameGenderAnimal;
    }

}
