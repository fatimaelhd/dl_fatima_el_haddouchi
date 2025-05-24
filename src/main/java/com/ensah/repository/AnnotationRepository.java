package com.ensah.repository;

import com.ensah.model.Annotateur;
import com.ensah.model.Annotation;
import com.ensah.model.CoupleTexte;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AnnotationRepository extends JpaRepository<Annotation, Long> {
    @Query("SELECT COUNT(a) FROM Annotation a WHERE a.coupleTexte.dataset.id = :datasetId")
    long countByDataset(@Param("datasetId") Long datasetId);
    boolean existsByCoupleTexteAndAnnotateur(CoupleTexte coupleTexte, Annotateur annotateur);
    Optional<Annotation> findByCoupleTexte(CoupleTexte coupleTexte);
    boolean existsByCoupleTexte(CoupleTexte coupleTexte);
    List<Annotation> findByAnnotateur(Annotateur annotateur);


}

