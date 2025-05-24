package com.ensah.repository;

import com.ensah.model.Annotateur;
import com.ensah.model.Dataset;
import com.ensah.model.Tache;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TacheRepository extends JpaRepository<Tache, Long> {
    List<Tache> findByDatasetId(Long datasetId);
    List<Tache> findByAnnotateurId(Long annotateurId);
    List<Tache> findByDatasetIdAndSupprimeFalse(Long datasetId);
    Optional<Tache> findByAnnotateurAndDataset(Annotateur annotateur, Dataset dataset);

}
