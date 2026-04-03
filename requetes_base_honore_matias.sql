-- Catalogue des produits du plus cher au moins cher
SELECT nomProduit, prixProduit
FROM PRODUIT
ORDER BY prixProduit DESC;

-- Employés au poste n°2
SELECT nomPersonnel, prenomPersonnel, emailPersonnel
FROM PERSONNEL
WHERE idPoste = 2;

-- Prénoms des clients contenant un 'a'
SELECT DISTINCT prenomClient
FROM CLIENT
WHERE prenomClient LIKE '%a%'
ORDER BY prenomClient;

-- Compter les articles par commande
SELECT idCommande, COUNT(idProduit) AS nbProduits
FROM PRODUIT_COMMANDE
GROUP BY idCommande;

-- Quel produit vendu par quel employé
SELECT PE.nomPersonnel, PE.prenomPersonnel, CO.idCommande, PR.nomProduit
FROM PERSONNEL PE
JOIN COMMANDE CO ON PE.idPersonnel = CO.idPersonnel
JOIN PRODUIT_COMMANDE PC ON CO.idCommande = PC.idCommande
JOIN PRODUIT PR ON PC.idProduit = PR.idProduit;

-- Clients ayant passé plus d'une commande
SELECT C.idClient, C.nomClient, C.prenomClient, COUNT(CO.idCommande) AS nb_commandes
FROM CLIENT C
JOIN COMMANDE CO ON C.idClient = CO.idClient
GROUP BY C.idClient, C.nomClient, C.prenomClient
HAVING COUNT(CO.idCommande) > 1;

-- Panier moyen par commande
SELECT AVG(total_commande) AS prix_moyen_panier
FROM (
    SELECT PC.idCommande, SUM(P.prixProduit) AS total_commande
    FROM PRODUIT_COMMANDE PC
    JOIN PRODUIT P ON PC.idProduit = P.idProduit
    GROUP BY PC.idCommande
);

-- Produit le plus vendu (Best-Seller)
SELECT P.nomProduit, COUNT(PC.idProduit) AS nombre_ventes
FROM PRODUIT_COMMANDE PC
JOIN PRODUIT P ON PC.idProduit = P.idProduit
GROUP BY P.nomProduit
ORDER BY nombre_ventes DESC
LIMIT 1;

-- Masse salariale totale
SELECT SUM(PO.SalairePoste) AS masse_salariale
FROM PERSONNEL PE
JOIN POSTE PO ON PE.idPoste = PO.idPoste;

-- Heure de pointe (Nombre de commandes par heure)
SELECT strftime('%H', heureCommande) AS heure, COUNT(*) AS nb_commandes
FROM COMMANDE
GROUP BY heure
ORDER BY nb_commandes DESC;

-- Valeur totale du stock
SELECT SUM(S.quantitéStock * F.prixFournisseur) AS valeur_totale_stock
FROM STOCK S
JOIN FOURNISSEUR F ON S.idFournisseur = F.idFournisseur;

-- Chiffre d'affaires par mode de commande
SELECT C.modeCommande, SUM(P.prixProduit) AS CA_par_mode
FROM COMMANDE C
JOIN PRODUIT_COMMANDE PC ON C.idCommande = PC.idCommande
JOIN PRODUIT P ON PC.idProduit = P.idProduit
GROUP BY C.modeCommande;

-- Donner les ingrédients nécessaire pour chaque produit
SELECT P.nomProduit AS "Produit", GROUP_CONCAT(S.denréeStock, ', ') AS "Ingrédients"
FROM PRODUIT P
JOIN COMPOSITION_PRODUIT CP ON P.idProduit = CP.idProduit
JOIN STOCK S ON CP.idStock = S.idStock
GROUP BY P.nomProduit;