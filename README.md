**Déploiement Local de l'Application Zoo ARCADIA 2024**

Ce guide vous montre comment déployer l'application de gestion du zoo en local. L'application est développée en PHP pour le backend et utilise MySQL pour la base de données. Le frontend est construit avec HTML, CSS, JavaScript et Bootstrap.

### Prérequis :

- XAMPP installé sur votre machine.
- Un éditeur de code comme Visual Studio Code.

### Structure du Projet:

- **Dossier du projet** : `ecf-arcadia-2024`
- **Base de données** : Le fichier `gestion_zoo.sql` se trouve dans le dossier du projet.

### Installation :

#### 1. Télécharger et Installer XAMPP

- Téléchargez XAMPP depuis le site officiel.
- Suivez les instructions d'installation pour configurer XAMPP sur votre système.

#### 2. Décompresser le Projet

- Décompressez le dossier `ecf-arcadia-2024` dans le répertoire `htdocs` de XAMPP. Le chemin par défaut est généralement `C:\xampp\htdocs`.

#### 3. Configurer la Base de Données :

- Ouvrez le panneau de contrôle XAMPP et démarrez les services Apache et MySQL.
- Accédez à phpMyAdmin via votre navigateur.
- Créez une nouvelle base de données en cliquant sur "Bases de données" et nommez-la `gestion_zoo`.
  
##### Importer le fichier `gestion_zoo.sql` :
  - Dans phpMyAdmin, sélectionnez la base de données `gestion_zoo`.
  - Cliquez sur l'onglet "Importer".
  - Sélectionnez le fichier `gestion_zoo.sql` dans le dossier du projet et cliquez sur "Exécuter".

#### 4. Configurer le Fichier de Connexion

- Assurez-vous que le fichier de configuration PHP (`config/database.php`) contient les bonnes informations pour se connecter à la base de données MySQL :

```php
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
```

### 5. Accéder à l'Application

- Ouvrez votre navigateur et accédez à [http://localhost/ecf-arcadia-2024](http://localhost/ecf-arcadia-2024) pour voir l'application en action.