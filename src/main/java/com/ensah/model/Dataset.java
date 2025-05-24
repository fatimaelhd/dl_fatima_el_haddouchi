package com.ensah.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Dataset {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "nom_dataset", nullable = false)
    private String nomDataset;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "dataset", cascade = CascadeType.ALL)
    private List<ClassePossible> classes;

    @OneToMany(mappedBy = "dataset", cascade = CascadeType.ALL)
    private List<CoupleTexte> couples;

    public Long getId() {
        return id;
    }

    public List<ClassePossible> getClasses() {
        return classes;
    }

    public String getDescription() {
        return description;
    }

    public String getNomDataset() {
        return nomDataset;
    }

    public List<CoupleTexte> getCouples() {
        return couples;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setClasses(List<ClassePossible> classes) {
        this.classes = classes;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setNomDataset(String nomDataset) {
        this.nomDataset = nomDataset;
    }

    public void setCouples(List<CoupleTexte> couples) {
        this.couples = couples;
    }
}
