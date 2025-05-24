📘 Plateforme d'Annotation de Texte
Ce projet est une application web développée avec Spring Boot et Thymeleaf, permettant aux administrateurs de gérer des datasets et aux annotateurs d’annoter des couples de textes selon des classes définies.

⚙️ Fonctionnalités
Gestion des datasets (import CSV, visualisation, export)

Attribution de tâches aux annotateurs

Annotation de textes par les annotateurs

Suivi de l'avancement des annotations

Export des annotations en format CSV

🗃️ Technologies utilisées
Spring Boot
Thymeleaf
Spring Data JPA
MySQL
HTML/CSS/Bootstrap

📁 Structure du projet
controller/ – Contrôleurs Spring

model/ – Entités JPA

repository/ – Interfaces de persistance

service/ – Logique métier

templates/ – Fichiers HTML Thymeleaf

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
🚀 Lancement du projet
Assurez-vous que MySQL fonctionne sur le port 3307

Créez une base de données projet

Mettez à jour application.properties avec vos identifiants MySQL

Lancez l'application via votre IDE ou avec :
mvn spring-boot:run


