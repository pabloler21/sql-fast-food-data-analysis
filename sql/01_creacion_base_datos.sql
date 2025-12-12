CREATE TABLE sucursal(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) NOT NULL, direccion VARCHAR(256) UNIQUE)

CREATE TABLE cliente(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) NOT NULL, direccion VARCHAR(256) NOT NULL)

CREATE TABLE tipo_de_pago(id INT IDENTITY(1,1) PRIMARY KEY, descripcion VARCHAR(256) UNIQUE)

CREATE TABLE categoria(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) UNIQUE)

CREATE TABLE mensajero(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) NOT NULL, es_externo BIT NOT NULL)

CREATE TABLE origen_order(id INT IDENTITY(1,1) PRIMARY KEY, descripcion VARCHAR(256) UNIQUE)

CREATE TABLE prodcuto(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) NOT NULL, direccion VARCHAR(256) NOT NULL)

CREATE TABLE empleado(id INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50) NOT NULL, posicion VARCHAR(256) NOT NULL, departamento VARCHAR(256) NOT NULL, sucursal_id INT, CONSTRAINT FK_empleado_sucursal FOREIGN KEY(sucursal_id) REFERENCES sucursal(id) ON DELETE NO ACTION ON UPDATE NO ACTION)

USE fast_food_db

ALTER TABLE producto add categoria_id INT, CONSTRAINT FK_producto_categoria FOREIGN KEY(categoria_id) REFERENCES categoria(id)

USE fast_food_db
GO
SELECT * FROM producto

CREATE TABLE order_product 


CREATE TABLE ordenes
(
    id                  INT IDENTITY(1,1) PRIMARY KEY,
    horario_venta       VARCHAR(50),
    total_compra        FLOAT,
    kilometros_recorrer FLOAT,
    fecha_despacho      DATETIME,
    fecha_entrega       DATETIME,
    fecha_orden_tomada  DATETIME,
    fecha_orden_lista   DATETIME,

    empleado_id         INT,
    cliente_id          INT,
    sucursal_id         INT,
    mensajero_id        INT,
    tipo_de_pago_id     INT,
    origen_order_id     INT,

    CONSTRAINT FK_orden_empleado
        FOREIGN KEY (empleado_id)     REFERENCES empleado(id),

    CONSTRAINT FK_orden_cliente
        FOREIGN KEY (cliente_id)      REFERENCES cliente(id),

    CONSTRAINT FK_orden_sucursal
        FOREIGN KEY (sucursal_id)     REFERENCES sucursal(id),

    CONSTRAINT FK_orden_mensajero
        FOREIGN KEY (mensajero_id)    REFERENCES mensajero(id),

    CONSTRAINT FK_orden_tipo_pago
        FOREIGN KEY (tipo_de_pago_id) REFERENCES tipo_de_pago(id),

    CONSTRAINT FK_orden_origen_order
        FOREIGN KEY (origen_order_id) REFERENCES origen_order(id)
);


CREATE TABLE orden_producto
(
    orden_id     INT  NOT NULL,
    producto_id  INT  NOT NULL,
    cantidad     INT,
    precio       FLOAT,
    
    CONSTRAINT PK_orden_producto
        PRIMARY KEY (orden_id, producto_id),

    CONSTRAINT FK_orden_producto_orden
        FOREIGN KEY (orden_id)
        REFERENCES dbo.ordenes(id),

    CONSTRAINT FK_orden_producto_producto
        FOREIGN KEY (producto_id)
        REFERENCES dbo.producto(id)
    )

SELECT * FROM orden_producto