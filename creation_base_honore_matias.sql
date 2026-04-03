DROP TABLE IF EXISTS COMPOSITION_PRODUIT;
DROP TABLE IF EXISTS CONTACTE;
DROP TABLE IF EXISTS PRODUIT_COMMANDE;
DROP TABLE IF EXISTS COMMANDE;
DROP TABLE IF EXISTS PERSONNEL;
DROP TABLE IF EXISTS STOCK;
DROP TABLE IF EXISTS POSTE;
DROP TABLE IF EXISTS FOURNISSEUR;
DROP TABLE IF EXISTS PRODUIT;
DROP TABLE IF EXISTS CLIENT;

CREATE TABLE CLIENT(
   idClient INT,
   nomClient VARCHAR(50) NOT NULL,
   prenomClient VARCHAR(50) NOT NULL,
   adresseClient VARCHAR(50) NOT NULL,
   PRIMARY KEY(idClient)
);

CREATE TABLE PRODUIT(
   idProduit INT,
   nomProduit VARCHAR(50) NOT NULL,
   prixProduit DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(idProduit)
);

CREATE TABLE FOURNISSEUR(
   idFournisseur INT PRIMARY KEY,
   nomFournisseur VARCHAR(50) NOT NULL,
   denreeFournisseur VARCHAR(50) NOT NULL,
   prixFournisseur DECIMAL(10,2) NOT NULL,
   telFournisseur VARCHAR(20) 
);

CREATE TABLE POSTE(
   idPoste INT,
   nomPoste VARCHAR(50) NOT NULL,
   SalairePoste DECIMAL(15,2) NOT NULL,
   PRIMARY KEY(idPoste)
);

CREATE TABLE STOCK(
   idStock INT,
   quantitéStock INT NOT NULL,
   denréeStock VARCHAR(50) NOT NULL,
   peremptionStock DATE NOT NULL,
   idFournisseur INT NOT NULL,
   PRIMARY KEY(idStock),
   FOREIGN KEY(idFournisseur) REFERENCES FOURNISSEUR(idFournisseur)
);

CREATE TABLE PERSONNEL(
   idPersonnel INT,
   nomPersonnel VARCHAR(50) NOT NULL,
   prenomPersonnel VARCHAR(50) NOT NULL,
   emailPersonnel VARCHAR(50) NOT NULL,
   telPersonnel VARCHAR(50) NOT NULL,
   idPoste INT NOT NULL,
   PRIMARY KEY(idPersonnel),
   UNIQUE(emailPersonnel),
   UNIQUE(telPersonnel),
   FOREIGN KEY(idPoste) REFERENCES POSTE(idPoste)
);

CREATE TABLE COMMANDE(
   idCommande INT,
   dateCommande DATE NOT NULL,
   heureCommande TIME NOT NULL, 
   modeCommande VARCHAR(50) NOT NULL,
   idPersonnel INT, 
   idClient INT,
   PRIMARY KEY(idCommande),
   FOREIGN KEY(idPersonnel) REFERENCES PERSONNEL(idPersonnel),
   FOREIGN KEY(idClient) REFERENCES CLIENT(idClient)
);

CREATE TABLE PRODUIT_COMMANDE(
   idCommande INT,
   idProduit INT,
   PRIMARY KEY (idCommande, idProduit),
   FOREIGN KEY(idProduit) REFERENCES PRODUIT(idProduit),
   FOREIGN KEY(idCommande) REFERENCES COMMANDE(idCommande)
);

CREATE TABLE CONTACTE(
   idFournisseur INT,
   idPersonnel INT,
   PRIMARY KEY (idFournisseur, idPersonnel),
   FOREIGN KEY (idFournisseur) REFERENCES FOURNISSEUR(idFournisseur),
   FOREIGN KEY (idPersonnel) REFERENCES PERSONNEL(idPersonnel)
);

CREATE TABLE COMPOSITION_PRODUIT(
   idProduit INT,
   idStock INT,
   PRIMARY KEY (idProduit, idStock),
   FOREIGN KEY (idProduit) REFERENCES PRODUIT(idProduit),
   FOREIGN KEY (idStock) REFERENCES STOCK(idStock)
);