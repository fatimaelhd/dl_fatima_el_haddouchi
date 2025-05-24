package com.ensah.model;

import jakarta.persistence.*;

@Entity
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nom_role")
    private String nomRole;


    public Integer getId() {
        return id;
    }

    public String getNomRole() {
        return nomRole;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setNomRole(String nomRole) {
        this.nomRole = nomRole;
    }
}
