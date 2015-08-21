--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-21 13:04:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 175 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 175
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16440)
-- Name: clinical_observation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clinical_observation (
    id integer NOT NULL,
    person_id numeric,
    disease_id numeric,
    age_low numeric,
    age_high numeric,
    unit text,
    is_deceased boolean
);


ALTER TABLE public.clinical_observation OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16446)
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disease (
    disease_id integer NOT NULL,
    display_name text,
    hl7_code text
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16452)
-- Name: family_members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE family_members (
    id integer NOT NULL,
    name text,
    dob date,
    administrative_gender_code text,
    ethnic_group text,
    race text,
    weight numeric,
    height numeric,
    adopted boolean,
    twin integer,
    active boolean,
    created_at timestamp with time zone
);


ALTER TABLE public.family_members OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16458)
-- Name: relationships; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationships (
    id integer NOT NULL,
    display_name text,
    hl7_code text
);


ALTER TABLE public.relationships OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16464)
-- Name: relative; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relative (
    id integer NOT NULL,
    person_id numeric,
    relationship_id numeric,
    related_to numeric
);


ALTER TABLE public.relative OWNER TO postgres;

--
-- TOC entry 1949 (class 0 OID 16440)
-- Dependencies: 170
-- Data for Name: clinical_observation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clinical_observation (id, person_id, disease_id, age_low, age_high, unit, is_deceased) FROM stdin;
\.


--
-- TOC entry 1950 (class 0 OID 16446)
-- Dependencies: 171
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disease (disease_id, display_name, hl7_code) FROM stdin;
\.


--
-- TOC entry 1951 (class 0 OID 16452)
-- Dependencies: 172
-- Data for Name: family_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY family_members (id, name, dob, administrative_gender_code, ethnic_group, race, weight, height, adopted, twin, active, created_at) FROM stdin;
\.


--
-- TOC entry 1952 (class 0 OID 16458)
-- Dependencies: 173
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relationships (id, display_name, hl7_code) FROM stdin;
\.


--
-- TOC entry 1953 (class 0 OID 16464)
-- Dependencies: 174
-- Data for Name: relative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relative (id, person_id, relationship_id, related_to) FROM stdin;
\.


--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-08-21 13:04:48

--
-- PostgreSQL database dump complete
--

