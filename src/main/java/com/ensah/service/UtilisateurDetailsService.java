package com.ensah.service;

import com.ensah.model.Utilisateur;
import com.ensah.repository.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UtilisateurDetailsService implements UserDetailsService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;



    //Méthode obligatoire pour UserDetailsService.
    //Est appelée automatiquement par Spring Security quand un utilisateur se connecte.
    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Utilisateur user = utilisateurRepository.findByLogin(login)
                .orElseThrow(() -> new UsernameNotFoundException("Utilisateur introuvable avec le login: " + login));
        //Si l'utilisateur n'est pas trouvé, lance une UsernameNotFoundException.
        System.out.println("✅ Utilisateur trouvé : " + user.getLogin());


      //User est une classe fournie par Spring Security pour représenter les utilisateurs authentifiés.
        return new org.springframework.security.core.userdetails.User(
                user.getLogin(),
                user.getPassword(), // 🛡️ Mot de passe déjà encodé en Bcrypt dans la base
                Collections.singleton(new SimpleGrantedAuthority(user.getRole().getNomRole()))
        );
    }
}
