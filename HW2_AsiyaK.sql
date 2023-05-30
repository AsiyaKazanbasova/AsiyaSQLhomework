/*
Асия Казанбасова
Домашнее задание №2
1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
*/
CREATE DATABASE homework2;
USE homework2;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date VARCHAR(45) NOT NULL,
    count_product INT
);
INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;
/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва: 
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/
SELECT
	id AS 'Order ID',
CASE
	WHEN count_product < 100
		THEN 'Small order'
	WHEN count_product > 100 AND count_product < 300
		THEN 'Average order'
	ELSE 'Big order'
END AS 'Order Type'
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(45) NOT NULL,
    amount FLOAT,
    order_status VARCHAR(45) NOT NULL
);
INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;
/*
Выберите все заказы. В зависимости от поля order_status
выведите столбец full_order_status:
OPEN – «Order is in open state»; 
CLOSED - «Order is closed»; 
CANCELLED - «Order is cancelled»
*/
SELECT
	id,
    employee_id,
    amount,
    order_status,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	ELSE 'Order is cancelled'
END AS 'full_order_status'
FROM orders;