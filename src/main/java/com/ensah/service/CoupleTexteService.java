package com.ensah.service;

import com.ensah.model.CoupleTexte;
import com.ensah.repository.CoupleTexteRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoupleTexteService {

    private final CoupleTexteRepository coupleTexteRepository;

    public CoupleTexteService(CoupleTexteRepository coupleTexteRepository) {
        this.coupleTexteRepository = coupleTexteRepository;
    }

    public List<CoupleTexte> findByDatasetId(Long datasetId) {
        return coupleTexteRepository.findByDatasetId(datasetId);
    }
}
