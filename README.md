# SQL Fast Food Data Analysis 🍔📊

Proyecto de análisis de datos con SQL enfocado en el diseño de una base de datos relacional y en la ejecución de consultas analíticas para un sistema de pedidos de fast food.

Proyecto realizado como parte del **Módulo 2 (SQL)** de la carrera **Data Analytics – Soy Henry**.

---

## 🎯 Objetivo del proyecto

Diseñar e implementar una base de datos relacional centralizada que permita:

- Consolidar información previamente dispersa
- Garantizar integridad y consistencia de los datos
- Facilitar el análisis de ventas, clientes, productos y logística
- Responder preguntas de negocio mediante consultas SQL

---

## 🛠️ Tecnologías utilizadas

- **SQL**
- Modelado de bases de datos relacionales
- Consultas con:
  - JOINs
  - Funciones de agregación (SUM, AVG, MIN, MAX)
  - Agrupaciones y filtros

---

## 🗂️ Estructura del repositorio

sql-fast-food-data-analysis
├── README.md
│
├── assets
│ └── modelo-relacional.png
│
├── sql
│ ├── 01_creacion_base_datos.sql
│ ├── 02_poblacion_tablas.sql
│ ├── 03_consultas_agregacion.sql
│ └── 04_consultas_joins.sql
│
└── docs
└── informe_PI.docx


## 🗺️ Modelo de datos

El modelo relacional está diseñado alrededor de la tabla central **`ordenes`**, que representa el hecho principal del negocio.

Se incluyen entidades como:
- Clientes
- Productos y categorías
- Sucursales
- Empleados
- Mensajeros
- Tipos de pago
- Origen del pedido

La relación muchos a muchos entre órdenes y productos se resuelve mediante la tabla intermedia **`orden_producto`**.

El esquema se encuentra normalizado hasta la **Tercera Forma Normal (3FN)**, garantizando integridad referencial y escalabilidad.

---

## 🔍 Análisis realizado

A través de consultas SQL se analizaron, entre otros aspectos:

- Ventas totales y promedio
- Distribución de productos por categoría
- Rendimiento de sucursales
- Comportamiento de clientes
- Análisis por horario y período
- Tipos de pago utilizados
- Distancias y logística de entrega

Los resultados completos y el análisis detallado se encuentran documentados en el informe del proyecto.

---

## 📈 Principales insights

- Alta concentración de productos en una única categoría
- Riesgo operativo por baja dotación de empleados en la mayoría de los departamentos
- Sucursales cercanas concentran tickets promedio más altos
- El canal Drive Thru registra los pedidos de mayor valor
- La franja horaria de la tarde presenta el mejor promedio de ventas

---

## 📎 Documentación

- 📄 **Informe completo del proyecto**: `docs/informe_PI.docx`
- 🖼️ **Modelo entidad-relación**: `assets/modelo-relacional.png`

---

## 👤 Autor

**Pablo Lerner**  
Analista de Datos  
Formación: Soy Henry – Data Analytics  

---

## 🚀 Próximos pasos

- Escalar el modelo con mayor volumen de datos
- Incorporar métricas de rentabilidad
- Integrar el análisis con herramientas de visualización
