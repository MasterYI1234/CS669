insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (2, 'Hally', 'n2Ns5KvBNqt', 'Lanette', 'Massey', '3158004388', 'lmassey1@salon.com', '2/9/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (3, 'Moshe', 'NmjstOW12', 'Jana', 'Ripsher', '3972795626', 'jripsher2@hhs.gov', '2/21/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (4, 'Dell', 'xdETWKaSr4Po', 'Phillipe', 'Gange', '2727876153', 'pgange3@surveymonkey.com', '5/17/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (5, 'Chelsey', 'm2r72eGTm', 'Jodi', 'Ruggier', '4421678545', 'jruggier4@spotify.com', '12/14/2021', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (6, 'Aldus', 'fgvcB3', 'Clarabelle', 'Klyn', '5751232008', 'cklyn5@cbc.ca', '10/4/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (7, 'Ulberto', 'NOhMDwbQrg', 'Shannon', 'Riddlesden', '2382159865', 'sriddlesden6@mapquest.com', '6/25/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (8, 'Ellery', 'qqDHoRN', 'Lauritz', 'Gravenell', '6057494861', 'lgravenell7@reverbnation.com', '1/21/2022', 'S');
insert into Account (AccountID, UserName, UserPassword, FirstName, LastName, Phone, Email, CreatOn, AccountType) values (9, 'Ximenez', '83hfyCK', 'Case', 'Thewlis', '9502279156', 'cthewlis0@wikia.com', '4/8/2022', 'S');


insert into SellerAccount values (1,191.03,945.23);
insert into SellerAccount values (2,982.83,7.71);
insert into SellerAccount values (3,828.40,60.43);
insert into SellerAccount values (4,96.23,316.29);
insert into SellerAccount values (5,922.83,9.17);
insert into SellerAccount values (6,256.75,721.93);
insert into SellerAccount values (7,438.65,2.97);
insert into SellerAccount values (8,4.47,777.09);
insert into SellerAccount values (9,857.10,590.16);

UPDATE SellerAccount
Set Promote = 137.61
Where AccountID = 9;


insert into Product values (2,'fairlife 2% Reduced Fat Ultra-Filtered Milk, Lactose Free, 52 fl oz',3.98,'https://www.walmart.com/ip/fairlife-2-Reduced-Fat-Ultra-Filtered-Milk-Lactose-Free-52-fl-oz/43984343');
insert into Product values (3,'Great Value Whole Vitamin D Milk, Half Gallon, 64 fl oz',1.92,'https://www.walmart.com/ip/Great-Value-Whole-Vitamin-D-Milk-Half-Gallon-64-fl-oz/10450118');
insert into Product values (4,'Great Value Fat Free Milk, Gallon, 128 fl oz',3.07,'https://www.walmart.com/ip/Great-Value-Fat-Free-Milk-Gallon-128-fl-oz/10450117');




insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (1, 3.14, 3.53, 1, '8/15/2021');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (2, 3.53, 3.21, 1, '9/28/2021');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (3, 3.04, 3.58, 4, '12/30/2021');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (4, 3.85, 2.16, 3, '3/16/2022');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (5, 3.21, 3.78, 1, '5/24/2022');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (6, 4.68, 3.00, 2, '5/24/2022');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (7, 3.58, 2.64, 4, '5/24/2022');
insert into PriceChange (PriceChangeID, OldPrice, NewPrice, ProductID, ChangeDate) values (8, 3.00, 3.23, 2, '8/17/2022');