
insert into Customers (phoneNumber, nameCustomers, cpfCustomers) values (35984372627, "Nicole Escobar Alves", 11021323443);
insert into Customers (phoneNumber, nameCustomers, cpfCustomers) values (35984374534, "Tatiane Escobar Alves", 34024563443);

select * from Customers

insert into Packages (namePackage) values ("Start Fresh 022");
insert into Packages (namePackage) values ("Return from the ashes 022");
insert into Packages (namePackage) values ("I-can-no-longer-live-in-fear-of-the-rain-anymore 022");

select * from Packages

insert into Services (nameService) values ("Cleaning Services");
insert into Services (nameService) values ("Deep-Cleaning Services");
insert into Services (nameService) values ("Painting Services");
insert into Services (nameService) values ("Hydraulic Services");
insert into Services (nameService) values ("Electrical Services");
insert into Services (nameService) values ("Rooftop Services");

select * from Services

insert into PackageServices (codService, codPackage) values (2,1);
insert into PackageServices (codService, codPackage) values (3,1);
insert into PackageServices (codService, codPackage) values (4,2);
insert into PackageServices (codService, codPackage) values (5,2);
insert into PackageServices (codService, codPackage) values (2,2);
insert into PackageServices (codService, codPackage) values (6,3);
insert into PackageServices (codService, codPackage) values (1,3);

select * from PackageServices

insert into Building (lat_Building, long_Building, zipCode) values ("-22.23142","45.2325", 3765000);
insert into Building (lat_Building, long_Building, zipCode) values ("-22.12345","45.23223", 4765000);

select * from Building

insert into CleanHouses (id_Building, cpfCustomers, long_Service,lat_Service,dateFinished,dateStarted,codPackage) values (1,11021323443,"-23.3234","45.2345","22/02/2022","22/01/2022",1);
insert into CleanHouses (id_Building, cpfCustomers, long_Service,lat_Service,dateFinished,dateStarted,codPackage) values (2,34024563443,"-23.3234","45.2345","19/02/2022","22/01/2022",2);

select * from CleanHouses

insert into Pictures (urlPicture, datePicture, codCleanHouse) values ("https://www.google.com/search?q=casa&", "22/02/2022",1);
insert into Pictures (urlPicture, datePicture, codCleanHouse) values ("https://www.google.com/search?e=sitios&", "21/02/2022",2);

select * from Pictures

SELECT distinct Pi.urlPicture, P.namePackage, Pi.datePicture, Pi.codCleanHouse FROM Pictures as Pi 
INNER JOIN Packages as P ON P.codPackage exists (select codPackage from Packages)
WHERE P.codPackage == (SELECT codPackage FROM Packages WHERE namePackage == "Start Fresh 022")

select PI.urlPicture, PI.datePicture from Pictures as PI
where PI.codCleanHouse in (select codCleanHouse from CleanHouses where codPackage in (select codPackage from Packages where namePackage == "Return from the ashes 022"))