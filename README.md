# 🍔 Rapport Individuel S104 : Système d'Information KRUNCHY
# Auteurs : Lina Honoré et Ruben Matias

## 📋 Sommaire
1. [Présentation de l'entreprise](#présentation-de-lentreprise)
2. [Synthèse des recherches](#synthèse-des-recherches)
3. [Modèle Conceptuel de Données (MCD)](#modèle-conceptuel-de-données)
4. [Schéma Relationnel](#schéma-relationnel)
5. [Dictionnaire de données](#dictionnaire-de-données)

---

## 🏢 Présentation de l'entreprise
L’entreprise **KRUNCHY** est un fast-food situé au **28B Boulevard François-Mitterrand, 95200 Sarcelles**, à proximité du centre commercial *My Place*. Cette localisation stratégique lui permet de capter une clientèle variée : jeunes, familles et professionnels.

* **Activité :** Restauration rapide (burgers, sandwichs, wraps, naans).
* **Spécialités :** *Chèvre Miel Smash*, *Chef Spécial Boursin*, menus *Poulet Tandoori*.
* **Modes de consommation :** Sur place, à emporter, ou livraison (Uber Eats, Deliveroo).
* **Effectif :** Une dizaine de salariés répartis entre la cuisine, le service et la livraison.
* **Outil de gestion :** Système informatisé **Zelty** (gestion des commandes via iPad, iPhone, bornes et web).

---

## 🔍 Synthèse des recherches
Les informations ont été recueillies auprès d'**Ilyes**, Community Manager de l'enseigne.

* **Facturation :** Le système génère des tickets incluant la date, l’heure, le mode de paiement, la TVA, le montant HT et le montant TTC.
* **Flux de commande :** Chaque commande est rattachée à un client (nom, prénom, adresse) et liste les produits consommés.
* **Gestion des stocks :** Le restaurateur suit les quantités restantes et les dates de péremption pour optimiser ses achats.
* **Approvisionnement :** Les achats se font soit localement, soit via des fournisseurs (suivi par nom, catégorie et prix).
* **Ressources Humaines :** Le personnel est répertorié par poste avec leurs coordonnées complètes (email, téléphone).

---

## 🛠️ Dictionnaire de données

| Nom de donnée | Type | Description |
| :--- | :--- | :--- |
| **idClient** | A | Numéro unique identifiant un client. |
| **nomClient** | A | Nom de famille du client. |
| **idCommande** | A | Numéro unique identifiant une commande. |
| **dateCommande** | A | Date à laquelle la commande a été passée. |
| **modeCommande** | A | Canal utilisé (UberEats, Borne, Comptoir...). |
| **idProduit** | A | Identifiant unique du produit. |
| **prixProduit** | C | Prix calculé selon la marge : `PrixAchat * (1 + %Marge)`. |
| **idStock** | A | Identifiant unique d'une denrée en stock. |
| **quantiteStock** | C | `(Stock de départ + Entrées) – Ventes`. |
| **peremptionStock**| A | Date limite de consommation. |
| **idPersonnel** | A | Identifiant unique du salarié. |
| **salairePoste** | C | `(TauxHoraire * Heures) + Primes`. |
| **idFournisseur** | A | Identifiant unique du fournisseur. |
| **prixFournisseur**| C | `PrixCatalogue * (1 - %Remise)`. |

> **Légende :** **A** : Attribut / **C** : Calculable / **P** : Paramètre.

---

## 📊 Modélisation

### Modèle Conceptuel de Données (MCD)
*Remarque : Pas de contraintes non modélisables.*

> 🖼️ *[Ici, insère ton image du MCD]*
> `![MCD Krunchy](./images/votre_image_mcd.png)`

### Schéma Relationnel (MLD)
* **CLIENT** (**idClient**, nomClient, prenomClient, adresseClient)
* **COMMANDE** (**idCommande**, dateCommande, heureCommande, modeCommande, #idClient)
* **PRODUIT** (**idProduit**, nomProduit, prixProduit)
* **FOURNISSEUR** (**idFournisseur**, nomFournisseur, denreeFournisseur, prixFournisseur, telFournisseur)
* **PERSONNEL** (**idPersonnel**, nomPersonnel, prenomPersonnel, emailPersonnel, telPersonnel, #idPoste)
* **POSTE** (**idPoste**, nomPoste, salairePoste)
* **STOCK** (**idStock**, denreeStock, quantiteStock, peremptionStock)

---

## 🏁 Conclusion
Ce rapport S104 présente la structure complète de la base de données nécessaire au bon fonctionnement du restaurant **KRUNCHY**, couvrant le cycle de vente, la gestion logistique et le suivi du personnel.
