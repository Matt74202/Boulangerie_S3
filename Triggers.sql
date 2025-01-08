CREATE OR REPLACE FUNCTION mettre_a_jour_stock() 
RETURNS TRIGGER AS
$$
BEGIN

    IF NEW.typeMouvement = 'entree' THEN
        UPDATE Stock
        SET quantiteDisponible = quantiteDisponible + NEW.quantite
        WHERE idIngredients = NEW.idIngredients;
    ELSIF NEW.typeMouvement = 'sortie' THEN

        UPDATE Stock
        SET quantiteDisponible = quantiteDisponible - NEW.quantite
        WHERE idIngredients = NEW.idIngredients;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_mouvement_stock
AFTER INSERT ON MouvementStock
FOR EACH ROW
EXECUTE FUNCTION mettre_a_jour_stock();

--miconsiderer ny ingredient nampidirina ho stock
CREATE OR REPLACE FUNCTION update_stock_on_insert() 
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifie si l'ingrédient existe déjà dans la table Stock
    IF NOT EXISTS (SELECT 1 FROM Stock WHERE idIngredients = NEW.idIngredients) THEN
        -- Si l'ingrédient n'existe pas, insère-le dans la table Stock
        INSERT INTO Stock (idIngredients, quantiteDisponible, dateMiseAJour)
        VALUES (NEW.idIngredients, NEW.quantite, CURRENT_TIMESTAMP);
    ELSE
        -- Si l'ingrédient existe déjà dans Stock, mets à jour sa quantité
        UPDATE Stock
        SET quantiteDisponible = quantiteDisponible + NEW.quantite,
            dateMiseAJour = CURRENT_TIMESTAMP
        WHERE idIngredients = NEW.idIngredients;
    END IF;

    -- Retourne la nouvelle ligne insérée dans Ingredients
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER after_insert_ingredients
AFTER INSERT ON Ingredients
FOR EACH ROW
EXECUTE FUNCTION update_stock_on_insert();


