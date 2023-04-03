/*Create the table*/
DROP TABLE BuyerAccount
DROP TABLE SellerAccount
DROP TABLE Account
DROP TABLE OneSave
DROP TABLE TypeName
DROP TABLE SellingPlatform
DROP TABLE Evaluation
DROP TABLE Product


CREATE TABLE Account(
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
UserName VARCHAR(64) NOT NULL,
UserPassword VARCHAR(255) NOT NULL,
FirstName VARCHAR(225) NOT NULL,
LastName VARCHAR(225) NOT NULL,
Phone DECIMAL(10) NOT NULL,
Email VARCHAR(255) NOT NULL,
CreatOn DATE NOT NULL,
AccountType CHAR(1) NOT NULL);


CREATE TABLE BuyerAccount(
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
AccountBalance DECIMAL(4,3) NOT NULL,
RenewalDate DATE NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));


CREATE TABLE SellerAccount(
AccountID DECIMAL(12) NOT NULL PRIMARY KEY,
AccountBalance DECIMAL(8,3) NOT NULL,
Promote DECIMAL(8,3) NOT NULL,
FOREIGN KEY (AccountID) REFERENCES Account(AccountID));


CREATE TABLE Product(
ProductID DECIMAL(12) NOT NULL PRIMARY KEY,
ItemName VARCHAR(225) NOT NULL,
Price DECIMAL(8,2) NOT NULL,
URLline VARCHAR(1024) NOT NULL);


CREATE TABLE SellingPlatform(
SellingPlatformID DECIMAL(12) NOT NULL PRIMARY KEY,
SellingPlatform Varchar(225) NOT NULL,
ProductID DECIMAL(12) NOT NULL,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID));


CREATE TABLE TypeName(
TypeID DECIMAL(12) NOT NULL PRIMARY KEY,
TypeName VARCHAR(100) NOT NULL,
SellingPlatformID DECIMAL(12) NOT NULL,
FOREIGN KEY (SellingPlatformID) REFERENCES SellingPlatform(SellingPlatformID));


CREATE TABLE Evaluation(
EvaluationID DECIMAL(12) NOT NULL PRIMARY KEY,
Evaluation VARCHAR(2047) NOT NULL);



CREATE TABLE OneSave(
SaveID DECIMAL(12) NOT NULL PRIMARY KEY,
SaveTime DATE NOT NULL,
EvaluationID DECIMAL(12) NOT NULL,
TypeID DECIMAL(12) NOT NULL,
FOREIGN KEY (EvaluationID) REFERENCES Evaluation(EvaluationID),
FOREIGN KEY (TypeID) REFERENCES TypeName(TypeID));



/*Make the index*/

/*Make the index of FK*/

CREATE INDEX EvaluationIDIdx
ON OneSave(EvaluationID);

CREATE UNIQUE INDEX TypeIDIdx
ON OneSave(TypeID);

CREATE INDEX SellingPlatformIDIdx
ON TypeName(SellingPlatformID);

CREATE INDEX ProductIDIdx
ON SellingPlatform(ProductID);

CREATE INDEX BuyerAccountBalanceIdx
ON BuyerAccount(AccountBalance);

/*Make the index for account balance to make people know is it enough*/
CREATE INDEX SellerAccountBalanceIdx
ON SellerAccount(AccountBalance);

/*Make the index of savetime to let people can make same time save together*/
CREATE INDEX SaveTimeIdx
ON OneSave(SaveTime);

/*Make the index of type to let people can make same tpye product together*/
CREATE INDEX TypeNameIdx
ON TypeName(TypeName);

