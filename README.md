📘 Plateforme d'Annotation de Texte
Ce projet est une application web développée avec Spring Boot et Thymeleaf, permettant aux administrateurs de gérer des datasets et aux annotateurs d’annoter des couples de textes selon des classes définies.


⚠️ Remarque importante sur la base de données
✅ Le port MySQL a été modifié de 3306 à 3307.
Assurez-vous que votre base de données MySQL écoute bien sur le port 3307.

Exemple de configuration dans application.properties :
properties
Copy
Edit
spring.datasource.url=jdbc:mysql://localhost:3307/projet
spring.datasource.username=root
spring.datasource.password=
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

Créez une base de données projet
le mot de passe de l'admin est : ad@#7uol123

Mettez à jour application.properties avec vos identifiants MySQL

Lancez l'application via votre IDE ou avec :
mvn spring-boot:run


