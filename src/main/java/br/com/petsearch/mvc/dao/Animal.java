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

    private int idAnimal;
    private int statusAnimal;
    private String nameAnimal;
    private String nameSpeciesAnimal;
    private String nameRace;
    private String nameColor;
    private int ageAnimal;
    private String comments;
    private String genderAnimal;
    
     
    public  Animal(int idAnimal, int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments) {
        this.idAnimal = idAnimal;
        this.statusAnimal = statusAnimal;
        this.nameAnimal = nameAnimal;
        this.nameSpeciesAnimal = nameSpeciesAnimal;
        this.nameRace = nameRace;
        this.nameColor = nameColor;
        this.ageAnimal = ageAnimal;
        this.comments = comments;
      
    } 
    
   public static ArrayList<Animal> getAnimal() throws Exception {
        String SQL = "SELECT * FROM animal";
        ArrayList<Animal> animal = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Animal a = new Animal(
                    (int) row[0],
                    (int) row[1],
                    (String) row[2], 
                    (String) row[3], 
                    (String) row[4], 
                    (String) row[5], 
                     (int) row[5],
                    (String) row[6]);
                    
            animal.add(a);
        }
        return animal;
    } 
   
    
     public static void inserAnimal( int statusAnimal, String nameAnimal, String nameSpeciesAnimal, String nameRace, String nameColor, int ageAnimal, String comments ) throws Exception {
        //inserir animal

        String sql = "INSERT INTO  animal( cd_animal, cd_status_animal, nm_animal, nm_species_animal, nm_race, nm_color, qt_age_animal, ds_comments, cd_user) VALUES (default,?, ?, ?, ?, ?, ?,?,default)";
       
        Object parameters[] = { statusAnimal,  nameAnimal,  nameSpeciesAnimal, nameRace,  nameColor,  ageAnimal, comments};

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

    public String getGenderAnimal() {
        return genderAnimal;
    }

    public void setGenderAnimal(String genderAnimal) {
        this.genderAnimal = genderAnimal;
    }

}
