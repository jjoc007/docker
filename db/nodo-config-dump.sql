--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-26 03:06:58 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12435)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 562 (class 1247 OID 16919)
-- Name: migrations_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE migrations_status AS ENUM (
    'update',
    'rollback'
);


ALTER TYPE migrations_status OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16876)
-- Name: aplicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE aplicacion (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion text,
    dominio character varying(200),
    ip character varying(15),
    password character varying(255)
);


ALTER TABLE aplicacion OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16874)
-- Name: aplicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aplicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aplicacion_id_seq OWNER TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 181
-- Name: aplicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aplicacion_id_seq OWNED BY aplicacion.id;


--
-- TOC entry 186 (class 1259 OID 16925)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations (
    id_migration integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    statements text,
    rollback_statements text,
    status migrations_status
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16923)
-- Name: migrations_id_migration_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE migrations_id_migration_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_migration_seq OWNER TO postgres;

--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_migration_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE migrations_id_migration_seq OWNED BY migrations.id_migration;


--
-- TOC entry 184 (class 1259 OID 16887)
-- Name: parametro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE parametro (
    id integer NOT NULL,
    id_aplicacion bigint,
    nombre character varying(200),
    valor text
);


ALTER TABLE parametro OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16885)
-- Name: parametro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parametro_id_seq OWNER TO postgres;

--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 183
-- Name: parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametro_id_seq OWNED BY parametro.id;


--
-- TOC entry 2077 (class 2604 OID 16879)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aplicacion ALTER COLUMN id SET DEFAULT nextval('aplicacion_id_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 16928)
-- Name: id_migration; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations ALTER COLUMN id_migration SET DEFAULT nextval('migrations_id_migration_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16890)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametro ALTER COLUMN id SET DEFAULT nextval('parametro_id_seq'::regclass);


--
-- TOC entry 2204 (class 0 OID 16876)
-- Dependencies: 182
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aplicacion (id, nombre, descripcion, dominio, ip, password) FROM stdin;
0	prueba 2	prueba 2	www.google.com	10.10.10.10	\N
1	prueba 3	prueba 3	www	10.10.10.10	\N
3	prueba 3	prueba 3	www.google.com	10.10.10.10	\N
4	prueba 4	prueba 4	www.google.com	10.10.10.10	\N
5	prueba 4	prueba 4	www.google.com	10.10.10.10	\N
6	prueba 4	prueba 4	www.google.com	10.10.10.10	\N
7	prueba 4	prueba 4	www.google.com	10.10.10.10	prueba
8	prueba 4	prueba 4	www.google.com	10.10.10.10	prueba
9	prueba 4	prueba 4	www.google.com	10.10.10.10	[45 249 93 35 208 3 255 238 113 148 105 29 121 6 227 155 108 86 131 25 116 112 24 56 175 22 24 119 224 37 85 213]
10	prueba 4	prueba 4	www.google.com	10.10.10.10	[101 94 120 102 116 217 211 231 123 192 94 209 222 55 180 182 188 137 247 136 130 159 159 60 103 158 118 135 180 16 200 155]
11	prueba 4	prueba 4	www.google.com	10.10.10.10	[101 94 120 102 116 217 211 231 123 192 94 209 222 55 180 182 188 137 247 136 130 159 159 60 103 158 118 135 180 16 200 155]
\.


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 181
-- Name: aplicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aplicacion_id_seq', 1, true);


--
-- TOC entry 2208 (class 0 OID 16925)
-- Dependencies: 186
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migrations (id_migration, name, created_at, statements, rollback_statements, status) FROM stdin;
\.


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 185
-- Name: migrations_id_migration_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_migration_seq', 1, false);


--
-- TOC entry 2206 (class 0 OID 16887)
-- Dependencies: 184
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametro (id, id_aplicacion, nombre, valor) FROM stdin;
1	10	HOST_DB	localhost
2	10	USER_DB	postgres
3	10	PORT_DB	5432
4	10	NAME_DB	OAS-API
5	10	PASSWORD_DB	123456
\.


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 183
-- Name: parametro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('parametro_id_seq', 1, false);


--
-- TOC entry 2083 (class 2606 OID 16884)
-- Name: aplicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aplicacion
    ADD CONSTRAINT aplicacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 16935)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id_migration);


--
-- TOC entry 2085 (class 2606 OID 16892)
-- Name: parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametro_pkey PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 16893)
-- Name: parametro_id_aplicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametro_id_aplicacion_fkey FOREIGN KEY (id_aplicacion) REFERENCES aplicacion(id);


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-26 03:07:01 COT

--
-- PostgreSQL database dump complete
--

