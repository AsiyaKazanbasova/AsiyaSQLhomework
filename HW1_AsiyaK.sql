-- Асия Казанбасова
/*
Домашнее задание №1: 
1. Создайте таблицу с мобильными телефонами, 
используя графический интерфейс. Заполните БД данными.
*/
CREATE DATABASE IF NOT EXISTS homework_1;
USE homework_1;
DROP TABLE IF EXISTS mobile_phones;
CREATE TABLE IF NOT EXISTS mobile_phones
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(45),
    Manufacturer VARCHAR(45),
	ProductCount INT,
    Price INT
);

INSERT mobile_phones(ProductName, Manufacturer, ProductCount, Price)
VALUES 
	("IPhone X", "Apple", 3, 76000),
	("IPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
	("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);

-- Выведим информацию о мобильных телефонах
SELECT * FROM mobile_phones;
/*
2. Выведите название, производителя и цену для товаров, 
количество которых превышает 2
*/
SELECT ProductName, Manufacturer, Price
FROM mobile_phones
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM mobile_phones
WHERE Manufacturer = "Samsung";
/*
4. Выведите информацию о телефонах, 
где суммарный чек больше 100 000 и меньше 145 000
*/
SELECT *
FROM mobile_phones
WHERE ProductCount * Price > 100000 
AND ProductCount * Price < 145000;

/*
5. С помощью регулярных выражений найти 
(можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
5.1. Товары, в которых есть упоминание "Iphone"
*/
SELECT *
FROM mobile_phones
WHERE ProductName LIKE "IPhone%";
-- 5.2. "Galaxy"
SELECT *
FROM mobile_phones
WHERE ProductName LIKE "Galaxy%";
-- 5.3. Товары, в которых есть ЦИФРЫ
SELECT *
FROM mobile_phones
WHERE ProductName RLIKE "[:digit:]";
-- 5.4. Товары, в которых есть ЦИФРА "8"
SELECT *
FROM mobile_phones
WHERE ProductName LIKE "%8";