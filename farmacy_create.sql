create database farmacy; // creating new database
use farmacy; // declare the usage

//creation of table for saving information about customers
CREATE TABLE Customer(
ID INT AUTO_INCREMENT PRIMARY KEY,
FirstName NVARCHAR(20),
LastName NVARCHAR(30) NOT NULL,
Phone NVARCHAR(20)
);

//creation of table for saving information about medicines
CREATE TABLE Medicine(
ID_Med INT AUTO_INCREMENT PRIMARY KEY,
NameMed NVARCHAR(20) NOT NULL,
Instruction TEXT 
);

//creation of table for saving information about providers
CREATE TABLE Provider(
ID_Prov INT AUTO_INCREMENT PRIMARY KEY,
NameProv NVARCHAR(20),
Phone VARCHAR(20),
Email NVARCHAR(25)
);

//creation of table for saving information about warehouse
CREATE TABLE Sklad(
ID_Sklad INT AUTO_INCREMENT PRIMARY KEY,
Adress NVARCHAR(20) NOT NULL
);

//creation of table for saving information about pharmacists (workers)
CREATE TABLE Pharmacist(
ID_Pharm INT AUTO_INCREMENT PRIMARY KEY,
FirstName NVARCHAR(20),
LastName NVARCHAR(30) NOT NULL,
FathersName NVARCHAR(30),
Phone VARCHAR(20),
Adress VARCHAR(25)
);

//creation of table for saving information about orders
CREATE TABLE Zakaz(
ID_Zakaz INT AUTO_INCREMENT PRIMARY KEY,
ID_Customer INT not null,
ID_Pharm INT not null,
foreign key(ID_Customer) REFERENCES customer(ID),
DateZakaz DATETIME default CURRENT_TIMESTAMP not null,
foreign key (ID_Pharm) REFERENCES pharmacist (ID_Pharm)
);

// intermediate table for representing medicine that is included
CREATE TABLE ZakazMed(
ID_ZakazMed INT AUTO_INCREMENT PRIMARY KEY,
ID_Med INT not null,
ID_Zakaz INT not null,
foreign key(ID_Med) REFERENCES  medicine (ID_Med),
foreign key(ID_Zakaz) REFERENCES Zakaz(ID_Zakaz),
PriceOne Float NOT NULL,
AmountZakaz INT Check(AmountZakaz>0)
);

// the table for saving information about worked shifts
CREATE TABLE ReportCard(
ID_Card INT AUTO_INCREMENT PRIMARY KEY,
ID_Pharm INT not null,
DateWork DATETIME default CURRENT_TIMESTAMP not null,
foreign key(ID_Pharm) REFERENCES pharmacist (ID_Pharm),
Shift INT Check(Shift>0 and Shift<5) // assumed that there are only 5 shifts
);

//creation of table for saving information about madicine supplies
create table Supply(
ID_Supply INT AUTO_INCREMENT PRIMARY KEY,
ID_Prov INT not null,
ID_Sklad INT not null,
DateSupply DATETIME default CURRENT_TIMESTAMP not null,
foreign key (ID_Prov) REFERENCES provider (ID_Prov),
foreign key (ID_Sklad) REFERENCES sklad (ID_Sklad)
);

// intermediate table for representing medicine that was supplied
create table SupMedicine(
ID_SupMed INT AUTO_INCREMENT PRIMARY KEY,
Amount INT NOT NULL Check (Amount>0),
PricePerOne FLOAT,
ID_Med INT not null,
ID_Supply INT not null,
OutOfDate DATE NOT NULL;,
foreign key (ID_Med) REFERENCES Medicine (ID_Med),
foreign key (ID_Supply) REFERENCES Supply (ID_Supply)
);

