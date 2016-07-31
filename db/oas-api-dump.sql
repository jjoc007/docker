--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

-- Started on 2016-07-26 03:05:47 COT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16421)
-- Name: gestion_parametros; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA gestion_parametros;


ALTER SCHEMA gestion_parametros OWNER TO postgres;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA gestion_parametros; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA gestion_parametros IS 'gestion_parametros_titan';


--
-- TOC entry 1 (class 3079 OID 12435)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 16459)
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cargo (
    id_cargo integer NOT NULL,
    descripcion character varying(30) NOT NULL,
    porcentaje_pago smallint NOT NULL,
    id_ley smallint NOT NULL,
    id_ley_ley integer,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE cargo OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16457)
-- Name: cargo_id_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cargo_id_cargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargo_id_cargo_seq OWNER TO postgres;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 190
-- Name: cargo_id_cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cargo_id_cargo_seq OWNED BY cargo.id_cargo;


--
-- TOC entry 197 (class 1259 OID 16506)
-- Name: cdp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cdp (
    id_cdp integer NOT NULL,
    codigo character varying(50) NOT NULL,
    id_rubro_rubro integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE cdp OWNER TO postgres;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN cdp.id_rubro_rubro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cdp.id_rubro_rubro IS 'codigo rubro';


--
-- TOC entry 196 (class 1259 OID 16504)
-- Name: cdp_id_cdp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cdp_id_cdp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cdp_id_cdp_seq OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 196
-- Name: cdp_id_cdp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cdp_id_cdp_seq OWNED BY cdp.id_cdp;


--
-- TOC entry 209 (class 1259 OID 16581)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudad (
    id_ciudad integer NOT NULL,
    nombre character varying NOT NULL,
    id_departamento integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL,
    cod_divipola character varying(10) NOT NULL
);


ALTER TABLE ciudad OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16579)
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_id_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudad_id_ciudad_seq OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 208
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_id_ciudad_seq OWNED BY ciudad.id_ciudad;


--
-- TOC entry 207 (class 1259 OID 16570)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departamento (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL,
    cod_divipola character varying NOT NULL
);


ALTER TABLE departamento OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16568)
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departamento_id_seq OWNER TO postgres;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 206
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departamento_id_seq OWNED BY departamento.id;


--
-- TOC entry 199 (class 1259 OID 16526)
-- Name: descuentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE descuentos (
    id_descuento integer NOT NULL,
    tipo character varying(25) NOT NULL,
    codigo numeric(10,0) NOT NULL,
    valor money NOT NULL,
    id_entidad_entidad integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion smallint NOT NULL
);


ALTER TABLE descuentos OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16524)
-- Name: descuentos_id_descuento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE descuentos_id_descuento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE descuentos_id_descuento_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 198
-- Name: descuentos_id_descuento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE descuentos_id_descuento_seq OWNED BY descuentos.id_descuento;


--
-- TOC entry 203 (class 1259 OID 16542)
-- Name: entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entidad (
    id_entidad integer NOT NULL,
    nit character varying(10),
    nombre character varying(30) NOT NULL,
    id_tipo_enti_tipo_entidad integer NOT NULL,
    id_estado_estado integer NOT NULL,
    id_ciudad_ciudad integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion smallint NOT NULL
);


ALTER TABLE entidad OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16540)
-- Name: entidad_id_entidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entidad_id_entidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entidad_id_entidad_seq OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 202
-- Name: entidad_id_entidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entidad_id_entidad_seq OWNED BY entidad.id_entidad;


--
-- TOC entry 189 (class 1259 OID 16451)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id_estado integer NOT NULL,
    descripcion character varying(15)
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16449)
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_estado_seq OWNER TO postgres;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 188
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;


--
-- TOC entry 187 (class 1259 OID 16443)
-- Name: facultad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE facultad (
    cod_facultad integer NOT NULL,
    nombre character varying(30) NOT NULL,
    direccion character varying(30) NOT NULL,
    telefono numeric(10,0) NOT NULL,
    fax numeric(4,0),
    email character varying(30),
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE facultad OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN facultad.cod_facultad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN facultad.cod_facultad IS 'codigo facultad';


--
-- TOC entry 186 (class 1259 OID 16441)
-- Name: facultad_cod_facultad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE facultad_cod_facultad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facultad_cod_facultad_seq OWNER TO postgres;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 186
-- Name: facultad_cod_facultad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE facultad_cod_facultad_seq OWNED BY facultad.cod_facultad;


--
-- TOC entry 201 (class 1259 OID 16534)
-- Name: info_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE info_entidad (
    id_info integer NOT NULL,
    direccion character varying(30),
    telefono numeric(10,0) NOT NULL,
    ext_telefono numeric(5,0),
    fax numeric(10,0),
    ext_fax numeric(4,0),
    email character varying(30),
    id_entidad_entidad integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE info_entidad OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16532)
-- Name: info_entidad_id_info_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE info_entidad_id_info_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE info_entidad_id_info_seq OWNER TO postgres;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 200
-- Name: info_entidad_id_info_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE info_entidad_id_info_seq OWNED BY info_entidad.id_info;


--
-- TOC entry 193 (class 1259 OID 16477)
-- Name: ley; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ley (
    id_ley integer NOT NULL,
    nombre character varying(30),
    descripcion text,
    fecha_expedicion date NOT NULL,
    fecha_vencimiento date,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE ley OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16475)
-- Name: ley_id_ley_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ley_id_ley_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ley_id_ley_seq OWNER TO postgres;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 192
-- Name: ley_id_ley_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ley_id_ley_seq OWNED BY ley.id_ley;


--
-- TOC entry 183 (class 1259 OID 16424)
-- Name: proyecto_curricular; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proyecto_curricular (
    cod_proy_curricular integer NOT NULL,
    nombre character varying(30) NOT NULL,
    cuenta_bruto character varying(15) NOT NULL,
    cod_concepto character varying NOT NULL,
    id_estado_estado integer NOT NULL,
    cod_facultad_facultad integer NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL,
    cod_snies character varying(10) NOT NULL
);


ALTER TABLE proyecto_curricular OWNER TO postgres;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 183
-- Name: COLUMN proyecto_curricular.cod_facultad_facultad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN proyecto_curricular.cod_facultad_facultad IS 'codigo facultad';


--
-- TOC entry 182 (class 1259 OID 16422)
-- Name: proyecto_curricular_cod_proy_curricular_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_curricular_cod_proy_curricular_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proyecto_curricular_cod_proy_curricular_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 182
-- Name: proyecto_curricular_cod_proy_curricular_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyecto_curricular_cod_proy_curricular_seq OWNED BY proyecto_curricular.cod_proy_curricular;


--
-- TOC entry 195 (class 1259 OID 16493)
-- Name: rp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rp (
    id_rp integer NOT NULL,
    valor numeric(10,0) NOT NULL,
    id_cdp_cdp integer NOT NULL,
    cod_proy_curricular_proyecto_curricular integer NOT NULL,
    "fecha_Creacion" date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE rp OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16491)
-- Name: rp_id_rp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rp_id_rp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rp_id_rp_seq OWNER TO postgres;

--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 194
-- Name: rp_id_rp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rp_id_rp_seq OWNED BY rp.id_rp;


--
-- TOC entry 185 (class 1259 OID 16435)
-- Name: rubro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rubro (
    id_rubro integer NOT NULL,
    codigo character varying(50) NOT NULL,
    cuenta_bruto character varying(15) NOT NULL,
    cuenta_neto character varying(15) NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE rubro OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN rubro.id_rubro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rubro.id_rubro IS 'codigo rubro';


--
-- TOC entry 184 (class 1259 OID 16433)
-- Name: rubro_id_rubro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rubro_id_rubro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rubro_id_rubro_seq OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 184
-- Name: rubro_id_rubro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rubro_id_rubro_seq OWNED BY rubro.id_rubro;


--
-- TOC entry 205 (class 1259 OID 16550)
-- Name: tipo_entidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_entidad (
    id_tipo_enti integer NOT NULL,
    descripcion character varying(15) NOT NULL,
    fecha_creacion date NOT NULL,
    fecha_modificacion date NOT NULL
);


ALTER TABLE tipo_entidad OWNER TO postgres;

--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE tipo_entidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_entidad IS 'tipos de entidades (arl, eps, etc)';


--
-- TOC entry 204 (class 1259 OID 16548)
-- Name: tipo_entidad_id_tipo_enti_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_entidad_id_tipo_enti_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_entidad_id_tipo_enti_seq OWNER TO postgres;

--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_entidad_id_tipo_enti_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_entidad_id_tipo_enti_seq OWNED BY tipo_entidad.id_tipo_enti;


--
-- TOC entry 2146 (class 2604 OID 16462)
-- Name: id_cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargo ALTER COLUMN id_cargo SET DEFAULT nextval('cargo_id_cargo_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 16509)
-- Name: id_cdp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdp ALTER COLUMN id_cdp SET DEFAULT nextval('cdp_id_cdp_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 16584)
-- Name: id_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN id_ciudad SET DEFAULT nextval('ciudad_id_ciudad_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 16573)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamento_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 16529)
-- Name: id_descuento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuentos ALTER COLUMN id_descuento SET DEFAULT nextval('descuentos_id_descuento_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 16545)
-- Name: id_entidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad ALTER COLUMN id_entidad SET DEFAULT nextval('entidad_id_entidad_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 16454)
-- Name: id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 16446)
-- Name: cod_facultad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facultad ALTER COLUMN cod_facultad SET DEFAULT nextval('facultad_cod_facultad_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 16537)
-- Name: id_info; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY info_entidad ALTER COLUMN id_info SET DEFAULT nextval('info_entidad_id_info_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 16480)
-- Name: id_ley; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ley ALTER COLUMN id_ley SET DEFAULT nextval('ley_id_ley_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 16427)
-- Name: cod_proy_curricular; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_curricular ALTER COLUMN cod_proy_curricular SET DEFAULT nextval('proyecto_curricular_cod_proy_curricular_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 16496)
-- Name: id_rp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rp ALTER COLUMN id_rp SET DEFAULT nextval('rp_id_rp_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 16438)
-- Name: id_rubro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rubro ALTER COLUMN id_rubro SET DEFAULT nextval('rubro_id_rubro_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 16553)
-- Name: id_tipo_enti; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_entidad ALTER COLUMN id_tipo_enti SET DEFAULT nextval('tipo_entidad_id_tipo_enti_seq'::regclass);


--
-- TOC entry 2327 (class 0 OID 16459)
-- Dependencies: 191
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cargo (id_cargo, descripcion, porcentaje_pago, id_ley, id_ley_ley, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 190
-- Name: cargo_id_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cargo_id_cargo_seq', 1, false);


--
-- TOC entry 2333 (class 0 OID 16506)
-- Dependencies: 197
-- Data for Name: cdp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cdp (id_cdp, codigo, id_rubro_rubro, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 196
-- Name: cdp_id_cdp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cdp_id_cdp_seq', 1, false);


--
-- TOC entry 2345 (class 0 OID 16581)
-- Dependencies: 209
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id_ciudad, nombre, id_departamento, fecha_creacion, fecha_modificacion, cod_divipola) FROM stdin;
2	prueba ciudad	26	2016-12-12	2016-12-12	1
6	prueba ciudad	28	2016-12-12	2016-12-12	1
\.


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 208
-- Name: ciudad_id_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_id_ciudad_seq', 6, true);


--
-- TOC entry 2343 (class 0 OID 16570)
-- Dependencies: 207
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departamento (id, nombre, fecha_creacion, fecha_modificacion, cod_divipola) FROM stdin;
26	prueba departamento 7 gorm	2016-12-12	2016-12-12	pr
28	prueba departamento 7 gorm	2016-12-12	2016-12-12	pr
\.


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 206
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departamento_id_seq', 28, true);


--
-- TOC entry 2335 (class 0 OID 16526)
-- Dependencies: 199
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY descuentos (id_descuento, tipo, codigo, valor, id_entidad_entidad, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 198
-- Name: descuentos_id_descuento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('descuentos_id_descuento_seq', 1, false);


--
-- TOC entry 2339 (class 0 OID 16542)
-- Dependencies: 203
-- Data for Name: entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY entidad (id_entidad, nit, nombre, id_tipo_enti_tipo_entidad, id_estado_estado, id_ciudad_ciudad, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 202
-- Name: entidad_id_entidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entidad_id_entidad_seq', 1, false);


--
-- TOC entry 2325 (class 0 OID 16451)
-- Dependencies: 189
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado (id_estado, descripcion) FROM stdin;
\.


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 188
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_estado_seq', 1, false);


--
-- TOC entry 2323 (class 0 OID 16443)
-- Dependencies: 187
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facultad (cod_facultad, nombre, direccion, telefono, fax, email, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 186
-- Name: facultad_cod_facultad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('facultad_cod_facultad_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 16534)
-- Dependencies: 201
-- Data for Name: info_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY info_entidad (id_info, direccion, telefono, ext_telefono, fax, ext_fax, email, id_entidad_entidad, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 200
-- Name: info_entidad_id_info_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('info_entidad_id_info_seq', 1, false);


--
-- TOC entry 2329 (class 0 OID 16477)
-- Dependencies: 193
-- Data for Name: ley; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ley (id_ley, nombre, descripcion, fecha_expedicion, fecha_vencimiento, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 192
-- Name: ley_id_ley_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ley_id_ley_seq', 1, false);


--
-- TOC entry 2319 (class 0 OID 16424)
-- Dependencies: 183
-- Data for Name: proyecto_curricular; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto_curricular (cod_proy_curricular, nombre, cuenta_bruto, cod_concepto, id_estado_estado, cod_facultad_facultad, fecha_creacion, fecha_modificacion, cod_snies) FROM stdin;
\.


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 182
-- Name: proyecto_curricular_cod_proy_curricular_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_curricular_cod_proy_curricular_seq', 1, false);


--
-- TOC entry 2331 (class 0 OID 16493)
-- Dependencies: 195
-- Data for Name: rp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rp (id_rp, valor, id_cdp_cdp, cod_proy_curricular_proyecto_curricular, "fecha_Creacion", fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 194
-- Name: rp_id_rp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rp_id_rp_seq', 1, false);


--
-- TOC entry 2321 (class 0 OID 16435)
-- Dependencies: 185
-- Data for Name: rubro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rubro (id_rubro, codigo, cuenta_bruto, cuenta_neto, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 184
-- Name: rubro_id_rubro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rubro_id_rubro_seq', 1, false);


--
-- TOC entry 2341 (class 0 OID 16550)
-- Dependencies: 205
-- Data for Name: tipo_entidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_entidad (id_tipo_enti, descripcion, fecha_creacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_entidad_id_tipo_enti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_entidad_id_tipo_enti_seq', 1, false);


--
-- TOC entry 2171 (class 2606 OID 16523)
-- Name: cdp_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdp
    ADD CONSTRAINT cdp_uq UNIQUE (id_rubro_rubro);


--
-- TOC entry 2161 (class 2606 OID 16448)
-- Name: cod_facultad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facultad
    ADD CONSTRAINT cod_facultad_pk PRIMARY KEY (cod_facultad);


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 2161
-- Name: CONSTRAINT cod_facultad_pk ON facultad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT cod_facultad_pk ON facultad IS 'codigo de la facultad pk';


--
-- TOC entry 2157 (class 2606 OID 16432)
-- Name: cod_proyecto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_curricular
    ADD CONSTRAINT cod_proyecto_pk PRIMARY KEY (cod_proy_curricular);


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 2157
-- Name: CONSTRAINT cod_proyecto_pk ON proyecto_curricular; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT cod_proyecto_pk ON proyecto_curricular IS 'codigo del proyecto curricular';


--
-- TOC entry 2181 (class 2606 OID 16567)
-- Name: entidad_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_uq UNIQUE (id_estado_estado);


--
-- TOC entry 2183 (class 2606 OID 16608)
-- Name: entidad_uq1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT entidad_uq1 UNIQUE (id_ciudad_ciudad);


--
-- TOC entry 2165 (class 2606 OID 16464)
-- Name: id_cargo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT id_cargo_pk PRIMARY KEY (id_cargo);


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 2165
-- Name: CONSTRAINT id_cargo_pk ON cargo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_cargo_pk ON cargo IS 'id cargo pk';


--
-- TOC entry 2173 (class 2606 OID 16511)
-- Name: id_cdp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdp
    ADD CONSTRAINT id_cdp_pk PRIMARY KEY (id_cdp);


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 2173
-- Name: CONSTRAINT id_cdp_pk ON cdp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_cdp_pk ON cdp IS 'id ';


--
-- TOC entry 2191 (class 2606 OID 16589)
-- Name: id_ciudad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT id_ciudad_pk PRIMARY KEY (id_ciudad);


--
-- TOC entry 2177 (class 2606 OID 16539)
-- Name: id_dato_contacto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY info_entidad
    ADD CONSTRAINT id_dato_contacto PRIMARY KEY (id_info);


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 2177
-- Name: CONSTRAINT id_dato_contacto ON info_entidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_dato_contacto ON info_entidad IS 'id del dato para el contacto';


--
-- TOC entry 2189 (class 2606 OID 16578)
-- Name: id_departamento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT id_departamento_pk PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 16531)
-- Name: id_descuento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuentos
    ADD CONSTRAINT id_descuento_pk PRIMARY KEY (id_descuento);


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 2175
-- Name: CONSTRAINT id_descuento_pk ON descuentos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_descuento_pk ON descuentos IS 'id del descuento';


--
-- TOC entry 2185 (class 2606 OID 16547)
-- Name: id_entidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT id_entidad PRIMARY KEY (id_entidad);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 2185
-- Name: CONSTRAINT id_entidad ON entidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_entidad ON entidad IS 'id de la entidad';


--
-- TOC entry 2163 (class 2606 OID 16456)
-- Name: id_estado_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT id_estado_pk PRIMARY KEY (id_estado);


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 2163
-- Name: CONSTRAINT id_estado_pk ON estado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_estado_pk ON estado IS 'codigo del estado';


--
-- TOC entry 2167 (class 2606 OID 16485)
-- Name: id_ley_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ley
    ADD CONSTRAINT id_ley_pk PRIMARY KEY (id_ley);


--
-- TOC entry 2159 (class 2606 OID 16440)
-- Name: id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rubro
    ADD CONSTRAINT id_pk PRIMARY KEY (id_rubro);


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 2159
-- Name: CONSTRAINT id_pk ON rubro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_pk ON rubro IS 'id del rubro pk';


--
-- TOC entry 2169 (class 2606 OID 16498)
-- Name: id_rp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rp
    ADD CONSTRAINT id_rp_pk PRIMARY KEY (id_rp);


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 2169
-- Name: CONSTRAINT id_rp_pk ON rp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_rp_pk ON rp IS 'id del robruro presupuestal';


--
-- TOC entry 2187 (class 2606 OID 16555)
-- Name: id_tipo_entidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_entidad
    ADD CONSTRAINT id_tipo_entidad PRIMARY KEY (id_tipo_enti);


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 2187
-- Name: CONSTRAINT id_tipo_entidad ON tipo_entidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT id_tipo_entidad ON tipo_entidad IS 'id del tipo de entidad';


--
-- TOC entry 2179 (class 2606 OID 16601)
-- Name: info_entidad_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY info_entidad
    ADD CONSTRAINT info_entidad_uq UNIQUE (id_entidad_entidad);


--
-- TOC entry 2196 (class 2606 OID 16512)
-- Name: cdp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rp
    ADD CONSTRAINT cdp_fk FOREIGN KEY (id_cdp_cdp) REFERENCES cdp(id_cdp) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2202 (class 2606 OID 16602)
-- Name: ciudad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT ciudad_fk FOREIGN KEY (id_ciudad_ciudad) REFERENCES ciudad(id_ciudad) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2203 (class 2606 OID 16590)
-- Name: departamento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento) REFERENCES departamento(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2199 (class 2606 OID 16595)
-- Name: entidad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY info_entidad
    ADD CONSTRAINT entidad_fk FOREIGN KEY (id_entidad_entidad) REFERENCES entidad(id_entidad) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2198 (class 2606 OID 16609)
-- Name: entidad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuentos
    ADD CONSTRAINT entidad_fk FOREIGN KEY (id_entidad_entidad) REFERENCES entidad(id_entidad) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2192 (class 2606 OID 16465)
-- Name: estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_curricular
    ADD CONSTRAINT estado_fk FOREIGN KEY (id_estado_estado) REFERENCES estado(id_estado) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2201 (class 2606 OID 16561)
-- Name: estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT estado_fk FOREIGN KEY (id_estado_estado) REFERENCES estado(id_estado) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2193 (class 2606 OID 16470)
-- Name: facultad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto_curricular
    ADD CONSTRAINT facultad_fk FOREIGN KEY (cod_facultad_facultad) REFERENCES facultad(cod_facultad) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2194 (class 2606 OID 16486)
-- Name: ley_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT ley_fk FOREIGN KEY (id_ley_ley) REFERENCES ley(id_ley) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2195 (class 2606 OID 16499)
-- Name: proyecto_curricular_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rp
    ADD CONSTRAINT proyecto_curricular_fk FOREIGN KEY (cod_proy_curricular_proyecto_curricular) REFERENCES proyecto_curricular(cod_proy_curricular) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2197 (class 2606 OID 16517)
-- Name: rubro_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cdp
    ADD CONSTRAINT rubro_fk FOREIGN KEY (id_rubro_rubro) REFERENCES rubro(id_rubro) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2200 (class 2606 OID 16556)
-- Name: tipo_entidad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad
    ADD CONSTRAINT tipo_entidad_fk FOREIGN KEY (id_tipo_enti_tipo_entidad) REFERENCES tipo_entidad(id_tipo_enti) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-26 03:05:53 COT

--
-- PostgreSQL database dump complete
--

