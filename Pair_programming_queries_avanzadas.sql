-- 1  Conocer el precio de los productos que tienen el precio más alto y más bajo. dales alias lowestPrice y highestPrice.
SELECT product_name,  MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
FROM products
GROUP BY product_name;

-- 2 Conocer el número de productos y el precio medio de todos ellos (en general, no por cada producto).

SELECT COUNT(units_in_stock) AS cantidad, AVG(unit_price) AS precio_medio
FROM products; 

-- 3 Sacad la máxima y mínima carga de los pedidos de UK: 

SELECT ship_country, MAX(freight) AS maxima_carga_UK, MIN(freight) AS minima_carga_UK
FROM orders 
WHERE ship_country = 'UK'; 

-- 4 Qué productos se venden por encima del precio medio: 

-- Calcular precio medio: 
SELECT AVG(unit_price) AS precio_medio
FROM products; 

-- Calcular productos que son mas caros que el resultado de la consulta anterior: 
SELECT product_name, unit_price
FROM products
WHERE unit_price > 28.866363636363637
ORDER BY unit_price DESC; 

-- Si lo hicieramos en una sola consulta: 

SELECT product_name, unit_price
FROM products 
WHERE unit_price > 
( SELECT AVG(unit_price) FROM products ) 
ORDER BY unit_price DESC;

-- 5 Qué productos se han descontinuado:

SELECT product_name, discontinued
FROM products
WHERE discontinued = 1

-- 6 Adicionalmente nos piden detalles de aquellos productos no descontinuados, sobre todo el ProductID y ProductName

SELECT product_id, product_name
FROM products
WHERE discontinued = 0
ORDER BY product_id DESC
LIMIT 10;

-- 7 Relación entre número de pedidos y máxima carga:

SELECT employee_id, COUNT(order_id) AS CantidadPedidos, MAX(freight) AS MaximaCarga
FROM orders
GROUP BY employee_id;

-- 8 Descartar pedidos sin fecha y ordénalos

SELECT employee_id, COUNT(order_id) AS CantidadPedidos, MAX(freight) AS MaximaCarga, shipped_date
FROM orders
GROUP BY employee_id
HAVING shipped_date IS NOT NULL
