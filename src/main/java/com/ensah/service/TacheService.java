package com.ensah.service;

import com.ensah.model.Annotateur;
import com.ensah.model.Dataset;
import com.ensah.model.Tache;
import com.ensah.repository.TacheRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TacheService {

    private final TacheRepository tacheRepository;
    public Tache findById(Long id) {
        return tacheRepository.findById(id).orElse(null);
    }

    public Optional<Tache> findByAnnotateurAndDataset(Annotateur annotateur, Dataset dataset) {
        return tacheRepository.findByAnnotateurAndDataset(annotateur, dataset);
    }
    public TacheService(TacheRepository tacheRepository) {
        this.tacheRepository = tacheRepository;
    }
    public Tache save(Tache tache) {
        return tacheRepository.save(tache);
    }
    public List<Tache> getTachesByAnnotateurId(Long annotateurId) {
        return tacheRepository.findByAnnotateurId(annotateurId);
    }
    public List<Tache> saveAll(List<Tache> taches) {
        return tacheRepository.saveAll(taches);
    }


}

