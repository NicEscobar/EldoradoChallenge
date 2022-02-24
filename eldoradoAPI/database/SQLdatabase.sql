--
-- File generated with SQLiteStudio v3.3.3 on qui fev 24 00:57:40 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Building
DROP TABLE IF EXISTS Building;

CREATE TABLE Building (
    id_Building   INTEGER      PRIMARY KEY AUTOINCREMENT
                               NOT NULL
                               UNIQUE,
    lat_Building  VARCHAR (50),
    long_Building VARCHAR (50),
    zipCode       INTEGER      NOT NULL
);

INSERT INTO Building (
                         id_Building,
                         lat_Building,
                         long_Building,
                         zipCode
                     )
                     VALUES (
                         1,
                         '-22.23142',
                         '45.2325',
                         3765000
                     );

INSERT INTO Building (
                         id_Building,
                         lat_Building,
                         long_Building,
                         zipCode
                     )
                     VALUES (
                         2,
                         '-22.12345',
                         '45.23223',
                         4765000
                     );


-- Table: CleanHouses
DROP TABLE IF EXISTS CleanHouses;

CREATE TABLE CleanHouses (
    codCleanHouse INTEGER      PRIMARY KEY AUTOINCREMENT
                               UNIQUE
                               NOT NULL,
    id_Building   INTEGER      REFERENCES Building (id_Building) 
                               NOT NULL,
    cpfCustomers  INTEGER      REFERENCES Customers (cpfCustomers) 
                               NOT NULL,
    long_Service  VARCHAR (50),
    lat_Service   VARCHAR (50),
    dateFinished  DATE         NOT NULL,
    dateStarted   DATE         NOT NULL,
    codPackage    INTEGER      REFERENCES Packages (codPackage) 
                               NOT NULL
);

INSERT INTO CleanHouses (
                            codCleanHouse,
                            id_Building,
                            cpfCustomers,
                            long_Service,
                            lat_Service,
                            dateFinished,
                            dateStarted,
                            codPackage
                        )
                        VALUES (
                            1,
                            1,
                            11021323443,
                            '-23.3234',
                            '45.2345',
                            '22/02/2022',
                            '22/01/2022',
                            1
                        );

INSERT INTO CleanHouses (
                            codCleanHouse,
                            id_Building,
                            cpfCustomers,
                            long_Service,
                            lat_Service,
                            dateFinished,
                            dateStarted,
                            codPackage
                        )
                        VALUES (
                            2,
                            2,
                            34024563443,
                            '-23.3234',
                            '45.2345',
                            '19/02/2022',
                            '22/01/2022',
                            2
                        );


-- Table: Customers
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    phoneNumber   INTEGER       NOT NULL,
    nameCustomers VARCHAR (255) NOT NULL,
    cpfCustomers  INTEGER       PRIMARY KEY
                                UNIQUE
                                NOT NULL
);

INSERT INTO Customers (
                          phoneNumber,
                          nameCustomers,
                          cpfCustomers
                      )
                      VALUES (
                          35984372627,
                          'Nicole Escobar Alves',
                          11021323443
                      );

INSERT INTO Customers (
                          phoneNumber,
                          nameCustomers,
                          cpfCustomers
                      )
                      VALUES (
                          35984374534,
                          'Tatiane Escobar Alves',
                          34024563443
                      );


-- Table: Packages
DROP TABLE IF EXISTS Packages;

CREATE TABLE Packages (
    codPackage  INTEGER      PRIMARY KEY AUTOINCREMENT
                             UNIQUE
                             NOT NULL,
    namePackage STRING (255) UNIQUE
                             NOT NULL
);

INSERT INTO Packages (
                         codPackage,
                         namePackage
                     )
                     VALUES (
                         1,
                         'Start Fresh 022'
                     );

INSERT INTO Packages (
                         codPackage,
                         namePackage
                     )
                     VALUES (
                         2,
                         'Return from the ashes 022'
                     );

INSERT INTO Packages (
                         codPackage,
                         namePackage
                     )
                     VALUES (
                         3,
                         'I-can-no-longer-live-in-fear-of-the-rain-anymore 022'
                     );


-- Table: PackageServices
DROP TABLE IF EXISTS PackageServices;

CREATE TABLE PackageServices (
    codService         INTEGER REFERENCES Services (codService) 
                               NOT NULL,
    codPackage         INTEGER REFERENCES Packages (codPackage) 
                               NOT NULL,
    id_PackageServices INTEGER PRIMARY KEY AUTOINCREMENT
                               NOT NULL
                               UNIQUE
);

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                2,
                                1,
                                1
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                3,
                                1,
                                2
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                4,
                                2,
                                3
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                5,
                                2,
                                4
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                2,
                                2,
                                5
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                6,
                                3,
                                6
                            );

INSERT INTO PackageServices (
                                codService,
                                codPackage,
                                id_PackageServices
                            )
                            VALUES (
                                1,
                                3,
                                7
                            );


-- Table: Pictures
DROP TABLE IF EXISTS Pictures;

CREATE TABLE Pictures (
    id_Picture    INTEGER       PRIMARY KEY AUTOINCREMENT
                                NOT NULL
                                UNIQUE,
    codCleanHouse INTEGER       UNIQUE
                                NOT NULL
                                REFERENCES CleanHouses (codCleanHouse),
    urlPicture    VARCHAR (255) UNIQUE
                                NOT NULL,
    datePicture   DATE          NOT NULL
);

INSERT INTO Pictures (
                         id_Picture,
                         codCleanHouse,
                         urlPicture,
                         datePicture
                     )
                     VALUES (
                         1,
                         1,
                         'https://www.google.com/search?q=casa&',
                         '22/02/2022'
                     );

INSERT INTO Pictures (
                         id_Picture,
                         codCleanHouse,
                         urlPicture,
                         datePicture
                     )
                     VALUES (
                         2,
                         2,
                         'https://www.google.com/search?e=sitios&',
                         '21/02/2022'
                     );


-- Table: Services
DROP TABLE IF EXISTS Services;

CREATE TABLE Services (
    nameService VARCHAR (255) NOT NULL
                              UNIQUE,
    codService  INTEGER       PRIMARY KEY AUTOINCREMENT
                              UNIQUE
                              NOT NULL
);

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Cleaning Services',
                         1
                     );

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Deep-Cleaning Services',
                         2
                     );

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Painting Services',
                         3
                     );

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Hydraulic Services',
                         4
                     );

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Electrical Services',
                         5
                     );

INSERT INTO Services (
                         nameService,
                         codService
                     )
                     VALUES (
                         'Rooftop Services',
                         6
                     );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
