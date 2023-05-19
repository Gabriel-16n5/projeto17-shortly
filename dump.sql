--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.user_urls DROP CONSTRAINT IF EXISTS user_urls_fk1;
ALTER TABLE IF EXISTS ONLY public.user_urls DROP CONSTRAINT IF EXISTS user_urls_fk0;
ALTER TABLE IF EXISTS ONLY public.urls DROP CONSTRAINT IF EXISTS urls_fk1;
ALTER TABLE IF EXISTS ONLY public.urls DROP CONSTRAINT IF EXISTS urls_fk0;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_token_key;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_name_key;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_key;
ALTER TABLE IF EXISTS ONLY public.user_urls DROP CONSTRAINT IF EXISTS "user_urls_urlsId_key";
ALTER TABLE IF EXISTS ONLY public.user_urls DROP CONSTRAINT IF EXISTS user_urls_pkey;
ALTER TABLE IF EXISTS ONLY public.urls DROP CONSTRAINT IF EXISTS "urls_shortUrls_key";
ALTER TABLE IF EXISTS ONLY public.urls DROP CONSTRAINT IF EXISTS urls_pkey;
ALTER TABLE IF EXISTS ONLY public.url DROP CONSTRAINT IF EXISTS "url_urlBase_key";
ALTER TABLE IF EXISTS ONLY public.url DROP CONSTRAINT IF EXISTS url_pkey;
ALTER TABLE IF EXISTS ONLY public.shorturl DROP CONSTRAINT IF EXISTS shorturl_shorturl_key;
ALTER TABLE IF EXISTS ONLY public.shorturl DROP CONSTRAINT IF EXISTS shorturl_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_urls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.urls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.url ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.shorturl ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.user_urls_id_seq;
DROP TABLE IF EXISTS public.user_urls;
DROP SEQUENCE IF EXISTS public.urls_id_seq;
DROP TABLE IF EXISTS public.urls;
DROP SEQUENCE IF EXISTS public.url_id_seq;
DROP TABLE IF EXISTS public.url;
DROP SEQUENCE IF EXISTS public.shorturl_id_seq;
DROP TABLE IF EXISTS public.shorturl;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: shorturl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shorturl (
    id integer NOT NULL,
    shorturl text NOT NULL
);


--
-- Name: shorturl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shorturl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shorturl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shorturl_id_seq OWNED BY public.shorturl.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id integer NOT NULL,
    "urlBase" text NOT NULL
);


--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "urlsBase" text,
    "shortUrls" text,
    "visitCount" integer NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: user_urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "urlsId" integer NOT NULL
);


--
-- Name: user_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_urls_id_seq OWNED BY public.user_urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    token text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: shorturl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturl ALTER COLUMN id SET DEFAULT nextval('public.shorturl_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: user_urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls ALTER COLUMN id SET DEFAULT nextval('public.user_urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: shorturl; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: user_urls; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: shorturl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shorturl_id_seq', 1, false);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, false);


--
-- Name: user_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_urls_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: shorturl shorturl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturl
    ADD CONSTRAINT shorturl_pkey PRIMARY KEY (id);


--
-- Name: shorturl shorturl_shorturl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturl
    ADD CONSTRAINT shorturl_shorturl_key UNIQUE (shorturl);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: url url_urlBase_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT "url_urlBase_key" UNIQUE ("urlBase");


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrls_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrls_key" UNIQUE ("shortUrls");


--
-- Name: user_urls user_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT user_urls_pkey PRIMARY KEY (id);


--
-- Name: user_urls user_urls_urlsId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT "user_urls_urlsId_key" UNIQUE ("urlsId");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_key UNIQUE (token);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("urlsBase") REFERENCES public.url("urlBase");


--
-- Name: urls urls_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk1 FOREIGN KEY ("shortUrls") REFERENCES public.shorturl(shorturl);


--
-- Name: user_urls user_urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT user_urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: user_urls user_urls_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_urls
    ADD CONSTRAINT user_urls_fk1 FOREIGN KEY ("urlsId") REFERENCES public.urls(id);


--
-- PostgreSQL database dump complete
--

