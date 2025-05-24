package com.ensah.repository;

import com.ensah.model.ClassePossible;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassePossibleRepository extends JpaRepository<ClassePossible, Long> {

    List<ClassePossible> findByDatasetId(Long datasetId); // pour retrouver les classes d'un dataset
}
