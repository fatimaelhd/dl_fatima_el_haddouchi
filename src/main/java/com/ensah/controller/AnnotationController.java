package com.ensah.controller;

import com.ensah.model.*;
import com.ensah.repository.*;
import com.ensah.service.TacheService;
import com.ensah.web.AnnotationForm;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class AnnotationController {

    @Autowired
    private TacheService tacheService;
    @Autowired
    private TacheRepository tacheRepository;

    @Autowired
    private CoupleTexteRepository coupleTexteRepository;

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    private AnnotateurRepository annotateurRepository;

    @Autowired
    private AnnotationRepository annotationRepository;

    // Affiche le prochain couple non annoté
    @GetMapping("/{id}/travailler")
    public String travailler(@PathVariable Long id,
                             @RequestParam(defaultValue = "0") int page,
                             Model model,
                             Principal principal) {

        String login = principal.getName();
        Utilisateur utilisateur = utilisateurRepository.findByLogin(login).orElseThrow();
        Annotateur annotateur = annotateurRepository.findByUtilisateur(utilisateur).orElseThrow();

        Tache tache = tacheRepository.findById(id).orElseThrow();

        List<CoupleTexte> couples = tache.getCouples();

        List<CoupleTexte> nonAnnnotes = couples.stream()
                .filter(c -> !annotationRepository.existsByCoupleTexteAndAnnotateur(c, annotateur))
                .toList();

        if (nonAnnnotes.isEmpty()) {
            model.addAttribute("message", "Toutes les annotations sont terminées pour cette tâche.");
            return "user/fin_tache";
        }

        int maxPage = nonAnnnotes.size();
        page = Math.max(0, Math.min(page, maxPage - 1));

        CoupleTexte coupleAAfficher = nonAnnnotes.get(page);

        AnnotationForm annotationForm = new AnnotationForm();
        annotationForm.setCoupleId(coupleAAfficher.getId());

        model.addAttribute("tache", tache);
        model.addAttribute("couple", coupleAAfficher);
        model.addAttribute("annotationForm", annotationForm);
        model.addAttribute("classesPossibles", tache.getDataset().getClasses());
        model.addAttribute("page", page);
        model.addAttribute("maxPage", maxPage);

        return "user/travailler";
    }


    // Sauvegarde de l'annotation
    @PostMapping("/{id}/annoter")
    public String annoter(@PathVariable Long id,
                          @ModelAttribute AnnotationForm annotationForm,
                          Principal principal) {

        String login = principal.getName();
        Utilisateur utilisateur = utilisateurRepository.findByLogin(login).orElseThrow();
        Annotateur annotateur = annotateurRepository.findByUtilisateur(utilisateur).orElseThrow();

        CoupleTexte couple = coupleTexteRepository.findById(annotationForm.getCoupleId()).orElseThrow();

        // Création de l'annotation
        Annotation annotation = new Annotation();
        annotation.setAnnotateur(annotateur);
        annotation.setCoupleTexte(couple);
        annotation.setClasseChoisie(annotationForm.getClasseChoisie());

        annotationRepository.save(annotation);

        return "redirect:/user/" + id + "/travailler";
    }
    @GetMapping("/tache/{id}/export")
    public void exporterCouplesCsv(@PathVariable Long id, HttpServletResponse response) throws IOException {
        Tache tache = tacheService.findById(id);
        if (tache == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"couples_tache_" + id + ".csv\"");
        PrintWriter writer = response.getWriter();
        writer.println("Texte1,TEXTE2,Annotation");

        for (CoupleTexte couple : tache.getCouples()) {
            Optional<Annotation> optionalAnnotation = annotationRepository.findByCoupleTexte(couple);
            String annotation = optionalAnnotation.map(Annotation::getClasseChoisie).orElse("Non annoté");

            writer.printf("\"%s\";\"%s\";\"%s\"%n", couple.getTexte1(), couple.getTexte2(), annotation);
        }

        writer.flush();
        writer.close();
    }

}
