package com.ensah.service;

import com.ensah.model.Annotateur;
import com.ensah.model.Utilisateur;
import com.ensah.repository.AnnotateurRepository;
import com.ensah.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnotateurService {

    @Autowired
    private AnnotateurRepository annotateurRepository;

    public List<Annotateur> getAllAnnotateurs() {
        return annotateurRepository.findAll();
    }
    public Annotateur getAnnotateurById(Long id) {
        return annotateurRepository.findById(id).orElseThrow();
    }
    public List<Annotateur> getAnnotateursActifs() {
        return annotateurRepository.findBySupprimeFalse();
    }



}
