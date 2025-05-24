package com.ensah.model;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class CoupleTexte {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(name = "texte1")
    private String texte1;

    @Lob
    @Column(name = "texte2")
    private String texte2;
    //@Lob = Large Object — Hibernate va alors générer une colonne TEXT (ou CLOB) au lieu de VARCHAR(255).

    @ManyToMany(mappedBy = "couples")
    private List<Tache> taches;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dataset_id", nullable = false)
    private Dataset dataset;

    public Long getId() {
        return id;
    }

    public String getTexte1() {
        return texte1;
    }

    public Dataset getDataset() {
        return dataset;
    }

    public String getTexte2() {
        return texte2;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTexte1(String texte1) {
        this.texte1 = texte1;
    }

    public void setTexte2(String texte2) {
        this.texte2 = texte2;
    }

    public void setDataset(Dataset dataset) {
        this.dataset = dataset;
    }
}
