CREATE DATABASE IF NOT EXISTS gestion_zoo;
USE gestion_zoo;


CREATE TABLE `animal` (
  `animal_id` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `race` varchar(50) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  `etat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `avis` (
  `avis_id` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `isVisible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `commentaire_habitat` (
  `commentaire_habitat_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  `commentaire` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `consultation` (
  `consultation_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `habitat` (
  `habitat_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `commentaire_habitat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `image_data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `nourriture` (
  `nourriture_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `type_nourriture` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `rapport_veterinaire` (
  `rapport_veterinaire_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `role` (`role_id`, `label`) VALUES
(1, 'Employé'),
(2, 'Vétérinaire'),
(3, 'Admin');


CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `utilisateur` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `utilisateur` (`username`, `password`, `nom`, `prenom`, `role_id`) VALUES
('adminpro@arcadia.fr', '$2y$10$5ffRnihO6QIRrNuAa7dvUu.J.4o8rf3d92V1dguHZmtcBMNaGdTNu', 'Admin', 'Arcadia', 3),
('test@arcadia.fr', '$2y$10$zzPtTSsSzT1f2fIq5THI7et8ATlmmH7u0lcZTjoVM.Vf6G9IQBdYG', 'John', 'Test', 2);


ALTER TABLE `animal`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `fk_habitat` (`habitat_id`);


ALTER TABLE `avis`
  ADD PRIMARY KEY (`avis_id`);


ALTER TABLE `commentaire_habitat`
  ADD PRIMARY KEY (`commentaire_habitat_id`),
  ADD KEY `fk_habitat_commentaire` (`habitat_id`);


ALTER TABLE `consultation`
  ADD PRIMARY KEY (`consultation_id`),
  ADD KEY `fk_animal_consultation` (`animal_id`);


ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);


ALTER TABLE `habitat`
  ADD PRIMARY KEY (`habitat_id`);


ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);


ALTER TABLE `nourriture`
  ADD PRIMARY KEY (`nourriture_id`),
  ADD KEY `fk_animal_nourriture` (`animal_id`);


ALTER TABLE `rapport_veterinaire`
  ADD PRIMARY KEY (`rapport_veterinaire_id`),
  ADD KEY `fk_animal` (`animal_id`);


ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);


ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);


ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fk_role` (`role_id`);



ALTER TABLE `animal`
  MODIFY `animal_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `avis`
  MODIFY `avis_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `commentaire_habitat`
  MODIFY `commentaire_habitat_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `consultation`
  MODIFY `consultation_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `habitat`
  MODIFY `habitat_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `nourriture`
  MODIFY `nourriture_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `rapport_veterinaire`
  MODIFY `rapport_veterinaire_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;



ALTER TABLE `animal`
  ADD CONSTRAINT `fk_habitat` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`habitat_id`);


ALTER TABLE `commentaire_habitat`
  ADD CONSTRAINT `fk_habitat_commentaire` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`habitat_id`);


ALTER TABLE `consultation`
  ADD CONSTRAINT `fk_animal_consultation` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);


ALTER TABLE `nourriture`
  ADD CONSTRAINT `fk_animal_nourriture` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);


ALTER TABLE `rapport_veterinaire`
  ADD CONSTRAINT `fk_animal` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`animal_id`);


ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

