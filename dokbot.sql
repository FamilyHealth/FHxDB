--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-08-19 14:38:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 180 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16414)
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
-- TOC entry 174 (class 1259 OID 16412)
-- Name: clinical_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clinical_observation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinical_observation_id_seq OWNER TO postgres;

--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 174
-- Name: clinical_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clinical_observation_id_seq OWNED BY clinical_observation.id;


--
-- TOC entry 177 (class 1259 OID 16423)
-- Name: disease; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disease (
    disease_id integer NOT NULL,
    display_name text,
    hl7_code text
);


ALTER TABLE public.disease OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16421)
-- Name: disease_disease_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disease_disease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disease_disease_id_seq OWNER TO postgres;

--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 176
-- Name: disease_disease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disease_disease_id_seq OWNED BY disease.disease_id;


--
-- TOC entry 171 (class 1259 OID 16396)
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
    active boolean,
    created_at timestamp with time zone
);


ALTER TABLE public.family_members OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16394)
-- Name: family_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE family_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.family_members_id_seq OWNER TO postgres;

--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 170
-- Name: family_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE family_members_id_seq OWNED BY family_members.id;


--
-- TOC entry 179 (class 1259 OID 16432)
-- Name: relationships; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE relationships (
    id integer NOT NULL,
    display_name text,
    hl7_code text
);


ALTER TABLE public.relationships OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16430)
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_id_seq OWNER TO postgres;

--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 178
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- TOC entry 173 (class 1259 OID 16405)
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
-- TOC entry 172 (class 1259 OID 16403)
-- Name: relative_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relative_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relative_id_seq OWNER TO postgres;

--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 172
-- Name: relative_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relative_id_seq OWNED BY relative.id;


--
-- TOC entry 1854 (class 2604 OID 16417)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinical_observation ALTER COLUMN id SET DEFAULT nextval('clinical_observation_id_seq'::regclass);


--
-- TOC entry 1855 (class 2604 OID 16426)
-- Name: disease_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disease ALTER COLUMN disease_id SET DEFAULT nextval('disease_disease_id_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 16399)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY family_members ALTER COLUMN id SET DEFAULT nextval('family_members_id_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 16435)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- TOC entry 1853 (class 2604 OID 16408)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relative ALTER COLUMN id SET DEFAULT nextval('relative_id_seq'::regclass);


--
-- TOC entry 1969 (class 0 OID 16414)
-- Dependencies: 175
-- Data for Name: clinical_observation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clinical_observation (id, person_id, disease_id, age_low, age_high, unit, is_deceased) FROM stdin;
\.


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 174
-- Name: clinical_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clinical_observation_id_seq', 1, false);


--
-- TOC entry 1971 (class 0 OID 16423)
-- Dependencies: 177
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disease (disease_id, display_name, hl7_code) FROM stdin;
\.


--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 176
-- Name: disease_disease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disease_disease_id_seq', 1, false);


--
-- TOC entry 1965 (class 0 OID 16396)
-- Dependencies: 171
-- Data for Name: family_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY family_members (id, name, dob, administrative_gender_code, ethnic_group, race, weight, height, active, created_at) FROM stdin;
\.


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 170
-- Name: family_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('family_members_id_seq', 1, false);


--
-- TOC entry 1973 (class 0 OID 16432)
-- Dependencies: 179
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relationships (id, display_name, hl7_code) FROM stdin;
\.


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 178
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relationships_id_seq', 1, false);


--
-- TOC entry 1967 (class 0 OID 16405)
-- Dependencies: 173
-- Data for Name: relative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY relative (id, person_id, relationship_id, related_to) FROM stdin;
\.


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 172
-- Name: relative_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('relative_id_seq', 1, false);


--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-08-19 14:38:06

--
-- PostgreSQL database dump complete
--

