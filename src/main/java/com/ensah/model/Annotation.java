package com.ensah.model;

import jakarta.persistence.*;

@Entity
public class Annotation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String classeChoisie;

    @OneToOne
    @JoinColumn(name = "idCoupleTexte", unique = true)
    private CoupleTexte coupleTexte;

    @ManyToOne
    @JoinColumn(name = "idAnnotateur")
    private Annotateur annotateur;

    public Annotateur getAnnotateur() {
        return annotateur;
    }

    public Long getId() {
        return id;
    }

    public CoupleTexte getCoupleTexte() {
        return coupleTexte;
    }

    public String getClasseChoisie() {
        return classeChoisie;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setAnnotateur(Annotateur annotateur) {
        this.annotateur = annotateur;
    }

    public void setClasseChoisie(String classeChoisie) {
        this.classeChoisie = classeChoisie;
    }

    public void setCoupleTexte(CoupleTexte coupleTexte) {
        this.coupleTexte = coupleTexte;
    }
}

