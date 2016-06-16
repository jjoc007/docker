-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.7.2
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --

-- Tablespaces creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: sd | type: TABLESPACE --
-- -- DROP TABLESPACE sd;
-- --sd--
-- CREATE TABLESPACE sd
-- 	LOCATION 'a';
-- -- ddl-end --
-- 


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: gestion_parametros | type: DATABASE --
-- -- DROP DATABASE gestion_parametros;
-- CREATE DATABASE gestion_parametros
-- 	ENCODING = 'UTF8'
-- ;
-- -- ddl-end --
-- 

-- object: gestion_parametros | type: SCHEMA --
-- DROP SCHEMA gestion_parametros;
CREATE SCHEMA gestion_parametros;
COMMENT ON SCHEMA gestion_parametros IS 'gestion_parametros_titan';
-- ddl-end --

SET search_path TO pg_catalog,public,gestion_parametros;
-- ddl-end --

-- object: public.proyecto_curricular | type: TABLE --
-- DROP TABLE public.proyecto_curricular;
CREATE TABLE public.proyecto_curricular(
	cod_proy_curricular serial NOT NULL,
	nombre character varying(30) NOT NULL,
	cuenta_bruto character varying(15) NOT NULL,
	cod_concepto character varying NOT NULL,
	id_estado_estado integer NOT NULL,
	cod_facultad_facultad integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	cod_snies character varying(10) NOT NULL,
	CONSTRAINT cod_proyecto_pk PRIMARY KEY (cod_proy_curricular)

);
-- ddl-end --
COMMENT ON COLUMN public.proyecto_curricular.cod_facultad_facultad IS 'codigo facultad';
COMMENT ON CONSTRAINT cod_proyecto_pk ON public.proyecto_curricular IS 'codigo del proyecto curricular';
-- ddl-end --

-- object: public.rubro | type: TABLE --
-- DROP TABLE public.rubro;
CREATE TABLE public.rubro(
	id_rubro serial NOT NULL,
	codigo character varying(50) NOT NULL,
	cuenta_bruto character varying(15) NOT NULL,
	cuenta_neto character varying(15) NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_pk PRIMARY KEY (id_rubro)

);
-- ddl-end --
COMMENT ON COLUMN public.rubro.id_rubro IS 'codigo rubro';
COMMENT ON CONSTRAINT id_pk ON public.rubro IS 'id del rubro pk';
-- ddl-end --

-- object: public.facultad | type: TABLE --
-- DROP TABLE public.facultad;
CREATE TABLE public.facultad(
	cod_facultad serial NOT NULL,
	nombre character varying(30) NOT NULL,
	direccion character varying(30) NOT NULL,
	telefono numeric(10) NOT NULL,
	fax numeric(4),
	email character varying(30),
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT cod_facultad_pk PRIMARY KEY (cod_facultad)

);
-- ddl-end --
COMMENT ON COLUMN public.facultad.cod_facultad IS 'codigo facultad';
COMMENT ON CONSTRAINT cod_facultad_pk ON public.facultad IS 'codigo de la facultad pk';
-- ddl-end --

-- object: public.estado | type: TABLE --
-- DROP TABLE public.estado;
CREATE TABLE public.estado(
	id_estado serial NOT NULL,
	descripcion character varying(15),
	CONSTRAINT id_estado_pk PRIMARY KEY (id_estado)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_estado_pk ON public.estado IS 'codigo del estado';
-- ddl-end --

-- object: public.cargo | type: TABLE --
-- DROP TABLE public.cargo;
CREATE TABLE public.cargo(
	id_cargo serial NOT NULL,
	descripcion character varying(30) NOT NULL,
	porcentaje_pago smallint NOT NULL,
	id_ley smallint NOT NULL,
	id_ley_ley integer,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_cargo_pk PRIMARY KEY (id_cargo)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_cargo_pk ON public.cargo IS 'id cargo pk';
-- ddl-end --

-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE public.proyecto_curricular DROP CONSTRAINT estado_fk;
ALTER TABLE public.proyecto_curricular ADD CONSTRAINT estado_fk FOREIGN KEY (id_estado_estado)
REFERENCES public.estado (id_estado) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: facultad_fk | type: CONSTRAINT --
-- ALTER TABLE public.proyecto_curricular DROP CONSTRAINT facultad_fk;
ALTER TABLE public.proyecto_curricular ADD CONSTRAINT facultad_fk FOREIGN KEY (cod_facultad_facultad)
REFERENCES public.facultad (cod_facultad) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: public.ley | type: TABLE --
-- DROP TABLE public.ley;
CREATE TABLE public.ley(
	id_ley serial NOT NULL,
	nombre character varying(30),
	descripcion text,
	fecha_expedicion date NOT NULL,
	fecha_vencimiento date,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_ley_pk PRIMARY KEY (id_ley)

);
-- ddl-end --
-- object: ley_fk | type: CONSTRAINT --
-- ALTER TABLE public.cargo DROP CONSTRAINT ley_fk;
ALTER TABLE public.cargo ADD CONSTRAINT ley_fk FOREIGN KEY (id_ley_ley)
REFERENCES public.ley (id_ley) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: public.rp | type: TABLE --
-- DROP TABLE public.rp;
CREATE TABLE public.rp(
	id_rp serial NOT NULL,
	valor numeric(10) NOT NULL,
	id_cdp_cdp integer NOT NULL,
	cod_proy_curricular_proyecto_curricular integer NOT NULL,
	"fecha_Creacion" date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_rp_pk PRIMARY KEY (id_rp)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_rp_pk ON public.rp IS 'id del robruro presupuestal';
-- ddl-end --

-- object: proyecto_curricular_fk | type: CONSTRAINT --
-- ALTER TABLE public.rp DROP CONSTRAINT proyecto_curricular_fk;
ALTER TABLE public.rp ADD CONSTRAINT proyecto_curricular_fk FOREIGN KEY (cod_proy_curricular_proyecto_curricular)
REFERENCES public.proyecto_curricular (cod_proy_curricular) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: public.cdp | type: TABLE --
-- DROP TABLE public.cdp;
CREATE TABLE public.cdp(
	id_cdp serial NOT NULL,
	codigo character varying(50) NOT NULL,
	id_rubro_rubro integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_cdp_pk PRIMARY KEY (id_cdp)

);
-- ddl-end --
COMMENT ON COLUMN public.cdp.id_rubro_rubro IS 'codigo rubro';
COMMENT ON CONSTRAINT id_cdp_pk ON public.cdp IS 'id ';
-- ddl-end --

-- object: cdp_fk | type: CONSTRAINT --
-- ALTER TABLE public.rp DROP CONSTRAINT cdp_fk;
ALTER TABLE public.rp ADD CONSTRAINT cdp_fk FOREIGN KEY (id_cdp_cdp)
REFERENCES public.cdp (id_cdp) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: rubro_fk | type: CONSTRAINT --
-- ALTER TABLE public.cdp DROP CONSTRAINT rubro_fk;
ALTER TABLE public.cdp ADD CONSTRAINT rubro_fk FOREIGN KEY (id_rubro_rubro)
REFERENCES public.rubro (id_rubro) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: cdp_uq | type: CONSTRAINT --
-- ALTER TABLE public.cdp DROP CONSTRAINT cdp_uq;
ALTER TABLE public.cdp ADD CONSTRAINT cdp_uq UNIQUE (id_rubro_rubro);
-- ddl-end --


-- object: public.descuentos | type: TABLE --
-- DROP TABLE public.descuentos;
CREATE TABLE public.descuentos(
	id_descuento serial NOT NULL,
	tipo character varying(25) NOT NULL,
	codigo numeric(10) NOT NULL,
	valor money NOT NULL,
	id_entidad_entidad integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion smallint NOT NULL,
	CONSTRAINT id_descuento_pk PRIMARY KEY (id_descuento)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_descuento_pk ON public.descuentos IS 'id del descuento';
-- ddl-end --

-- object: public.info_entidad | type: TABLE --
-- DROP TABLE public.info_entidad;
CREATE TABLE public.info_entidad(
	id_info serial NOT NULL,
	direccion character varying(30),
	telefono numeric(10) NOT NULL,
	ext_telefono numeric(5),
	fax numeric(10),
	ext_fax numeric(4),
	email character varying(30),
	id_entidad_entidad integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_dato_contacto PRIMARY KEY (id_info)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_dato_contacto ON public.info_entidad IS 'id del dato para el contacto';
-- ddl-end --

-- object: public.entidad | type: TABLE --
-- DROP TABLE public.entidad;
CREATE TABLE public.entidad(
	id_entidad serial NOT NULL,
	nit character varying(10),
	nombre character varying(30) NOT NULL,
	id_tipo_enti_tipo_entidad integer NOT NULL,
	id_estado_estado integer NOT NULL,
	id_ciudad_ciudad integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion smallint NOT NULL,
	CONSTRAINT id_entidad PRIMARY KEY (id_entidad)

);
-- ddl-end --
COMMENT ON CONSTRAINT id_entidad ON public.entidad IS 'id de la entidad';
-- ddl-end --

-- object: public.tipo_entidad | type: TABLE --
-- DROP TABLE public.tipo_entidad;
CREATE TABLE public.tipo_entidad(
	id_tipo_enti serial NOT NULL,
	descripcion character varying(15) NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	CONSTRAINT id_tipo_entidad PRIMARY KEY (id_tipo_enti)

);
-- ddl-end --
COMMENT ON TABLE public.tipo_entidad IS 'tipos de entidades (arl, eps, etc)';
COMMENT ON CONSTRAINT id_tipo_entidad ON public.tipo_entidad IS 'id del tipo de entidad';
-- ddl-end --

-- object: tipo_entidad_fk | type: CONSTRAINT --
-- ALTER TABLE public.entidad DROP CONSTRAINT tipo_entidad_fk;
ALTER TABLE public.entidad ADD CONSTRAINT tipo_entidad_fk FOREIGN KEY (id_tipo_enti_tipo_entidad)
REFERENCES public.tipo_entidad (id_tipo_enti) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: estado_fk | type: CONSTRAINT --
-- ALTER TABLE public.entidad DROP CONSTRAINT estado_fk;
ALTER TABLE public.entidad ADD CONSTRAINT estado_fk FOREIGN KEY (id_estado_estado)
REFERENCES public.estado (id_estado) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: entidad_uq | type: CONSTRAINT --
-- ALTER TABLE public.entidad DROP CONSTRAINT entidad_uq;
ALTER TABLE public.entidad ADD CONSTRAINT entidad_uq UNIQUE (id_estado_estado);
-- ddl-end --


-- object: public.departamento | type: TABLE --
-- DROP TABLE public.departamento;
CREATE TABLE public.departamento(
	id serial,
	nombre character varying NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	cod_divipola character varying NOT NULL,
	CONSTRAINT id_departamento_pk PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.ciudad | type: TABLE --
-- DROP TABLE public.ciudad;
CREATE TABLE public.ciudad(
	id_ciudad serial NOT NULL,
	nombre character varying NOT NULL,
	id_departamento integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	cod_divipola character varying(10) NOT NULL,
	CONSTRAINT id_ciudad_pk PRIMARY KEY (id_ciudad)

);
-- ddl-end --
-- object: departamento_fk | type: CONSTRAINT --
-- ALTER TABLE public.ciudad DROP CONSTRAINT departamento_fk;
ALTER TABLE public.ciudad ADD CONSTRAINT departamento_fk FOREIGN KEY (id_departamento)
REFERENCES public.departamento (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: entidad_fk | type: CONSTRAINT --
-- ALTER TABLE public.info_entidad DROP CONSTRAINT entidad_fk;
ALTER TABLE public.info_entidad ADD CONSTRAINT entidad_fk FOREIGN KEY (id_entidad_entidad)
REFERENCES public.entidad (id_entidad) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: info_entidad_uq | type: CONSTRAINT --
-- ALTER TABLE public.info_entidad DROP CONSTRAINT info_entidad_uq;
ALTER TABLE public.info_entidad ADD CONSTRAINT info_entidad_uq UNIQUE (id_entidad_entidad);
-- ddl-end --


-- object: ciudad_fk | type: CONSTRAINT --
-- ALTER TABLE public.entidad DROP CONSTRAINT ciudad_fk;
ALTER TABLE public.entidad ADD CONSTRAINT ciudad_fk FOREIGN KEY (id_ciudad_ciudad)
REFERENCES public.ciudad (id_ciudad) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


-- object: entidad_uq1 | type: CONSTRAINT --
-- ALTER TABLE public.entidad DROP CONSTRAINT entidad_uq1;
ALTER TABLE public.entidad ADD CONSTRAINT entidad_uq1 UNIQUE (id_ciudad_ciudad);
-- ddl-end --


-- object: entidad_fk | type: CONSTRAINT --
-- ALTER TABLE public.descuentos DROP CONSTRAINT entidad_fk;
ALTER TABLE public.descuentos ADD CONSTRAINT entidad_fk FOREIGN KEY (id_entidad_entidad)
REFERENCES public.entidad (id_entidad) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --



