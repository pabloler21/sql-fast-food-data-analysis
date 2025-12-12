USE fast_food_db

SELECT * 
FROM ordenes
--Total de ventas globales

SELECT SUM(total_compra) as total_ventas
FROM ordenes

SELECT *
FROM producto

--Promedio de precios de productos por categoría

SELECT categoria_id,AVG(precio) as promedio_precio
FROM producto
GROUP BY categoria_id

SELECT *
FROM ordenes

--Orden mínima y máxima por sucursal

SELECT  sucursal_id,
        MIN(total_compra) AS minimo,MAX(total_compra) AS maximo
FROM    ordenes
GROUP BY sucursal_id;

--Mayor número de kilómetros recorridos para entrega

SELECT TOP 1 id,MAX(kilometros_recorrer) AS maximo_km_recorrido
FROM ordenes
GROUP BY id
ORDER BY maximo_km_recorrido DESC


SELECT *
FROM orden_producto

--Promedio de cantidad de productos por orden

SELECT producto_id,orden_id,AVG(cantidad) AS promedio_cantidad_por_orden
FROM orden_producto
GROUP BY orden_id, producto_id


SELECT *
FROM tipo_de_pago

--Total de ventas por tipo de pago

SELECT tipo_de_pago_id,SUM(total_compra) AS total_por_tipo_pago 
FROM ordenes
GROUP BY  tipo_de_pago_id

--Sucursal con la venta promedio más alta

SELECT TOP 1 sucursal_id,AVG(total_compra) as promedio_por_sucursal
FROM ordenes
GROUP BY sucursal_id
ORDER BY promedio_por_sucursal DESC

--Sucursal con la mayor cantidad de ventas por encima de un umbral

SELECT sucursal_id,total_compra
FROM ordenes
WHERE total_compra > 1000.00

--Comparación de ventas promedio antes y después de una fecha específica

SELECT DISTINCT(
SELECT AVG(total_compra) AS promedio_ventas 
FROM ordenes
WHERE fecha_orden_tomada < '2023/07/01') AS ventas_antes_de_julio,

(SELECT AVG(total_compra) AS promedio_ventas
FROM ordenes
WHERE fecha_orden_tomada > '2023/07/01' ) AS ventas_despues_de_julio


--Análisis de actividad de ventas por horario

SELECT horario_venta,COUNT(id) AS cantidad_compras, AVG(total_compra) AS promedio,MAX(total_compra) as venta_maxima
FROM ordenes
GROUP BY horario_venta


SELECT *
FROM ordenes

