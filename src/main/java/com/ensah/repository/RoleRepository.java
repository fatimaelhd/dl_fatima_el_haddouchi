package com.ensah.repository;

import com.ensah.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByNomRole(String nomRole);
}
