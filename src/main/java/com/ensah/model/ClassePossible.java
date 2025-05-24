package com.ensah.model;

import jakarta.persistence.*;

@Entity
public class ClassePossible {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nomClasse;

    @ManyToOne
    @JoinColumn(name = "dataset_id")
    private Dataset dataset;

    public Long getId() {
        return id;
    }

    public String getNomClasse() {
        return nomClasse;
    }

    public Dataset getDataset() {
        return dataset;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    public void setDataset(Dataset dataset) {
        this.dataset = dataset;
    }
}
