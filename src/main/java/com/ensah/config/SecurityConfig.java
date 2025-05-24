package com.ensah.config;

import com.ensah.service.UtilisateurDetailsService;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

@Configuration
@EnableWebSecurity   //Active les fonctionnalités de sécurité Spring.
public class SecurityConfig {

    private final UtilisateurDetailsService userDetailsService;

    public SecurityConfig(UtilisateurDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean  //BCrypt pour sécuriser les mots de passe.
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(userDetailsService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;  //vérifier les mots de passe haché des utilisateurs.
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authenticationProvider(authenticationProvider())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/css/**", "/js/**").permitAll()// sont accessibles à tout le monde
                        .requestMatchers("/admin/**").hasAuthority("ADMIN_ROLE")
                        .requestMatchers("/user/**").hasAuthority("USER_ROLE")
                        .anyRequest().authenticated() //Toutes les autres requêtes nécessitent une authentification.
                )
                .formLogin(form -> form
                        .loginPage("/login") // La page de connexion personnalisée
                        .loginProcessingUrl("/login") // URL pour envoyer les données de login
                        .defaultSuccessUrl("/default", true)// Redirection après succès
                        .failureUrl("/login?error=true") // Redirection après échec
                        .permitAll()

                )
                .logout(logout -> logout
                        .logoutUrl("/logout") // URL pour se déconnecter
                        .logoutSuccessUrl("/login?logout") // Redirection après déconnexion
                        .invalidateHttpSession(true) // Supprime la session
                        .clearAuthentication(true) // Efface l'authentification
                        .deleteCookies("JSESSIONID") // Supprime le cookie de session
                        .permitAll()
                )
                .exceptionHandling(exception -> exception
                        .accessDeniedPage("/access-denied")
                );
       // Si un utilisateur tente d'accéder à une page sans autorisation, il sera redirigé vers "/access-denied".



        return http.build();
    }
}
