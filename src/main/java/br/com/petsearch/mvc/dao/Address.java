/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.dao;

import static br.com.petsearch.mvc.dao.Animal.msgConnection;
import java.util.ArrayList;

/**
 *
 * @author Wandes
 */
public class Address {

    private int idAddress;
    private String street;
    private int postalCode;
    private String district;
    private String city;
    private String state;
    private String country;
    private int codAnimal;
    protected static String msgConnection;

    public Address(int idAddress, String street, int postalCode, String district, String city, String state, String country, int codAnimal) {
        this.idAddress = idAddress;
        this.street = street;
        this.postalCode = postalCode;
        this.district = district;
        this.city = city;
        this.state = state;
        this.country = country;
    }

//inserindo um endereço
    public static void insertAddress( String street, int postalCode, String district, String city, String state, String country, int codAnimal) throws Exception {

        String sql = "INSERT INTO  address( cd_address, nm_street , cd_postal_code, nm_district, nm_city, sg_state, nm_country, cd_animal) VALUES (default,?, ?, ?, ?, ?, ?,?)";

        Object parameters[] = { street, postalCode, district, city, state, country, codAnimal};

        DatabaseConnector.execute(sql, parameters);

    }

    public static Address getAddress(int codAnimal) throws Exception {
        try {
            String SQL = "SELECT cd_address, nm_street , cd_postal_code, nm_district, nm_city, sg_state, nm_country, cd_animal  FROM address WHERE cd_animal = ?";
            Object parameters[] = {codAnimal};

            ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, parameters);

            if (list.isEmpty()) {
                msgConnection = "Não existe dados cadastrados ";
                return null;
            } else {
                Object row[] = list.get(0);
                Address end = new Address(
                        (int) row[0],
                        (String) row[1],
                        (int) row[2],
                        (String) row[3],
                        (String) row[4],
                        (String) row[5],
                        (String) row[6],
                        (int) row[7]);
                return end;
            }
        } catch (Exception ex) {
            msgConnection = "Error conexao " + ex;
            return null;
        }
    }

    public static void updateAddress( String street, int postalCode, String district, String city, String state, String country, int codAnimal) throws Exception {

        String SQL = "UPDATE address SET  nm_street =? , cd_postal_code = ?, nm_district = ?, nm_city = ?, sg_state = ?, nm_country = ?, cd_animal = ?  WHERE cd_animal = ?";
        Object parameters[] = { street, postalCode, district, city, state, country, codAnimal};
        DatabaseConnector.execute(SQL, parameters);
    }

    public int getIdEndereco() {
        return idAddress;
    }

    public void setIdEndereco(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getCodAnimal() {
        return codAnimal;
    }

    public void setCodAnimal(int codAnimal) {
        this.codAnimal = codAnimal;
    }

    public static String getMsgConnection() {
        return msgConnection;
    }

    public static void setMsgConnection(String msgConnection) {
        Address.msgConnection = msgConnection;
    }

}
