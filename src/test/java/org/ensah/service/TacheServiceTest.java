package org.ensah.service;

import com.ensah.model.Tache;
import com.ensah.service.*;
import com.ensah.repository.TacheRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class TacheServiceTest {

    @Mock
    private TacheRepository tacheRepository;

    @InjectMocks
    private TacheService tacheService;

    @Test
    void findById_shouldReturnTache_whenTacheExists() {
        // GIVEN
        Tache tache = new Tache();
        tache.setId(1L);
        when(tacheRepository.findById(1L)).thenReturn(Optional.of(tache));

        // WHEN
        Tache result = tacheService.findById(1L);

        // THEN
        assertNotNull(result);
        assertEquals(1L, result.getId());
        verify(tacheRepository).findById(1L);
    }

    @Test
    void findById_shouldReturnNull_whenTacheNotFound() {
        // GIVEN
        when(tacheRepository.findById(2L)).thenReturn(Optional.empty());

        // WHEN
        Tache result = tacheService.findById(2L);

        // THEN
        assertNull(result);
    }
}
