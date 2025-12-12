--Listar todos los productos y sus categorías

SELECT DISTINCT p.nombre as comida, c.nombre as categoria
FROM producto as p
LEFT JOIN categoria as c
ON p.categoria_id = c.id

--Obtener empleados y su sucursal asignada

SELECT * 
FROM sucursal
SELECT * 
FROM empleado

SELECT e.nombre as empleado, s.nombre as sucursal 
FROM empleado as e
LEFT JOIN sucursal as s
ON e.sucursal_id = s.id


--Identificar productos sin categoría asignada

SELECT * 
FROM producto
SELECT * 
FROM sucursal

SELECT  p.nombre as comida, c.nombre as categoria
FROM producto as p
RIGHT JOIN categoria as c
ON p.categoria_id = c.id
WHERE p.categoria_id IS NOT NULL


--Detalle completo de órdenes

SELECT * 
FROM ordenes
SELECT * 
FROM cliente
SELECT * 
FROM mensajero

SELECT 
	o.id,
	o.horario_venta,
	o.total_compra,
	o.kilometros_recorrer,
	o.fecha_despacho,
	o.fecha_entrega,
	o.fecha_orden_tomada,
	o.fecha_orden_lista,
	e.nombre as nombre_empleado,
	c.nombre as nombre_cliente,
	o.sucursal_id,
	m.nombre as nombre_mensajero,
	o.tipo_de_pago_id,
	o.origen_order_id
FROM ordenes as o
INNER JOIN empleado as e
ON o.empleado_id = e.id
INNER JOIN mensajero as m
ON o.mensajero_id = m.id
INNER JOIN cliente as c
ON o.cliente_id = c.id

SELECT *
FROM orden_producto


--Productos vendidos por sucursal

SELECT COUNT(*)
FROM orden_producto

SELECT  
s.nombre AS sucursal,     
c.nombre AS categoria,
SUM(d.Cantidad) AS UnidadesVendidas
FROM Ordenes AS o
INNER JOIN orden_producto AS d 
ON o.id=d.orden_id
LEFT JOIN producto AS p 
ON d.producto_id  = p.id
LEFT JOIN categoria AS c 
ON p.categoria_id = c.id
LEFT JOIN sucursal AS s 
ON o.sucursal_id  = s.id
GROUP BY s.nombre, c.nombre
	

SELECT *
FROM ordenes

--Eficiencia de los mensajeros

SELECT mensajero_id, AVG(DATEDIFF(MINUTE,fecha_despacho,fecha_entrega)) as tiempo_tarda
FROM ordenes
GROUP BY mensajero_id


SELECT * 
FROM ordenes
SELECT *
FROM origen_order

--Análisis de Ventas por Origen de Orden

SELECT TOP 1 o.total_compra,ori.descripcion
FROM ordenes as o
LEFT JOIN origen_order as ori
ON o.origen_order_id = ori.id
ORDER BY o.total_compra DESC

--Productividad de los Empleados

SELECT SUM(total_compra) total_compra,e.nombre
FROM ordenes AS o
LEFT JOIN empleado AS e
ON o.empleado_id = e.id
GROUP BY e.nombre

--Análisis de Demanda por Horario y Día

SELECT o.id,SUM(ori.cantidad) as total_productos, o.horario_venta
FROM ordenes AS o
INNER JOIN orden_producto as ori
ON o.id = ori.orden_id
GROUP BY id, horario_venta


/*
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 1
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 2
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 3
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 4
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 5
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 6
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 7
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 8
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 9
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 10
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 11
UNION
SELECT total_compra, fecha_orden_tomada
FROM ordenes
WHERE MONTH(fecha_orden_tomada) = 12
*/

SELECT * 
FROM ordenes

SELECT *
FROM orden_producto

SELECT *
FROM empleado


--Comparación de Ventas Mensuales

SELECT SUM(total_compra) AS total, MONTH(fecha_orden_tomada) AS periodo_mes
FROM ordenes
GROUP BY MONTH(fecha_orden_tomada)
ORDER BY periodo_mes