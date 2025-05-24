package com.ensah.repository;
import com.ensah.model.Annotateur;
import com.ensah.model.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AnnotateurRepository extends JpaRepository<Annotateur, Long> {
    Optional<Annotateur> findByUtilisateur(Utilisateur utilisateur);
    List<Annotateur> findBySupprimeFalse();

}

