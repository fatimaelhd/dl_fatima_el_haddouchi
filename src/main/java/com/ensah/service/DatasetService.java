package com.ensah.service;

import com.ensah.model.ClassePossible;
import com.ensah.model.CoupleTexte;
import com.ensah.model.Dataset;
import com.ensah.repository.ClassePossibleRepository;
import com.ensah.repository.CoupleTexteRepository;
import com.ensah.repository.DatasetRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
@Service
public class DatasetService {

    private final DatasetRepository datasetRepository;
    private final ClassePossibleRepository classePossibleRepository;
    private final CoupleTexteRepository coupleTexteRepository;

    public DatasetService(DatasetRepository datasetRepository,
                          ClassePossibleRepository classePossibleRepository,
                          CoupleTexteRepository coupleTexteRepository) {
        this.datasetRepository = datasetRepository;
        this.classePossibleRepository = classePossibleRepository;
        this.coupleTexteRepository = coupleTexteRepository;
    }
    public Dataset findById(Long id) {
        return datasetRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Dataset introuvable avec id : " + id));
    }

    public void ajouterDataset(MultipartFile fichier, String nomDataset, String classesPossibles, String description) {
        try {
            // 1. Créer et enregistrer le dataset
            Dataset dataset = new Dataset();
            dataset.setNomDataset(nomDataset);
            dataset.setDescription(description);
            dataset = datasetRepository.save(dataset); // Enregistre le dataset

            // 2. Enregistrer les classes possibles
            if (classesPossibles != null && !classesPossibles.trim().isEmpty()) {
                String[] classes = classesPossibles.split(";");
                for (String nomClasse : classes) {
                    ClassePossible cp = new ClassePossible();
                    cp.setNomClasse(nomClasse.trim());
                    cp.setDataset(dataset); // affecter la dataset
                    classePossibleRepository.save(cp);
                }
            }

            // 3. Lire le fichier et enregistrer les couples de textes
            List<CoupleTexte> couples = new ArrayList<>();
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(fichier.getInputStream(), StandardCharsets.UTF_8)
            );

            String ligne;
            while ((ligne = reader.readLine()) != null) {
                String[] textes = ligne.split(";", 2); // exactement deux textes attendus
                if (textes.length == 2) {
                    CoupleTexte ct = new CoupleTexte();
                    ct.setTexte1(textes[0].trim());
                    ct.setTexte2(textes[1].trim());
                    ct.setDataset(dataset); // FK vers le dataset
                    couples.add(ct);
                }
            }

            // Enregistrer tous les couples de texte à la fois
            coupleTexteRepository.saveAll(couples);

        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de l'ajout du dataset : " + e.getMessage(), e);
        }
    }

}
