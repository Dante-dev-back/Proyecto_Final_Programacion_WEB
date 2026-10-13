# Mrs. Green Spoon

Plataforma web de rescate y pedido de alimentos, desarrollada como proyecto académico en equipo (curso de Programación Web, UTP).

## Tecnologías

HTML, CSS, JavaScript, Node.js, MySQL, PostgreSQL

## Mi participación

- Desarrollé la página de pedidos (HTML, CSS responsive y JavaScript).
- Consumí la API REST con `fetch` (async/await) para listar los pedidos del usuario en una tabla dinámica, con estados visuales y actualización automática cada 30 segundos.
- Implementé la cancelación de pedidos con modal de confirmación, validación de sesión y de estado, y manejo de errores.
- Diseñé el modelo de datos relacional inicial en MySQL (6 tablas: usuarios, categorías, productos, pedidos, detalle de pedidos y ofertas) con claves foráneas y datos de prueba. Posteriormente, el equipo lo migró a PostgreSQL.

## Repositorio del equipo

https://github.com/DiegoVCH01/Proyecto_Final_Programacion_WEB

## Cómo ejecutar

1. Crear la base `mrs_green_spoon` en PostgreSQL.
2. Ejecutar `database/mrs_green_spoon_pg.sql`.
3. Copiar `.env.example` a `.env` y completar la clave.
4. `npm install` y luego `node server.js`.
