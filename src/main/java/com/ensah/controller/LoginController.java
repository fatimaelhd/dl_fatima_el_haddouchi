package com.ensah.controller;

import com.ensah.model.*;
import com.ensah.repository.*;
import com.ensah.service.AnnotateurService;
import com.ensah.service.TacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class LoginController {
    private final AnnotateurService annotateurService;
    private final DatasetRepository datasetRepository;
    @Autowired
    private TacheRepository tacheRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private AnnotateurRepository annotateurRepository;
    @Autowired
    private AnnotationRepository annotationRepository;


    // Injection via constructeur
    public LoginController(AnnotateurService annotateurService, DatasetRepository datasetRepository) {
        this.annotateurService = annotateurService;
        this.datasetRepository = datasetRepository;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/admin/home")
    public String home(Model model) {
        List<Annotateur> annotateurs = annotateurService.getAllAnnotateurs()
                .stream()
                .filter(a -> !a.isSupprime())
                .collect(Collectors.toList());//Transforme le flux filtré en une Liste.

        List<Dataset> datasets = datasetRepository.findAll();

        // Clé : id du dataset, Valeur : pourcentage d'annotation
        Map<Long, Double> avancements = new HashMap<>();
        for (Dataset ds : datasets) {
            long totalCouples = ds.getCouples().size();
            long couplesAnnotés = annotationRepository.countByDataset(ds.getId());

            double pourcentage = (totalCouples == 0) ? 0.0 : ((double) couplesAnnotés / totalCouples * 100);
            avancements.put(ds.getId(), pourcentage);
        }

        model.addAttribute("annotateurs", annotateurs);
        model.addAttribute("datasets", datasets);
        model.addAttribute("avancements", avancements);
        return "admin/home";
    }


    @GetMapping("/user/home")
    public String userHome(Model model, Principal principal) {
        String login = principal.getName();
        Utilisateur utilisateur = utilisateurRepository.findByLogin(login).orElseThrow();
        Annotateur annotateur = annotateurRepository.findByUtilisateur(utilisateur).orElseThrow();

        // Récupérer toutes les tâches (y compris les supprimées)
        List<Tache> taches = tacheRepository.findByAnnotateurId(annotateur.getId());

        Map<Long, Double> avancements = new HashMap<>();

        for (Tache t : taches) {
            List<CoupleTexte> couples = t.getCouples();
            int total = couples.size();
            int faits = (int) couples.stream()
                    .filter(c -> annotationRepository.existsByCoupleTexteAndAnnotateur(c, annotateur))
                    .count();
            double pourcentage = total == 0 ? 0 : ((faits * 100.0) / total);
            avancements.put(t.getId(), pourcentage);
        }

        model.addAttribute("taches", taches);
        model.addAttribute("avancements", avancements);

        return "user/home";
    }





    @GetMapping("/default")
    public String redirectAfterLogin(Authentication authentication) {
        String login = authentication.getName();
        Utilisateur utilisateur = utilisateurRepository.findByLogin(login).orElseThrow();

        Annotateur annotateur = annotateurRepository.findByUtilisateur(utilisateur).orElse(null);
        if (annotateur != null && annotateur.isSupprime()) {
            // Invalide la session et redirige vers login si l'utilisateur est supprimé
            return "redirect:/login?deleted";
        }

        if (authentication.getAuthorities().stream()
                .anyMatch(auth -> auth.getAuthority().equals("ADMIN_ROLE"))) {
            return "redirect:/admin/home";
        } else if (authentication.getAuthorities().stream()
                .anyMatch(auth -> auth.getAuthority().equals("USER_ROLE"))) {
            return "redirect:/user/home";
        }
        return "redirect:/login?error";//erreur générique
    }


    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied"; // correspond à access denied.html dans /templates
    }

}
