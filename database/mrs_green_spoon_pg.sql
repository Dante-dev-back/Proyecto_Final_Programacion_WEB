--
-- PostgreSQL database dump
--

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-10-12 17:42:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16407)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion character varying(200)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16406)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categorias ALTER COLUMN id_categoria ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categorias_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16454)
-- Name: detalle_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedido (
    id_detalle integer NOT NULL,
    id_pedido integer NOT NULL,
    id_producto integer,
    nombre_producto character varying(100) NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL
);


ALTER TABLE public.detalle_pedido OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16453)
-- Name: detalle_pedido_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.detalle_pedido ALTER COLUMN id_detalle ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.detalle_pedido_id_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16476)
-- Name: ofertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ofertas (
    id_oferta integer NOT NULL,
    id_producto integer NOT NULL,
    precio_oferta numeric(10,2) NOT NULL,
    descripcion character varying(255),
    fecha_inicio date,
    fecha_fin date,
    activa boolean DEFAULT true
);


ALTER TABLE public.ofertas OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16475)
-- Name: ofertas_id_oferta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ofertas ALTER COLUMN id_oferta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ofertas_id_oferta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16435)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_usuario integer,
    cliente_nombre character varying(100),
    cliente_correo character varying(100),
    cliente_telefono character varying(20),
    direccion character varying(200),
    metodo_pago character varying(50),
    total numeric(10,2) DEFAULT 0 NOT NULL,
    estado character varying(30) DEFAULT 'Pendiente'::character varying NOT NULL,
    fecha_pedido timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16434)
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pedidos ALTER COLUMN id_pedido ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pedidos_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16417)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    id_categoria integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    precio numeric(10,2) NOT NULL,
    imagen character varying(150),
    disponible boolean DEFAULT true,
    stock integer DEFAULT 10 NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16416)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.productos ALTER COLUMN id_producto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.productos_id_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    estado character varying(20) DEFAULT 'Activo'::character varying NOT NULL,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_estado_usuario CHECK (((estado)::text = ANY ((ARRAY['Activo'::character varying, 'Inhabilitado'::character varying, 'Pendiente'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5062 (class 0 OID 16407)
-- Dependencies: 222
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, nombre, descripcion) FROM stdin;
1	Bowls y ensaladas	Opciones frescas y saludables
2	Platos principales	Platos fuertes del menú
3	Piqueos y snacks	Opciones ligeras para compartir
4	Bebidas naturales	Bebidas frescas y saludables
\.


--
-- TOC entry 5068 (class 0 OID 16454)
-- Dependencies: 228
-- Data for Name: detalle_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_pedido (id_detalle, id_pedido, id_producto, nombre_producto, cantidad, precio_unitario, subtotal) FROM stdin;
1	1	1	Bowl Renacer Verde	3	15.00	45.00
2	1	5	Hamburguesa Raíz Urbana	1	12.00	12.00
3	2	1	Bowl Renacer Verde	2	15.00	30.00
4	2	3	Wrap Circular	3	14.00	42.00
5	2	5	Hamburguesa Raíz Urbana	3	12.00	36.00
6	3	2	Ensalada Bosque Urbano	3	13.00	39.00
7	3	3	Wrap Circular	2	14.00	28.00
8	4	2	Ensalada Bosque Urbano	1	13.00	13.00
9	4	1	Bowl Renacer Verde	1	15.00	15.00
10	4	5	Hamburguesa Raíz Urbana	1	12.00	12.00
11	4	4	Pizza Huella Cero	1	10.00	10.00
12	5	2	Ensalada Bosque Urbano	1	13.00	13.00
13	5	1	Bowl Renacer Verde	1	15.00	15.00
14	6	2	Ensalada Bosque Urbano	1	13.00	13.00
15	6	1	Bowl Renacer Verde	1	15.00	15.00
16	7	2	Ensalada Bosque Urbano	1	13.00	13.00
17	7	1	Bowl Renacer Verde	1	15.00	15.00
18	8	1	Bowl Renacer Verde	1	15.00	15.00
19	8	2	Ensalada Bosque Urbano	1	13.00	13.00
20	9	1	Bowl Renacer Verde	1	15.00	15.00
21	9	2	Ensalada Bosque Urbano	1	13.00	13.00
22	10	5	Hamburguesa Raíz Urbana	1	12.00	12.00
23	11	2	Ensalada Bosque Urbano	1	13.00	13.00
24	12	3	Wrap Circular	1	14.00	14.00
25	13	2	Ensalada Bosque Urbano	1	13.00	13.00
\.


--
-- TOC entry 5070 (class 0 OID 16476)
-- Dependencies: 230
-- Data for Name: ofertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ofertas (id_oferta, id_producto, precio_oferta, descripcion, fecha_inicio, fecha_fin, activa) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 16435)
-- Dependencies: 226
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id_pedido, id_usuario, cliente_nombre, cliente_correo, cliente_telefono, direccion, metodo_pago, total, estado, fecha_pedido) FROM stdin;
2	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	online	108.00	Cancelado	2026-07-04 13:50:14.551152
8	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	yape	28.00	Cancelado	2026-07-08 22:57:23.716558
10	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	12.00	Cancelado	2026-07-08 22:59:25.916742
6	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	28.00	Cancelado	2026-07-08 22:53:25.621759
1	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	57.00	Entregado	2026-07-01 22:09:34.862448
3	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	yape	67.00	Entregado	2026-07-08 22:20:02.519219
4	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	yape	50.00	Entregado	2026-07-08 22:24:45.418031
5	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	28.00	Entregado	2026-07-08 22:29:42.08624
7	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	28.00	Entregado	2026-07-08 22:55:21.648432
9	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	28.00	Cancelado	2026-07-08 22:58:24.327058
12	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	14.00	Entregado	2026-07-09 05:46:30.575151
11	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	13.00	Entregado	2026-07-08 23:49:10.439352
13	1	Daniel Peralta Peralta Escurra	danyutp@gmail.com	954545464	Avenida las Palmeras 236	efectivo	13.00	Cancelado	2026-07-09 05:56:20.047901
\.


--
-- TOC entry 5064 (class 0 OID 16417)
-- Dependencies: 224
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, id_categoria, nombre, descripcion, precio, imagen, disponible, stock) FROM stdin;
7	3	Papas Crocantes	Papas horneadas acompañadas de salsa casera.	8.00	img/papas.jpg	t	10
8	3	Nuggets Verdes	Nuggets artesanales preparados con vegetales mixtos.	9.00	img/nuggets.jpg	t	10
9	3	Tacos Naturales	Tacos rellenos con vegetales frescos y pollo.	11.00	img/tacos.jpg	t	10
10	4	Jugo Natural Fresh	Bebida preparada con frutas frescas de temporada.	6.00	img/jugo.jpg	t	10
12	4	Batido Tropical	Batido natural de mango, plátano y avena.	7.00	img/batido.jpg	t	10
11	4	Limonada Verde	Refrescante limonada artesanal con hierbabuena.	5.00	img/limonada.jpg	t	20
6	2	Pasta EcoFresh	Pasta cremosa preparada con ingredientes reutilizados.	16.00	img/pasta.jpg	t	0
13	4	Agua Frutada Natural	Agua fresca con frutas de temporada.	4.50	img/agua-frutada.jpg	t	15
4	2	Pizza Huella Cero	Pizza artesanal con vegetales rostizados y queso fundido.	10.00	img/pizza.jpg	t	1
1	1	Bowl Renacer Verde	Arroz integral con vegetales asados y salsa de hierbas.	15.00	img/bowl.jpg	t	4
5	2	Hamburguesa Raíz Urbana	Hamburguesa de lentejas con vegetales frescos.	12.00	img/hamburguesa.jpg	t	8
3	1	Wrap Circular	Tortilla artesanal rellena con vegetales y pollo.	14.00	img/wrap.jpg	t	7
2	1	Ensalada Bosque Urbano	Mezcla fresca de verduras, queso y aderezo natural.	13.00	img/ensalada.jpg	t	3
\.


--
-- TOC entry 5060 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, correo, password, estado, fecha_registro, fecha_actualizacion) FROM stdin;
1	Daniel Peralta	danyutp@gmail.com	$2b$10$.Lt53px8u1zbfQZ9tAzwUuLJuqsUaWDgDbQDWZzFab40G/KcqbE3C	Activo	2026-07-01 22:06:52.473823	2026-07-01 22:06:52.473823
\.


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 221
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 4, true);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 227
-- Name: detalle_pedido_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pedido_id_detalle_seq', 25, true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 229
-- Name: ofertas_id_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ofertas_id_oferta_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 225
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 13, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 13, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, true);


--
-- TOC entry 4896 (class 2606 OID 16415)
-- Name: categorias categorias_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_key UNIQUE (nombre);


--
-- TOC entry 4898 (class 2606 OID 16413)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4904 (class 2606 OID 16464)
-- Name: detalle_pedido detalle_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 4906 (class 2606 OID 16484)
-- Name: ofertas ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_pkey PRIMARY KEY (id_oferta);


--
-- TOC entry 4902 (class 2606 OID 16447)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4900 (class 2606 OID 16428)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4892 (class 2606 OID 16405)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4894 (class 2606 OID 16403)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4909 (class 2606 OID 16465)
-- Name: detalle_pedido detalle_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido);


--
-- TOC entry 4910 (class 2606 OID 16470)
-- Name: detalle_pedido detalle_pedido_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4911 (class 2606 OID 16485)
-- Name: ofertas ofertas_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4908 (class 2606 OID 16448)
-- Name: pedidos pedidos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4907 (class 2606 OID 16429)
-- Name: productos productos_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


-- Completed on 2026-10-12 17:42:53

--
-- PostgreSQL database dump complete
--

\unrestrict IkHng1dSdDc3RX3bJJykK8jfMweZdy9GCp4vybQPKDqkKE2jfgVld5sufnZpbcr

