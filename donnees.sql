-- Insertion des ingredients dans la table Ingredients
INSERT INTO Ingredients (nomIngredients, quantite, unite) VALUES
('Farine', 1000, 'g'), -- 1 kg de farine
('Sucre', 500, 'g'),   -- 500 g de sucre
('Beurre', 250, 'g'),  -- 250 g de beurre
('Oeuf', 12, 'piece'), -- 12 oeufs
('Chocolat', 200, 'g'),-- 200 g de chocolat
('Vanille', 10, 'ml'), -- 10 ml d'extrait de vanille
('Lait', 1000, 'ml'),  -- 1 litre de lait
('Huile', 500, 'ml'),  -- 500 ml d'huile
('Levure', 10, 'g'),   -- 10 g de levure
('Sel', 5, 'g');       -- 5 g de sel

-- Produits disponibles
INSERT INTO Produit (nomProduit, prixProduit, quantite) VALUES
('Gateau au chocolat', 12.99, 100),
('Tarte a la vanille', 9.49, 150),
('Cookies', 6.99, 200),
('Muffin aux fruits', 7.49, 120),
('Brownie', 8.99, 80);

-- Fabrication du Gateau au chocolat (pour 1 gateau)
INSERT INTO FabricationProduit (idProduit, idIngredients, quantiteUtilise, dureeFabrication) VALUES
(1, 1, 200, 30),  -- Farine : 200g pour 1 gateau
(1, 2, 150, 15),  -- Sucre : 150g pour 1 gateau
(1, 3, 100, 20),  -- Beurre : 100g pour 1 gateau
(1, 4, 2, 10),    -- Oeuf : 2 oeufs pour 1 gateau
(1, 5, 100, 25),  -- Chocolat : 100g pour 1 gateau
(1, 6, 10, 5);    -- Vanille : 10ml pour 1 gateau

-- Fabrication de la Tarte a la vanille (pour 1 tarte)
INSERT INTO FabricationProduit (idProduit, idIngredients, quantiteUtilise, dureeFabrication) VALUES
(2, 1, 250, 30),  -- Farine : 250g pour 1 tarte
(2, 2, 200, 20),  -- Sucre : 200g pour 1 tarte
(2, 3, 100, 25),  -- Beurre : 100g pour 1 tarte
(2, 4, 3, 10),    -- Oeuf : 3 oeufs pour 1 tarte
(2, 7, 100, 35),  -- Lait : 100ml pour 1 tarte
(2, 8, 10, 15);   -- Huile : 10ml pour 1 tarte

-- Fabrication des Cookies (pour 1 cookie)
INSERT INTO FabricationProduit (idProduit, idIngredients, quantiteUtilise, dureeFabrication) VALUES
(3, 1, 300, 25),  -- Farine : 300g pour 1 cookie
(3, 2, 150, 15),  -- Sucre : 150g pour 1 cookie
(3, 3, 150, 20),  -- Beurre : 150g pour 1 cookie
(3, 4, 1, 5),     -- Oeuf : 1 oeuf pour 1 cookie
(3, 5, 100, 30),  -- Chocolat : 100g pour 1 cookie
(3, 6, 5, 10);    -- Vanille : 5ml pour 1 cookie

-- Fabrication du Muffin aux fruits (pour 1 muffin)
INSERT INTO FabricationProduit (idProduit, idIngredients, quantiteUtilise, dureeFabrication) VALUES
(4, 1, 250, 30),  -- Farine : 250g pour 1 muffin
(4, 2, 180, 20),  -- Sucre : 180g pour 1 muffin
(4, 3, 120, 25),  -- Beurre : 120g pour 1 muffin
(4, 4, 2, 10),    -- Oeuf : 2 oeufs pour 1 muffin
(4, 9, 150, 35),  -- Levure : 150g pour 1 muffin
(4, 6, 10, 5);    -- Vanille : 10ml pour 1 muffin

-- Fabrication du Brownie (pour 1 brownie)
INSERT INTO FabricationProduit (idProduit, idIngredients, quantiteUtilise, dureeFabrication) VALUES
(5, 1, 200, 30),  -- Farine : 200g pour 1 brownie
(5, 2, 180, 25),  -- Sucre : 180g pour 1 brownie
(5, 3, 150, 25),  -- Beurre : 150g pour 1 brownie
(5, 4, 3, 10),    -- Oeuf : 3 oeufs pour 1 brownie
(5, 5, 150, 40),  -- Chocolat : 150g pour 1 brownie
(5, 6, 10, 5);    -- Vanille : 10ml pour 1 brownie

-- Les données supposent que les ids dans la table Produit vont de 1 à 5.
INSERT INTO FabricationProduit (idProduit, dureeFabrication, quantiteUtilise)
VALUES
    (1, 120, 50.5), -- Fabrication du Produit A
    (2, 180, 30.0), -- Fabrication du Produit B
    (3, 90, 70.5),  -- Fabrication du Produit C
    (4, 60, 20.0),  -- Fabrication du Produit D
    (5, 150, 40.0); -- Fabrication du Produit E


INSERT INTO FabricationIngredients (idIngredients, idFabricationProduit)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5);