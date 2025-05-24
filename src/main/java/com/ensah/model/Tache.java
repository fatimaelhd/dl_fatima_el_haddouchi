package com.ensah.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
public class Tache {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate dateLimite;

    @ManyToOne
    @JoinColumn(name = "idAnnotateur")
    private Annotateur annotateur;

    @ManyToOne
    @JoinColumn(name = "idDataset")
    private Dataset dataset;

    @ManyToMany
    @JoinTable(
            name = "Tache_CoupleTexte",
            joinColumns = @JoinColumn(name = "tache_id"),
            inverseJoinColumns = @JoinColumn(name = "couple_id")
    )
    private List<CoupleTexte> couples;

    private boolean supprime;


    public boolean isSupprime() {
        return supprime;
    }

    public void setSupprime(boolean supprime) {
        this.supprime = supprime;
    }
    public void setCouples(List<CoupleTexte> couples) {
        this.couples = couples;
    }

    public List<CoupleTexte> getCouples() {
        return couples;
    }

    public Long getId() {
        return id;
    }

    public Annotateur getAnnotateur() {
        return annotateur;
    }

    public LocalDate getDateLimite() {
        return dateLimite;
    }

    public Dataset getDataset() {
        return dataset;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setAnnotateur(Annotateur annotateur) {
        this.annotateur = annotateur;
    }

    public void setDataset(Dataset dataset) {
        this.dataset = dataset;
    }

    public void setDateLimite(LocalDate dateLimite) {
        this.dateLimite = dateLimite;
    }
}
