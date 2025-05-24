package org.ensah.jee_projet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.ensah")
@EnableJpaRepositories(basePackages = "com.ensah.repository")
@EntityScan(basePackages = "com.ensah.model")

public class JeeProjetApplication {

    public static void main(String[] args) {

        SpringApplication.run(JeeProjetApplication.class, args);
    }

}
