/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

/**
 *
 * @author Wandes
 */
public class Animal {

    private int idAnimal;
    private int statusAnimal;
    private String nameAnimal;
    private String nameSpeciesAnimal;
    private String nameRace;
    private String nameColor;
    private int ageAnimal;
    private String comments;
     
    public Animal(int idAnimal, int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments) {
        this.idAnimal = idAnimal;
        this.statusAnimal = statusAnimal;
        this.nameAnimal = nameAnimal;
        this.nameSpeciesAnimal = nameSpeciesAnimal;
        this.nameRace = nameRace;
        this.nameColor = nameColor;
        this.ageAnimal = ageAnimal;
        this.comments = comments;
    } 
    
     public static void inserAnimal( int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments) throws Exception {
        //inserir animal

        String sql = "INSERT INTO  users ( cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, nm_color, qt_age_animal, ds_comments, cd_user) VALUES (default, ?, ?, ?, ?, ?,?,?,default)";
       
        Object parameters[] = { statusAnimal,  nameAnimal,  nameSpeciesAnimal, nameRace,  nameColor,  ageAnimal,  comments};

        DatabaseConnector.execute(sql, parameters);

    } 

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
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

}
