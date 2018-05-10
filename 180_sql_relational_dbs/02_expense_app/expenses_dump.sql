--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: robertszabo
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date DEFAULT now() NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount >= 0.0))
);


ALTER TABLE public.expenses OWNER TO robertszabo;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: robertszabo
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO robertszabo;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robertszabo
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: robertszabo
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: robertszabo
--

INSERT INTO public.expenses VALUES (1, 14.56, 'Pencils', '2018-05-08');
INSERT INTO public.expenses VALUES (2, 2.99, 'Newspaper', '2018-05-08');
INSERT INTO public.expenses VALUES (3, 3.79, 'Coffee', '2018-05-08');
INSERT INTO public.expenses VALUES (4, 12.49, 'T-shirt', '2018-05-08');
INSERT INTO public.expenses VALUES (5, 2.23, 'Coffee', '2018-05-09');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robertszabo
--

SELECT pg_catalog.setval('public.expenses_id_seq', 5, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: robertszabo
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

