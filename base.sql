CREATE DATABASE Boulangerie;
\c boulangerie;

CREATE TABLE Produit (
    idProduit SERIAL PRIMARY KEY,
    nomProduit VARCHAR(50),
    prixProduit DECIMAL,
    quantite INT,
    duree decimal
);

CREATE TABLE Ingredients (
    idIngredients SERIAL PRIMARY KEY,
    nomIngredients VARCHAR(50),
    quantite DECIMAL,
    unite VARCHAR(10),
    prix DECIMAL 
);

CREATE TABLE Stock (
    idStock SERIAL PRIMARY KEY,
    idIngredients INT REFERENCES Ingredients(idIngredients),
    quantiteDisponible DECIMAL,
    dateMiseAJour TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TypeMouvement (
    idTypeMouvement SERIAL PRIMARY KEY,
    nomMouvement VARCHAR(10)
);

CREATE TABLE MouvementStock (
    idMouvementStock SERIAL PRIMARY KEY,
    idIngredients INT REFERENCES Ingredients(idIngredients),
    idTypeMouvement INT REFERENCES TypeMouvement(idTypeMouvement),
    dateMouvement TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table MouvementStockProduit(
    idMouvementStockProduit serial primary key,
    idProduit  int references Ingredients(idIngredients),
    idTypeMouvement int references TypeMouvement(idTypeMouvement),
    dateMouvement timestamp default CURRENT_TIMESTAMP
);

create table User(
    idUser serial primary key,
    idRole int references Role(idRole),
    username varchar(15),
    mdp varchar(50)
);

create table role(
    idRole serial primary key,
    nomRole varchar(10)
);



CREATE TABLE FabricationProduit (
    idFabricationProduit SERIAL PRIMARY KEY,
    idProduit INT REFERENCES Produit(idProduit),
    dureeFabrication INT,
    quantiteUtilise DECIMAL
);

create table FabricationIngredients(
    idfabricationIngredients serial PRIMARY key,
    idIngredients int references Ingredients(idIngredients),
    idFabricationProduit int references FabricationProduit(idFabricationProduit)
);
