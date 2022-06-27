use farmacy;
INSERT INTO customer(FirstName, LastName, Phone) 
VALUES
('Ivan','Petrov','097-32-43-238'),
('Kate','Myasnikova', '063-59-80-300'),
('Ruslan', 'Savin', '073-76-90-875');
INSERT INTO medicine (NameMed, Instruction)
VALUES
('Aspirin', 'Таблетки белого цвета, круглые, слегка двояковыпуклые, скошенные к краю, с оттиском в виде фирменного знака'),
('Korvalol', 'Комбинированный препарат, действие которого обусловлено свойствами входящих в его состав веществ. Оказывает седативное и спазмолитическое действие. Облегчает наступление естественного сна.'),
('Drugs', 'Принимать не рекомендуем)))');

INSERT INTO pharmacist (FirstName,LastName,FathersName, Phone, Adress)
VALUES
('Daria','Melyk','Andreevna', '067-723-32-05', 'Fontanska, 14'),
('Irina', 'Kompan', 'Igorevna', '080-678-98-76', 'Poskot, 1');

INSERT INTO sklad(Adress) values ('Shevchenko, 666');

INSERT INTO provider(NameProv, Phone, Email)
Values
('Darnitsa', '042-33-15','darnitsa15@gmail.com'),
('Cure', '080-90-87','cere87@gmail.com'),
('Lechim', '090-99-66','lechim66@ukr.net');

insert into supply(ID_Prov, ID_Sklad, DateSupply)
values
(2, 1, CAST('2021-04-18' as datetime)),
(3, 1, CAST('2020-01-13' as datetime));

insert Into supmedicine(Amount,PricePerOne,ID_Med, ID_Supply, OutOfDate)
Values
(3, 13.40,3,1, '2022-12-02'),
(1, 22.99, 1,1, '2023-09-08'),
(2, 34.45, 1, 1, '2020-12-13'),
(2, 23, 1, 2, '2023-07-12');

insert into zakaz(ID_Customer, ID_Pharm, DateZakaz)
values
(1, 2, '2019-05-27 20:14:00'),
(1, 1, '2018-05-27 20:14:13'),
(3, 2, '2020-05-27 23:14:21'),
(2, 1, '2020-05-27 23:14:21');

insert into zakazmed(ID_Med, ID_Zakaz, PriceOne, AmountZakaz)
values
(1,3,11,4),
(2,4,45,5),
(3,1,56,6),
(1,2,12,1),
(3,2,13,3);

insert into reportcard(ID_Pharm, DateWork, Shift)
values
(1,'2019-05-27', 1),
(1,'2021-04-18', 3),
(2,'2021-01-15', 4),
(1,'2021-03-08', 1);
