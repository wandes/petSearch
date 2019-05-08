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
public class Address {
    int id_endereco;
    String nm_rua;
    int cd_cep;
    String nm_bairro;
    String nm_cidade; 
    String sg_estado;
    String nm_pais; 

    public Address(int id_endereco, String nm_rua, int cd_cep, String nm_bairro, String nm_cidade, String sg_estado, String nm_pais) {
        this.id_endereco = id_endereco;
        this.nm_rua = nm_rua;
        this.cd_cep = cd_cep;
        this.nm_bairro = nm_bairro;
        this.nm_cidade = nm_cidade;
        this.sg_estado = sg_estado;
        this.nm_pais = nm_pais;
    }

    public int getId_endereco() {
        return id_endereco;
    }

    public void setId_endereco(int id_endereco) {
        this.id_endereco = id_endereco;
    }

    public String getNm_rua() {
        return nm_rua;
    }

    public void setNm_rua(String nm_rua) {
        this.nm_rua = nm_rua;
    }

    public int getCd_cep() {
        return cd_cep;
    }

    public void setCd_cep(int cd_cep) {
        this.cd_cep = cd_cep;
    }

    public String getNm_bairro() {
        return nm_bairro;
    }

    public void setNm_bairro(String nm_bairro) {
        this.nm_bairro = nm_bairro;
    }

    public String getNm_cidade() {
        return nm_cidade;
    }

    public void setNm_cidade(String nm_cidade) {
        this.nm_cidade = nm_cidade;
    }

    public String getSg_estado() {
        return sg_estado;
    }

    public void setSg_estado(String sg_estado) {
        this.sg_estado = sg_estado;
    }

    public String getNm_pais() {
        return nm_pais;
    }

    public void setNm_pais(String nm_pais) {
        this.nm_pais = nm_pais;
    }
    
    
    
}
