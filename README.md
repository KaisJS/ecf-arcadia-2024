Déploiement Local de l'Application Zoo ARCADIA 2024

Ce guide te montre comment déployer l'application de gestion du zoo en local. L'application est développée en PHP pour le backend et utilise MySQL pour la base de données. Le frontend est construit avec HTML, CSS, JavaScript et Bootstrap.

Prérequis :

XAMPP installé sur la machine.
Un éditeur de code comme Visual Studio Code.

Structure du Projet:

Dossier du projet : ecf-arcadia-2024
Base de données : Le fichier gestion_zoo.sql se trouve dans le dossier du projet.

Installation :

Télécharger et Installer XAMPP

Télécharge XAMPP depuis le site officiel.
Suis les instructions d'installation pour configurer XAMPP sur ton système.
Décompresser le Projet

Décompresse le dossier ecf-arcadia-2024 dans le répertoire htdocs de XAMPP. Le chemin par défaut est généralement C:\xampp\htdocs.

Configurer la Base de Données :

Ouvre le panneau de contrôle XAMPP et démarre les services Apache et MySQL.
Accède à phpMyAdmin via ton navigateur.
Crée une nouvelle base de données en cliquant sur "Bases de données" et nomme-la gestion_zoo.
Importer le fichier gestion_zoo.sql :
Dans phpMyAdmin, sélectionne la base de données gestion_zoo.
Clique sur l'onglet "Importer".
Sélectionne le fichier gestion_zoo.sql dans le dossier du projet et clique sur "Exécuter".

Configurer le Fichier de Connexion

Assure-toi que le fichier de configuration PHP (config/database.php) contient les bonnes informations pour se connecter à la base de données MySQL :

<?php
$servername = "localhost";
$username = "root"; 
$password = "";
$dbname = "gestion_zoo";

// Création de la connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion a échoué : " . $conn->connect_error);
}
?>

Accéder à l'Application

Ouvre ton navigateur et accède à http://localhost/ecf-arcadia-2024 pour voir l'application en action.
