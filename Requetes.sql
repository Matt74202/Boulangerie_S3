--
create or replace view getIngredientByFab as 
SELECT 
Ig.nomIngredients nomIngredients,
Pp.nomProduit nomProduit
from 
FabricationIngredients fi
join FabricationProduit fp 
on
fi.idFabricationProduit = fp.idFabricationProduit
join Produit Pp 
on
fp.idProduit = Pp.idProduit
join Ingredients Ig
on 
fi.idIngredients = Ig.idIngredients
;

-- Vue ProduitQuantite ahitana ny quantite ana produit ray
CREATE or replace VIEW VueProduitQuantite AS
SELECT 
    idProduit, 
    nomProduit, 
    prixProduit, 
    SUM(quantite) AS totalQuantite,
    duree
FROM 
    Produit
GROUP BY 
    idProduit, nomProduit, prixProduit,duree;

-- Vue pour savoir le nombre d'ingredients utilises pour un certain nombre de produits
CREATE VIEW VueQuantiteIngredients AS
SELECT 
    i.nomIngredients, 
    SUM(fp.quantiteUtilise) AS quantite_totale
FROM 
    FabricationProduit fp
JOIN 
    Ingredients i ON fp.idIngredients = i.idIngredients
GROUP BY 
    i.nomIngredients;

-- Calculer le nombre de produits mbola afaka fabriquena a partir des restes en stock
CREATE VIEW VueNombreProduitsFabricables AS
SELECT
    p.idProduit,
    p.nomProduit,
    -- Calculer le nombre de produits qu'on peut fabriquer avec les ingredients restants
    FLOOR(MIN(s.quantiteDisponible / fp.quantiteUtilise)) AS nombre_de_produits_fabricables
FROM
    Produit p
JOIN
    FabricationProduit fp ON p.idProduit = fp.idProduit
JOIN
    Ingredients i ON fp.idIngredients = i.idIngredients
JOIN
    Stock s ON i.idIngredients = s.idIngredients
GROUP BY
    p.idProduit, p.nomProduit;

-- Calcul du prix de revient des produits
CREATE VIEW PrixRevientProduits AS
SELECT 
    p.idProduit,
    p.nomProduit,
    SUM(fi.quantiteUtilise * i.prix) AS prixRevient
FROM 
    Produit p
JOIN 
    FabricationProduit fi ON p.idProduit = fi.idProduit
JOIN 
    Ingredients i ON fi.idIngredients = i.idIngredients
GROUP BY 
    p.idProduit, p.nomProduit;

-- Meme calcul mais pour un produit specifique
CREATE VIEW PrixRevientProduitSpecifique AS
SELECT 
    p.idProduit,
    p.nomProduit,
    SUM(fi.quantiteUtilise * i.prix) AS prixRevient
FROM 
    Produit p
JOIN 
    FabricationProduit fi ON p.idProduit = fi.idProduit
JOIN 
    Ingredients i ON fi.idIngredients = i.idIngredients
WHERE 
    p.idProduit = idProduit
GROUP BY 
    p.idProduit, p.nomProduit;

-- Prix de revient pour un nombre donne de produits
CREATE VIEW CoutTotalFabrication AS
SELECT 
    p.idProduit,
    p.nomProduit,
    p.quantite AS nombreProduits, -- Nombre total de produits
    SUM(fi.quantiteUtilise * i.prix) * p.quantite AS coutTotalFabrication
FROM 
    Produit p
JOIN 
    FabricationProduit fi ON p.idProduit = fi.idProduit
JOIN 
    Ingredients i ON fi.idIngredients = i.idIngredients
GROUP BY 
    p.idProduit, p.nomProduit, p.quantite;
