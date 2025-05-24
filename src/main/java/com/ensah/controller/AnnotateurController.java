package com.ensah.controller;

import com.ensah.model.Annotateur;
import com.ensah.model.Role;
import com.ensah.model.Tache;
import com.ensah.model.Utilisateur;
import com.ensah.repository.AnnotateurRepository;
import com.ensah.repository.RoleRepository;
import com.ensah.repository.UtilisateurRepository;
import com.ensah.service.AnnotateurService;
import com.ensah.service.TacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/annotateurs")
public class AnnotateurController {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private TacheService tacheService;


    @Autowired
    private AnnotateurService annotateurService;

    @Autowired
    private AnnotateurRepository annotateurRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/ajouter")
    public String afficherFormulaireAjout(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "admin/annotateurs/ajouterAnnotateur";
    }

    @PostMapping("/ajouter")
    public String ajouterAnnotateur(@ModelAttribute Utilisateur utilisateur, Model model) {
        String mdp = UUID.randomUUID().toString().substring(0, 8);//Génère un mot de passe aléatoire de 8 caractères.
        utilisateur.setPassword(passwordEncoder.encode(mdp));//Encode ce mot de passe généré avec BCrypt .

        Role role = roleRepository.findByNomRole("USER_ROLE");
        utilisateur.setRole(role);

        utilisateur = utilisateurRepository.save(utilisateur);

        Annotateur annotateur = new Annotateur();
        annotateur.setUtilisateur(utilisateur);
        annotateurRepository.save(annotateur);

        model.addAttribute("utilisateur", new Utilisateur());
        model.addAttribute("motDePasseGenere", mdp);
        return "admin/annotateurs/ajouterAnnotateur";
    }

    @GetMapping("/modifier/{id}")
    public String afficherFormulaireModification(@PathVariable Long id, Model model) {
        Annotateur annotateur = annotateurService.getAnnotateurById(id);
        if (annotateur.getUtilisateur() == null) {
            annotateur.setUtilisateur(new Utilisateur());
        }
        model.addAttribute("annotateur", annotateur);
        return "admin/annotateurs/modifier";
    }

    @PostMapping("/modifier")
    public String modifierAnnotateur(@ModelAttribute Annotateur annotateur) {
        if (annotateur.getUtilisateur() != null && annotateur.getUtilisateur().getId() != null) {
            Utilisateur utilisateurExistant = utilisateurRepository.findById(
                    annotateur.getUtilisateur().getId()).orElseThrow();

            // Garder l'ancien mot de passe
            annotateur.getUtilisateur().setPassword(utilisateurExistant.getPassword());

            // Garder le rôle existant
            annotateur.getUtilisateur().setRole(utilisateurExistant.getRole());

            utilisateurRepository.save(annotateur.getUtilisateur());
        }
        annotateurRepository.save(annotateur);
        return "redirect:/admin/home";
    }
    @GetMapping("/supprimer/{id}")
    public String supprimerAnnotateur(@PathVariable Long id) {
        Annotateur annotateur = annotateurService.getAnnotateurById(id);
        if (annotateur != null) {
            annotateur.setSupprime(true);
            annotateurRepository.save(annotateur);

          // supprimer les taches de l'annotateur concerne
            List<Tache> taches = tacheService.getTachesByAnnotateurId(id);
            for (Tache t : taches) {
                t.setSupprime(true);
                t.getCouples().clear(); // Enlève tous les couples de la tâche
            }
            tacheService.saveAll(taches);
        }
        return "redirect:/admin/home";
    }
}
