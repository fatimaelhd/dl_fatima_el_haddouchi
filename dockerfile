# Utiliser une image Java
FROM eclipse-temurin:17-jdk

# Copier le JAR construit par Maven
COPY target/jee_projet-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port de l'application si besoin (ex: Spring Boot 8080)
EXPOSE 8080

# Commande pour lancer le JAR
ENTRYPOINT ["java","-jar","/app.jar"]
