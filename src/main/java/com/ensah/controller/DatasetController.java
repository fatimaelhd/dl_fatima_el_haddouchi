package com.ensah.controller;

import com.ensah.model.*;
import com.ensah.repository.AnnotationRepository;
import com.ensah.repository.CoupleTexteRepository;
import com.ensah.repository.TacheRepository;
import com.ensah.service.CoupleTexteService;
import com.ensah.service.DatasetService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.ensah.service.AnnotateurService;
import com.ensah.service.TacheService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/datasets")
public class DatasetController {

    @Autowired
    private CoupleTexteService coupleTexteService;
    @Autowired
    private AnnotationRepository annotationRepository;
    @Autowired
    private TacheRepository tacheRepository;
    @Autowired
    private CoupleTexteRepository coupleTexteRepository;


    private final DatasetService datasetService;
    private final AnnotateurService annotateurService;
    private final TacheService tacheService;

    public DatasetController(DatasetService datasetService,
                             AnnotateurService annotateurService,
                             TacheService tacheService) {
        this.datasetService = datasetService;
        this.annotateurService = annotateurService;
        this.tacheService = tacheService;
    }

    @GetMapping("/ajouter")
    public String showForm() {
        return "admin/datasets/ajouterDataset";
    }

    @PostMapping("/ajouter")
    public String ajouterDataset(@RequestParam("fichier") MultipartFile fichier,
                                 @RequestParam("nomDataset") String nomDataset,
                                 @RequestParam("classesPossibles") String classesPossibles,
                                 @RequestParam("description") String description) {
        try {
            datasetService.ajouterDataset(fichier, nomDataset, classesPossibles, description);
            return "redirect:/admin/home";
        } catch (Exception e) {
            throw new RuntimeException("Erreur lors de l'ajout du dataset : " + e.getMessage(), e);
        }
    }
    @GetMapping("/details/{id}")
    public String afficherDetailsDataset(@PathVariable Long id,
                                         @RequestParam(defaultValue = "0") int page,
                                         @RequestParam(defaultValue = "100") int size,
                                         Model model) {

        Dataset dataset = datasetService.findById(id);

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").ascending());// trier les résultats par le champ id de l'entité CoupleTexte.
        Page<CoupleTexte> couplesPage = coupleTexteRepository.findByDatasetId(id, pageable);

        long totalCouples = coupleTexteRepository.findByDatasetId(id).size();

        long totalAnnotations = 0;
        for (CoupleTexte couple : coupleTexteRepository.findByDatasetId(id)) {
            boolean existe = annotationRepository.existsByCoupleTexte(couple);
            if (existe) {
                totalAnnotations++;
            }
        }

        double avancement = (totalCouples == 0) ? 0 : ((double) totalAnnotations / totalCouples) * 100;

        List<Tache> taches = tacheRepository.findByDatasetId(id)
                .stream()
                .filter(t -> !t.isSupprime())  // ne garder que les non supprimées
                .collect(Collectors.toList());


        List<Annotateur> annotateurs = taches.stream()
                .map(Tache::getAnnotateur)//Pour chaque tâche, on récupère l'annotateur qui lui est associé.
                .distinct()
                .collect(Collectors.toList());

        // ✅ Attributs envoyés à la vue
        model.addAttribute("dataset", dataset);
        model.addAttribute("avancement", avancement);
        model.addAttribute("annotateurs", annotateurs);
        model.addAttribute("couplesPage", couplesPage);
        model.addAttribute("taches", taches); // ✅ Ajout essentiel ici

        return "admin/datasets/dataset-details";
    }


    @GetMapping("/ajouter-annotateurs/{id}")
    public String afficherFormulaireAffectation(@PathVariable Long id, Model model) {
        Dataset dataset = datasetService.findById(id);
        List<Annotateur> tousLesAnnotateurs = annotateurService.getAnnotateursActifs();

        model.addAttribute("dataset", dataset);
        model.addAttribute("annotateurs", tousLesAnnotateurs);
        model.addAttribute("annotateursSelectionnes", new ArrayList<Long>());

        return "admin/datasets/affecter_annotateurs";
    }

    @PostMapping("/affecter-annotateurs")
    public String affecterAnnotateurs(
            @RequestParam Long datasetId,
            @RequestParam(required = false) List<Long> annotateursSelectionnes) {

        if (annotateursSelectionnes != null && !annotateursSelectionnes.isEmpty()) {
            Dataset dataset = datasetService.findById(datasetId);

            // 1. Récupérer et mélanger tous les couples du dataset
            List<CoupleTexte> tousLesCouples = coupleTexteService.findByDatasetId(datasetId);
            Collections.shuffle(tousLesCouples);

            int totalCouples = tousLesCouples.size();
            int annotateurCount = annotateursSelectionnes.size();
            int tailleParAnnotateur = totalCouples / annotateurCount;

            for (int i = 0; i < annotateurCount; i++) {
                Long idAnnotateur = annotateursSelectionnes.get(i);//Récupère l'identifiant (ID) de l'annotateur
                Annotateur annotateur = annotateurService.getAnnotateurById(idAnnotateur);

                Optional<Tache> tacheExistanteOpt = tacheService.findByAnnotateurAndDataset(annotateur, dataset);

                Tache tache;
                if (tacheExistanteOpt.isPresent()) {
                    // Réactivation de la tâche existante
                    tache = tacheExistanteOpt.get();
                    tache.setSupprime(false);

                    // Garde uniquement les couples non encore annotés ET qui étaient dans cette tâche
                    List<CoupleTexte> couplesInitials = tache.getCouples();
                    List<CoupleTexte> couplesNonAnnotes = couplesInitials.stream()
                            .filter(c -> !annotationRepository.existsByCoupleTexteAndAnnotateur(c, annotateur))
                            .collect(Collectors.toList());

                    // Remplacer la liste actuelle par la liste filtrée (couples non annotés)
                    tache.setCouples(new ArrayList<>(couplesNonAnnotes));
                } else {
                    // Nouvelle tâche, on divise la dataset pour chaque annotateur
                    tache = new Tache();
                    tache.setAnnotateur(annotateur);
                    tache.setDataset(dataset);

                    int fromIndex = i * tailleParAnnotateur;
                    //Si i == 0 et tailleParAnnotateur == 5, alors fromIndex == 0.
                    //Si i == 1, alors fromIndex == 5.
                    int toIndex = (i == annotateurCount - 1) ? totalCouples : fromIndex + tailleParAnnotateur;
                    //Cas normal : fromIndex + tailleParAnnotateur → prend le prochain groupe de tailleParAnnotateur couples.
                    //Cas du dernier annotateur : i == annotateurCount - 1 → donne tous les couples restants pour éviter les couples non attribués à cause de divisions inexactes.
                    tache.setCouples(new ArrayList<>(tousLesCouples.subList(fromIndex, toIndex)));
                    //extrait une sous-liste des couples entre fromIndex (inclus) et toIndex (exclus).
                }

                tache.setDateLimite(LocalDate.now().plusDays(7));
                tacheService.save(tache);
            }
        }

        return "redirect:/admin/home";
    }



    @PostMapping("/tache/supprimer/{id}")
    public String supprimerTache(@PathVariable Long id) {
        Optional<Tache> tacheOpt = tacheRepository.findById(id);

        if (tacheOpt.isPresent()) {
            Tache tache = tacheOpt.get();
            tache.setSupprime(true);
            tacheRepository.save(tache);

            Long idDataset = tache.getDataset().getId(); // Pour redirection
            return "redirect:/admin/datasets/details/" + idDataset;
        }

        // Si la tâche n'existe pas
        return "redirect:/admin/home";
    }

    @GetMapping("/{id}/export")
    public void exporterDatasetCsv(@PathVariable Long id, HttpServletResponse response) throws IOException {
        Dataset dataset = datasetService.findById(id);
        if (dataset == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        List<CoupleTexte> couples = coupleTexteRepository.findByDatasetId(id);

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"dataset_" + id + ".csv\"");

        PrintWriter writer = response.getWriter();
        writer.println("Texte1;Texte2;Annotation;Annotateur");

        for (CoupleTexte couple : couples) {
            // Retrieve the annotation and the annotator
            Optional<Annotation> optionalAnnotation = annotationRepository.findByCoupleTexte(couple);
            String annotation = optionalAnnotation.map(Annotation::getClasseChoisie).orElse("Non annoté");
            String annotateurName = optionalAnnotation.map(annotationObj -> {
                Annotateur annotateur = annotationObj.getAnnotateur();
                return annotateur != null ? annotateur.getUtilisateur().getLogin() : "Non annoté";
            }).orElse("Non annoté");

            // Write to CSV
            writer.printf("\"%s\";\"%s\";\"%s\";\"%s\"%n",
                    couple.getTexte1(),
                    couple.getTexte2(),
                    annotation,
                    annotateurName);
        }

        writer.flush();
        writer.close();
    }
}

