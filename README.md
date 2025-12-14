# 📖 Lab 2 : Conception du Schéma et Contraintes d'Intégrité (Base de Données Bibliothèque Scolaire)

## 🎯 Objectif du Lab

Ce document contient les livrables du Lab 2, qui couvrent la conception du schéma relationnel de la base de données `bibliotheque`. L'objectif était d'appliquer les règles de normalisation, de modéliser les entités et relations, et d'intégrer des contraintes d'intégrité strictes via DDL pour garantir la cohérence des données.

---

## 💾 1. Création de Schéma (`lab2_schema.sql`)

Ce script DDL (Data Definition Language) est la version finale et corrigée. Il crée les quatre tables (`auteur`, `ouvrage`, `abonne`, `emprunt`), définit les clés et établit les contraintes d'intégrité.


##  2. Diagramme Entité-Relation (ER)
Ce diagramme a été généré par rétro-ingénierie à partir du schéma DDL ci-dessus. Il représente la structure du modèle, notamment la table d'association `Emprunt` et toutes les relations 1:n.

<img width="617" height="437" alt="iagramme_bibliotheque_er" src="https://github.com/user-attachments/assets/8649741c-bc65-4bea-b0c5-46fb17cc3ad6" />

## 📝 3. Rapport Succinct sur les Contraintes d’Intégrité

Les contraintes d'intégrité sont le mécanisme fondamental pour garantir l'**exactitude** et la **cohérence** des données dans la base, empêchant ainsi les erreurs et les **anomalies** (insertion, mise à jour, suppression) au niveau du système de gestion de base de données (SGBD).

### Intérêt et Rôle des Contraintes

1.  **Intégrité d'Entité (`PRIMARY KEY`)** :
    * Assure l'unicité et l'identification de chaque enregistrement. La clé composée de la table `Emprunt` **(ouvrage_id, abonne_id, date_debut)** garantit qu'un prêt spécifique est un événement unique et traçable dans le temps.

2.  **Intégrité Référentielle (`FOREIGN KEY`)** :
    * Maintient la validité des liens logiques entre les tables.
    * **`ON DELETE CASCADE`** (Auteur/Abonné) : Gère automatiquement la suppression des enregistrements dépendants, prévenant les **lignes orphelines** (ex: si un abonné est supprimé, ses emprunts historiques le sont aussi).
    * **`ON DELETE RESTRICT`** (Ouvrage vers Emprunt) : C'est une contrainte métier cruciale. Elle **bloque la suppression d'un ouvrage** s'il est en cours d'emprunt, protégeant ainsi l'historique et évitant une **anomalie de suppression** de données vitales.

3.  **Contraintes de Domaine (`UNIQUE`, `CHECK`)** :
    * **`abonne.email UNIQUE`** : Empêche la création de doublons logiques dans les données des utilisateurs.
    * **`ck_date_emprunt CHECK`** : Empêche une **erreur métier** simple mais fréquente où la date de retour (`date_fin`) serait antérieure à la date de début (`date_debut`), assurant la validité temporelle du prêt.

En intégrant ces règles directement dans le SGBD, on assure la **robustesse et la cohérence** du modèle, indépendamment de l'application cliente.


## 👤 Auteur

* **École Normale Supérieure de Marrakech**
  
* **Réalisé par :** SALMA LAKHAL
  
* **Filière  :** CLE_INFO_S5
  
* **Date :**  14/12/2025
  
* **Encadré par :** Pr. Mohamed LACHGAR

* **Module :** Bases de données
  
