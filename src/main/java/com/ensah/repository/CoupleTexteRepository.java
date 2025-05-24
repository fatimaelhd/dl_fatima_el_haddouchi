package com.ensah.repository;

import com.ensah.model.CoupleTexte;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Repository
public interface CoupleTexteRepository extends JpaRepository<CoupleTexte, Long> {

    List<CoupleTexte> findByDatasetId(Long datasetId); // si tu veux retrouver les couples d'un dataset
    Page<CoupleTexte> findByDatasetId(Long datasetId, Pageable pageable); // Add this method for pagination
}
