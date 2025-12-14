
CREATE DATABASE IF NOT EXISTS bibliotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bibliotheque;

CREATE TABLE auteur (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  nom   VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE ouvrage (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  titre       VARCHAR(200) NOT NULL,
  disponible  BOOLEAN NOT NULL DEFAULT TRUE,
  auteur_id   INT NOT NULL,
  CONSTRAINT fk_ouvrage_auteur
    FOREIGN KEY (auteur_id)
    REFERENCES auteur(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE abonne (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  nom   VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE emprunt (
  ouvrage_id  INT NOT NULL,
  abonne_id   INT NOT NULL,
  date_debut  DATE NOT NULL DEFAULT NOW(), 
  date_fin    DATE,

  PRIMARY KEY (ouvrage_id, abonne_id, date_debut),

  CONSTRAINT fk_emprunt_ouvrage
    FOREIGN KEY (ouvrage_id)
    REFERENCES ouvrage(id)
    ON DELETE RESTRICT,

  CONSTRAINT fk_emprunt_abonne
    FOREIGN KEY (abonne_id)
    REFERENCES abonne(id)
    ON DELETE CASCADE
    
) ENGINE=InnoDB;

ALTER TABLE ouvrage ADD INDEX (disponible);
ALTER TABLE emprunt ADD INDEX (date_fin);