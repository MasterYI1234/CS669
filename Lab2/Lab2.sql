CREATE TABLE Pizza(
pizza_id DECIMAL(12) NOT NULL PRIMARY KEY,
name VARCHAR(32) NOT NULL,
date_available DATE NOT NULL,
price DECIMAL(4,2) NOT NULL
);

CREATE TABLE Topping(
topping_id DECIMAL(12) NOT NULL PRIMARY KEY,
topping_name VARCHAR(64) NOT NULL,
pizza_id DECIMAL(12) NULL 
);

ALTER TABLE Topping
ADD CONSTRAINT topping_pizza_fk
FOREIGN KEY(pizza_id)
REFERENCES Pizza(pizza_id);





INSERT INTO Pizza(pizza_id, name, date_available, price)
VALUES(1, 'Plain', CAST('3/10/2022' AS date), 8.00);
INSERT INTO Pizza(pizza_id, name, date_available, price)
VALUES(2, 'Hawaiian', CAST('4/10/2022' AS date), 10.12);
INSERT INTO Pizza(pizza_id, name, date_available, price)
VALUES(3, 'Margherita', CAST('5/10/2022' AS date), 12.25);
INSERT INTO Pizza(pizza_id, name, date_available, price)
VALUES(4, 'Supreme', CAST('6/10/2022' AS date), 18.75);

INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(101, 'pineapple', 2);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(102, 'Bacon', 2);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(103, 'pork', NULL);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(104, 'tomato', 3);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(105, 'cheese', 3);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(106, 'sausage', 4);
INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(107, 'pepper', 4);

SELECT *
FROM Pizza
SELECT *
FROM Topping


INSERT INTO Topping(topping_id, topping_name, pizza_id)
VALUES(108, 'water', 99);


SELECT name, topping_name
FROM Topping
JOIN Pizza ON Topping.pizza_id = Pizza.pizza_id;

SELECT name, date_available, topping_name
From Topping
RIGHT JOIN Pizza ON Topping.pizza_id = Pizza.pizza_id
ORDER BY date_available;

SELECT name, date_available, topping_name
From Pizza
LEFT JOIN Topping ON Pizza.pizza_id = Topping.pizza_id
ORDER BY date_available;



SELECT topping_name, name
From Topping
LEFT JOIN Pizza ON Topping.pizza_id = Pizza.pizza_id
ORDER BY topping_name DESC;

SELECT topping_name, name
From Pizza
RIGHT JOIN Topping ON Pizza.pizza_id = Topping.pizza_id
ORDER BY topping_name DESC;



SELECT name, topping_name
From Topping
FULL JOIN Pizza ON Topping.pizza_id = Pizza.pizza_id
ORDER BY name, topping_name;


SELECT name, format(price, '$.00')
FROM Pizza


SELECT name, format(Pizza.price-1, '$.00')
FROM Pizza



SELECT topping.topping_name + '(' + Pizza.name + ':' + format(Pizza.price, '$.00') + ')' 
FROM Topping
JOIN Pizza ON Topping.pizza_id = Pizza.pizza_id
ORDER BY topping_name;