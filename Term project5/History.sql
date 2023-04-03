CREATE TABLE PriceChange(
PriceChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
OldPrice DECIMAL(8,2) NOT NULL,
NewPrice DECIMAL(8,2) NOT NULL,
ProductID DECIMAL(12) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (ProductID) REFERENCES Product(ProductID));



CREATE TRIGGER PriceChangeTrigger
ON Product
After UPDATE
AS
BEGIN
  DECLARE @OldPrice DECIMAL(8,2) = (SELECT Price FROM DELETED);
  DECLARE @NewPrice DECIMAL(8,2) = (SELECT Price FROM INSERTED);

  IF (@OldPrice<>@NewPrice)
    INSERT INTO PriceChange(PriceChangeID,OldPrice,NewPrice,ProductID,ChangeDate)
	VALUES(ISNULL((SELECT MAX(PriceChangeID)+1 FROM PriceChange),1),
	       @OldPrice,
		   @NewPrice,
		   (SELECT ProductID FROM INSERTED),
		   GETDATE());
END;



Select * from Product;


UPDATE Product
Set Price = 2.50
Where ProductID = 1;

UPDATE Product
Set Price = 2.99
Where ProductID = 1;

Select * from PriceChange;