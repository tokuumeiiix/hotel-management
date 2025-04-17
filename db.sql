CREATE TABLE Hotel (
    id_Hotel INT PRIMARY KEY AUTO_INCREMENT,
    nom_Hotel VARCHAR(100) NOT NULL,
    Nbre_Etoiles TINYINT NOT NULL CHECK (Nbre_Etoiles BETWEEN 1 AND 5)
);

CREATE TABLE Restaurant (
    id_Restaurant INT PRIMARY KEY AUTO_INCREMENT,
    Prix DECIMAL(10,2) NOT NULL,
    capacite INT NOT NULL,
    statut ENUM('Empty', 'Occupied') NOT NULL DEFAULT 'Empty',
    food VARCHAR(100) NOT NULL,
    id_Hotel INT,
    FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_Hotel) ON DELETE CASCADE
);

CREATE TABLE Salle (
    id_Salle INT PRIMARY KEY AUTO_INCREMENT,
    Type_salle ENUM('fetes', 'conference') NOT NULL,
    capacite INT NOT NULL,
    statut ENUM('Empty', 'Occupied') NOT NULL DEFAULT 'Empty',
    Prix DECIMAL(10,2) NOT NULL,
    id_Hotel INT,
    FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_Hotel) ON DELETE CASCADE
);

CREATE TABLE Chambre (
    id_Chambre INT PRIMARY KEY AUTO_INCREMENT,
    Type_Chambre ENUM('Single', 'Double', 'Junior Single', 'Junior Double', 'Apart Single', 'Apart Double') NOT NULL,
    Prix DECIMAL(10,2) NOT NULL,
    statut ENUM('Empty', 'Occupied') NOT NULL DEFAULT 'Empty',
    id_Hotel INT NOT NULL,
    FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_Hotel) ON DELETE CASCADE
);

CREATE TABLE Client (
    id_Client INT NOT NULL PRIMARY KEY,
    FName_Client VARCHAR(50) NOT NULL,
    LName_Client VARCHAR(50) NOT NULL,
    Phone_Client VARCHAR(20),
    Email_Client VARCHAR(100)
);

CREATE TABLE Reservation (
    id_Reservation INT PRIMARY KEY AUTO_INCREMENT,
    Date_Arive DATE NOT NULL,
    Date_Depart DATE NOT NULL,
    Nbre_personnes INT NOT NULL,
    id_Client INT NOT NULL,
    id_Chambre INT,
    id_Salle INT,
    id_Hotel INT,
    FOREIGN KEY (id_Client) REFERENCES Client(id_Client) ON DELETE CASCADE,
    FOREIGN KEY (id_Chambre) REFERENCES Chambre(id_Chambre) ON DELETE CASCADE,
    FOREIGN KEY (id_Salle) REFERENCES Salle(id_Salle) ON DELETE CASCADE,
    FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_Hotel) ON DELETE CASCADE
);

CREATE TABLE Facture (
    id_Facture INT PRIMARY KEY AUTO_INCREMENT,
    montant_total DECIMAL(10,2) NOT NULL,
    date_facture DATE NOT NULL,
    id_Reservation INT,
    FOREIGN KEY (id_Reservation) REFERENCES Reservation(id_Reservation)
);

CREATE TABLE Pool (
    id_Pool INT PRIMARY KEY AUTO_INCREMENT,
    Prix DECIMAL(10,2) NOT NULL,
    status_pool ENUM('Empty', 'Occupied') NOT NULL DEFAULT 'Empty',
    id_Hotel INT,
    FOREIGN KEY (id_Hotel) REFERENCES Hotel(id_Hotel) ON DELETE CASCADE
);

CREATE TABLE Paiement (
    id_Paiement INT PRIMARY KEY AUTO_INCREMENT,
    mode_paiement ENUM('cash') NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_paiement DATE NOT NULL,
    id_Facture INT,
    FOREIGN KEY (id_Facture) REFERENCES Facture(id_Facture)
);
